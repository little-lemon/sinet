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
	    var URL = '/sim.php?s=/Rbac';
	    var APP	 = '/sim.php?s=';
	    var SELF='/sim.php?s=/Rbac/editNode/id/2';
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
		<div class="col-lg-12">
			<h3 class="page-header"><em class="glyphicon glyphicon-cloud-upload"></em> 
			修改<?php echo ($type); ?>
		    </h3>
		</div>
		
	</div>


	<div class="row">
		<div class="col-lg-12">

				<form method='post' class="form-horizontal" id="form_do" name="form_do" action="<?php echo U('editNode');?>">	
					
					<div class="form-group">
						<label for="inputName" class="col-sm-2 control-label"><?php echo ($type); ?>名称</label>
						<div class="col-sm-9">
							<input type="text" name="name" id="inputName" value="<?php echo ($node["name"]); ?>" class="form-control" placeholder="<?php echo ($type); ?>名称" required="required" />		
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-sm-2 control-label"><?php echo ($type); ?>描述</label>
						<div class="col-sm-9">
							<input type="text" name="title" id="inputTitle" value="<?php echo ($node["title"]); ?>" class="form-control" placeholder="<?php echo ($type); ?>描述" required="required" />		
						</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">开启</label>
						<div class="col-sm-9">
							<label class="radio-inline">
							<input type="radio" name="status" value="1" <?php if($node['status'] == 1): ?>checked="checked"<?php endif; ?> />开启</label>
							<label class="radio-inline">
							<input type="radio" name="status" value="0" <?php if($node['status'] == 0): ?>checked="checked"<?php endif; ?> />关闭</label>
						</div>
					</div>

					<div class="form-group">
						<label for="inputSort" class="col-sm-2 control-label">排序</label>
						<div class="col-sm-9">
							<input type="text" name="sort" id="inputSort" value="<?php echo ($node["sort"]); ?>" class="form-control" placeholder="排序" />		
						</div>
					</div>

					<div class="row margin-botton-large">
						<div class="col-sm-offset-2 col-sm-9">
							<input type="hidden" name="id" value="<?php echo ($node["id"]); ?>">
							<input type="hidden" name="pid" value="<?php echo ($node["pid"]); ?>" />
							<input type="hidden" name="level" value="<?php echo ($node["level"]); ?>" />
							<div class="btn-group">							
								<button type="submit" class="btn btn-primary"> <i class="glyphicon glyphicon-saved"></i>
									保存
								</button>
								<button type="button" onclick="goUrl('<?php echo U('node');?>')" class="btn btn-default"> <i class="glyphicon glyphicon-chevron-left"></i>
									返回
								</button>
							</div>
						</div>
					</div>
				</form>
	
		</div>
	</div>

		



			
	</div>	
</body>
</html>