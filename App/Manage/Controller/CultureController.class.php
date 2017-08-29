<?php

namespace Manage\Controller;

use Common\Lib\Category;
//企业文化相关
class CultureController extends CommonContentController
{
    public function index()
    {

        $count = M('culture')->count();

        $page = new \Common\Lib\Page($count, 10);
        $page->rollPage = 10;
        $page->setConfig('theme', '%HEADER% %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%');
        $limit = $page->firstRow . ',' . $page->listRows;
        $list = M('culture')->limit($limit)->select();
        $this->assign('list', $list);
        $this->assign('page', $page->show());
        $this->assign('type', '企业文化列表');
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
        $data = I('post.', '');
        $culture_model = M('culture');
        $res = $culture_model->add($data);

        if ($res) {
            $this->success('添加成功', U('index'));
        } else {
            $this->error('添加失败', U('index'));
        }

    }

    public function edit()
    {
        $id = I('id', 0, 'intval');
        $data = M('culture')->find($id);
        if (!$data) {
            $this->error('记录不存在');
        }

        $this->assign("data", $data);

        $this->display();
    }

    /**
     * 编辑
     */
    public function editpost()
    {
        $data = I('post.', '');
        $id = $data['id'] = intval($data['id']);
        $honor_model = M('culture');

        $res = $honor_model->where("id = $id")->save($data);
        if ($res) {
            $this->success('更新成功', U('index'));
        } else {
            $this->error('更新失败', U('index'));
        }

    }

    /**
     * 删除
     */
    public function del()
    {
        $id = I('id', 0, 'intval');
        $culture_model = M('culture');
        $imgUrl = $culture_model->where("id = $id")->find()['pic'];
        $res = $culture_model->where("id = $id")->delete();
        $msg = '';
        if ($res) {
            //删除文件夹中的图片
            if (!empty($imgUrl)) {
                $images[] = '.' . $imgUrl;
                $url = substr($imgUrl, 0, 23);
                $name = substr($imgUrl, 23);
                $images[] = '.' . $url . $name . "!300X300.jpg";
                $images[] = '.' . $url . $name . "!600X.jpg";
                deleteImage($images);
            }
            $this->success('删除成功' . $msg . '<script type="text/javascript" language="javascript">window.parent.get_cate();</script>', U('Culture/index'));
        } else {
            $this->error('删除失败');
        }

    }
}