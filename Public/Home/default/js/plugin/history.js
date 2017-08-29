
(function(e){
	function b(a){
		a=a.replace(/left|top/g,"0px");
		a=a.replace(/right|bottom/g,"100%");
		a=a.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
		a=a.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
		return[parseFloat(a[1],10),a[2],parseFloat(a[3],10),a[4]]}
		if(!document.defaultView||!document.defaultView.getComputedStyle){
			var f=e.curCSS;
			e.curCSS=function(a,c,b){
				"background-position"===c&&(c="backgroundPosition");
				if("backgroundPosition"!==c||!a.currentStyle||a.currentStyle[c])
				return f.apply(this, arguments);
				var g=a.style;
				return!b&&g&&g[c]?g[c]:f(a,"backgroundPositionX",b)+" "+f(a,"backgroundPositionY",b)
			}
		}
		var d=e.fn.animate;
		e.fn.animate=function(a){
			"background-position"in a&&(a.backgroundPosition=a["background-position"],delete a["background-position"]);
			"backgroundPosition"in a&&(a.backgroundPosition="("+a.backgroundPosition);
			return d.apply(this,arguments)
		};
		e.fx.step.backgroundPosition=function(a){
			if(!a.bgPosReady){
				var c=e.curCSS(a.elem,"backgroundPosition");
				c||(c="0px 0px");c=b(c);a.start= [c[0],c[2]];
				c=b(a.end);
				a.end=[c[0],c[2]];
				a.unit=[c[1],c[3]];
				a.bgPosReady=!0}c=[];
				c[0]=(a.end[0]-a.start[0])*a.pos+a.start[0]+a.unit[0];
				c[1]=(a.end[1]-a.start[1])*a.pos+a.start[1]+a.unit[1];
				a.elem.style.backgroundPosition=c[0]+" "+c[1]
			}
	}
)(jQuery);

(function(e){e.extend(e.fx.step,{
	backgroundPosition:function(b){
		function f(a){
			a=a.replace(/left|top/g,"0px");
			a=a.replace(/right|bottom/g,"100%");
			a=a.replace(/([0-9\.]+)(\s|\)|$)/g,"$1px$2");
		  	a=a.match(/(-?[0-9\.]+)(px|\%|em|pt)\s(-?[0-9\.]+)(px|\%|em|pt)/);
		  	return[parseFloat(a[1],10),a[2],parseFloat(a[3],10),a[4]]
		}
			if(0===b.state&&"string"==typeof b.end){
				var d=e.curCSS(b.elem,"backgroundPosition"),d=f(d);
				b.start=[d[0],d[2]];d=f(b.end);b.end=[d[0],d[2]];
				b.unit=[d[1],d[3]]}d=[];
				d[0]=(b.end[0]-b.start[0])* b.pos+b.start[0]+b.unit[0];
				d[1]=(b.end[1]-b.start[1])*b.pos+b.start[1]+b.unit[1];
				//b.elem.style.backgroundPosition=d[0]+" "+d[1];		
			}
	}
)})(jQuery);
			
