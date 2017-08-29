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



   setTimeout(function(){
   		 $("#safeProduct .context .begin .content ul li .pathtwo .bg").css('height',$("#safeProduct .context .begin .content ul li .pathtwo").height()+50).css('top',$("#safeProduct .context .begin .content ul li .pathtwo").position().top+20);
   },200)

   var judgeCla = function(){
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        if (bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
            return "phone";
        }else if(bIsIpad){
            return "ipad";
        } else {
            return "pc";
        }
    }

    var fkMouseEvent = function(){
        $(".fk").mousemove(function(e) {
            var x = $(this).offset().left;
            var y = $(this).offset().top;
            var width = $(this).width();
            var inde = $(".fk").index($(this));
            var x1 = e.pageX;
            var y1 = e.pageY;
            var a1 = x+width/2;
            var b1 = y+width/2;
            var px = $(this).position().left;
            var py = $(this).position().top;
            // console.log(a1+'--'+b1+'====='+x1+'///'+y1)
            // console.log(Math.abs(y1-b1)+Math.abs(x1-a1))
            // console.log(width/2)
            if (Math.abs(y1-b1)+Math.abs(x1-a1)<(width/2)) {
                $(this).css('cursor','pointer');
                var dom = $('.topbox').eq(inde);
                dom.css({
                    display:'block'
                    // left:px+1.1*width,
                    // top:py*1.8
                })
                var left = px+1.1*width;
                var top = py;
                if (left+dom.width()>$(window).width()) {
                    dom.css({
                        left:left-2.8*width,
                        top:top
                    })
                    dom.children('.xsj').addClass('curs')
                }else{
                    dom.css({
                        left:left,
                        top:top
                    })
                }
            }
            else{
                 $(this).css('cursor','auto');
                $('.topbox').eq(inde).css({
                    display:'none'
                })
            }

        });

        $(".fk").mouseout(function(e) {
            var inde = $(".fk").index($(this));
            $('.topbox').eq(inde).css({
                display:'none'
            })
        });

    }

    var touchfk = function(){
      var dom = null;
      Zepto(".fk").on('touchstart',function(e){
           var x = $(this).offset().left;
           var y = $(this).offset().top;
           var width = $(this).width();
           var x1 = e.changedTouches[0].pageX;
           var y1 = e.changedTouches[0].pageY;
           var a1 = x+width/2;
           var b1 = y+width/2;
           var inde = $(".fk").index($(this));
           dom = $('#layerHB .topbox').eq(inde);
          if (Math.abs(y1-b1)+Math.abs(x1-a1)<(width/2)) {
             $("#layerHB").show(200);
             setTimeout(function(){
                dom.css('display','block').removeClass('rollOut').addClass('rollIn');
             },300)
          }

      })

      Zepto("#layerHB").on('touchstart',function(){
          dom.removeClass('rollIn').addClass('rollOut');
          setTimeout(function(){
            dom.css('display','none');
            $("#layerHB").hide(200);
          },800)
      })
   }
    
    

     var yqlj = function(){
        if (judgeCla() == 'phone') {
           touchfk();
        }else{
           fkMouseEvent();
        }
    }
    yqlj();

})