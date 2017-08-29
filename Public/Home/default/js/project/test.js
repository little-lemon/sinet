$(function() {
    var c = function() {
        this.current = 1;
        this.pages = 15;
        this.ts = 5;
        this.countPage = 0;
        this.sum = 5;
        this.currentIndex = 1;
        this.ftype = this.judgeCla();
        this.cid = $("#ychidden").val();
        this.url = "";
        this.contents = [];
        this.length = 1;
        this.ydts = 10
    };
	
    c.prototype.init = function() {
        if (this.ftype == "pc") {
            this.setPCData();
            this.upClick();
            this.downClick();
            this.scollshow();
            this.fiveClick();
            this.syClick();
            this.wyClick()
        } else {
            var d = $("<ul></ul>");
            $("#newList .news").append(d);
            this.setYDData();
            this.scollYDshow()
        }
    }
    ;
    c.prototype.createButton = function(j) {
        $(".button").remove();
        var f = [];
        var g = 1;
        var h = 0;
        var e = 0;
        if (this.currentIndex > 3) {
            g = parseInt(this.currentIndex) - 2;
            e = parseInt(this.currentIndex) + 2;
            h = 2
        } else {
            e = 5;
            h = this.currentIndex - 1
        }
        if (parseInt(this.currentIndex) + 2 >= this.countPage) {
            g = this.countPage - 4;
            e = this.countPage;
            h = 4 - this.countPage + parseInt(this.currentIndex)
        }
        for (var d = g; d <= e; d++) {
            f.push($("<div class='button'>" + d + "</div>"))
        }
        $("#newList .news .paging .up").after(f);
        $("#newList .news .paging .button").eq(h).addClass("active");
        if (this.currentIndex == 1) {
            $("#newList .news .paging .up").addClass("upnone");
            $("#newList .news .paging .sy").addClass("upnone")
        } else {
            $("#newList .news .paging .up,#newList .news .paging .sy").removeClass("upnone")
        }
        if (this.currentIndex == this.countPage) {
            $("#newList .news .paging .down").addClass("upnone");
            $("#newList .news .paging .wy").addClass("upnone")
        } else {
            $("#newList .news .paging .down,#newList .news .paging .wy").removeClass("upnone")
        }
        this.szClick()
    }
    ;
    c.prototype.pcModel = function() {
        var d = '<a href="#" title="" ><li class="clearfix"><div class="imgs"><a href="{{url}}" title="" target="_blank"><img src="{{pic}}" alt="" class="img-responsive" /></a></div><div class="context"><a href="{{url}}" title="" target="_blank"><div class="newtitle">{{title}}</div><p>{{desc}}</p></a><div class="dynamic clearfix"><div class="hxdt">{{catname}}</div><div class="time">{{publishtime}}</div></div></div></li></a>';
        return d
    }
    ;
    c.prototype.paseing = function(j, h) {
        var d = JSON.parse(j);
        var h = h;
        var e = h.pcModel();
        var k = "";
        h.countPage = parseInt(d.count / h.pages);
        d.count % h.pages > 0 ? h.countPage += 1 : h.countPage += 0;
        $(".zys").text(h.countPage);
        for (var g = 0; g < d.content.length; g++) {
            k += e.replace(/{{url}}/g, d.content[g].url).replace(/{{pic}}/g, d.content[g].pic).replace(/{{desc}}/g, d.content[g].desc).replace(/{{title}}/g, d.content[g].title).replace(/{{catname}}/g, d.content[g].catname).replace(/{{publishtime}}/g, d.content[g].publishtime);
            if ((g + 1) % h.ts == 0) {
                var f = $("<ul></ul>");
                f.append(k);
                h.contents.push(f);
                k = ""
            }
            if (d.count % h.pages && d.count == (h.pages * (h.currentIndex - 1) + g + 1)) {
                var f = $("<ul></ul>");
                f.append(k);
                h.contents.push(f);
                k = ""
            }
        }
        $("#newList .news ul").remove();
        $("#newList .news").prepend(h.contents[0]);
        h.createButton(h.countPage);
        if (h.length == 1 && h.contents.length == 1) {
            $(".paging").removeClass("none");
            $("#hsLayer img").addClass("none")
        }
    }
    ;
    c.prototype.ydPaseing = function(e, d) {
        $("#newList .news ul").append(e);
        $("#hsLayer img").addClass("none");
        if (e.length === 0) {
            $("#hsLayer p").removeClass("none")
        }
    }
    ;
    c.prototype.setPCData = function() {
        $(".paging").addClass("none");
        this.contents.splice(0, this.contents.length);
        this.cid == "18" ? this.url = "/index.php/list/getarticle/cid/18" : this.url = "/index.php/list/getarticle/cid/41";
        this.ajax(this.url, (this.currentIndex - 1) * this.pages, this.pages, this.paseing, this)
    }
    ;
    c.prototype.setYDData = function() {
        $(".paging").addClass("none");
        this.cid == "18" ? this.url = "/index.php/list/getarticle/cid/18" : this.url = "/index.php/list/getarticle/cid/41";
        var d = $("#newList ul").children("a").length;
        this.ajax(this.url, d, this.pages, this.ydPaseing, this)
    }
    ;
    c.prototype.scollshow = function() {
        var e = this;
        var d = false;
        $(window).scroll(function(g) {
            if (b()) {
                g.timeStamp = 260
            }
            if ($(document).scrollTop() >= $(document).height() - $(window).height() && g.timeStamp > 250) {
                if ($(".paging").hasClass("none")) {
                    $("#hsLayer img").removeClass("none")
                }
                e.length = $("#newList .news ul").length;
                var f = Math.random() * 1000 + 800;
                if (e.length <= e.contents.length - 1) {
                    var h = setTimeout(function() {
                        $("#newList .news").prepend(e.contents[1]).prepend(e.contents[0]);
                        $("#hsLayer img").addClass("none")
                    }, f);
                    d = true
                }
                if (e.length == e.contents.length - 1 && d) {
                    var h = setTimeout(function() {
                        $("#newList .news").prepend(e.contents);
                        $(".paging").removeClass("none");
                        $("#hsLayer img").addClass("none")
                    }, f);
                    d = false
                }
            }
        })
    }
    ;
    c.prototype.scollYDshow = function() {
        var d = this;
        $(window).scroll(function(f) {
            if ($(document).scrollTop() >= $(document).height() - $(window).height() && f.timeStamp > 250) {
                $("#hsLayer img").removeClass("none");
                setTimeout(function() {
                    d.setYDData()
                }, 1000)
            }
        })
    }
    ;
    c.prototype.szClick = function() {
        var d = this;
        $(".button").click(function() {
            if (!$(this).hasClass("active")) {
                d.length = 1;
                d.currentIndex = $(this).text();
                if (d.ftype == "pc") {
                    d.setPCData()
                }
                $(".ys").val("");
                $(document).scrollTop(70)
            }
        })
    }
    ;
    c.prototype.syClick = function() {
        var d = this;
        $(".sy").click(function() {
            if ($(".active").text() != 1) {
                d.currentIndex = 1;
                if (d.ftype == "pc") {
                    d.setPCData()
                }
                $(".ys").val("");
                $(document).scrollTop(70)
            }
        })
    }
    ;
    c.prototype.wyClick = function() {
        var d = this;
        $(".wy").click(function() {
            if ($(".active").text() != d.countPage) {
                d.currentIndex = d.countPage;
                if (d.ftype == "pc") {
                    d.setPCData()
                }
                $(".ys").val("");
                $(document).scrollTop(70)
            }
        })
    }
    ;
    c.prototype.upClick = function() {
        var d = this;
        $(".paging .up").click(function() {
            if ($(".active").text() != 1) {
                d.length = 1;
                d.currentIndex = parseInt(d.currentIndex) - 1;
                if ($(".button:first").hasClass("active")) {
                    d.current = parseInt(d.current) - 1
                }
                if (d.ftype == "pc") {
                    d.setPCData()
                }
                $(".ys").val("");
                $(document).scrollTop(70)
            }
        })
    }
    ;
    c.prototype.downClick = function() {
        var d = this;
        $(".paging .down").click(function() {
            if ($(".active").text() < d.countPage) {
                d.length = 1;
                d.currentIndex = parseInt(d.currentIndex) + 1;
                if ($(".button:last").hasClass("active")) {
                    d.current = parseInt(d.current) + 1
                }
                if (d.ftype == "pc") {
                    d.setPCData()
                }
                $(".ys").val("");
                $(document).scrollTop(70)
            }
        })
    }
    ;
    c.prototype.fiveClick = function() {
        var d = this;
        $(".paging .five").click(function() {
            var e = parseInt($(".ys").val());
            if (e > 0) {
                d.length = 1;
                d.currentIndex = e;
                if (e > d.countPage) {
                    d.currentIndex = d.countPage;
                    e = d.countPage
                }
                e % d.sum > 0 ? d.current = parseInt(e / d.sum) + 1 : d.current = parseInt(e / d.sum)
            } else {
                d.currentIndex = 1;
                d.current = 1
            }
            if (d.ftype == "pc") {
                d.setPCData()
            }
            $(".ys").val("");
            $(document).scrollTop(70)
        })
    }
    ;
    c.prototype.ajax = function(e, h, d, g, f) {
        $.ajax({
            type: "POST",
            timeout: 10000,
            data: {
                start: h,
                end: d,
                cid: this.cid,
                ftype: this.ftype
            },
            dataType: "text",
            url: e,
            success: function(i) {
                g(i, f)
            },
            error: function(k, l, j, i) {}
        })
    }
    ;
    c.prototype.judgeCla = function() {
        var f = navigator.userAgent.toLowerCase();
        var j = f.match(/ipad/i) == "ipad";
        var k = f.match(/iphone os/i) == "iphone os";
        var i = f.match(/midp/i) == "midp";
        var g = f.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
        var h = f.match(/ucweb/i) == "ucweb";
        var d = f.match(/android/i) == "android";
        var e = f.match(/windows ce/i) == "windows ce";
        var l = f.match(/windows mobile/i) == "windows mobile";
        if (j || k || i || g || h || d || e || l) {
            return "phone"
        } else {
            return "pc"
        }
    }
    ;
    new c().init();
    function b() {
        if (navigator.userAgent.indexOf("Firefox") > -1) {
            return true
        } else {
            return false
        }
    }
    $("#newList .news").on("mouseover mouseout", "li .context", function(d) {
        if (d.type == "mouseover") {
            $(this).find(".newtitle,p").css({
                color: "#5194E0"
            })
        } else {
            if (d.type == "mouseout") {
                $(this).find(".newtitle,p").css("color", "#595959")
            }
        }
    });
    function a() {
        if ($(".fotter").offset().top < document.documentElement.clientHeight) {
            $(".fotter").css({
                position: "fixed",
                bottom: 0
            });
            $(".fr_link").css({
                position: "fixed",
                bottom: "50px",
                left: 0,
                width: "100%"
            })
        }
    }
    setTimeout(a, 500)
});
