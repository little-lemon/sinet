$(function(){
	
	var _setParentWidth = function(){
		var length = $(".gd ul li").size();
		var width = $(".gd ul li").outerWidth(true);
		$(".gd ul").css('width',length*width).attr('inde',0);
	}
	_setParentWidth();


	$(".ar_right").click(function(){
		var length, right , ul  ,sum;
		(	length = $(".gd ul li").size(),
			right = $(".gd ul li").outerWidth(true),
			sum = parseInt($("#culture .pichd .gd").width()/right),
			ul  = $(".gd ul"),
			inde = (sum+parseInt(ul.attr('inde'))==length ? parseInt(ul.attr('inde')): +parseInt(ul.attr('inde'))+1),
			ul.animate({
				right:right*inde
			},300,function(){
				ul.attr('inde',inde);
			})
		);
	})

	$(".ar_left").click(function(){
		var  right , ul  ;
		(
			right = $(".gd ul li").outerWidth(true),
			ul  = $(".gd ul"),
			inde = (+ul.attr('inde')==0 ? 0: +parseInt(ul.attr('inde'))-1),
			ul.animate({
				right:right*inde
			},300,function(){
				ul.attr('inde',inde);
			})
		);
	})

	Zepto(".pichd .gd").swipeRight(function(){
        var  right , ul  ;
        (
            right = $(".gd ul li").outerWidth(true),
            ul  = $(".gd ul"),
            inde = (+ul.attr('inde')==0 ? 0: +parseInt(ul.attr('inde'))-1),
            ul.animate({
                right:right*inde
            },300)
        );
        setTimeout(function(){
        	ul.attr('inde',inde);
        },400)
    })

    Zepto(".pichd .gd").swipeLeft(function(){
        var length, right , ul  ,sum;
        (   length = Zepto(".gd ul li").size(),
            right = $(".gd ul li").outerWidth(true),
            sum = parseInt(Zepto("#culture .pichd .gd").width()/right),
            ul  = $(".gd ul"),
            inde = (sum+parseInt(ul.attr('inde'))==length ? parseInt(ul.attr('inde')): +parseInt(ul.attr('inde'))+1)
            
        );
        ul.animate({
                right:right*inde
            },300)
        setTimeout(function(){
        	ul.attr('inde',inde);
        },400)
    })
	
})