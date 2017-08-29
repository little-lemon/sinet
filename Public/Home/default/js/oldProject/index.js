// var mySwiper = new Swiper('.swiper-container',{
// 		pagination : '.swiper-pagination',
// 		paginationClickable :true,
// 		autoplay: 2500,
// 	  autoplayDisableOnInteraction: false
// 	});

//按钮3D变换效果
button3D(".btn1",".state1",".state2",0.3);
function button3D(obj,element1,element2,d){
	var button3DAnimate = new TimelineMax();

	button3DAnimate.to( $(obj).find(element1),0,{rotationX:0,transformPerspective:600,transformOrigin:"center bottom"} );
	button3DAnimate.to( $(obj).find(element2),0,{rotationX:-90,transformPerspective:600,transformOrigin:"top center"} );

	$(obj).bind("mouseenter",function(){
		var enterAnimate = new TimelineMax();

		var ele1 = $(this).find(element1);
		var ele2 = $(this).find(element2);

		enterAnimate.to(ele1,d,{rotationX:90,top:-ele1.height(),ease:Cubic.easeInOut},0);
		enterAnimate.to(ele2,d,{rotationX:0,top:0,ease:Cubic.easeInOut},0);
	});

	$(obj).bind("mouseleave",function(){
		var leaveAinimate = new TimelineMax();

		var ele1 = $(this).find(element1);
		var ele2 = $(this).find(element2);

		leaveAinimate.to(ele1,d,{rotationX:0,top:0,ease:Cubic.easeInOut},0);
		leaveAinimate.to(ele2,d,{rotationX:-90,top:ele2.height(),ease:Cubic.easeInOut},0);
	});
}



//点击切换新闻

/**
 * 欧彬 选项卡
 * @param  {[type]} ){	var that          [description]
 * @return {[type]}         [description]
 */
$(".new_title ul li").hover(function(){
	var that = $(this), index = $(".new_title ul li").index($(this));
	that.addClass('active').children('span').css('background-position','center -20px');
	that.siblings('li').removeClass('active').children('span').css('background-position','center 0');
	$(".new_box .new_main").children("div").eq(index).removeClass('none').siblings('div').addClass('none');
	$('.more').eq(index).removeClass('none').siblings('.more').addClass('none');
});

/**
 * 以面向对象的方式进行轮播图的书写
 */
var figure = function(parentDom,childrenDom,bannerPagination){
    //轮播图的滑动元素
    this.bannerContext = parentDom;
    //轮播图的每块元素
    this.divs = childrenDom;
    this.size = this.divs.size();
    this.width = this.divs.width();
    this.bannerPagination = bannerPagination;
    //判断轮播是否暂停
    this.flag = true;
    //滑动距离
    this.left = 0;

};

figure.prototype.init = function(){
    this._Pagination();
    //这个是定时滚动和点击右边滚动是一致的
    this._Shuffling($(".bannerRight"));
    this._lfClick();
    this._aHover();
    this._reSize();
    this.swipeLeft();
	this.swipeRight();
	this._flagSize();
};
//创建点击按钮
figure.prototype._Pagination = function(){
    for (var i = 0; i < this.size; i++) {
        var span,bannerContext = this.bannerContext,that = this;
        i == 0 ? span = $('<span class="active"></span>') : span = $('<span></span>');
        (function(i){
            span.bind('click',function(){
                if(!bannerContext.is(":animated")){
                    $(this).addClass('active').siblings('span').removeClass('active');
                    bannerContext.attr('indexes', i);
                    bannerContext.animate({left:-that.width*i},600);
                }
            });
        })(i)
        this.bannerPagination.append(span);
    }
};
//创建轮播
figure.prototype._Shuffling = function(bannerRight){
    var bannerContext = this.bannerContext, that = this;
    var bannerW = $(".banner").width();
    this.divs.css('width',bannerW);
    bannerContext.attr('indexes', 0);
    bannerContext.css('width', this.size*this.width).css('left',0);
    setInterval(function(){
        if (that.flag){
            that._roll.call(that,bannerRight);
        }
    },5000);
};

