<?php
namespace Manage\Controller;
use Common\Lib\Category;
class DetailController extends CommonContentController
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

        $detailData= M('pageDetail')->where(array('pid' => $pid))->find();
        //将子标题转化为数组
        $subtitle = array();
        if (!empty($detailData['subtitle'])) {
            $temparr = explode('$$$', $detailData['subtitle']);
            foreach ($temparr as $key => $v) {
//                $temparr2      = explode('$$$', $v);
                $subtitle[] = $v;
            }
        }

        //将子段落转化为数组
        unset($temparr);
        unset($temparr2);
        $subcontent = array();
        if (!empty($detailData['subcontent'])) {
            $temparr = explode('$$$', $detailData['subcontent']);
            foreach ($temparr as $key => $v) {
//                $temparr2      = explode('$$$', $v);
                $subcontent[] = $v;
            }
        }

        //将标题和子段落的数组合并
        $len = count($subtitle);
        for($i=0;$i<$len;$i++){
            $detailData['content'][$i]['subtitle'] = $subtitle[$i];
            $detailData['content'][$i]['subcontent'] = $subcontent[$i];
        }

        //将子段落图片地址转化为数组
        unset($temparr);
        unset($temparr2);
        $subimgurls = array();
        if (!empty($detailData['subimg'])) {
            $temparr = explode('|||',$detailData['subimg']);
            foreach ($temparr as $key => $v) {
                $temparr2      = explode('$$$', $v);
                $subimgurls[] = array('url' => '' . $temparr2[0], 'alt' => '' . $temparr2[1]);
            }
        }
        $detailData['subimg'] = $subimgurls;


        $this->assign('vo', $vo);
        $this->assign('pid', $pid);
        $this->assign('subcate', $subcate);
        $this->assign('poscate', $poscate);
        $this->assign('detailData', $detailData);
        $this->display();
    }

    /*//修改文章处理
    public function indexPost()
    {
        $id          = I('pid', 0, 'intval');
        $pid         = I('pid', 0, 'intval');
        $content     = I('content', '', '');
        $description = I('description', '');
        $ename      = I('ename','');
        if (!$pid) {
            $this->error('参数错误');
        }

        if (empty($description)) {
            $description = str2sub(strip_tags($content), 120);
        }

        $data = array('id' => $pid, 'description' => $description, 'content' => $content, 'ename' => $ename);


        //获取属于分类信息,得到modelid
        $selfCate = Category::getSelf(get_category(0), $id); //当前栏目信息
        $modelid  = $selfCate['modelid'];

        if (false !== M('category')->save($data)) {

            M('attachmentindex')->where(array('arcid' => $id, 'modelid' => $modelid))->delete();
            $attid = get_att_content($content); //内容中的图片
            insert_att_index($attid, $id, $modelid); //attachmentindex入库

            get_category(0, 1); //更新栏目缓存
            get_category(1, 1);
            get_category(2, 1);

            $this->success('修改成功', U('Detail/index', array('pid' => $pid)));
        } else {

            $this->error('修改失败');
        }

    }*/


    //修改文章处理
    public function indexPost()
    {
        //$data = I('post.');
        //var_dump($data);die;


        //$id          = I('pid', 0, 'intval');
        $pid         = I('pid', 0, 'intval');
        if (!$pid) {
            $this->error('参数错误');
        }

        /*        //获取属于分类信息,得到modelid
                $selfCate = Category::getSelf(get_category(0), $id); //当前栏目信息
                $modelid  = $selfCate['modelid'];*/

        $data['id'] = I('id', 0, 'intval');
        $data['pid'] = I('pid', 0, 'intval');
        $data['bigtitle'] = I('bigtitle','');
        $data['description'] = htmlspecialchars_decode(I('description',''));
        
        $data['example'] = I('example','');
        //子标题数据设置
        $subtitle = I('subtitle', '');
        if(is_array($subtitle)){
            foreach($subtitle as $k => $v){
                if($v != '' ){
                    $subtitle_arr[] = $v;
                }
            }
        }
        $data['subtitle'] = join('$$$', $subtitle_arr);
        //子段落数据设置
        $subcontent= I('subcontent', '');
//      $subcontent = htmlspecialchars_decode($subcontent);
//      var_dump($data);
        if(is_array($subcontent)){
            foreach($subcontent as $k => $v){
                if($v != '' ){
                    $subcontent_arr[] = $v;
                }
            }
        }
        $data['subcontent'] = join('$$$', $subcontent_arr);
        //子内容图片的设置
        $subimgurls = I('subimgurls', '');
        $apppicurls_arr = array();
        $subimgurls = isset($subimgurls) ? $subimgurls : '';
        if (is_array($subimgurls)) {
            foreach ($subimgurls as $k => $v) {
                $apppicurls_arr[] = $v;
            }
        }
        $data['subimg'] = join('|||', $apppicurls_arr);
        //var_dump($data);die;

        if($data['id'] != ''){
            if (false !== M('pageDetail')->save($data)) {
                $this->success('修改成功', U('Detail/index', array('pid' => $pid)));
            } else {
                $this->error('修改失败');
            }
        }else{
            if (false !== M('pageDetail')->add($data)) {
                $this->success('添加成功', U('Detail/index', array('pid' => $pid)));
            } else {
                $this->error('添加失败');
            }
        }


    }


}