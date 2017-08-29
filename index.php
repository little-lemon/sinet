<?php
/**
 * @copyright   Copyright (c) 2014-2016 xyhcms.com All rights reserved.
 * @license     http://www.xyhcms.com/help/1.html
 * @link        http://www.xyhcms.com
 * @author      gosea <gosea199@gmail.com>
 */


header("Content-type:text/html;charset=utf-8");
// header("Access-Control-Allow-Origin: *");   //跨域访问 ，最终版本请去掉
// 检测PHP环境
if (version_compare(PHP_VERSION, '5.3.0', '<')) {
	die('require PHP > 5.3.0 !');
}

// 定义应用的绝对路径
//define('HOME_PATH',dirname(dirname(__FILE__)));
define('HOME_PATH',dirname(__FILE__));
//项目路径
define('APP_PATH', HOME_PATH.'/App/');
//判断是否安装
if (!file_exists(APP_PATH . 'Common/Conf/db.php')) {
	exit();
}
// 应用运行时目录
define('RUNTIME_PATH','./Runtime/');
// 应用静态缓存目录
define('HTML_PATH','./Html/');
// 定义模板文件默认目录
// define("TMPL_PATH",'./tpl_src/');
// ThinkPHP框架
define('THINK_PATH', HOME_PATH.'/Include/');

//是否调试//部署阶段注释或者设为false
define('APP_DEBUG', false); 

require THINK_PATH . 'ThinkPHP.php'; //加载ThinkPHP框架
