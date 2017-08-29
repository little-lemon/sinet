$(function(){
	
	//添加子内容
	$('#add_child').click(function(){
		var new_panel = '<div class="panel panel-default"><div class="panel-body"><div class="form-group"><label  for="" class="col-sm-2 control-label">子标题</label>'+	
			'<div class="col-sm-9"><input type="text"  id="" name="subtitle[]" class="form-control" placeholder="标题" required="required" /></div></div>'+
			'<div class="form-group"><label  class="col-sm-2 control-label">子段落</label><div class="col-sm-9"><textarea rows="5" name="subcontent[]" class="form-control"></textarea>'+
			'</div></div></div></div>';
		$('#position').before(new_panel);
	});
	
})