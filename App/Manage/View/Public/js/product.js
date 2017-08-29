$(function(){
	
	// 点击按钮切换div
	$("#tabbar-div p span").click(function(){
		// 获取点击的是第几个按钮
		var i = $(this).index();
		// 显示第i个table
		$(".div_content").eq(i).show();
		// 隐藏其他的table
		$(".div_content").eq(i).siblings(".div_content").hide();
		// 把原来选中的取消选中状态
		$(".tab-front").removeClass("tab-front").addClass("tab-back");
		// 切换点击的按钮的样式为选中状态
		$(this).removeClass("tab-back").addClass("tab-front");
	});
	
	//添加技术优势
	$('#add_advantage').click(function(){
    	var new_input = '<br/><input type="text" id="inputTtitle" name="advantage[]" class="form-control advantage" placeholder="技术优势" required="required"/>';
		$position = $('#position_1');
		$position.append(new_input);
	});
	
	//添加典型应用
	$('#add_application').click(function(){
		var new_panel = '<div class="panel panel-default app_content"><div class="panel-body"><div class="form-group"><label class="col-sm-2 control-label">标题</label>'+	
		'<div class="col-sm-9"><input type="text" name="app_title[]" class="form-control" placeholder="小标题" required="required"/></div></div>'+
		'<div class="form-group"><label class="col-sm-2 control-label">描述</label><div class="col-sm-9">'+
		'<textarea  name="app_des[]" class="form-control"></textarea></div></div></div></div>';
		$('.app_pictures').before(new_panel);
	});
	
/*	$("button[type='submit']").click(function(){
		var advantageArr = $('.advantage');
		var len = advantageArr.length;
		var advantageStr = '';
		for(i=0;i<len;i++){
			advantageStr += advantageArr[i].value + '#';
		}
		advantageStr=advantageStr.substr(0,advantageStr.length-1);
		alert(advantageStr);
	});*/
	
})