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
	    var SELF='/sim.php?s=/Rbac/access/rid/7';
	    var PUBLIC='/App/Manage/View/Public';
	    var data_path = "/Data";
		var tpl_public = "/App/Manage/View/Public";
	    //-->
	</script>
	<script type="text/javascript" src="/App/Manage/View/Public/js/common.js"></script> 
	<!-- 头部js文件|自定义 -->
	

<script type="text/javascript">
    $(function(){
         
        //选中全部子级
        $('input[level=1]').click(function(){

            var checked = $(this).prop('checked');            
            var inputs = $(this).parents('.panel').find('.panel-body input');     
            if (checked) {
                inputs.prop('checked', true);
            }else {
                inputs.prop('checked', false);
            }
            
        });
        //选中全部子级
        $('input[level=2]').click(function(){

            var checked = $(this).prop('checked');            
            var parent = $(this).parents('.panel:eq(0)'); 
            var topParent = parent.parents('.panel:eq(0)');    
            if (checked) {
                parent.find('.panel-body input').prop('checked', true);
                topParent.find('input[level=1]').prop('checked', true);
            }else {
                parent.find('.panel-body input').prop('checked', false);
                topParent.find('input[level=1]').prop('checked', false);
            }
            
        });

        //选中父级
        $('input[level=3]').click(function(){

            var checked = $(this).prop('checked');            
            var parent = $(this).parents('.panel:eq(0)');
            var topParent = parent.parents('.panel:eq(0)');  
            if (checked) {
                parent.find('.panel-heading input').prop('checked', true);
                topParent.find('input[level=1]').prop('checked', true);
            }
            
        });



    });
 
</script>

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
        <div class="col-lg-12">
            <div class="btn-group btn-group-md">           
                <button class="btn btn-primary" type="button" onclick="goUrl('<?php echo U('role');?>')"><em class="glyphicon glyphicon-chevron-left"></em> 返回</button>
                <button class="btn btn-info" type="button" onclick="doGoSubmit('<?php echo U('access');?>', 'formAccess')"><em class="glyphicon glyphicon-saved"></em> 更新权限</button>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-12">
            <form method="post" action="" id="formAccess">
            <input type="hidden" name="rid" value="<?php echo ($rid); ?>"/>
            <?php if(is_array($node)): $i = 0; $__LIST__ = $node;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="row">
                                <div class="col-xs-8">
                                    <h3 class="panel-title">
                                    <input type="checkbox" name="access[]" value="<?php echo ($vo["id"]); ?>_<?php echo ($vo["level"]); ?>" level="1" <?php if($vo['access']): ?>checked="checked"<?php endif; ?>/> <?php echo ($vo["title"]); ?></h3>
                                </div>
                        </div>
                        
                    </div>
                    <div class="panel-body xyh-panel-body">
                            <?php if(is_array($vo['child'])): $i = 0; $__LIST__ = $vo['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo2): $mod = ($i % 2 );++$i;?><div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                                <div class="col-xs-8">
                                                    <h3 class="panel-title">
                                                    <input type="checkbox" name="access[]" value="<?php echo ($vo2["id"]); ?>_<?php echo ($vo2["level"]); ?>" level="2" <?php if($vo2['access']): ?>checked="checked"<?php endif; ?>/> <?php echo ($vo2["title"]); ?></h3>
                                                </div>
                                        </div>
                                        
                                    </div>
                                    <div class="panel-body">
                                            <?php if(is_array($vo2['child'])): $i = 0; $__LIST__ = $vo2['child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo3): $mod = ($i % 2 );++$i;?><label class="checkbox-inline">                    
                                                    <input type="checkbox" name="access[]" value="<?php echo ($vo3["id"]); ?>_<?php echo ($vo3["level"]); ?>" level="3" <?php if($vo3['access']): ?>checked="checked"<?php endif; ?>/>                
                                                    <span class="label label-primary"><?php echo ($vo3["title"]); ?></span> 
                                                </label> &nbsp;&nbsp;<?php endforeach; endif; else: echo "" ;endif; ?>
                                    </div>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
           
                    </div>
                </div><?php endforeach; endif; else: echo "" ;endif; ?>
            <div>
            	<div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="row">
                                <div class="col-xs-8">
                                    <h3 class="panel-title">
                                    <input type="checkbox"  level="2" /> 内容管理</h3>
                                </div>
                        </div>
                        
                    </div>
                    <div class="panel-body">
                            <?php if(is_array($cateData)): $i = 0; $__LIST__ = $cateData;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo4): $mod = ($i % 2 );++$i;?><label class="checkbox-inline">              
                                	<?php  $str = ','.$vo4['id'].','; if(strpos($accessStr, $str) === false) $checked = ""; else $checked = 'checked="checked"'; ?>
                                    <input type="checkbox" name="cateAccess[]" value="<?php echo ($vo4["id"]); ?>" level="3" <?php echo ($checked); ?> />                
                                    <span class="label label-primary"><?php echo ($vo4["name"]); ?></span> 
                                </label> &nbsp;&nbsp;<?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </div>  
            </div>
            </form>

        </div>
    </div>


			
	</div>	
</body>
</html>