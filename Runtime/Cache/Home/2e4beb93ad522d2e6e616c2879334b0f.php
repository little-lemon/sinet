<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>
    <title>福建省海峡信息技术有限公司 - 黑盾，安全缔造信息未来</title>
    <meta name="keywords" content="黑盾,网络安全公司,海峡,防火墙,数据库审计,入侵防御,入侵防护,远程安全评估,web安全防护,安全准入,文档安全" />
    <meta name="description" content="福建省海峡信息技术有限公司，是一家专业从事网络安全技术研发、网络安全产品销售、网络安全服务的高薪技术企业" />
    
    <link rel="stylesheet" href="/Public/Home/default/css/bootstrap.css"/>
    <!-- <link rel="stylesheet" href="http://lib.sinaapp.com/js/bootstrap/2.1.1/css/bootstrap.css"/> -->
    <link rel="stylesheet" href="/Public/Home/default/css/index.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/style.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/header.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/media.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/fotter.css"/>
    
	<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
	<!--[if lte IE 8]>
    <script type="text/javascript" src="/Public/Home/default/js/plugin/html5shiv.js"></script>
    <script type="text/javascript" src="/Public/Home/default/js/plugin/respond.min.js"></script>
	<![endif]-->
    <script type="text/javascript" src="/Public/Home/default/js/plugin/TweenMax.js"></script>
	<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/bootstrap/2.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/zepto/0.8/zepto.min.js"></script>
    <script type="text/javascript">
        !window.jQuery && document.write('<script src=/Public/Home/default/js/framework/jquery-1.9.1.min.js><\/script>');
        !window.Zepto && document.write('<script src=/Public/Home/default/js/plugin/zepto.min.js><\/script>');
    </script>
    
    
    
	
