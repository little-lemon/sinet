<?php
header("Content-type:text/html;charset=utf8");
/**
 * @copyright   Copyright (c) 2014-2016 xyhcms.com All rights reserved.
 * @license     http://www.xyhcms.com/help/1.html
 * @link        http://www.xyhcms.com
 * @author      gosea <gosea199@gmail.com>
 */

if (version_compare(PHP_VERSION, '5.3.0', '<')) {
	die('require PHP > 5.3.0 !');
}
// 定义应用的绝对路径
define('HOME_PATH',dirname(__FILE__));

define('BIND_MODULE', 'Manage');
define('APP_DEBUG', true);
define('APP_PATH', './App/');
define('RUNTIME_PATH','./Runtime/');
define('THINK_PATH', './Include/');
require THINK_PATH . 'ThinkPHP.php';