//点击滚动
figure.prototype._roll = function(direction){
    indexes = +this.bannerContext.attr('indexes');
    var that = this;
    this.flag = false;
    if (direction.hasClass('bannerRight')) {
        this.size-1 == indexes ? (this.left = 0,indexes = 0) : (this.left = -(indexes+1)*this.width,indexes+=1);
    }else{
        indexes-1 < 0  ? (this.left = -(this.size-1)*this.width,indexes = this.size-1) : (this.left = -(indexes-1)*this.width,indexes-=1) ;
    }
    this.bannerContext.attr('indexes', indexes);
    if(!this.bannerContext.is(":animated") ){
        this.bannerContext.animate({left:this.left},600,function(){that.flag = true;});
    }
    this.bannerPagination.children('span').eq(indexes).addClass('active').siblings('span').removeClass('active');
}
//点击左右按钮
figure.prototype._lfClick = function(direction){
    var that = this;
    $(".bannerRight,.bannerLeft").click(function(){
        that._roll($(this));
    })
}
//鼠标移到图片上暂停
figure.prototype._aHover = function(){
    var that = this;
    $(".banner .bannerContext").hover(function() {
        that.flag = !that.flag;
        // console.log(that.flag )
    }, function() {
        that.flag = !that.flag;
        // console.log(that.flag )

    });
}
//左滑屏事件
figure.prototype.swipeLeft = function(){
	var that = this;
	Zepto(".bannerContext").swipeLeft(function(e){
		that._roll($(".bannerRight"));
	})
}
//右边滑屏事件
figure.prototype.swipeRight = function(){
	var that = this;
	Zepto(".bannerContext").swipeRight(function(e){
		that._roll($(".bannerLeft"));
	})
}

//调整轮播图窗口大小
figure.prototype._reSize = function(){
    var bannerContext = this.bannerContext,divs =this.divs,that = this,size=this.size;
    $(window).resize(function() {
        var indexes = +bannerContext.attr('indexes');
        var windowWidth = $(window).width();
        that.width = windowWidth;
        divs.css('width', windowWidth);
        bannerContext.css('width', size*windowWidth).css('left',-indexes*windowWidth);
    });
}
//判断浏览器的大小
figure.prototype._flagSize = function(){
	var bannerItem = $(".bannerContext .bannerItem");
	var data = null;
	var s = public;
	if (screen.width<568) {
		data = this.imgData('img500',s);
	}else if (screen.width >= 568 && screen.width <1000) {
		data = this.imgData('img900',s);
	}else{
		data = this.imgData('img1920',s);
	}
	bannerItem.each(function(index, el) {
		$(el).css('backgroundImage',data[index]);
	});
}
//图片数据

figure.prototype.imgData = function(scree,public){
	var img1920 = ['url('+public+'/img/banner/banner01.png)','url('+public+'/img/banner/banner02.png)','url('+public+'/img/banner/banner03.png)','url('+public+'/img/banner/banner04.png)','url('+public+'/img/banner/banner05.png)'];
	var img900 = ['url('+public+'/img/banner/banner01_720.png)','url('+public+'/img/banner/banner02_720.png)','url('+public+'/img/banner/banner03_720.png)','url('+public+'/img/banner/banner04_720.png)','url('+public+'/img/banner/banner05_720.png)'];
	var img500 = ['url('+public+'/img/banner/banner01_500.png)','url('+public+'/img/banner/banner02_500.png)','url('+public+'/img/banner/banner03_500.png)','url('+public+'/img/banner/banner04_500.png)','url('+public+'/img/banner/banner05_500.png)'];
	if (scree == 'img500') {
		return img500;
	}else if(scree == 'img900'){
		return img900;
	}else{
		return img1920;
	}

}


//调用
var figures = new figure($('.bannerContext'),$('.bannerContext').find('.bannerI'),$('.bannerPagination'));
figures.init();

