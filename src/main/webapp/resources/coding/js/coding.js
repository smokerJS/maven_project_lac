/**
 * 최운영
 * 2018-05-21
 */
$("#compile").on("click", function() {
		runCode();
	});
	var workspace = Blockly.inject('blocklyDiv', {
		toolbox : document.getElementById('toolbox')
	});

	// blockly 이벤트 받기        
	workspace.addChangeListener(showCode);

	function showCode() {
		// java 소스 생성
		Blockly.Java.INFINITE_LOOP_TRAP = null;
		var code = Blockly.Java.workspaceToCode(workspace);
		setOutput(code);
	}
	function setOutput(text) {
		$(".CodeMirror").remove();
		var output = document.getElementById('importExport');
		output.value = text;
		output.focus();
		output.select();
		CodeMirror.fromTextArea(document.getElementById("importExport"), {
			lineNumbers : true
		});
		$(".CodeMirror").css("height", "80%");
	}
	function runCode() {
		console.log($("#importExport").val());
		$.ajax({
			url : '/maven_project_lac/coding/compile.json',
			type : "POST",
			data : {
				"source" : $("#importExport").val()
			}
		}).done(function(result) {
			console.log("완료된 것이야");
			console.log(result.replace("\r\n", "<br>"));
			$(".compile_box").text(result.replace("\r\n", "<br>"));
		});
	}


//$(document).ready(function () {
//    //Counter
//    counter = 0;
//	$("#order_box > div").draggable({  
//		helper: 'clone',
//		snap:"true",
//		containment: '.block_box',
//		 stop: function (ev, ui) {
//	         var pos = $(ui.helper).offset();
//	         objName = "#clonediv" + counter
//	         console.log(pos.left);
//	         $(objName).css({
//	             "left": pos.left-48,
//	             "top": pos.to-150
//	         });
//	         $(objName).removeClass("drag");
//	         //When an existiung object is dragged
//	         $(objName).draggable({
//	             containment: 'parent',
//	             stop: function (ev, ui) {
//	                 var pos = $(ui.helper).offset();
//	                 console.log($(this).attr("id"));
//	                 console.log(pos.left)
//	                 console.log(pos.top)
//	             }
//	         });
//	     }
//	});
//	var search=/drag[0-9]/;
//	$(".block_box").droppable({
//        drop: function (ev, ui) {
//            if (search.test(ui.helper.attr('id')) != -1) {
//                counter++;
//                var element = $(ui.draggable).clone();
//                element.addClass("tempclass");
//                element.css("position","absolute");
//                $(this).append(element);
//                $(".tempclass").attr("id", "clonediv" + counter);
//                $("#clonediv" + counter).removeClass("tempclass");
//                //Get the dynamically item id
//                draggedNumber = search.test(ui.helper.attr('id'))
//                itemDragged = "dragged" + RegExp.$1
//                console.log(itemDragged)
//                $("#clonediv" + counter).addClass(itemDragged);
//            }
//        }
//    });
//	
//});

/*$( ".block_box" ).droppable({
	accept:'#order_box > div',
	tolerance: "touch",
    drop: function(event, ui) {
    	console.dir(event);
    	parseInt($(ui.helper).css("top")) 탑의 위치 숫자로 가져오기
        $(this).append($(ui.helper).draggable());
    }
});*/

