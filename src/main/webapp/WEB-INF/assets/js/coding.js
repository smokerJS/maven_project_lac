/**
 * 최운영
 * 2018-05-21
 */
$(".content_box").mousemove(function(e){
	console.dir(e);
	$(".entryMouseViewWorkspace").text("X: "+e.offsetX+" , Y: "+e.offsetY);
});
$(document).ready(function(){
	for(let i=1;i<30;i++){
		$(".text_line").append('<span>  '+i+'|</span><br>');
	}
});


