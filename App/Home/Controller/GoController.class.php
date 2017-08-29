<?php
/**
 * @Author: David <espblood@qq.com>
 * @Date:   2017-04-20 10:12
 * @Last Modified by:   David
 * @Last Modified time: 2017-04-20 10:12
 */

namespace Home\Controller;

/**
 * 跳转页面的方法
 */
class GoController extends HomeCommonController
{
    //传入具体url跳转
    public function index()
    {
        $url = I('url', 0, '');
        if (!empty($url)) {
            redirect($url);
        }
    }

    //给url地址加密然后重定向（ThinkPHP的redirect方法）
    public function link()
    {
        $url = I('url', 0, '');
        if (!empty($url)) {
            $url = base64_decode($url);
            redirect($url);
        }
    }
}
