$(function(){

	//添加电话
	$('#add_tel').click(function(){
		var new_div = '<div class="form-group"><label class="col-sm-2 control-label"></label><div class="col-sm-5">'+
                    '<input type="text" class="form-control" name="hx_tel[]" placeholder="电话" required="required"/></div></div>';
        $('#address').before(new_div);
	});
	//添加办事处
	$('#add_office').click(function(){		
		var new_panel = '<div class="panel panel-default office"><div class="panel-body"><div class="form-group"><label class="col-sm-2 control-label">办事处</label>'+
		    '<div class="col-sm-5"><input type="text" class="form-control" name="name[]" value="" placeholder="办事处" required="required"/></div></div>'+
		    '<div class="form-group"><label class="col-sm-2 control-label">地址</label><div class="col-sm-5">'+
		    '<input type="text" class="form-control" name="addr[]" value="" placeholder="地址" required="required"/></div></div><div class="form-group"><label class="col-sm-2 control-label">电话</label>'+
		    '<div class="col-sm-5"><input type="text" class="form-control" name="tel[]" value="" placeholder="电话" required="required"/></div></div><div class="form-group">'+
		    '<label class="col-sm-2 control-label">联系人</label><div class="col-sm-5"><input type="text" class="form-control" name="contacts[]" value="" placeholder="联系人" required="required"/>'+
		    '</div></div><div class="form-group"><label class="col-sm-2 control-label">E-mail</label><div class="col-sm-5"><input type="text" class="form-control" name="email[]" value="" placeholder="E-mail" required="required"/>'+
		    '</div></div><div class="form-group"><label class="col-sm-2 control-label">传真</label><div class="col-sm-5"><input type="text" class="form-control" name="fax[]" value="" placeholder="传真" required="required"/>'+
		    '</div></div></div></div>';
		$('#position2').before(new_panel);
	});
});