<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1"/>

    <title>福建省海峡信息技术有限公司 - 黑盾，安全缔造信息未来</title>
    <meta name="keywords" content="黑盾,网络安全公司,海峡,防火墙,数据库审计,入侵防御,入侵防护,远程安全评估,web安全防护,安全准入,文档安全" />
    <meta name="description" content="福建省海峡信息技术有限公司，是一家专业从事网络安全技术研发、网络安全产品销售、网络安全服务的高薪技术企业" />

    <link rel="stylesheet" href="/Public/Home/default/css/bootstrap.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/style.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/header.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/banners.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/fotter.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/details.css"/>
    <link rel="stylesheet" href="/Public/Home/default/css/media.css"/>

	<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
	<!--[if lte IE 8]>
    <script type="text/javascript" src="/Public/Home/default/js/plugin/html5shiv.js"></script>
    <script type="text/javascript" src="/Public/Home/default/js/plugin/respond.min.js"></script>
	<![endif]-->

    <script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="http://lib.sinaapp.com/js/bootstrap/2.1.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        !window.jQuery && document.write('<script src=/Public/Home/default/js/framework/jquery-1.9.1.min.js><\/script>');
    </script>
    <script type="text/javascript" src="/Public/Home/default/js/project/introduce.js"></script>

</head>
<body>
<!--引入导航-->
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
			$("#<?php echo ($cate['id']); ?>").addClass("current");
            $("#<?php echo ($cate['id']); ?>").parent('li').addClass("currs").siblings('li').removeClass("currs");
		</script>
    </div>
</nav>


<!-- Banner判断 -->
<?php switch($cate['id']): case "11": ?><!--走进海峡02-->
        <div id="banners" class="banners">
            <!-- <img src="img/introduce/title_02.png" alt="" class="img-responsive" /> -->
            <div class="bannerBG" style="background-image: url(/Public/Home/default/img/introduce/title_02.png);">
                <div class="contain">
                    <div class="xq">
                        <div class="title">
                            走进公司
                        </div>
                        <p>福建省海峡信息技术有限公司是一家国有控股高新技术企业，专业从事网络安全技术领域的技术研究、产品销售、信息安全服务等业务，通过十多年的产品研发和发展，现已成为全国领先的网络安全整体解决方案提供商。</p>
                    </div>
                </div>
            </div>

        </div><?php break;?>
    <?php case "2": ?><!--安全产品03-->
        <div id="banners" class="banners">
            <!-- <img src="img/introduce/title_02.png" alt="" class="img-responsive" /> -->
            <div class="bannerBG" style="background-image: url(/Public/Home/default/img/introduce/title_03.png);">
                <div class="contain">
                    <div class="xq">
                        <div class="title">
                            安全产品
                        </div>
                        <p>黑盾系列网络安全产品覆盖政府、医疗、教育、金融、能源、电力、交通等多个行业，现已为国内数千家政府和企事业单位提供信息安全保护。</p>
                    </div>
                </div>
            </div>
        </div><?php break;?>
    <?php case "5": ?><!--安全服务04-->
        <div id="banners" class="banners">
            <!-- <img src="img/introduce/title_02.png" alt="" class="img-responsive" /> -->
            <div class="bannerBG" style="background-image: url(/Public/Home/default/img/introduce/title_04.png);">
                <div class="contain">
                    <div class="xq">
                        <div class="title">
                            安全服务
                        </div>
                        <p>经过多年安全服务实践，海峡信息积累了大量安全工程实施经验，通过国家信息安全测评中心安全工程二级认证，是客户可信赖的信息安全专家顾问。</p>
                    </div>
                </div>
            </div>
        </div><?php break;?>
    <?php case "8": ?><!--解决方案05-->
        <div id="banners" class="banners">
            <!-- <img src="img/introduce/title_02.png" alt="" class="img-responsive" /> -->
            <div class="bannerBG" style="background-image: url(/Public/Home/default/img/introduce/title_05.png);">
                <div class="contain">
                    <div class="xq"> 
                        <div class="title">
                            行业应用解决方案
                        </div>
                        <p>海峡信息始终专注于中国的信息网络安全建设，结合最新的网络安全技术，为客户提供全面的网络安全整体解决方案和构建立体式安全防护体系。</p>
                    </div>
                </div>
            </div>
        </div><?php break;?>
    <?php case "9": ?><!--渠道合作06-->
        <div id="banners" class="banners">
            <!-- <img src="img/introduce/title_02.png" alt="" class="img-responsive" /> -->
            <div class="bannerBG" style="background-image: url(/Public/Home/default/img/introduce/title_06.png);">
                <div class="contain">
                    <div class="xq">
                        <div class="title">
                            渠道合作
                        </div>
                        <p>福建省海峡信息技术有限公司作为一家专业从事网络安全产品研发、销售和网络安全整体解决方案的一流供应商，我们的业务拓展方针是通过业内同行合作伙伴向最终用户提供服务和产品，本着“诚信 协作 共赢”的渠道合作原则</p>
                    </div>
                </div>
            </div>
        </div><?php break;?>
    <?php case "10": ?><!--人力资源07-->
        <div id="banners" class="banners">
            <div class="bannerBG" style="background-image: url(/Public/Home/default/img/introduce/title_06.png);">
                <div class="contain">
                    <div class="xq">
                        <div class="title">
                            诚聘英才
                        </div>
                        <p>秉承“人力资源是企业的第一资源”的人才经营理念，重视员工，激励员工，培养员工，让每个员工都能与公司共同进步和发展。</p>
                    </div>
                </div>
            </div>
        </div><?php break;?>
    <?php case "67": ?><!--联系我们02-->
        <div id="banners" class="banners">
            <div class="bannerBG" style="background-image: url(/Public/Home/default/img/introduce/title_02.png);">
                <div class="contain">
                    <div class="xq">
                        <div class="title">
                            联系我们
                        </div>
                        <p>福建省海峡信息技术有限公司是福建省科技厅下属的省科技信息研究所控股、员工参股的国有企业</p>
                    </div>
                </div>
            </div>
        </div><?php break; endswitch;?>



