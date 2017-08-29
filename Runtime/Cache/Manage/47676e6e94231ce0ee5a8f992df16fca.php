<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>后台</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="baidu-site-verification" content="unXl91MyB6" />
	<link rel="stylesheet" type="text/css" href="/Data/static/bootstrap/3.3.5/css/bootstrap.min.css" media="screen">	
	<link rel='stylesheet' type="text/css" href="/App/Manage/View/Public/css/main.css" />
	<!-- 头部css文件|自定义  -->
	

	<script type="text/javascript" src="/Data/static/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/Data/static/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
		<script src="/Data/static/js/html5shiv.min.js"></script>
		<script src="/Data/static/js/respond.min.js"></script>
    <![endif]-->
	
	<script type="text/javascript" src="/App/Manage/View/Public/js/jquery.form.min.js"></script>
	<script type="text/javascript" src="/Data/static/jq_plugins/layer/layer.js"></script>
	<script src="/App/Manage/View/Public/js/index.js"></script>
	<script language="JavaScript">
	    <!--
	    var URL = '/sim.php?s=/Public';
	    var APP	 = '/sim.php?s=';
	    var SELF='/sim.php?s=/Public/main';
	    var PUBLIC='/App/Manage/View/Public';
	    var data_path = "/Data";
		var tpl_public = "/App/Manage/View/Public";
	    //-->
	</script>
	<script type="text/javascript" src="/App/Manage/View/Public/js/common.js"></script> 
	<!-- 头部js文件|自定义 -->
	
</head>
<body>
	<div class="xyh-content">
		
<div class="row">

	<div class="col-md-6">
		<div class="panel panel-info">
			<div class="panel-heading">管理员相关信息</div>
			<div class="panel-body">
				您好，<?php echo (session('yang_adm_username')); ?> <br />
				上次登录时间：<?php echo (session('yang_adm_logintime')); ?><br />
				上次登录IP：<?php echo (session('yang_adm_loginip')); ?><br />
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="panel panel-info">
			<div class="panel-heading">系统相关信息</div>
			<div class="panel-body">
				服务器环境：<?php echo ($os); ?> <br />
				Web服务器：<?php echo ($software); ?><br />
				MySQL 版本：<?php echo ($mysql_ver); ?><br />
			</div>
		</div>
	</div>

	<div class="col-md-12">
		<div class="panel panel-danger">
			<div class="panel-heading">站点信息相关统计</div>
			<div class="panel-body">
				所有信息数量：<span class="label label-danger"><?php echo ($article['sum']); ?></span>&nbsp;&nbsp;&nbsp;
				安全公告数量：<span class="label label-danger"><?php echo ($article['security']); ?></span>&nbsp;&nbsp;&nbsp;
				新闻信息数量：<span class="label label-danger"><?php echo ($article['news']); ?></span>&nbsp;&nbsp;&nbsp;
				<!--招聘信息数量：<span class="label label-danger"><?php echo ($article['work']); ?></span>&nbsp;&nbsp;&nbsp;-->
				<!--<hr />-->
				<!--所有产品数量：<span class="label label-info"><?php echo ($product['sum']); ?></span>&nbsp;&nbsp;&nbsp;-->
				<!--防火墙产品数量：<span class="label label-info"><?php echo ($product['fw']); ?></span>&nbsp;&nbsp;&nbsp;-->
				<!--入侵检测产品数量：<span class="label label-info"><?php echo ($product['ruqing']); ?></span>&nbsp;&nbsp;&nbsp;-->
				<!--安全审计产品数量：<span class="label label-info"><?php echo ($product['shenji']); ?></span>&nbsp;&nbsp;&nbsp;-->
				<!--其他产品数量：<span class="label label-info"><?php echo ($product['other']); ?></span>&nbsp;&nbsp;&nbsp;-->
			</div>
		</div>
	</div>

	<div class="col-md-12">
		<div class="panel panel-info">
			<div class="panel-heading">相关指南</div>
			<div class="panel-body">

				1.信息总览：显示数据概况<br/>
				2.导航菜单：对站点首页导航栏的功能菜单进行管理<br/>
				3.网站内容管理：站点所有内容管理均在此处进行操作<br/>
				4.系统设置相关：<br/>
				<ol type="A">
					<li>友情链接：站点底部友情链接管理</li>
					<li>清除缓存：清除站点缓存</li>
					<!--<li>模型控制器：管理页面模型</li>-->
					<!--<li>视图模板：对页面显示的模板进行管理</li>-->
					<li>系统菜单：后台管理系统的功能</li>
					<li>数据库管理：显示数据库所有表</li>
					<!--<li>已上传文件管理：显示已经上传的附件</li>-->
				</ol>
			</div>
		</div>
	</div>







</div>

			
	</div>	
</body>
</html>