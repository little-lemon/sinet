$(function(){
	var page = function(){
		this.index = 1;
		this.pages = 2;
		this.num = 5;
		this.cid = $("#ychidden").val();
        this.url = "";
	}
	
	page.prototype.init = function(){
		this.setData();
		console.log(this.cid);
		console.log(this.url);
	}
	
	page.prototype.setData = function(){
		 this.cid == "18" ? this.url = "/index.php/list/getarticle/cid/18" : this.url = "/index.php/list/getarticle/cid/41";
		 this.ajax(this.url, (this.index - 1) * this.pages, this.pages,this.pageInit,this);
	}
	
	/* 获取数据*/
	page.prototype.ajax = function(url,start,count,pageInit,f){
		$.ajax({
			url: url,
			type: 'post',
			data: {
				start:start,
				end:count,
				cid: this.cid,
			},
			dataType: "text",
			success: function (data) {
				pageInit(data,f);
			}
		});
	}
	
	page.prototype.pcModel = function() {
        var d = '<a href="#" title="" ><li class="clearfix"><div class="imgs"><a href="{{url}}" title="" target="_blank"><img src="{{pic}}" alt="" class="img-responsive" /></a></div><div class="context"><a href="{{url}}" title="" target="_blank"><div class="newtitle">{{title}}</div><p>{{desc}}</p></a><div class="dynamic clearfix"><div class="hxdt">{{catname}}</div><div class="time">{{publishtime}}</div></div></div></li></a>';
        return d
    }
	
	page.prototype.pageInit = function(d,f){
		 var data = JSON.parse(d);
		 var that = f;
		 var e = that.pcModel();
		 var str = '';
		 len=data.content.length;
		 console.log(len);
		/*  for(var i=0,len=data.content.length;i<len;i++){
			 str += e.replace(/{{url}}/g, data.content[i].url).replace(/{{pic}}/g, data.content[i].pic).replace(/{{desc}}/g, data.content[i].desc).replace(/{{title}}/g, data.content[i].title).replace(/{{catname}}/g, d.content[i].catname).replace(/{{publishtime}}/g, data.content[i].publishtime);
		 }
		 console.log(str); */
		 //$("#newList .news).prepend(k);
		 console.log(f);
		 console.log(data);
	}
	
	 new page().init();
	
	
	
})