<?php

namespace Manage\Controller;

use Common\Lib\Category;

class HonorController extends CommonContentController
{
    public function index()
    {

        $count = M('honor')->count();

        $page = new \Common\Lib\Page($count, 10);
        $page->rollPage = 10;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $list  = M('honor')->limit($limit)->select();
        $this->assign('list', $list);
        $this->assign('page', $page->show());
        $this->assign('type', '荣誉证书列表');
        $this->display();
    }

    public function add()
    {
        $this->display();
    }

    /**
     * 添加证书
     */
    public function addpost()
    {
        $data        = I('post.', '');
        $honor_model = M('honor');
        $res = $honor_model->add($data);

        if($res){
            $this->success('证书添加成功', U('index'));
        }else{
            $this->error('证书添加失败', U('index'));
        }

    }

    public function edit()
    {
        $id   = I('id', 0, 'intval');
        $data = M('honor')->find($id);
        if (!$data) {
            $this->error('记录不存在');
        }

        $this->assign("data",$data);

        $this->display();
    }

    /**
     * 编辑
     */
    public function editpost()
    {
        $data        = I('post.', '');
        $id   = $data['id']   = intval($data['id']);
        $honor_model = M('honor');
        $res = $honor_model->where("id = $id")->save($data);
        if($res){
            $this->success('证书更新成功', U('index'));
        }else{
            $this->error('证书更新失败', U('index'));
        }

    }

    /**
     * 删除
     */
    public function del()
    {
        $id = I('id', 0, 'intval');
        $honor_model = M('honor');
        $res = $honor_model->where("id = $id")->delete();
        $msg = '';
        if($res){
            $this->success('删除成功' . $msg . '<script type="text/javascript" language="javascript">window.parent.get_cate();</script>', U('Honor/index'));
        }else{
            $this->error('删除失败');
        }

    }






}