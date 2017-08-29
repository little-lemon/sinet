<?php
/**
 * @Author: gosea <gosea199@gmail.com>
 * @Date:   2014-06-21 10:00:00
 * @Last Modified by:   gosea
 * @Last Modified time: 2016-06-21 12:39:18
 */
namespace Home\Controller;

use Think\Controller;

/*
 * 空控制器解决方法
 * */
class EmptyController extends Controller
{

    public function _empty()
    {
        header("HTTP/1.1 404 Not Found");
        header("Status: 404 Not Found");
        $this->display(get_tpl('404.html'));

    }

    public function index()
    {
        header("HTTP/1.1 404 Not Found");
        header("Status: 404 Not Found");
        $this->display(get_tpl('404.html'));

    }
}