/**
 * 欧彬 滚动显示
 * @return {[type]} [description]
 */
(function(){
	var secur = $("#secur"),solut = $("#solut");
	var secur_height = secur.offset().top - secur.height()*2.4 ;
	var solut_height = solut.offset().top - solut.height()*2.4 ;
	secur.hide();
	solut.hide();
	$(window).scroll(function(){
        var this_scrollTop = $(this).scrollTop();
        if(this_scrollTop>secur_height ){
            $("#secur").fadeIn(1500);
        }
        if(this_scrollTop>solut_height ){
            $("#solut").fadeIn(1500);
        }
    })
})()

/**
 * 欧彬 上下左右滑入滑出
 * @param  {[type]} e)             {                                                                                                                                  var w [description]
 * @param  {[type]} 300);			break; 			case       1: 				prod_xz.css('left', xz_w + 'px');				prod_xz.css('top', 0);				prod_xz.animate({left:0}, 300 [description]
 * @return {[type]}                [description]
 */
var prod = function(){
$(".prod_box").children('.prod_one').bind("mouseenter mouseleave",function(e) {
         var w = $(this).outerWidth();
         var h = $(this).outerHeight();
         var x = (e.pageX - $(this).offset().left - (w / 2)) * (w > h ? (h / w) : 1);
         var y = (e.pageY - $(this).offset().top - (h / 2)) * (h > w ? (w / h) : 1);
         var direction = Math.round((((Math.atan2(y, x) * (180 / Math.PI)) + 180) / 90) + 3) % 4; //direction的值为“0,1,2,3”分别对应着“上，右，下，左”

         var prod_xz = $(this).children('.prod_xz');
         var xz_w = prod_xz.width() ;
         var xz_h = prod_xz.height();

         if(e.type == 'mouseenter'){
         	prod_xz.css('display', 'block');
         	switch (direction) {
			case 0:
				prod_xz.css('top', -xz_h + 'px');
				prod_xz.css('left', 0);
				prod_xz.animate({top:0}, 300);
			break;
			case 1:
				prod_xz.css('left', xz_w + 'px');
				prod_xz.css('top', 0);
				prod_xz.animate({left:0}, 300);
			break;
			case 2:
				prod_xz.css('top', xz_h + 'px');
				prod_xz.css('left', 0);
				prod_xz.animate({top:0}, 300);
			break;
			case 3:
				prod_xz.css('left', -xz_w + 'px');
				prod_xz.css('top', 0);
				prod_xz.animate({left:0}, 300);
			break;
			} ;
         }else{

            switch (direction) {
			case 0:
				prod_xz.css('top', 0);
				prod_xz.animate({top:-xz_h + 'px'}, 300);

			break;
			case 1:
				prod_xz.css('top', 0);
				prod_xz.animate({left: xz_w + 'px'}, 300);
			break;
			case 2:
				prod_xz.css('left', 0);
				prod_xz.animate({top:  xz_h + 'px'}, 300);

			break;
			case 3:
				prod_xz.css('left', 0);
				prod_xz.animate({left:-xz_w + 'px'}, 300);
			break;
			}
			setTimeout(function(){
				prod_xz.css('display', 'none');
			},300)
         }
     });
}





/**
 * 判断是否支持css3的某个属性
 * @param  {[type]} style [description]
 * @return {[type]}       [description]
 */
function supportCss3(style) {
	var prefix = ['webkit', 'Moz', 'ms', 'o'],
	i,
	humpString = [],
	htmlStyle = document.documentElement.style,
	_toHumb = function (string) {
		return string.replace(/-(\w)/g, function ($0, $1) {
		return $1.toUpperCase();
		});
	};

	for (i in prefix)
	humpString.push(_toHumb(prefix[i] + '-' + style));

	humpString.push(_toHumb(style));

	for (i in humpString)
		if (humpString[i] in htmlStyle) return true;

	return false;
}

