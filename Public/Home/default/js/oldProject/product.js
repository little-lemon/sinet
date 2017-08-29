$(function(){

	/**
	 * 欧彬 选项卡
	 * @param  {[type]} ){	var that          [description]
	 * @return {[type]}         [description]
	 */
	$(".begin .menu ul li").click(function(){
		var that = $(this), index = $(".begin .menu ul li").index($(this));
		that.addClass('current').siblings('li').removeClass('current');
		$(".begin .content ul li").eq(index).removeClass('none').siblings('li').addClass('none');
	});


})