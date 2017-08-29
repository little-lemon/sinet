<?php
/***
 *用户自定义函数文件，二次开发，可将函数写于此，升级不会覆盖此文件
 ***/

// 删除图片：参数：一维数组：所有要删除的图片的路径
function deleteImage($images)
{
    foreach ($images as $v) {
        @unlink($v);
    }
}

/**
 * 传入时间 秒,计算剩余的时间
 * @param  number $time 时间
 * @return string n年n月n天n小时n分钟n秒
 */
function left_time($time) {
	if($time > 0){
		$f = array(
			'31536000'=> '年',
			'2592000' => '个月',
			'604800'  => '周',
			'86400'   => '天',
			'3600'    => '小时',
			'60'      => '分钟',
			'1'       => '秒'
		);
		$stime = '';
		foreach($f as $k=>$v){
			if(0 != $c=floor($time/(int)$k)){
				$stime .= $c.$v;
				$time = $time % $k;
			}
		}
		return $stime;
	}else{
		return '';
	}
}

/**
 * @description 转换Unicode编码 解码
 * @param {String} sStr 要解码的字符串
 * @returns {String} sDstr 解码后的字符串
 */
function UnUnicode($sStr){
	$sDstr = '';
	for($i=0; $i < strlen($sStr); $i=$i+2){
		$sDstr .= chr(hexdec(substr($sStr, $i, 2)));
	}
    return $sDstr;
}


?>