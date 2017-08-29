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
	    var URL = '/sim.php?s=/Newtb';
	    var APP	 = '/sim.php?s=';
	    var SELF='/sim.php?s=/Newtb/index/pid/5';
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
			<?php echo ($vo["name"]); ?>
		    <span class="xyh-pos">
                <i class="glyphicon glyphicon-log-out"></i>
                <?php if(ACTION_NAME == "index"): if(is_array($poscate)): foreach($poscate as $key=>$v): ?><a href="<?php echo U('' . ucfirst($v['tablename']) .'/index', array('pid' => $v['id']));?>"><?php echo ($v["name"]); ?> </a> 
                    <em class="glyphicon glyphicon-menu-right"></em><?php endforeach; endif; endif; ?>
            </span>	    
		    </h3>

            <?php if($subcate): ?><div class="col-md-1"></div>
				<div class="col-md-10">
					<?php if(is_array($subcate)): foreach($subcate as $key=>$v): if($v["id"] != 57 ): ?><a href="<?php echo U(''. ucfirst($v['tablename']) . '/index', array('pid' => $v['id']));?>" >
								<div class="col-md-2 widget">
									<?php echo ($v["name"]); if(!empty($v['child'])): ?>&there4;<?php endif; ?>
								</div>
							</a><?php endif; endforeach; endif; ?>

					<style>
						.widget {
							margin-right: 2px;
							text-decoration: none;
							/*background-color: #5bc0de;*/
							/*-moz-box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.2);*/
							/*-webkit-box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.2);*/
							box-shadow: 0px 5px 5px 0px rgba(0, 0, 0, 0.2);
							/*-moz-border-radius: 5px;*/
							/*-webkit-border-radius: 5px;*/
							background: linear-gradient(to left, #82CAF0,#009BEB);
							color: white;
							border-radius: 8px;
							padding: 15px 20px;
							margin-bottom: 30px;
							min-height: 70px;
							/*font-size: 16px;*/
							text-align: center;
						}
					</style>
				</div>
				<div class="col-md-1"></div>

				<!--<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<span class="navbar-text">子栏目：</span>

							<?php if(is_array($subcate)): foreach($subcate as $key=>$v): ?><a href="<?php echo U(''. ucfirst($v['tablename']) . '/index', array('pid' => $v['id']));?>" class="label label-info">
									<?php echo ($v["name"]); if(!empty($v['child'])): ?>&there4;<?php endif; ?>
								</a><?php endforeach; endif; ?>

						</div>
					</div>
            	</nav>--><?php endif; ?>
		</div>
		
	</div>





			
	</div>	
</body>
</html>