</head>
<body>
<!--导航条-->
<script src="/Public/Home/default/js/project/header.js"></script>
<script type="text/javascript" src="/Public/Home/default/js/project/goback.js"></script>
<link rel="stylesheet" href="/Public/Home/default/css/goback.css"/>
<nav class="navbar navbar-default navbar-fixed-top" style="border-bottom: 1px solid #D8D8D8">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="/" class="navbar-brand"></a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
        	<!--显示导航-->
            <ul class="nav navbar-nav navbar-right">
            	<!--遍历显示一级目录-->
				<li>
					<a href="/" id="home" class="current">首页</a>
				</li>
				<?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li>
						<a id="<?php echo ($catlist["id"]); ?>" href="<?php echo ($catlist["url"]); ?>"><?php echo ($catlist["name"]); ?></a>
						<?php if( $catlist["name"] != '安全产品' ): ?><ul>
								<!--二级菜单-->
								<?php if(is_array($catlist["child"])): $k = 0; $__LIST__ = $catlist["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($k % 2 );++$k; if(($v["name"] != '相关下载') and ($v["name"] != '社会招聘') ): if($v["name"] == '长期招聘' ): ?><li><a href="<?php echo U('Show/job');?>"><?php echo ($v["name"]); ?></a></li>
											<?php elseif($v["name"] == '校园招聘' ): ?><li><a href="<?php echo U('Show/schooljob');?>"><?php echo ($v["name"]); ?></a></li>
										<?php else: ?><li><a href="<?php echo (get_url($v)); ?>"><?php echo ($v["name"]); ?></a></li><?php endif; endif; endforeach; endif; else: echo "" ;endif; ?>
							</ul>
							<!--安全产品分两列-->
						<?php else: ?>
							<ul class="safProduct actived">
								<dl class="clearfix">
									<dt>
										<?php if(is_array($catlist["child"])): $i = 0; $__LIST__ = array_slice($catlist["child"],0,8,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li><a href="<?php echo (get_url($v)); ?>"><?php echo ($v["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
									</dt>
									<div class="jbt">
										<img src="/Public/Home/default/img/fgx.png" alt="" class="img-responsive" />
									</div>
									<dd>
										<?php if(is_array($catlist["child"])): $i = 0; $__LIST__ = array_slice($catlist["child"],8,20,true);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><li><a href="<?php echo (get_url($v)); ?>"><?php echo ($v["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
									</dd>
								</dl>
							</ul><?php endif; ?>

					</li><?php endforeach;?>
				
            </ul>
        </div>
		<script>
//			active状态的添加
			$("#home").removeClass("current");
			$("#home").addClass("current");
            $("#home").parent('li').addClass("currs").siblings('li').removeClass("currs");
		</script>
    </div>
</nav>



<!--在线客服默认关闭-->

<!--轮播图-->
<div class="banner">
    <div class="bannerContext clearfix">
        <div class="bannerI" style="background-color: #0769CB">
            <div class="bannerItem" style="background-image:url(/Public/Home/default/img/banner/banner01.png);">

                <a href="<?php echo U('List/index',array('cid'=>24));?>" title=""></a>
            </div>
        </div>
        <div class="bannerI" style="background-color: #213862">
            <div class="bannerItem" style="background-image:url(/Public/Home/default/img/banner/banner02.png);">
                <a href="<?php echo U('List/index',array('cid'=>101));?>" title=""></a>
            </div>
        </div>
        <div class="bannerI" style="background-color: #3B6985">
            <div class="bannerItem" style="background-image:url(/Public/Home/default/img/banner/banner03.png);">
                <a href="<?php echo U('List/index',array('cid'=>23));?>" title=""></a>
            </div>
        </div>
        <div class="bannerI" style="background-color: #203A72">
            <div class="bannerItem" style="background-image:url(/Public/Home/default/img/banner/banner04.png);">
                <a href="<?php echo U('List/index',array('cid'=>100));?>" title=""></a>
            </div>
        </div>
        <div class="bannerI" style="background-color: #6E6E6E">
            <div class="bannerItem" style="background-image:url(/Public/Home/default/img/banner/banner05.png);">
                <a href="<?php echo U('List/index',array('cid'=>84));?>" title=""></a>
            </div>
        </div>
    </div>
    <div class="bannerPagination"></div>
    <div class="bannerLeft none">
        <img src="/Public/Home/default/img/row_l.png" alt="" class="img-responsive" />
    </div>
    <div class="bannerRight none">
        <img src="/Public/Home/default/img/row_r.png" alt="" class="img-responsive" />
    </div>
</div>


<!--第一区块-->
<div class="wihte">
    <!--公告和动态区域-->
    <div class="max1200">
        <!--选项卡-->
        <div class="new_title">
        	
            <ul>
                <li class="active" id="hxdt"><span class="dyna">海峡动态</span></li>
                <li id="aqgg"><span class="notice">安全公告</span></li>
            </ul>
            <div class="more"><a href="<?php echo ($more_url[0]); ?>">更多</a></div>
            <div class="more none"><a href="<?php echo ($more_url[1]); ?>">更多</a></div>

        </div>
        <!--显示新闻区域-->
        <div class="new_box">
            <div class="new_main">
                <!--海峡新闻-->
                <div class="haixia_new">
                	<div class="haixia_dk">
                		<div class="clearfix scoll">
		                    <?php
 $_typeid = 18; $_keyword = ""; $_arcid = ""; if($_typeid == -1) $_typeid = I('get.cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array('article.status' => 0, 'article.cid'=> array('IN',$ids)); }else { $where = array('article.status' => 0); } if ($_keyword != '') { $where['article.title'] = array('like','%'.$_keyword.'%'); } if (!empty($_arcid)) { $where['article.id'] = array('IN', $_arcid); } if (0 > 0) { $where['_string'] = 'article.flag & 0 = 0 '; } if (0 > 0) { $count = D2('ArcView','article')->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('theme'," %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "10"; } $_artlist = D2('ArcView','article')->nofield('content')->where($where)->order("publishtime desc")->limit($limit)->select(); if (empty($_artlist)) { $_artlist = array(); } foreach($_artlist as $autoindex => $artlist): $_jumpflag = ($artlist['flag'] & B_JUMP) == B_JUMP? true : false; $artlist['url'] = get_content_url($artlist['id'], $artlist['cid'], $artlist['ename'], $_jumpflag, $artlist['jumpurl']); if(30) $artlist['title'] = str2sub($artlist['title'], 30, 0); if(0) $artlist['description'] = str2sub($artlist['description'], 0, 0); ?><div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-zs-1">
		                            <div class=" new_one">
		                            	<!--判断有没有缩略图-->
                                        <a href="<?php echo ($artlist["url"]); ?>" target="_blank"> 
		                            	<?php if( $artlist["litpic"] == '' ): ?><img src="/uploads/system/nopic.png">
		                            	<?php else: ?>
		                                	<img src="<?php echo ($artlist["litpic"]); ?>"><?php endif; ?>
		                                
		                                <p><?php echo (str2sub($artlist["description"],100)); ?></p>
		                                <span>查看详情>> </span>
                                        </a>
		                            </div>
		                        </div><?php endforeach;?>
	                    </div>
                    </div>
                    <span class="ar_left"></span>
                    <span class="ar_right"></span>
                </div>
                <!--安全公告-->
                <div class="anquan_new none">
                	<div class="haixia_dk">
                		<div class="clearfix scoll">
		                    <?php
 $_typeid = 41; $_keyword = ""; $_arcid = ""; if($_typeid == -1) $_typeid = I('get.cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array('article.status' => 0, 'article.cid'=> array('IN',$ids)); }else { $where = array('article.status' => 0); } if ($_keyword != '') { $where['article.title'] = array('like','%'.$_keyword.'%'); } if (!empty($_arcid)) { $where['article.id'] = array('IN', $_arcid); } if (0 > 0) { $where['_string'] = 'article.flag & 0 = 0 '; } if (0 > 0) { $count = D2('ArcView','article')->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('theme'," %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "10"; } $_artlist = D2('ArcView','article')->nofield('content')->where($where)->order("publishtime desc")->limit($limit)->select(); if (empty($_artlist)) { $_artlist = array(); } foreach($_artlist as $autoindex => $artlist): $_jumpflag = ($artlist['flag'] & B_JUMP) == B_JUMP? true : false; $artlist['url'] = get_content_url($artlist['id'], $artlist['cid'], $artlist['ename'], $_jumpflag, $artlist['jumpurl']); if(50) $artlist['title'] = str2sub($artlist['title'], 50, 0); if(0) $artlist['description'] = str2sub($artlist['description'], 0, 0); ?><div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-zs-1">
		                            <div class=" new_one">
		                            	<!--判断有没有图-->
                                        <a href="<?php echo ($artlist["url"]); ?>" target="_blank">
		                                <?php if( $artlist["litpic"] == '' ): ?><img src="/uploads/system/nopic.png">
		                            	<?php else: ?>
		                                	<img src="<?php echo ($artlist["litpic"]); ?>"><?php endif; ?>
		                                <p><?php echo (str2sub($artlist["description"],100)); ?></p>
		                                <span>查看详情>></span>
                                        </a>
		                            </div>
		                        </div><?php endforeach;?>
		                </div>
	                </div>
                 	<span class="ar_left"></span>
                    <span class="ar_right"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!--第二区块安全服务-->
<div class="gray">
    <div class="max1200">
        <section id="secur">
            <div class="container">                
                <div class="col-md-6">
                    <h2 class="secur_b">安全服务</h2>
                    <p>
                        经过多年安全服务实践，海峡信息积累了大量安全工程实施经验，通过国家信息安全测评中心安全工程二级认证，是客户可信赖的信息安全专家顾问。
                    </p>

                    <!--安全服务页面-->
                    <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); if($catlist["name"] == '安全服务' ): ?><a class="btn1" href='<?php echo ($catlist["url"]); ?>'><?php endif; endforeach;?>
                    <div class="state1">查看更多</div>
                    <div class="state2">查看更多</div>
                    </a>                   
                    
                </div>
                
                <div class="col-md-6">
                    <img src="/Public/Home/default/img/secur.png" class="img-responsive" alt="" />
                </div>
                
            </div>
        </section>
    </div>
</div>

<!--第三区块解决方案-->
<div class="white">
    <div class="max1200">
        <section id="solut">
            <div class="container">
                <div class="col-md-6">
                    <h2 class="solut_b">解决方案</h2>
                    <p>
                        海峡信息始终专注于中国的网络安全建设，结合最新的网络安全技术为客户提供全面的网络安全整体解决方案，从网络的整体安全性考虑部署立体式安全防护体系。
                    </p>
                    <!--解决方案页面-->
                    <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); if($catlist["name"] == '行业应用解决方案' ): ?><a class="btn1" href='<?php echo ($catlist["url"]); ?>'><?php endif; endforeach;?>

                    <div class="state1">查看更多</div>
                    <div class="state2">查看更多</div>
                    </a>
                </div>
                <div class="col-md-6">
                    <img src="/Public/Home/default/img/solut.png" class="img-responsive" alt=""/>
                </div>
            </div>
        </section>
    </div>
</div>

<!--第四区块安全产品-->
<div class="gray">
    <div class="max1200">
        <section id="prod">
            <div class="container">
            	
                <div class="col-md-6">
                    <div class="prod_title">
                        <h2 class="prod_b">安全产品</h2>
                        <p>黑盾系列网络安全产品覆盖政府、医疗、教育、金融、能源、电力、交通等多个行业，现已为国内数千家政府和企事业单位提供信息安全保护。</p>
                        
                        <!--安全服务页面-->
                    <?php
 $_typeid = intval(0); $_type = "son"; $_temp = explode(',', "10"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); if($catlist["name"] == '安全产品' ): ?><a class="btn1" href='<?php echo ($catlist["url"]); ?>'><?php endif; endforeach;?>                        
                        
                            <div class="state1">查看更多</div>
                            <div class="state2">查看更多</div>
                        </a>
                    </div>
                </div>
                
                <div class="col-md-6">    
                    <div class="prod_box">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 prod_one">
                            <div class="prod_yl">
                                <a href="<?php echo ($new_cate["0"]["url"]); ?>">
                                    <div class="intru"><span><?php echo ($new_cate["0"]["name"]); ?></span></div>
                                </a>
                            </div>

                            <div class="prod_xz">
                                <a href="<?php echo ($new_cate["0"]["url"]); ?>">
                                    <div class="intru"><span><?php echo ($new_cate["0"]["name"]); ?></span></div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 prod_one">
                            <div class="prod_yl">
                                <a href="<?php echo ($new_cate["1"]["url"]); ?>">
                                    <div class="shield"><span><?php echo ($new_cate["1"]["name"]); ?></span></div>
                                </a>
                            </div>
                            <div class="prod_xz">
                                <a href="<?php echo ($new_cate["1"]["url"]); ?>">
                                    <div class="shield"><span><?php echo ($new_cate["1"]["name"]); ?></span></div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 prod_one" style="border-right:none;">
                            <div class="prod_yl">
                                <a href="<?php echo ($new_cate["2"]["url"]); ?>">
                                    <div class="networ"><span><?php echo ($new_cate["2"]["name"]); ?></span></div>
                                </a>
                            </div>
                            <div class="prod_xz">
                                <a href="<?php echo ($new_cate["2"]["url"]); ?>">
                                    <div class="networ"><span><?php echo ($new_cate["2"]["name"]); ?></span></div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 prod_one" style="border-bottom:none;">
                            <div class="prod_yl">
                                <a href="<?php echo ($new_cate["3"]["url"]); ?>">
                                    <div class="fw"><span><?php echo ($new_cate["3"]["name"]); ?></span></div>
                                </a>
                            </div>
                            <div class="prod_xz">
                                <a href="<?php echo ($new_cate["3"]["url"]); ?>">
                                    <div class="fw"><span><?php echo ($new_cate["3"]["name"]); ?></span></div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 prod_one" style="border-bottom:none;">
                            <div class="prod_yl">
                                <a href="<?php echo ($new_cate["4"]["url"]); ?>">
                                    <div class="shiel"><span>黑盾终端管理系统</span></div>
                                </a>
                            </div>
                            <div class="prod_xz">
                                <a href="<?php echo ($new_cate["4"]["url"]); ?>">
                                    <div class="shiel"><span>黑盾终端管理系统</span></div>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 prod_one" style="border:none;">
                            <div class="prod_yl">
                                <a href="<?php echo ($new_cate["5"]["url"]); ?>">
                                    <div class="secu"><span>网络安全解决方案</span></div>
                                </a>
                            </div>
                            <div class="prod_xz">
                                <a href="<?php echo ($new_cate["5"]["url"]); ?>">
                                    <div class="secu"><span>网络安全解决方案</span></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<!--友情链接部分-->
<!--友情链接-->
<div class="fr_link" xmlns:yang="http://www.w3.org/1999/html">
	<div class="sjBg">
		<div class="max1200">
			<section id="frilink">
				<div class="container">
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-4 fried">
						<h3>友情链接</h3>
						<ul>
							<?php
 $_typeid = 0; if ($_typeid>0 || substr($_typeid,0,1) == '$') { $where = array('ischeck'=> $_typeid); }else { $where = array('id' => array('gt',0)); } if (0 > 0) { $count = M('link')->where($where)->count(); $thisPage = new \Common\Lib\Page($count, 0); $thisPage->rollPage = 5; $thisPage->setConfig('theme'," %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "10"; } $_flink = M('link')->where($where)->order("sort ASC")->limit($limit)->select(); if (empty($_flink)) { $_flink = array(); } foreach($_flink as $autoindex => $flink): ?><li>
									<a style="color: #b1c1d3" href="<?php echo ($flink["url"]); ?>" target="_blank"><?php echo ($flink["name"]); ?></a>
								</li><?php endforeach;?>
						</ul>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-8 mecha">
						<h3>安全产品</h3>
						<ul>
							<?php
 $_typeid = intval(2); $_type = "son"; $_temp = explode(',', "4"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li><a href="<?php echo ($catlist["url"]); ?>"><?php echo ($catlist["name"]); ?></a></li><?php endforeach;?>
						</ul>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 col-xs-8 mecha">
						<h3>安全服务</h3>
						<ul>
							<?php
 $_typeid = intval(5); $_type = "son"; $_temp = explode(',', "4"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><li><a href="<?php echo ($catlist["url"]); ?>"><?php echo ($catlist["name"]); ?></a></li><?php endforeach;?>
						</ul>
					</div>
					<div class="col-lg-2 col-md-2 col-sm-4 col-xs-12">
						<div class="call">
							<span class="code"></span>
							<span>微信公众号</span>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<!--友情链接-->

<!--版权信息-->
<div class="fotter">
	福建省海峡信息技术有限公司&nbsp;版权所有
	<span>&nbsp;联系:&nbsp;hxzhb@heidun.net 闽ICP备06011901号 © 1999-2017 Fujian Strait Information Corporation. All Rights Reserved.</span>
</div>

<!-- 返回顶部 -->
<div id="goback">
    <div class="jt">
        <img src="/Public/Home/default/img/jt.png" alt="">
    </div>
    <p class="none">
        返回顶部
    </p>
</div>
<!-- 返回顶部 -->

<div id="qqAdd" style="display: block; position: fixed; z-index: 2147483646 ! important; left: 8px; right: auto; margin-left: 0px; top: 50%; bottom: auto; margin-top: -138px;"></div>
<!--在线客服-->
<!-- WPA Button Begin -->
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODAzOTEzNF8yMzI4MTFfNDAwNjM1MzUwMF8"></script>
<!-- WPA Button END -->
<script type="text/javascript">
// 聊天窗口
if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){
	BizQQWPA.add({
	 aty: '0', //接入到指定工号 0-自动分流，1-指定工号，2-指定分组
	 //a: '1001', //指定工号1001接入
	 type: '1', //使用按钮类型 WPA
	 nameAccount: '4006353500', //营销 QQ 号码
	 title: '欢迎咨询',
	 wd: '黑盾产品在线支持',
	 wd2: '0591-87303705',
	 fsty: '1', // 浮动类型，1-固定型，2-滚动型，仅在 type=10,11,12时有效
	 fposX: '0', // 浮动横向位置，0-左，1-中，2-右，仅在 type=10,11,12时有效
	 fposY: '0', // 浮动纵向位置，0-上，1-中，2-下，仅在 type=10,11,12时有效
	 parent: 'qqAdd' //将 WPA 放置在 ID 为 qqAdd 的元素里 type 为 1和2时有效
	});
}else{
	BizQQWPA.add({
	 aty: '0', //接入到指定工号 0-自动分流，1-指定工号，2-指定分组
	 //a: '1001', //指定工号1001接入
	 type: '12', //使用按钮类型 WPA
	 nameAccount: '4006353500', //营销 QQ 号码
	 title: '欢迎咨询',
	 wd: '黑盾产品在线支持',
	 wd2: '0591-87303705',
	 fsty: 1, // 浮动类型，1-固定型，2-滚动型，仅在 type=10,11,12时有效
	 fposX: '0', // 浮动横向位置，0-左，1-中，2-右，仅在 type=10,11,12时有效
	 fposY: '1' // 浮动纵向位置，0-上，1-中，2-下，仅在 type=10,11,12时有效
	 //parent: 'qqAdd' //将 WPA 放置在 ID 为 qqAdd 的元素里 type 为 1和2时有效
	});
	
	var ii = 0;
	var mqqTimer = setInterval(function(){
		var oIframe = $('iframe:last');
		if(oIframe.attr('src') == 'about:blank'){
			var oIframeDoc = oIframe[0].contentDocument || oIframe[0].contentWindow.document;
			if($.trim($('#launchBtn',oIframeDoc).text()) == 'QQ交谈'){
				oIframe.css({position: 'fixed',top: '30%'});
				if(ii++ > 10)clearInterval(mqqTimer);				
				ii++;
			}
		}
	},1000);
	
	/* BizQQWPA.addCustom({
	 aty: '0', //接入到指定工号 0-自动分流，1-指定工号，2-指定分组
	 //a: '1001', //指定工号1001接入
	 nameAccount: '4006353500', //营销 QQ 号码
	 //selector: 'qqAdd' //将 WPA 放置在 ID 为 qqAdd 的元素里
	 node: document.body
	});*/
}

// 添加访客功能
BizQQWPA.visitor({
 nameAccount: '4006353500' //营销 QQ 号码
});
</script>


<script type="text/javascript">
    var publics = '/Public/Home/default';
</script>
<script src="/Public/Home/default/js/project/index.js"></script>

</body>
</html>