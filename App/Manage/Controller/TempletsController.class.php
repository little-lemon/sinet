<?php

namespace Manage\Controller;

class TempletsController extends CommonController {

	public function index($ftype = 0) {

		$vlistFileType = array('PC默认模板', '手机默认模板');

		$file_path = !$ftype ? './Public/Home/' . C('CFG_THEMESTYLE') . '/' : './Public/Mobile/' . C('CFG_MOBILE_THEMESTYLE') . '/';

		$list = glob($file_path . '*');
		$fileArray = array();
		foreach ($list as $file) {

			if (is_file($file)) {
				$name = basename($file);
				$fileArray[] = array(
					'name' => $name,
					'bname' => base64_encode($name),
					'path' => $file,
					'write' => is_writable($file),
					'mtime' => filemtime($file),
				);
			}
		}

		$this->assign('vlist', $fileArray);
		$this->assign('vlistFileType', $vlistFileType);
		$this->assign('ftype', $ftype);
		$this->assign('type', '站点模板列表');
		$this->display();

	}

	public function edit() {
		$ftype = I('ftype', 0, 'intval');
		$fname = I('fname', '', 'trim,htmlspecialchars');
		$file_path = !$ftype ? './Public/Home/' . C('CFG_THEMESTYLE') . '/' : './Public/Mobile/' . C('CFG_MOBILE_THEMESTYLE') . '/';
		if (IS_POST) {
			if (empty($fname)) {
				$this->error('未指定文件名');
			}


			$content = I('content', '', '');      //不存在则写入已有的视图模板
			$fname = ltrim($fname, './');
			$truefile = $file_path . $fname;
			if (false !== file_put_contents($truefile, $content)) {
				$this->success('保存成功', U('index', array('ftype' => $ftype)));
			} else {
				$this->error('保存文件失败，请重试');
			}

			exit();
		}

		$fname = base64_decode($fname);
		if (empty($fname)) {
			$this->error('未指定要编辑的文件');
		}
		$truefile = $file_path . $fname;

		if (!file_exists($truefile)) {
			$this->error('文件不存在');
		}
		$content = file_get_contents($truefile);
		if ($content === false) {
			$this->error('读取文件失败');
		}
		$content = htmlspecialchars($content);

		$this->assign('ftype', $ftype);
		$this->assign('fname', $fname);
		$this->assign('content', $content);
		$this->assign('type', '修改模板');
		$this->display();

	}

	public function add($ftype = 0, $flag = 2) {
		$ftype = intval($ftype);
		$file_path = !$ftype ? './Public/Home/' . C('CFG_THEMESTYLE') . '/' : './Public/Mobile/' . C('CFG_MOBILE_THEMESTYLE') . '/';

		$fname_prefix = $flag == 2 ? 'Show_' : ($flag == 1 ? 'List_' : 'Index_');

		$fname = uniqid($fname_prefix) . '.html';

        /*新添加模板时的默认模板代码*/
		$content = <<<str
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <title>公司详情</title>
    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/style.css">
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/header.css">
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/media.css">
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/fotter.css">
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/newDetails.css">
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/history.css">
    <link rel="stylesheet" href="__PUBLIC__/css/banners.css"/>

    <script type="text/javascript" src="__PUBLIC__/js/framework/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/framework/bootstrap.min.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/plugin/html5shiv.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/plugin/respond.min.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/project/header.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/plugin/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="__PUBLIC__/js/plugin/jquery.easing.js"></script>
    

</head>
<body>
<!--引入导航-->
<include file="Public:header"/>
<!--此处开始添加自定义内容-->


<!--自定义内容结束-->
<div class="fotter current">
    福建省海峡信息技术有限公司版权所有
    <span>联系:hxzhb@heidun.net 闽ICP备06011901号 © 1999-2017 Fujian Strait Information Corporation. All Rights Reserved.</span>
</div>
</body>
</html>
str;

		$this->assign('ftype', $ftype);
		$this->assign('fname', $fname);
		$this->assign('content', $content);
		$this->assign('type', '新建模板');
		$this->display('edit');

	}

	public function del() {
		$ftype = I('ftype');
		$fname = I('fname', '', 'base64_decode');
		if (empty($fname)) {
			$this->error('参数错误');
		}
		$file_path = !$ftype ? './Public/Home/' . C('CFG_THEMESTYLE') . '/' : './Public/Mobile/' . C('CFG_MOBILE_THEMESTYLE') . '/';
		$truefile = $file_path . $fname;

		if (unlink($truefile)) {
			$this->success('删除文件成功', U('index', array('ftype' => $ftype)));
		} else {
			$this->error('删除文件失败');
		}

	}

}