<!-- 公司介绍 -->
<div id="introduction" class="introduction ">
    <div class="title clearfix">
        <img src="/Public/Home/default/img/introduce/icon_056.png" alt="" class="img-responsive"/>
        <div>
            <?php
 $_sname = ""; $_typeid = -1; if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); if ($_typeid == 0 && $_sname == '') { $_sname = isset($title) ? $title : ''; } echo get_position($_typeid, $_sname, "", 0, ""); ?>
        </div>
    </div>

    <div class="context">
        <ul class="clearfix">
            <?php
 $_typeid = intval(-1); $_type = "son"; $_temp = explode(',', "16"); $_temp[0] = $_temp[0] > 0? $_temp[0] : 10; if (isset($_temp[1]) && intval($_temp[1]) > 0) { $_limit[0] = $_temp[0]; $_limit[1] = intval($_temp[1]); }else { $_limit[0] = 0; $_limit[1] = $_temp[0]; } if($_typeid == -1) $_typeid = I('cid', 0, 'intval'); $__catlist = get_category(1); if (0) { $__catlist = Common\Lib\Category::getLevelOfModelId($__catlist, 0); } if (1 == 0) { $__catlist = Common\Lib\Category::clearPageAndLink($__catlist); } if($_typeid == 0 || $_type == 'top') { $_catlist = Common\Lib\Category::toLayer($__catlist); }else { if ($_type == 'self') { $_typeinfo = Common\Lib\Category::getSelf($__catlist, $_typeid ); $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeinfo['pid']); }else { $_catlist = Common\Lib\Category::toLayer($__catlist, 'child', $_typeid); } } foreach($_catlist as $autoindex => $catlist): if($autoindex < $_limit[0]) continue; if($autoindex >= ($_limit[1]+$_limit[0])) break; $catlist['url'] = get_url($catlist); ?><!--<?php var_dump($catlist); ?>-->
                <!--自定义页面模型-->
                <!--<?php if( ($catlist["template_list"] == 'List_page.html') or ($catlist["template_list"] == 'List_event.html') or ($catlist["template_list"] == 'List_honor.html') or ($catlist["template_list"] == 'List_culture.html') or ($catlist["template_list"] == 'List_detail.html') or ($catlist["template_list"] == 'List_download.html') ): ?>-->
                <?php $temp_list = array( 'List_page.html', 'List_event.html', 'List_honor.html', 'List_culture.html', 'List_detail.html', 'List_download.html', 'List_service.html' ); ?>
                <if condition="$catlist.template_list in $temp_list ">
                    <!--判断产品模型中的2个-->
                    <?php switch($catlist['id']): case "34": ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                                <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                                    <div class="cell" style="height: 270px;">
                                        <div class="ztImg">
                                            <img src="<?php echo ($catlist["catpic"]); ?>" class="img-responsive"
                                                 style="height: 200px;"/>
                                            <h4 class="text-center" style="color: #2E85D8"><?php echo ($catlist["name"]); ?></h4>
                                        </div>
                                        <dl class="clearfix"></dl>
                                    </div>
                                </a>
                            </li><?php break;?>
                        <?php case "35": ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                                <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                                    <div class="cell">
                                        <div class="title clearfix">
                                            <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                            <!--<img src="/Public/Home/default/img/introduce/icon_3.png " class="img-responsive"/>-->
                                            <div>
                                                <?php echo ($catlist["name"]); ?>
                                            </div>
                                        </div>
                                        <div class="englistTitle">
                                            <?php echo ($catlist["ename"]); ?>
                                        </div>
                                        <div class="ztImg">
                                            <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                        </div>
                                        <p><?php echo ($catlist["description"]); ?></p>
                                    </div>
                                </a>
                            </li><?php break;?>
                        <!--大事记-->
                        <?php case "16": ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                                <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                                    <div class="cell">
                                        <div class="title clearfix">
                                            <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                            <div><?php echo ($catlist["name"]); ?></div>
                                        </div>
                                        <div class="englistTitle"><?php echo ($catlist["ename"]); ?></div>
                                        <div class="ztImg">
                                            <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                        </div>
                                        <dl class="clearfix">
                                            <dt> <img src="/Public/Home/default/img/introduce/icon_96.png"  class="img-responsive"/></dt>
                                            <dd>2017-06 海峡信息以“黑盾--安全缔造信息未来 ”为主题，</dd>
                                            <dt> <img src="/Public/Home/default/img/introduce/icon_96.png"  class="img-responsive"/></dt>
                                            <dd>2016-11 公司建设运营的“福建省海峡软件应用安全公共服务平台”成功入选福建省互联网经济重点公共服务平台</dd>
                                            <dt> <img src="/Public/Home/default/img/introduce/icon_96.png"  class="img-responsive"/></dt>
                                            <dd>2016-07 公司成功入选“福建省科技小巨人领军企业”</dd>
                                        </dl>
                                    </div>
                                </a>
                            </li><?php break;?>
                        <!--资质荣誉-->
                        <?php case "19": ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                                <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                                    <div class="cell">
                                        <div class="title clearfix">
                                            <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                            <div><?php echo ($catlist["name"]); ?></div>
                                        </div>
                                        <div class="englistTitle"><?php echo ($catlist["ename"]); ?></div>
                                        <div class="ztImg">
                                            <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                        </div>
                                        <dl class="clearfix">
                                            <dt> <img src="/Public/Home/default/img/introduce/icon_96.png"  class="img-responsive"/></dt>
                                            <dd>高新企业技术证书</dd>
                                            <dt> <img src="/Public/Home/default/img/introduce/icon_96.png"  class="img-responsive"/></dt>
                                            <dd>福建省信息网络安全工程技术研究中心</dd>
                                            <dt> <img src="/Public/Home/default/img/introduce/icon_96.png"  class="img-responsive"/></dt>
                                            <dd>福建省创新型企业认证证书</dd>
                                        </dl>
                                    </div>
                                </a>
                            </li><?php break;?>
                        <?php default: ?>
                        <!--自定义页面模型-->
                        <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                            <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                                <div class="cell">
                                    <div class="title clearfix">
                                        <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                        <!--<img src="/Public/Home/default/img/introduce/icon_3.png " class="img-responsive"/>-->
                                        <div>
                                            <?php echo ($catlist["name"]); ?>
                                        </div>
                                    </div>
                                    <div class="englistTitle">
                                        <?php echo ($catlist["ename"]); ?>
                                    </div>
                                    <div class="ztImg">
                                        <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                    </div>
                                    <p><?php echo ($catlist["description"]); ?></p>
                                </div>
                            </a>
                        </li><?php endswitch; endif; ?>

                <!--文章模型显示-->
                <?php if($catlist["template_list"] == 'List_article.html' ): switch($catlist['name']): case "社会招聘": ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">

                                <div class="cell">
                                    <div class="title clearfix">
                                        <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                        <div>
                                            <?php echo ($catlist["name"]); ?>
                                        </div>
                                    </div>
                                    <div class="englistTitle">
                                        <?php echo ($catlist["ename"]); ?>
                                    </div>
                                    <div class="ztImg">
                                        <!--<img src="/Public/Home/default/img/introduce/introduce05.png" alt="" class="img-responsive" />-->
                                        <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                    </div>
                                    <dl class="clearfix">


                                        <dd style="max-height: 32px">
                                            <img src="/Public/Home/default/img/job/zhilian.png" alt="智联招聘" width="20px" height="20px" style="display: inline-block" />
                                            <a style="color: #8F8E8E" target="_blank" href="http://special.zhaopin.com/pagepublish/15671011/index.html">智联招聘</a>
                                        </dd>


                                        <dd style="max-height: 32px">
                                            <img src="/Public/Home/default/img/job/51job.png" alt="前程无忧" width="20px" height="20px" style="display: inline-block" />
                                            <a style="color: #8F8E8E" target="_blank" href="http://jobs.51job.com/all/co2997075.html">前程无忧</a>
                                        </dd>


                                        <dd style="max-height: 32px">
                                            <img src="/Public/Home/default/img/job/haixia.png" alt="海峡人才" width="20px" height="20px" style="display: inline-block"/>
                                            <a style="color: #8F8E8E" target="_blank" href="http://www.hxrc.com/JobDetail_5525e890-9a34-49f8-a368-0c6f6ca2145b.html">海峡人才网</a>
                                        </dd>

                                    </dl>
                                </div>

                            </li><?php break;?>
                        <?php case "长期招聘": ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">

                                <a href="<?php echo U('Show/job');?>" title="<?php echo ($catlist["name"]); ?>">

                                    <div class="cell">
                                        <div class="title clearfix">
                                            <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                            <div>
                                                <?php echo ($catlist["name"]); ?>
                                            </div>
                                        </div>
                                        <div class="englistTitle">
                                            <?php echo ($catlist["ename"]); ?>
                                        </div>
                                        <div class="ztImg">
                                            <!--<img src="/Public/Home/default/img/introduce/introduce05.png" alt="" class="img-responsive" />-->
                                            <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                        </div>
                                        <dl class="clearfix">
                                            <?php
 $_typeid = 58; $_keyword = ""; $_arcid = ""; if($_typeid == -1) $_typeid = I('get.cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array('article.status' => 0, 'article.cid'=> array('IN',$ids)); }else { $where = array('article.status' => 0); } if ($_keyword != '') { $where['article.title'] = array('like','%'.$_keyword.'%'); } if (!empty($_arcid)) { $where['article.id'] = array('IN', $_arcid); } if (0 > 0) { $where['_string'] = 'article.flag & 0 = 0 '; } if (0 > 0) { $count = D2('ArcView','article')->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('theme'," %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "3"; } $_artlist = D2('ArcView','article')->nofield('content')->where($where)->order("publishtime desc")->limit($limit)->select(); if (empty($_artlist)) { $_artlist = array(); } foreach($_artlist as $autoindex => $artlist): $_jumpflag = ($artlist['flag'] & B_JUMP) == B_JUMP? true : false; $artlist['url'] = get_content_url($artlist['id'], $artlist['cid'], $artlist['ename'], $_jumpflag, $artlist['jumpurl']); if(20) $artlist['title'] = str2sub($artlist['title'], 20, 0); if(0) $artlist['description'] = str2sub($artlist['description'], 0, 0); ?><dt>
                                                    <img src="/Public/Home/default/img/introduce/icon_96.png" alt=""
                                                         class="img-responsive"/>
                                                </dt>
                                                <dd>
                                                    <?php echo ($artlist["title"]); ?>
                                                </dd><?php endforeach;?>
                                        </dl>
                                    </div>
                                </a>
                            </li><?php break;?>
                        <?php case "校园招聘": ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">

                                <a href="<?php echo U('Show/schooljob');?>" title="<?php echo ($catlist["name"]); ?>">

                                    <div class="cell">
                                        <div class="title clearfix">
                                            <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                            <div>
                                                <?php echo ($catlist["name"]); ?>
                                            </div>
                                        </div>
                                        <div class="englistTitle">
                                            <?php echo ($catlist["ename"]); ?>
                                        </div>
                                        <div class="ztImg">
                                            <!--<img src="/Public/Home/default/img/introduce/introduce05.png" alt="" class="img-responsive" />-->
                                            <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                        </div>
                                        <dl class="clearfix">
                                            <?php
 $_typeid = 99; $_keyword = ""; $_arcid = ""; if($_typeid == -1) $_typeid = I('get.cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array('article.status' => 0, 'article.cid'=> array('IN',$ids)); }else { $where = array('article.status' => 0); } if ($_keyword != '') { $where['article.title'] = array('like','%'.$_keyword.'%'); } if (!empty($_arcid)) { $where['article.id'] = array('IN', $_arcid); } if (0 > 0) { $where['_string'] = 'article.flag & 0 = 0 '; } if (0 > 0) { $count = D2('ArcView','article')->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('theme'," %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "3"; } $_artlist = D2('ArcView','article')->nofield('content')->where($where)->order("publishtime desc")->limit($limit)->select(); if (empty($_artlist)) { $_artlist = array(); } foreach($_artlist as $autoindex => $artlist): $_jumpflag = ($artlist['flag'] & B_JUMP) == B_JUMP? true : false; $artlist['url'] = get_content_url($artlist['id'], $artlist['cid'], $artlist['ename'], $_jumpflag, $artlist['jumpurl']); if(20) $artlist['title'] = str2sub($artlist['title'], 20, 0); if(0) $artlist['description'] = str2sub($artlist['description'], 0, 0); ?><dt>
                                                    <img src="/Public/Home/default/img/introduce/icon_96.png" alt=""
                                                         class="img-responsive"/>
                                                </dt>
                                                <dd>
                                                    <?php echo ($artlist["title"]); ?>
                                                </dd><?php endforeach;?>
                                        </dl>
                                    </div>
                                </a>
                            </li><?php break;?>
                        <?php default: ?>
                            <li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">

                                <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">

                                    <div class="cell">
                                        <div class="title clearfix">
                                            <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                            <div>
                                                <?php echo ($catlist["name"]); ?>
                                            </div>
                                        </div>
                                        <div class="englistTitle">
                                            <?php echo ($catlist["ename"]); ?>
                                        </div>
                                        <div class="ztImg">
                                            <!--<img src="/Public/Home/default/img/introduce/introduce05.png" alt="" class="img-responsive" />-->
                                            <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                        </div>
                                        <dl class="clearfix">
                                            <?php
 $_typeid = -1; $_keyword = ""; $_arcid = ""; if($_typeid == -1) $_typeid = I('get.cid', 0, 'intval'); if ($_typeid>0 || substr($_typeid,0,1) == '$') { $ids = Common\Lib\Category::getChildsId(get_category(), $_typeid, true); $where = array('article.status' => 0, 'article.cid'=> array('IN',$ids)); }else { $where = array('article.status' => 0); } if ($_keyword != '') { $where['article.title'] = array('like','%'.$_keyword.'%'); } if (!empty($_arcid)) { $where['article.id'] = array('IN', $_arcid); } if (0 > 0) { $where['_string'] = 'article.flag & 0 = 0 '; } if (0 > 0) { $count = D2('ArcView','article')->where($where)->count(); $ename = I('e', '', 'htmlspecialchars,trim'); if (!empty($ename) && C('URL_ROUTER_ON') == true) { $param['p'] = I('p', 1, 'intval'); $param_action = '/'.$ename; }else { $param = array(); $param_action = ''; } $thisPage = new \Common\Lib\Page($count, 0, $param, $param_action); $thisPage->rollPage = 5; $thisPage->setConfig('theme'," %FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%"); $limit = $thisPage->firstRow. ',' .$thisPage->listRows; $page = $thisPage->show(); }else { $limit = "3"; } $_artlist = D2('ArcView','article')->nofield('content')->where($where)->order("publishtime desc")->limit($limit)->select(); if (empty($_artlist)) { $_artlist = array(); } foreach($_artlist as $autoindex => $artlist): $_jumpflag = ($artlist['flag'] & B_JUMP) == B_JUMP? true : false; $artlist['url'] = get_content_url($artlist['id'], $artlist['cid'], $artlist['ename'], $_jumpflag, $artlist['jumpurl']); if(20) $artlist['title'] = str2sub($artlist['title'], 20, 0); if(0) $artlist['description'] = str2sub($artlist['description'], 0, 0); ?><dt>
                                                    <img src="/Public/Home/default/img/introduce/icon_96.png" alt=""
                                                         class="img-responsive"/>
                                                </dt>
                                                <dd>
                                                    <?php echo ($artlist["title"]); ?>
                                                </dd><?php endforeach;?>
                                        </dl>
                                    </div>
                                </a>
                            </li><?php endswitch; endif; ?>

                <!--判断产品模型-->
                <?php if($catlist["template_list"] == 'List_product.html' ): ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                        <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                            <div class="cell" style="height: 270px;">
                                <div class="ztImg">
                                    <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive" style="height: 200px;"/>
                                    <h4 class="text-center" style="color: #2E85D8"><?php echo ($catlist["name"]); ?></h4>
                                </div>
                                <dl class="clearfix"></dl>
                            </div>
                        </a>
                    </li><?php endif; ?>

                <!--联系我们-->
                <?php if($catlist["template_list"] == 'List_contact.html' ): ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                        <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                            <div class="cell">
                                <div class="title clearfix">
                                    <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                    <!--<img src="/Public/Home/default/img/introduce/icon_3.png " class="img-responsive"/>-->
                                    <div>
                                        <?php echo ($catlist["name"]); ?>
                                    </div>
                                </div>
                                <div class="englistTitle">
                                    <?php echo ($catlist["ename"]); ?>
                                </div>
                                <div class="ztImg">
                                    <img src="/Public/Home/default/img/introduce/Social.png" alt="" class="img-responsive"/>
                                </div>
                                <p><?php echo ($catlist["description"]); ?></p>
                            </div>
                        </a>
                    </li><?php endif; ?>

                <!--服务类-->
                <?php if($catlist["template_list"] == 'List_service.html'): ?><li class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-zs-12">
                        <a href="<?php echo ($catlist["url"]); ?>" title="<?php echo ($catlist["name"]); ?>">
                            <div class="cell">
                                <div class="title clearfix">
                                    <div class="img" style="background-position: 0 <?php echo ($catlist["seotitle"]); ?>px;"></div>
                                    <!--<img src="/Public/Home/default/img/introduce/icon_3.png " class="img-responsive"/>-->
                                    <div>
                                        <?php echo ($catlist["name"]); ?>
                                    </div>
                                </div>
                                <div class="englistTitle">
                                    <?php echo ($catlist["ename"]); ?>
                                </div>
                                <div class="ztImg">
                                    <img src="<?php echo ($catlist["catpic"]); ?>" alt="" class="img-responsive"/>
                                </div>
                                <p><?php echo ($catlist["description"]); ?></p>
                            </div>
                        </a>
                    </li><?php endif; endforeach;?>
        </ul>
    </div>
</div>

<!--版权信息-->
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


    
</body>
</html>