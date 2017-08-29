<?php
/**
 * @Author: David <espblood@qq.com>
 * @Date:   2017-04-20 10:12
 * @Last Modified by:   David
 * @Last Modified time: 2017-04-20 10:12
 * @Description 添加首页获取链接方法
 */

namespace Home\Controller;

use Common\Lib\Category;

/**
 * 主页显示
 */
class IndexController extends HomeCommonController
{
    //方法：index
    public function index()
    {

//      go_mobile();
        $this->assign('title', C('CFG_WEBNAME'));

        /*
         * 20170418,20170419 林英英修改部分
         * */
        //获取首页 more 的链接地址
        $more_url = array();
        $cate = get_category(1);
        //获取海峡动态的 url
        $hxdt_cid = 18;
        $self = Category::getSelf($cate, $hxdt_cid);
        $more_url[0] = get_url($self);
        //获取安全公告的url
        $abgg_cid = 41;
        $self = Category::getSelf($cate, $abgg_cid);
        $more_url[1] = get_url($self);

        //获取安全产品的具体信息
        $cid = 2;
        $cate = M('category')->where(array('pid' => $cid))->select();

        $new_cate = array();
        //3 2 1 0 8 
        $cate[3]['url'] = get_url($cate[3]);
        $new_cate[0] = $cate[3];
        $cate[2]['url'] = get_url($cate[2]);
        $new_cate[1] = $cate[2];
        $cate[1]['url'] = get_url($cate[1]);
        $new_cate[2] = $cate[1];
        $cate[0]['url'] = get_url($cate[0]);
        $new_cate[3] = $cate[0];
        $cate[8]['url'] = get_url($cate[8]);
        $new_cate[4] = $cate[8];
        $cate = M('category')->where(array('id' => 43))->select();
        $cate[0]['url'] = get_url($cate[0]);
        $new_cate[5] = $cate[0];



        $this->assign('more_url', $more_url);
        $this->assign('new_cate', $new_cate);
        $this->display();

    }

    //显示公司地图
    public function map()
    {
        $this->display();
    }
    
    //显示合作伙伴地图
    public function zmap()
    {
        $this->display();
    }
    
}
