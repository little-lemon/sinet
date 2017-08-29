$(function(){

    /**
     * 滚动分页加载
     * @return {[type]} [description]
     */
    var dList = function(){
        this.current = 1;//第几面
        this.pages = 15;//获取的总页数
        this.ts = 5;//每一次多少条
        this.countPage = 0//总共多少页面 
        this.sum = 5;//几个分页按钮
        this.currentIndex = 1;//第几页的第几个分页按钮
        this.ftype = this.judgeCla(); //判断设备类型
        this.cid =  $("#ychidden").val();//隐藏表单域来辨别获取数据类别
        this.url = '';//ajax请求的url
        this.contents = [];//存放内容
        // this.flags = [];//降频
        this.length = 1;//有多少个ul
        this.ydts = 10; //移动端要加载的个数
    }
    //初始化
    dList.prototype.init = function(){
        if (this.ftype=='pc') {
            this.setPCData();
            this.upClick();
            this.downClick();
            this.scollshow();
            this.fiveClick();
            this.syClick();
            this.wyClick();
        }else{
            var ul = $("<ul></ul>");
            $("#newList .news").append(ul);
            this.setYDData();
            this.scollYDshow();
        }
        
    };
    //创建按钮
    dList.prototype.createButton = function(countPage){
        $(".button").remove();
        var buttons =[] ;
        //按钮起始位置
        var startsz = 1;
        var indexss = 0;
        //按钮终止位置
        var endsz = 0;
        if (this.currentIndex > 3) {
            startsz = parseInt(this.currentIndex) - 2;
            endsz = parseInt(this.currentIndex) + 2;
            indexss = 2;
        }else{
            endsz = 5;
            indexss = this.currentIndex-1;
        }
        if(parseInt(this.currentIndex)+2 >= this.countPage){
            startsz = this.countPage - 4 ;
            endsz = this.countPage;
            indexss = 4 - this.countPage + parseInt(this.currentIndex);
        }

        
        for (var i = startsz; i <= endsz; i++) {
            buttons.push($("<div class='button'>"+i+"</div>"));
        }
        $("#newList .news .paging .up").after(buttons);
        $("#newList .news .paging .button").eq(indexss).addClass('active');
        if (this.currentIndex == 1) {$("#newList .news .paging .up").addClass('upnone');$("#newList .news .paging .sy").addClass('upnone');}
        else{$("#newList .news .paging .up,#newList .news .paging .sy").removeClass('upnone');}
        if (this.currentIndex == this.countPage) {$("#newList .news .paging .down").addClass('upnone');$("#newList .news .paging .wy").addClass('upnone');}
        else{$("#newList .news .paging .down,#newList .news .paging .wy").removeClass('upnone');}
        this.szClick();
    };
    //PC端页面模版
    dList.prototype.pcModel = function(){
        var model = 
                    '<li class="clearfix">'+
                        '<div class="imgs">'+
                            '<a href="{{url}}" title="" target="_blank">'+
                                '<img src="{{pic}}" alt="" class="img-responsive" />'+
                            '</a>'+
                        '</div>'+
                        '<div class="context">'+
                            '<a href="{{url}}" title="" target="_blank">'+
                                '<div class="newtitle">{{title}}</div>'+
                                '<p>{{desc}}</p>'+
                            '</a>'+
                            '<div class="dynamic clearfix">'+
                                '<div class="hxdt">{{catname}}</div>'+
                                '<div class="time">{{publishtime}}</div>'+
                            '</div>'+
                        '</div>'+
                    '</li>'+
                
        return model;
    };
    //解析PC端的数据结果
    dList.prototype.paseing = function(data,that){
        var datas =  JSON.parse(data)
        var that = that;
        var model = that.pcModel();
        var models = '';
        that.countPage = parseInt(datas.count / that.pages);
        datas.count%that.pages > 0 ? that.countPage+=1 : that.countPage+=0;
        $(".zys").text(that.countPage);
        for (var i = 0; i < datas.content.length; i++) {
            models += model.replace(/{{url}}/g,datas.content[i].url)
            .replace(/{{pic}}/g,datas.content[i].pic)
            .replace(/{{desc}}/g,datas.content[i].desc)
            .replace(/{{title}}/g,datas.content[i].title)
            .replace(/{{catname}}/g,datas.content[i].catname)
            .replace(/{{publishtime}}/g,datas.content[i].publishtime)
            if ((i+1)%that.ts==0) {
                var ul = $("<ul></ul>");
                ul.append(models);
                that.contents.push(ul);
                models = '';
                
            }

            if (datas.count%that.pages && datas.count==(that.pages*(that.currentIndex-1)+i+1)) {
                    var ul = $("<ul></ul>");
                    ul.append(models);
                    that.contents.push(ul);
                    models = '';
            }


        }
        $("#newList .news ul").remove();
        $("#newList .news").prepend(that.contents[0])
        that.createButton(that.countPage);
        if (that.length == 1 && that.contents.length == 1) {
            $(".paging").removeClass('none');
            $('#hsLayer img').addClass('none');
        }
    };
    //解析移动端数据结果
    dList.prototype.ydPaseing = function(data,that){
        $("#newList .news ul").append(data);
        $('#hsLayer img').addClass('none');
        if(data.length === 0){
            $("#hsLayer p").removeClass("none");
        }
    };
    //PC端得到数据的处理
    dList.prototype.setPCData = function(){
        $(".paging").addClass('none');
        this.contents.splice(0,this.contents.length);//清空内容数组
        this.cid == '18' ? this.url = '/index.php/list/getarticle/cid/18' : this.url = '/index.php/list/getarticle/cid/41'; 
        this.ajax(this.url,(this.currentIndex-1)*this.pages,this.pages,this.paseing,this);
    };
    //移动端得到数据的处理
    dList.prototype.setYDData = function(){
        $(".paging").addClass('none');
        this.cid == '18' ? this.url = '/index.php/list/getarticle/cid/18' : this.url = '/index.php/list/getarticle/cid/41'; 
        var start = $("#newList ul").children('a').length;
        this.ajax(this.url,start,this.pages,this.ydPaseing,this);
    }
    //滚动显示
    dList.prototype.scollshow = function(){
        var that = this;
        var flagg = false;
        $(window).scroll(function(e){ 
        if (isFirefox()) {
            e.timeStamp = 260
        }
         if ($(document).scrollTop() >= $(document).height() - $(window).height() && e.timeStamp > 250) {
                if($(".paging").hasClass('none')){
                    $('#hsLayer img').removeClass('none');
                }
                that.length = $("#newList .news ul").length; 
                var time = Math.random()*1000+800;
                if (that.length <= that.contents.length-1) {
                    var tim = setTimeout(function(){
                        $("#newList .news").prepend(that.contents[1]).prepend(that.contents[0]);
                         $('#hsLayer img').addClass('none');
                    },time);
                    flagg = true;
                }
                if (that.length == that.contents.length-1 && flagg) {
                    var tim = setTimeout(function(){
                        $("#newList .news").prepend(that.contents);
                        $(".paging").removeClass('none');
                        $('#hsLayer img').addClass('none');
                    },time);
                    flagg = false;  
                }


            }
        });
    };
    //移动端滑动
    dList.prototype.scollYDshow = function(){
        var that = this;
        $(window).scroll(function(e){
            if ($(document).scrollTop() >= $(document).height() - $(window).height() && e.timeStamp > 250) {
                 $('#hsLayer img').removeClass('none');
                 setTimeout(function(){
                    that.setYDData();
                },1000);  
            }
        });
    };
    //给有数字的按钮绑定事件
    dList.prototype.szClick = function(){
        var that = this;
        $('.button').click(function(){
            if (!$(this).hasClass('active')) {
                that.length = 1;
                that.currentIndex = $(this).text();
                if (that.ftype=='pc') {that.setPCData();}
                $(".ys").val('');
                $(document).scrollTop(70)
            }
        })
    };

    //给首页绑定事件
    dList.prototype.syClick = function(){
        var that = this;
        $('.sy').click(function(){
            if ($('.active').text() != 1) {
                that.currentIndex = 1;
                if (that.ftype=='pc') {that.setPCData();}
                 $(".ys").val('');
                 $(document).scrollTop(70)
            }
        })
    };
    //给尾页绑定事件
    dList.prototype.wyClick = function(){
        var that = this;
        $('.wy').click(function(){
            if ($('.active').text() != that.countPage) {
                that.currentIndex = that.countPage;
                if (that.ftype=='pc') {that.setPCData();}
                 $(".ys").val('');
                 $(document).scrollTop(70)
            }
        })
    };

    //上一页加事件
    dList.prototype.upClick = function(){
        var that = this;
        $(".paging .up").click(function(){
            if ($('.active').text() != 1) {
                that.length = 1;
                that.currentIndex = parseInt(that.currentIndex)-1;
                if ($(".button:first").hasClass('active')) {
                    that.current = parseInt(that.current)-1;
                }
                 if (that.ftype=='pc') {that.setPCData();}
                 $(".ys").val('');
                 $(document).scrollTop(70)
            }
        })
    };

    //下一页加事件
    dList.prototype.downClick = function(){
        var that = this;
        $(".paging .down").click(function(){
            if ($('.active').text() < that.countPage) {
                that.length = 1;
                that.currentIndex = parseInt(that.currentIndex)+1;
                if ($(".button:last").hasClass('active')) {
                    that.current = parseInt(that.current)+1;
                }
                 if (that.ftype=='pc') {that.setPCData();}
                 $(".ys").val('');
                 $(document).scrollTop(70)
            }
        })
    };
    //点击跳转
    dList.prototype.fiveClick = function(){
        var that = this;
        $(".paging .five").click(function(){
            var sz = parseInt($(".ys").val());
            if (sz > 0) {
                that.length = 1;
                that.currentIndex = sz;
                if (sz > that.countPage) {
                    that.currentIndex = that.countPage;
                    sz = that.countPage;
                }
                sz%that.sum > 0 ? that.current = parseInt(sz/that.sum)+1 : that.current = parseInt(sz/that.sum);
            }
            else{
                that.currentIndex = 1;
                that.current = 1;
            }
            if (that.ftype=='pc') {that.setPCData();}
            $(".ys").val('');
            $(document).scrollTop(70)
        })
    };
    

    //数据请求的ajax
    dList.prototype.ajax = function(url ,start,end,paseing,that){
        $.ajax({
            type: "POST",
            timeout: 10000,
            data:{'start':start,'end':end,'cid':this.cid,'ftype':this.ftype},
            dataType: "text",
            url: url,
            success: function (data) {
                paseing(data,that);
            },
            error: function (e, jqxhr, settings, exception) {
            }
        })
    };
    //判断是pc还是移动端
    dList.prototype.judgeCla = function(){
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
        var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
        var bIsMidp = sUserAgent.match(/midp/i) == "midp";
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
        var bIsAndroid = sUserAgent.match(/android/i) == "android";
        var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
        var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
        if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
            return "phone";
        } else {
            return "pc";
        }
    }

    new dList().init();


    function isFirefox(){
        if (navigator.userAgent.indexOf("Firefox") > -1) 
            return true;
            else
            return false;
    }




	$("#newList .news").on("mouseover mouseout","li .context",function(event){
		 if(event.type == "mouseover"){
		  	$(this).children('.newtitle,p').css('color','#5194E0');
		 }else if(event.type == "mouseout"){
		  	$(this).children('.newtitle,p').css('color','#595959');
		 }
	})


    // 判断是否有到底部
    function fotterPosition() {
        if ($(".fotter").offset().top<document.documentElement.clientHeight) {
            $(".fotter").css({
                position: 'fixed',
                bottom: 0
            })
            $('.fr_link').css({
                    position: 'fixed',
                    bottom: '50px',
                    left: 0,
                    width: '100%'
            });
        }
    }

    setTimeout(fotterPosition,500);

})