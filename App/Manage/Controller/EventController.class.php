<?php
namespace Manage\Controller;
use Common\Lib\Category;
class EventController extends CommonContentController
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
        $tmp = explode('#',$vo['content']);
        $i = 0;
        $len = count($tmp);
        for($k=0; $k<$len; $k++)
        {
            $content[$i][0] = $tmp[$k];
            $k++;
            $content[$i][1] = $tmp[$k];
            $i++;
        }

        //所有子栏目列表
        $cate    = get_category(); //全部分类
        $subcate = Category::toLayer(Category::clearCate(Category::getChilds($cate, $pid), 'type'), 'child', $pid); //子类,多维
        $poscate = Category::getParents($cate, $pid);

        $this->assign('vo', $vo);
        $this->assign('pid', $pid);
        $this->assign('content', $content);
        $this->assign('subcate', $subcate);
        $this->assign('poscate', $poscate);
        $this->display();
    }

    //保存
    public function save()
    {
        if(IS_POST){
            $data = I('post.');
            if (false !== M('Category')->save($data)){
                $this->ajaxReturn(array('code'=>0, 'msg'=>'修改成功'));
            }
        }
    }

}