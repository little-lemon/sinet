<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html class="fullscreen-bg">
<head>
	<title>福建省海峡信息技术有限公司 网站后台管理登录</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="/Data/static/bootstrap/3.3.5/css/bootstrap.min.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="/App/Manage/View/Public/css/login.css">
	<!--相关js引入-->
	<script type="text/javascript" src="/Data/static/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/Data/static/jq_plugins/layer/layer.js"></script>
	<script type="text/javascript" src="/Data/static/md5/md5.min.js"></script>
	<!--验证码点击变换-->
	<script type="text/javascript" src="/App/Manage/View/Public/js/login.js"></script>
	
</head>

<body>
<!-- WRAPPER -->
<div id="wrapper">
	<div class="vertical-align-wrap">
		<div class="vertical-align-middle">
			<div class="auth-box ">
				<div class="left">
					<div class="content">
						<div class="header">
							<div class="logo text-center"><img src="/App/Manage/View/Public/images/logo-dark.png" ></div>
						</div>
						<form action="<?php echo U('Login/login');?>" method="post" id="LoginForm">
							<div class="form-group">
								<label class="control-label sr-only">账号</label>
								<input type="username" name="username" class="form-control" placeholder="输入管理员账号">
							</div>
							<div class="form-group">
								<label class="control-label sr-only">密码</label>
								<input type="password" name="password" class="form-control"  placeholder="输入密码">
							</div>
							<div class="form-group">
								<label class="control-label sr-only">验证码</label>
								<input type="code" name="code" class="form-control"  placeholder="输入下图验证码（不区分大小写）">
							</div>
							<div class="form-group">
								<img src="<?php echo U('Login/verify',array('id' => 'a_login_1'));?>" data-url="<?php echo U('Login/verify',array('id' => 'a_login_1'));?>" align="absmiddle" id="vcode"  class="vcode" />
							</div>

							<button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>

						</form>
					</div>
				</div>
				<div class="right">
					<div class="overlay"></div>
					<div class="content text">
						<h1 class="heading">福建省海峡信息技术有限公司</h1>
						<p style="text-indent: 2em">
							福建省海峡信息技术有限公司是福建省科技厅下属的省科技信息研究所控股、员工参股的国有企业。其前身福建省海峡科技信息中心成立于 1993 年， 1999 年 12 月改制为福建省海峡信息技术有限公司，是 专业从事网络安全技术研发、网络安全产品销售、网络安全服务的高新技术企业、福建省软件行业协会理事单位、福建省卫生信息协会理事单位、国家商用密码产品生产定点单位，同时是福建省信息网络重点实验室的承担单位，企业还获得国家信息安全服务资质认证、 ISO 质量管理体系认证。
						</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<!-- END WRAPPER -->
</body>

</html>