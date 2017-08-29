<?php
/**
 * @Author: 林英英
 * @Date:   2017-04-20
 * @Last Modified by:   林英英
 * @Last Modified time: 2017-04-20
 * 
 * !!!自定义模板对应的控制器！！！
 */

 
 
namespace Manage\Controller;

use Common\Lib\Category;

class NewtbController extends CommonContentController
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

        $check = M('category')->find($pid)['pid'];
        if($check == 0 ){
        	$vo = M('category')->find($pid); //直接是编辑
        	$vo['content'] = htmlspecialchars($vo['content']); //ueditor
        }else{
        	$vo = M('Newtb')->find($pid); //直接是编辑
        	$vo['content'] = htmlspecialchars($vo['content']); //ueditor
        }	

        //所有子栏目列表
        $cate    = get_category(); //全部分类
        $subcate = Category::toLayer(Category::clearCate(Category::getChilds($cate, $pid), 'type'), 'child', $pid); //子类,多维
        $poscate = Category::getParents($cate, $pid);

        $this->assign('vo', $vo);
        $this->assign('new_data',$new_data);
        $this->assign('pid', $pid);
        $this->assign('subcate', $subcate);
        $this->assign('poscate', $poscate);
        $this->display();
	}
	
	//提交当前页面的数据
	public function indexPost()
	{
		$data                = I('post.');
		$data['id']          = I('id', 0, 'intval');
		$data['pid']         = I('pid', 0, 'intval');
		$data['title']       = I('title', '', 'htmlspecialchars,rtrim');
		$data['content']     = I('content', '', '');
		$data['publishtime'] = I('publishtime', time(), 'strtotime');
		$data['updatetime']  = time();
		$data['aid']         = session(C('USER_AUTH_KEY'));
		var_dump($data);
		
		//获取属于分类信息,得到modelid
		$selfCate = Category::getSelf(get_category(0), $data['id']); //当前栏目信息
		$modelid  = $selfCate['modelid'];
		
		$mysql = 'select id from si_newtb where id='.$data['id'];
		//数据表中已存在该id对应的记录则修改，不存在个添加
		if(M('Newtb')->query($mysql))
		{
			if( false !== M('Newtb')->save($data)){
				M('attachmentindex')->where(array('arcid' => $data['id'], 'modelid' => $modelid))->delete();
				$attid = get_att_content($content); //内容中的图片
				insert_att_index($attid, $id, $modelid); //attachmentindex入库
				
				get_category(0, 1); //更新栏目缓存
				get_category(1, 1);
				get_category(2, 1);
				
				$this->success('修改成功', U('Newtb/index', array('pid' => $data['pid'])));
			}else {
			
				$this->error('修改失败');
			}
		}else {
			if(false !== M('Newtb')->add($data) ){
				M('attachmentindex')->where(array('arcid' => $data['id'], 'modelid' => $modelid))->delete();
				$attid = get_att_content($content); //内容中的图片
				insert_att_index($attid, $id, $modelid); //attachmentindex入库
				
				get_category(0, 1); //更新栏目缓存
				get_category(1, 1);
				get_category(2, 1);
				
				$this->success('添加成功', U('Newtb/index', array('pid' => $data['pid'])));
			}else {
			
				$this->error('添加失败');
			}
		}
	}
	
}