$(function(){

	//20170608
    if (!Array.prototype.map) {
        Array.prototype.map = function(callback, thisArg) {

            var T, A, k;

            if (this == null) {
                throw new TypeError(" this is null or not defined");
            }

            // 1. Let O be the result of calling ToObject passing the |this| value as the argument.
            var O = Object(this);

            // 2. Let lenValue be the result of calling the Get internal method of O with the argument "length".
            // 3. Let len be ToUint32(lenValue).
            var len = O.length >>> 0;

            // 4. If IsCallable(callback) is false, throw a TypeError exception.
            // See: http://es5.github.com/#x9.11
            if (typeof callback !== "function") {
                throw new TypeError(callback + " is not a function");
            }

            // 5. If thisArg was supplied, let T be thisArg; else let T be undefined.
            if (thisArg) {
                T = thisArg;
            }

            // 6. Let A be a new array created as if by the expression new Array(len) where Array is
            // the standard built-in constructor with that name and len is the value of len.
            A = new Array(len);

            // 7. Let k be 0
            k = 0;

            // 8. Repeat, while k < len
            while(k < len) {

                var kValue, mappedValue;

                // a. Let Pk be ToString(k).
                //   This is implicit for LHS operands of the in operator
                // b. Let kPresent be the result of calling the HasProperty internal method of O with argument Pk.
                //   This step can be combined with c
                // c. If kPresent is true, then
                if (k in O) {

                    // i. Let kValue be the result of calling the Get internal method of O with argument Pk.
                    kValue = O[ k ];

                    // ii. Let mappedValue be the result of calling the Call internal method of callback
                    // with T as the this value and argument list containing kValue, k, and O.
                    mappedValue = callback.call(T, kValue, k, O);

                    // iii. Call the DefineOwnProperty internal method of A with arguments
                    // Pk, Property Descriptor {Value: mappedValue, : true, Enumerable: true, Configurable: true},
                    // and false.

                    // In browsers that support Object.defineProperty, use the following:
                    // Object.defineProperty(A, Pk, { value: mappedValue, writable: true, enumerable: true, configurable: true });

                    // For best browser support, use the following:
                    A[ k ] = mappedValue;
                }
                // d. Increase k by 1.
                k++;
            }

            // 9. return A
            return A;
        };
    }









    var bigEvent = function(data){
        var mb = $("#content ul li:first").prop("outerHTML");
        var elemList = [];
        data.map(function(elem ,inde) {
                var mbLi;
                mbLi = mb.replace(/{{content}}/g,elem.content);
                var time = elem.time.toString().indexOf('-')>0 ? elem.time.toString().split("-") : elem.time.toString();
                if (typeof(time)=='string') {
                    mbLi = mbLi.replace(/{{year}}/g,time+'年').replace(/{{md}}/g,'');
                }else if(time.length==2){
                    mbLi = mbLi.replace(/{{year}}/g,time[0]+'年').replace(/{{md}}/g,time[1]+'月');
                }else{
                    mbLi = mbLi.replace(/{{year}}/g,time[0]+'年').replace(/{{md}}/g,time[1]+'月'+time[2]+'日');
                }
                if (inde%2==0) {
                	mbLi = mbLi.replace(/{{imp}}/g,'imp')
                }
                elemList.push(mbLi);
            })
           $("#content ul").html(elemList.join(''));
        }

        $.ajax({
                type: "POST",
                timeout: 10000,
                dataType: "json",
                url: "/index.php/list/getevent",
                success: function (data) {
                    bigEvent(data);
                    init();
                    $(".timeblock").attr("thisyear",c);
					//$(".list li:gt("+(row-1)+")").find(".lileft").css({left:"-400px"});
					//$(".list li:gt("+(row-1)+")").find(".liright").css({right:"-700px"});

					$("#content .list li").removeClass("thiscur");
			        $("#content .list li").eq(0).addClass("thiscur")
			        $("#content .list li").eq(0).focus();
                },
                error: function (e, jqxhr, settings, exception) {
                    console.log(e);
                }
            })
		
		function init(){
		  c=$(".list li").eq(0).find(".year").html(); //eq(0)获取第一行的时间 进行初始化赋值
		  $(".timeblock").attr("thisyear",c);  
		  var a=c.split(""),b=["numf","nums","numt","numfo"];
		  for(i=0;4>i;i++){
		     $("#circle ."+b[i]).stop(!0,!1).css({backgroundPosition:"0px "+-24*a[i]+"px"})
		  }
		}
		function e(){
			c=$(".list li").eq(d).find(".year").html();
			$(".timeblock").attr("thisyear",c);
			var a=c.split(""),b=["numf","nums","numt","numfo"];
			for(i=0;4>i;i++)
			{
				// $("#circle ."+b[i]).stop(!0,!1).animate({backgroundPosition:"0px "+-24*a[i]+"px"},{duration:200})
				$("#circle ."+b[i]).stop(!0,!1).css({backgroundPosition:"0px "+-24*a[i]+"px"})
			}
				
		}
		$(".list").on('mouseover','.liwrap',function(){
			$(".list li").removeClass("thiscur");
			$(this).parent().addClass("thiscur")
		});
		var b=0,f=$(".list li").length,d=0,a=!0,c;
		(function(){
			var a=$(window).height();
			890<=a&&(row=6);
			800<=a&&890>a&&(row=5);
			726<=a&& 800>a&&(row=4);
			726>a&&(row=3)}
		)();
		var h=f-row;
		$(".list").height(110*row);
		$("#content").height(110*row+25);
		$.fn.liOut=function(){
			var left =  $(this).find(".lileft");
			if (!left.hasClass('imp')) {
				$(this).find(".lileft").animate({left:"-400px"},500,"easeOutQuart");
				$(this).find(".liright").animate({right:"-700px"},500,"easeOutQuart");
			}else{
				$(this).find(".lileft").animate({right:"-700px"},500,"easeOutQuart");
				$(this).find(".liright").animate({left:"-400px"},500,"easeOutQuart");
			}
		};
		$.fn.liIn=function(){
			var left =  $(this).find(".lileft");
			if (!left.hasClass('imp')) {
				$(this).find(".lileft").animate({left:"0px"},500,"easeOutQuart");
				$(this).find(".liright").animate({right:"0px"},500,"easeOutQuart");
			}else{
				$(this).find(".lileft").animate({right:"0px"},500,"easeOutQuart");
				$(this).find(".liright").animate({left:"0px"},500,"easeOutQuart");
			}
		};
		var count = 0;
		$(".arrowdown").click(function(){
			//&&parseInt($(".list li:first").css("marginTop"))> -110*h
			var lengt = $(".list li").length-row;
			a&&count<lengt&&(d++,b--,a=!1,$(".list li").eq(d-1).liOut(),$(".list li").eq(d+row-1).liIn(),$(".list li:first").animate({marginTop:110*b},100,"easeInOutQuad",function(){
				a=!0;$(".arrowdown").css("opacity",1);
				$(".arrowdown").removeClass("arrow_active");
				count++;
			}),e()
		)});
		$(".arrowup").click(function(){
			a&&0!=parseInt($(".list li:first").css("marginTop"))&&(b++,d--,a=!1,$(".list li").eq(d).liIn(),$(".list li").eq(d+row).liOut(),$(".list li:first").animate({marginTop:110*b},100,"easeInOutQuad",function(){
				a=!0;$(".arrowup").css("opacity", 1);
				$(".arrowup").removeClass("arrow_active");
				count--;
			}),e()
		)});
		$(".list").mousewheel(function(b,c){
			b.preventDefault(); 
			Math.abs(c);
			if(a){
				var d=parseInt($(".list li:first").css("marginTop"));
				0<c?0!=d&&($(".arrowup").addClass("arrow_active"),$(".arrowup").trigger("click")):($(".arrowdown").addClass("arrow_active"),$(".arrowdown").trigger("click"))
			}
		});

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

	    var gl = function(){
	    	if(judgeCla() != 'pc'){
	    		$(".list").css('overflow-y','auto');
	    		$(".list").unbind('mousewheel');
	    	}
	    }
	    gl();

	    var liHeight = $(".list li").height();
	    $(".list").scroll(function(){
	    	d = parseInt($(this).scrollTop()/liHeight);
	    	e();
	    });
		

});