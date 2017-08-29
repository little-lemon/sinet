$(function(){

	
	var parsingJSON = function(parsingDom,cfDom,data){
		var mb = parsingDom.prop("outerHTML");
		var elemList = [];
        data.map(function(elem ,inde) {
            var mbLi;
            mbLi = mb.replace(/{{pic}}/g,elem.pic).replace(/{{name}}/g,elem.honor);
            elemList.push(mbLi);
        })
        cfDom.html(elemList.join(''));
	}

	$.ajax({
        type: "POST",
        timeout: 10000,
        dataType: "json",
        url: "/index.php/List/gethonor",
        success: function (data) {
            parsingJSON($("#introduction .honor ul li:first"),$("#introduction .honor ul"),data);
        },
        error: function (e, jqxhr, settings, exception) {
            console.log(e);
        }
    })

})