<?php

namespace Manage\Controller;

use Common\Lib\Category;

class ContactController extends CommonContentController
{
    //编辑
    public function index()
    {
        //当前控制器名称
        $actionName = strtolower(CONTROLLER_NAME);
        $pid        = I('pid', 0, 'intval');
        if (IS_POST) {
            $this->indexPost();
            exit();
        }

        $vo            = M('category')->find($pid); //直接是编辑
        $vo['content'] = htmlspecialchars($vo['content']); //ueditor

        //所有子栏目列表
        $cate    = get_category(); //全部分类
        $subcate = Category::toLayer(Category::clearCate(Category::getChilds($cate, $pid), 'type'), 'child', $pid); //子类,多维
        $poscate = Category::getParents($cate, $pid);

        $officeData = M('office')->select();
        $temparr = array();
        $temparr = explode('$$$', $officeData[0]['tel']);
        $officeData[0]['tel'] = $temparr;
        $hxData = $officeData[0];
        array_shift($officeData);

        $this->assign('vo', $vo);
        $this->assign('pid', $pid);
        $this->assign('subcate', $subcate);
        $this->assign('poscate', $poscate);
        $this->assign('officeData', $officeData);
        $this->assign('hxData', $hxData);
        $this->display();
    }

    //保存提交的数据
    public function indexPost()
    {
        $data = I('post.');
        $id          = I('pid', 0, 'intval');
        $pid         = I('pid', 0, 'intval');
        $i = 0;
        $officeData = array();
        $officeData[$i]['id'] = $i+1;
        $officeData[$i]['name'] = $data['hx_name'];
        $officeData[$i]['address'] = $data['hx_addr'];
        $officeData[$i]['fax'] = $data['hx_fax'];
        $officeData[$i]['contacts'] = '';
        $officeData[$i]['email'] = $data['hx_email'];
        //将多个电话拼成一个字符串存储
        if(is_array($data['hx_tel'])){
            foreach($data['hx_tel'] as $k => $v){
                if($v != '' ){
                    $tel_arr[] = $v;
                }
            }
        }
        $officeData[$i]['tel'] = join('$$$', $tel_arr);
        //办事处数据
        if(is_array($data['name'])){
            foreach($data['name'] as $k => $v){
                if($v != '' ){
                    $i++;
                    $officeData[$i]['id'] = $i+1;
                    $officeData[$i]['name'] = $v;
                    $officeData[$i]['address'] = $data['addr'][$k];
                    $officeData[$i]['fax'] = $data['fax'][$k];
                    $officeData[$i]['contacts'] = $data['contacts'][$k];
                    $officeData[$i]['email'] = $data['email'][$k];
                    $officeData[$i]['tel'] = $data['tel'][$k];
                }
            }
        }

        $model = M('office');
        $tmpData = $model->select();
        if(!empty($tmpData)){
            $model->where('1')->delete();
        }

        foreach($officeData as $v){
            $id = M('office')->add($v);
        }
        if ($id) {
            $this->success('修改成功', U('Contact/index', array('pid' => $pid)));
        } else {
            $this->error('修改失败');
        }

    }
}