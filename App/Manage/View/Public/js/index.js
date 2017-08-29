$(function(){
	
	//指定时长未操作，系统自动退出
	var maxTime = 30*60; // 30分钟
    var time = maxTime;
    $('body').on('keydown mousemove mousedown', function(e){
        time = maxTime; // reset
    });
    var intervalId = setInterval(function(){
        time--;
        if(time <= 0) {
            ShowInvalidLoginMessage();
            clearInterval(intervalId);
        }
    }, 1000)
    
    function ShowInvalidLoginMessage(){
    	parent.layer.open({
			title: [
			    '海峡信息 提示',
			    'background-color:#39a8ee; color:#ffffff;'
		  	],
		  	closeBtn: 0,
			shadeClose: false,
			shade: 0.5,
			area: ['200px', '150px'],
			anim: 'up',
			content: '系统长时间未操作，请重新登录',
			btn: ['确认'],
			yes: function(){
		    	parent.document.getElementById("i_exit").childNodes[1].click(); 
		    	//logout(); 
		  	},

		});
		
		//页面重新加载，刷新
    	window.onbeforeunload = function(){
    		$.ajax({ url: "sim.php?s=/Login/logout"});
    	}

	    $('body').on('keydown', function(e){
        	if (e.keyCode == 116){
        		parent.document.getElementById("i_exit").childNodes[1].click();
	    	}	
    	});
    }
    
});