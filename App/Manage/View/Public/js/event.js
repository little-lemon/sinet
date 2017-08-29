$(function(){
	
	//添加
	$('#add').click(function(){
    	var newtr = '<tr><td><input type="text" name="date" value="" /></td><td><input type="text" name="desc" value="" /></td><td><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-trash"></span></td></tr>';
		$position = $('tbody');
		$position.append(newtr);
	});
	
	//保存大事记页面的数据
	function save(){
		$("input[name='date']").removeAttr("disabled"); 
		$("input[name='desc']").removeAttr("disabled"); 
		$data = $('#formValidate').serializeArray();
		var djsData = new Array();
		djsData['ename'] = $data[0].value;
		djsData['description'] = $data[1].value;
		var len = $data.length;
		djsData['id'] = $data[len-2].value;
		var content = '';
		for(var i=2; i<len-2; i=i+2)
		{
			content += $data[i].value + '#';
			content += $data[i+1].value + '#';
		}
		content=content.substr(0,content.length-1);
		djsData['content'] = content;
				
		
		$.ajax({
            type: "POST",
            data:{'id':djsData['id'],'ename':djsData['ename'],'description':djsData['description'],'content':djsData['content']},
            url: "sim.php?s=/Event/save",
            success: function (obj) {
                if(obj.code == 0){
					/*alert(obj.msg);*/
					window.location.reload(); 
				}
            },
       });
	}
	
	//点击保存按钮操作
	$('#save').click(function(){
      save();
	});
	
	//修改
	$(".edit").click(function(){
		$("input[name='date']").attr('disabled','disabled');
		$("input[name='desc']").attr('disabled','disabled');
		$(this).parent().siblings().children('input').removeAttr("disabled");
		$('#save').click(function(){
      		save();
		});
	});
	
	//删除
	$(".del").click(function(){
		var a=confirm("确定要删除吗?");
		 if(a==true){
			$(this).parent().parent().remove();
			save();
		 }else{
			window.location.reload(); 
		 }
	});
	
});