var seeMore = function(){
	if (!supportCss3('perspective-origin')) {
		$('.state1').hover(function() {
			$(this).css({
				border:0,
				background:'#4E92E0',
				color:'#fff'
			})
		},function(){
			$(this).css({
				border:'2px solid #9e9e9e',
				background:'#fff',
				color:'#757575'
			})
		});
		$('.state2').hide();
		$('.btn1').unbind("mouseenter mouseleave");
	}
}
seeMore();


//海峡新闻点击滑动
$(".ar_right").click(function(){
	var scollDiv = $(this).siblings(".haixia_dk").children(".scoll");
	var indexes = scollDiv.attr("indexes"),divs = scollDiv.children('div');
		indexes == undefined ? indexes = 1 : indexes=(+indexes)+1;
		var gs = Math.round($(this).parent().width()/255);
	if(!scollDiv.is(":animated") && divs.length >= indexes+gs){
		scollDiv.attr("indexes",indexes);
		var width = divs.outerWidth();
		scollDiv.animate({left:-indexes*width},300);
	}
})

$(".ar_left").click(function(){
	var scollDiv = $(this).siblings(".haixia_dk").children(".scoll");
	var indexes = scollDiv.attr("indexes"),divs = scollDiv.children('div');
		indexes == undefined ? indexes = 0 : indexes=(+indexes)-1;
	if(!scollDiv.is(":animated") && indexes>=0){
		scollDiv.attr("indexes",indexes);
		var width = divs.outerWidth();
		scollDiv.animate({left:-indexes*width},300);
	}
})



var secur = function(){
	$("#secur").find(".col-md-6:first").hover(function() {
		$(this).children('.secur_b').css({
			'background-position': 'left -32px',
			'color': '#4E92E0'
		});
		$(this).children('p').css('color','#4E92E0');
	}, function() {
		$(this).children('.secur_b').css({
			'background-position': 'left 0',
			'color': '#9E9E9E'
		});
		$(this).children('p').css('color','#9E9E9E');
	});

	$("#solut").find(".col-md-6:first").hover(function() {
		$(this).children('.solut_b').css({
			'background-position': 'left -32px',
			'color': '#4E92E0'
		});
		$(this).children('p').css('color','#4E92E0');
	}, function() {
		$(this).children('.solut_b').css({
			'background-position': 'left 0',
			'color': '#9E9E9E'
		});
		$(this).children('p').css('color','#9E9E9E');
	});


	$("#prod").find(".col-md-6:first").hover(function() {
		$(this).find('.prod_b').css({
			'background-position': 'left -32px',
			'color': '#4E92E0'
		});
		$(this).find('p').css('color','#4E92E0');
	}, function() {
		$(this).find('.prod_b').css({
			'background-position': 'left 0',
			'color': '#9E9E9E'
		});
		$(this).find('p').css('color','#9E9E9E');
	});
}



//创建遮罩层
var layer = function(width, height){
var lay = $("<div class='maskLayer'></div>");
lay.css({
  width: width,
  height: height
});
return lay
}

var hxdt = function(){
	$(".new_one").hover(function() {
	 if ($(this).children(".maskLayer").length != 0) return
		  var lay = layer($(this).width(),$(this).height());
		  $(this).find('a').css({"text-decoration":'none','color':'#fff'}).append(lay);
		  $(this).find('p').css('color','#fff');
		  $(this).find('span').css('color','#fff');
		  $(this).find(".maskLayer").animate({'opacity':'.5'},300);
	}, function() {
			var that = $(this);
			that.find('p').css('color','#84888c').siblings('a').css('color','#469ae5');
		  	$(this).find('span').css('color','#469ae5');
		  	$(".maskLayer").animate({'opacity':'0'},300,function function_name(argument) {
		    that.find(".maskLayer").remove();
		  });
	});
}


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

var yqlj = function(){
	if (judgeCla() == 'pc') {
		hxdt();
		secur();
		prod();
	}else{
		$(".btn1").unbind();
	}
}
yqlj();





