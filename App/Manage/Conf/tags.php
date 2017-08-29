<?php

return array(
	// 启用多语言功能，需开启多语言行为
	//'app_begin' => array('Behavior\CheckLangBehavior'),
	// 表单令牌功能
	'view_filter' => array('Behavior\TokenBuildBehavior'),
);

?>
