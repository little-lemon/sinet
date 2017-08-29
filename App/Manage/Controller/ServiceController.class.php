<?php

namespace Manage\Controller;



class ServiceController extends CommonContentController
{
    public function index()
    {
        $cid = I('pid');     //得到具体对应内容的ID
        $content = M('sever')->where("cid=$cid")->select();

        $this->assign("cid",$cid);
        $this->assign("sev",$content);
        $this->display();
    }

    public function add()
    {
        $data = I('post.');
        $cid = $data['cid'];

        $data['content'] = htmlspecialchars_decode($data['content']);   //不过滤HTML标签

        $judge = M('sever')->where("cid=$cid")->select();   //判断是否已存在数据

        if($judge == NULL){
            if(false !== M('sever')->add($data)){
                $this->success('增加成功', U('Service/index', array('pid' => $cid)));
            } else {
                $this->error('增加失败');
            }
        }else{
            if(false !== M('sever')->where("cid=$cid")->save($data)){
                $this->success('修改成功', U('Service/index', array('pid' => $cid)));
            } else {
                $this->error('修改失败');
            }
        }





    }

}