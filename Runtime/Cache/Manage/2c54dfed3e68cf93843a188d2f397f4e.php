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
	    var URL = '/sim.php?s=/Menu';
	    var APP	 = '/sim.php?s=';
	    var SELF='/sim.php?s=/Menu/add/pid/37';
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
			添加菜单
		    </h3>
		</div>
		
	</div>


	<div class="row">
		<div class="col-lg-12">

				<form method='post' class="form-horizontal" id="form_do" name="form_do" action="<?php echo U('add');?>">
					<div class="form-group">
						<label for="inputName" class="col-sm-2 control-label">上级菜单</label>
						<div class="col-sm-9">
							<select name="pid" class="form-control">
								<option value="0">顶级菜单</option>
								<?php if(is_array($cate)): foreach($cate as $key=>$v): ?><option value="<?php echo ($v["id"]); ?>" <?php if($pid == $v['id']): ?>selected="selected"<?php endif; ?>><?php echo ($v["delimiter"]); echo ($v["name"]); ?></option><?php endforeach; endif; ?>
							</select>		
						</div>
					</div>

					<div class="form-group">
						<label for="inputName" class="col-sm-2 control-label">菜单名称</label>
						<div class="col-sm-9">
							<input type="text" name="name" id="inputName" class="form-control" placeholder="菜单名称" required="required" />		
						</div>
					</div>
					<div class="form-group">
						<label for="inputModule" class="col-sm-2 control-label">模块名</label>
						<div class="col-sm-9">
							<input type="text" name="module" id="inputModule" class="form-control" placeholder="模块名：首字母大写" />	
						</div>
					</div>

					<div class="form-group">
						<label for="inputAction" class="col-sm-2 control-label">方法名</label>
						<div class="col-sm-9">
							<input type="text" name="action" id="inputAction" class="form-control" placeholder="方法名：首字母小大写" />
						</div>
					</div>

					<div class="form-group">
						<label for="inputParameter" class="col-sm-2 control-label">附加参数</label>
						<div class="col-sm-9">
							<input type="text" name="parameter" id="inputParameter" class="form-control" placeholder="附加参数" />	
						</div>
					</div>

					<div class="form-group">
						<label for="inputSort" class="col-sm-2 control-label">排序</label>
						<div class="col-sm-9">
							<input type="text" name="sort" id="inputSort" value="1" class="form-control" placeholder="排序" />	
						</div>
					</div>
					
					<div class="form-group">
						<label for="" class="col-sm-2 control-label">显示</label>
						<div class="col-sm-9">
							<label class="radio-inline">
							<input type="radio" name="status" value="1" checked="checked"  />显示</label>
							<label class="radio-inline">
							<input type="radio" name="status" value="0" />隐藏</label>
						</div>
					</div>				

					<div class="row margin-botton-large">
						<div class="col-sm-offset-2 col-sm-9">
							<div class="btn-group">							
								<button type="submit" class="btn btn-primary"> <i class="glyphicon glyphicon-saved"></i>
									保存
								</button>
								<button type="button" onclick="goUrl('<?php echo U('index');?>')" class="btn btn-default"> <i class="glyphicon glyphicon-chevron-left"></i>
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