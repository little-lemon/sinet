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
	    var SELF='/sim.php?s=/Rbac/node';
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
            <?php echo ($type); ?>         
            </h3> 
        </div>
        
    </div>

    <div class="row margin-botton">
        <div class="col-sm-6 column">
            <div class="btn-group btn-group-md">           
                <button class="btn btn-primary" type="button" onclick="goUrl('<?php echo U('addNode', array('level' => 1));?>')"><em class="glyphicon glyphicon-plus-sign"></em> 添加应用(节点)</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="alert alert-warning" role="alert">
              <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
              <span class="sr-only">Note:</span>
              节点：应用(level:1)->控制器(level:2)->方法(level:3)
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <?php if(is_array($node)): $i = 0; $__LIST__ = $node;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="row">
                                <div class="col-xs-8">
                                    <h3 class="panel-title"><?php echo ($vo["title"]); ?></h3>
                                </div>
                                <div class="col-xs-4 text-right">
                                    <a href="<?php echo U('addNode', array('pid' => $vo['id'],'level' => 2));?>" class="btn btn-xs btn-primary" title="添加"><i class="glyphicon glyphicon-plus-sign"></i> </a>      
                                    <a href="<?php echo U('editNode', array('id' => $vo['id']));?>" class="btn btn-xs btn-success" title="修改"><i class="glyphicon glyphicon-edit"></i></a>
                                    <?php if(empty($vo['child'])): ?><button type="button" onclick="del('<?php echo U('delNode', array('id' => $vo['id']));?>')" class="btn btn-xs btn-danger" title="删除"><i class="glyphicon glyphicon-remove"></i></button><?php endif; ?>
                                </div>
                        </div>
                        
                    </div>
                    <div class="panel-body xyh-panel-body">
                            <?php if(is_array($vo['child'])): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?><div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                                <div class="col-xs-8">
                                                    <h3 class="panel-title"><?php echo ($vo2["title"]); ?></h3>
                                                </div>
                                                <div class="col-xs-4 text-right">
                                                    <a href="<?php echo U('addNode', array('pid' => $vo2['id'],'level' => 3));?>" class="btn btn-xs btn-primary" title="添加"><i class="glyphicon glyphicon-plus-sign"></i> </a>      
                                                    <a href="<?php echo U('editNode', array('id' => $vo2['id']));?>" class="btn btn-xs btn-success" title="修改"><i class="glyphicon glyphicon-edit"></i></a>
                                                    <?php if(empty($vo2['child'])): ?><button type="button" onclick="del('<?php echo U('delNode', array('id' => $vo2['id']));?>')" class="btn btn-xs btn-danger" title="删除"><i class="glyphicon glyphicon-remove"></i></button><?php endif; ?>
                                                </div>
                                        </div>
                                        
                                    </div>
                                    <div class="panel-body">
                                            <?php if(is_array($vo2['child'])): $i = 0; $__LIST__ = $vo2['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo3): $mod = ($i % 2 );++$i;?><div class="col-md-3 column">                   
                                                <span class="label <?php if(!empty($vo3["status"])): ?>label-primary<?php else: ?>label-default<?php endif; ?>"><?php echo ($vo3["title"]); ?></span> 
                                                <a href="<?php echo U('editNode', array('id' => $vo3['id']));?>" class="label label-success"><i class="glyphicon glyphicon-edit"></i></a> 
                                                <a href="javascript:;" onclick="del('<?php echo U('delNode', array('id' => $vo3['id']));?>')"  class="label label-danger"><i class="glyphicon glyphicon-remove"></i></a>&nbsp; 
                                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </div>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </div><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>


			
	</div>	
</body>
</html>