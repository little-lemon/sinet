
//登录验证  1为空   2为错误

$(function(){
	
	if (!$.support.leadingWhitespace) {
        layer.alert('CMS后台不再保障IE8及以下浏览器的正常访问。建议您尽快升级浏览器IE9+，或者使用Chrome、Firefox。', {icon: 2});
    }

	$('#vcode').click(function(event) {
		/* Act on the event */
		var verifyUrl = $(this).attr('data-url');
		verifyUrl += '#'+Math.random();
		$(this).attr("src",verifyUrl);
	});

	/**
	 * @description 转换Unicode编码
	 * @param {String} sStr 要转换的字符串
	 * @returns {String} sDstr 转换后的字符串
	 */
	function changeUnicode(sStr){
		var sDstr = '';
		for (var i=0; i<sStr.length; i++){
			sDstr = sDstr + sStr.charCodeAt(i).toString(16);	  
		}
		return sDstr;
	};
	
	var username = $("input[name='username']");
	var password = $("input[name='password']");
	var code = $("input[name='code']");
	$("#LoginForm").submit(function(event){
		event.preventDefault();		
		if($.trim(username.val())==''){
			layer.tips('账号不能为空', "input[name='username']");
			username.focus();
			return false;
		}else if($.trim(password.val())=='') {	
			layer.tips('密码不能为空', "input[name='password']");
			password.focus();
			return false;
		}else if($.trim(code.val())==''){
			layer.tips('验证码不能为空', "input[name='code']");
			code.focus();
			return false;
		}
		var postUrl = $(this).attr('action');
		// var param = $(this).serialize();
		// md5 加密
		//password.val(md5(password.val()));
		var param = {
			__hash__: $("input[name='__hash__']").val(),
			code: code.val(),
			password: md5(password.val()),
			username: changeUnicode(username.val())
		};
		
		var btn = $("button[type='submit']");
		btn.attr('disabled', 'disabled');
		$.ajax({
			url: postUrl,
			type: 'POST',
			dataType: 'json',
			data: param
		})
		.done(function(data) {
			if (data.status == 1) {
				top.location.href = data.url;
				layer.msg('登录成功,正在跳转...');
			} else {
				layer.msg(data.info, function(){});
			}
		})
		.fail(function() {
			layer.msg('发生错误，请重试');
		})
		.always(function() {
			btn.removeAttr('disabled');
			$('#vcode').trigger('click');
		});
		

	});



	//验证用户名
	$("input[name='username']").blur(function(){
		if($.trim(username.val())==''){
			layer.tips('账号不能为空', "input[name='username']");
			username.focus();
			return ;
		}
		
	});
	//验证密码
	$("input[name='password']").blur(function(){
		var username=$("input[name='username']");
		if($.trim(password.val())==''){
			layer.tips('密码不能为空', "input[name='password']");
			//password.focus();
			return ;
		}
		
	});

	$("input[name='code']").focus(function(){
    });

});

