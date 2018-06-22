<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/resources/css/waitMe.css"> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/waitMe.js"></script> --%>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
	background: white;
	padding: 30px;
	margin-right: 10px;
	border-radius: 5px;
}

#scheduleList {
	background-color: white;
	height: 738px;
	padding: 30px;
	border-radius: 5px;
}

.startDay, .endDay {
	padding: 0px;
}

.startDay {
	padding-right: 5px;
}

.endDay {
	padding-left: 5px;
}

#scheduleDetail, #updateScheduleDetail {
	height: 100px;
}

#scheColor, #editscheColor {
	width: 30px;
	height: 35px;
	margin-top: 0px;
	padding: 0px;
	border: none;
	background-color: rgba(0, 0, 0, 0);
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-8">
			<div id="calendar"></div>
		</div>
		<div class="col-md-3" id="scheduleList">
			<h3
				style="font-weight: bold; text-align: center; margin-top: 0; margin-bottom: 30px;">
				일정 리스트</h3>
			<p></p>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>시작일</th>
							<th>종료일</th>
							<th>일정 내용</th>
						</tr>
					</thead>
					<tbody id="scheuleList">
						<!-- 일정리스트 -->
						<!-- 						<tr> -->
						<!-- 							<td>2018-01-01</td> -->
						<!-- 							<td>2018-01-01</td> -->
						<!-- 							<td>미니 프로젝트</td> -->
						<!-- 						</tr> -->
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-1" style="visibility: hidden;"></div>


	</div>

	<!-- 새 일정 모달 -->
	<button style="display: none;" type="button" id="newModalOpen"
		class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#newScheModal">Open Modal</button>
	<div class="modal fade in" id="newScheModal" role="modal" tabindex="-1"
		aria-labelledby="newScheModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" id="newModalClose" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<strong>새 일정</strong>
					</h4>
				</div>
				<div class="modal-body">
					<div class="contact-clean">
						<form method="post" id="addNewSchedule">
							<input type="hidden" name="userNo" value="${user.userNo}">
							<input type="hidden" name="schNo" id="schNo">
							<div class="form-group col-md-5 startDay">
								<span>시작일</span> <input type="date" class="form-control"
									name="startDate" id="startDate" />
							</div>
							<div class="form-group col-md-5 endDay">
								<span>종료일</span> <input type="date" class="form-control"
									name="endDate" id="endDate" />
							</div>
							<div class="form-group col-md-2">
								<span style="visibility: hidden;">일정색</span> <input
									id="scheColor" name="schColor" type="color" value="#41c7f4">
							</div>
							<div class="form-group">
								<textarea id="scheduleDetail" rows="14" name="schDetail"
									placeholder="일정내용을 기입하세요." class="form-control"></textarea>
							</div>
							<div class="form-group">
								<button class="btn btn-primary float-none" type="button"
									id="addSchBtn">추가</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<button style="display: none;" type="button" id="editModalOpen"
		class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#editScheModal">Open Modal</button>
	<!-- 일정 편집 모달 -->
	<div class="modal fade in" id="editScheModal" role="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button id="editModalClose" type="button" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">
						<strong>일정편집</strong>
					</h4>
				</div>
				<div class="modal-body">
					<div class="contact-clean">
						<form method="post" id="editSechedule">
							<input type="hidden" name="userNo" value="${user.userNo}">
							<input type="hidden" name="schNo" id="editSchNo">
							<div class="form-group col-md-5 startDay">
								<span>시작일</span> <input type="date" class="form-control"
									name="startDate" id="editStartDate" />
							</div>
							<div class="form-group col-md-5 endDay">
								<span>종료일</span> <input type="date" class="form-control"
									name="endDate" id="editEndDate" />
							</div>
							<div class="form-group col-md-2">
								<span style="visibility: hidden;">일정색</span> <input
									name="schColor" id="editscheColor" type="color" value="#41c7f4">
							</div>
							<div class="form-group">
								<textarea id="updateScheduleDetail" rows="14" name="schDetail"
									placeholder="미니프로젝트 2-회의" class="form-control"></textarea>
							</div>
							<div class="form-group">
								<button class="btn btn-primary float-none" id="eddEventBtn"
									type="button">편집</button>
								<button class="btn btn-secondary float-none" id="delEventBtn"
									type="button" style="color: rgb(0, 0, 0);">삭제</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



	<script>
var index = null;
var today = new Date();
var month= today.getMonth()+1;
$(document).ready(function() {
	scheduleList();
	$.ajax({
		url:"/maven_project_lac/schedule/selectIndex.json",
		dataType:"json",
		type:"POST",
		success:function(result){
			loading();
// 			console.dir(result);
			index = result;
		},
		error:function(e){
// 			  console.dir(e);
		  }
	});
		    $('#calendar').fullCalendar({ 
		    //캘린더 상단
		      header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'addEventButton'
		      },
// 		      windowResize: function(view) {
// 		    	    alert('The calendar has adjusted to a window resize');
// 		    	  },
		      //새일정 추가
		      	    customButtons: {
		      addEventButton: {
		        text: '+',
		        click: function() {
		          $("#newScheModal").modal();
		          $("#newScheModal").attr({"diplay":"block"} );
		      	}  
		      }
		    },
		    displayEventTime:false,
		      //일정클릭이벤트  
		      eventClick: function( event, jsEvent, view ){
		    	  eventClickEvent(event);
		    	  $("#editScheModal").modal();
		      },

			  //오늘날짜	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
		      navLinks: true, // can click day/week names to navigate views
		      editable: true,
		      
		      eventDrop: function( event, delta, revertFunc, jsEvent, ui, view ) { 
		    	  dragEvent(event, delta._days);
		      },
// 		      eventDurationEditable:true,
		      eventLimit: true, // allow "more" link when too many events
		      //이벤트들
		      events: {
		      	url : "selectSchedule.json",
		      	data:function(){
		      		return{
		      			userNo : ${user.userNo}
		      		}
		      	}
		      }
		    	  
		    });
  });
  
  
  //이벤트 리스트 출력
  	function scheduleList(){
		var html="";
		$("#scheuleList").html(html);
		
// 		console.log("달",month);
		$.ajax({
			url:"selectScheduleByMonth.json", 
			dataType:"json",
			data:{month:month, userNo : ${user.userNo}},
			type:"POST", 
			success:function(result){
				loading();
// 				console.log("에이작스 성공 값",result);
				for(let i = 0; i < result.length; i++){
				html="<tr>"
					 +"<td>"+result[i].startDate+"</td>"				
					 +"<td>"+result[i].endDate.substring(0,10)+"</td>"				
					 +"<td>"+result[i].schDetail+"</td>"				
					 +"</tr>";		
					 $("#scheuleList").append(html);
				}
			},
			error:function(e){
// 				console.log(e);
			}
		});
	}
  	$('body').on('click', 'button.fc-prev-button', function() {
  		month = month-1;
  		scheduleList();
  	});
  	$('body').on('click', 'button.fc-next-button', function() {
  		month = month+1;
  		scheduleList();
  	});
//이벤트 수정 클릭
 function eventClickEvent(eventObj){
// 	  console.log("클릭이벤트 함수");
	  $("#editSchNo").attr({"value":eventObj.id});
// 	  console.dir(eventObj);
	  eventSources=eventObj.source;
  	  $("#updateScheduleDetail").attr({"placeholder":eventObj.title});
  	  $("#updateScheduleDetail").attr({"value":eventObj.title});
  	  $("#editscheColor").attr({"value":eventObj.backgroundColor});
  	  
  	  
  	  let start = new Date(eventObj.start);
		  let month = start.getMonth()+1;
		  if(month.toString().length < 2){var sMonth = '0'+month;}
		  else{sMonth =month;}
		  if(start.getDate().toString().length < 2){var sDate = '0'+start.getDate();}
		  else{sDate =start.getDate();}
  	  let sDateFormat = start.getFullYear()+'-'+sMonth+'-'+sDate;
  	  $("#editStartDate").attr({"value":sDateFormat});	
  	  
  	  let end = new Date(eventObj.end);
  	  let eMonth = end.getMonth()+1;
  	  let eDate = end.getDate();
  	  if(eMonth.toString().length < 2){var eMonthFormat = '0'+eMonth;}
		  else{eMonthFormat =eMonth;}
		  if(eDate.toString().length < 2){var eDateFormat = '0'+eDate;}
		  else{eDateFormat = eDate;}
  	  let eDateval = end.getFullYear()+'-'+eMonthFormat+'-'+eDateFormat;
  	  if(eDateval == '1970-01-01'){
     	  	$("#editEndDate").attr({"value":sDateFormat});    	      	  
  	  }else{
     	  	$("#editEndDate").attr({"value":eDateval});    	      	  
  	  }
  	  
};

//새 일정 추가
$("#addSchBtn").click(function(e){
	if( $("#startDate").val()==""){
		alert("시작일을 입력하세요.");
	}else if($("#endDate").val()==""){
		alert("종료일을 입력하세요.");
	}else if($("#scheduleDetail").val()==""){
		alert("일정내용을 입력하세요.");
	}else{
	//일정 유효성 검사
	var newSDate = $("#startDate").val().split("-");
	var newStart = new Date(newSDate[0],newSDate[1]-1,newSDate[2]);
	var newEDate = $("#endDate").val().split("-");
	var newEnd = new Date(newEDate[0],newEDate[1]-1,newEDate[2]);
// 	alert(newStart);
// 	alert(newStart.getTime());
// 	alert(newEnd);
	if(newStart.getTime() > newEnd.getTime()){
		alert("시작일와 종료일이 올바르지 않습니다.");
	}else{
// 		alert("시작일 종료일 올바름");
	  $("#schNo").attr({"value":++index});
	  e.preventDefault();
// 	  console.log($("#addNewSchedule").serialize());
	  $("#newModalClose").trigger("click",function(){});
//         $("#newScheModal").modal('hide');
	  $.ajax({
		 url:"/maven_project_lac/schedule/newSchedule.json",
		 type:"POST",
		 dataType:"json",
		 data:$("#addNewSchedule").serialize(),
		 success : function(result){
			 loading();
			  var sDate = moment(result.startDate);
			  var eDate = moment(result.endDate);
			  var schDetail = moment(result.schDetail);
			  var schDetail = result.schDetail;
			  var schColor = result.schColor;
			  var schNo = result.schNo;
			 $.fullCalendar.formatRange(sDate, eDate, 'MMMM D YYYY');
			 $('#calendar').fullCalendar('removeEvents');
			 $('#calendar').fullCalendar('rerenderEvents');
		 	 $('#calendar').fullCalendar('refetchEvents');
//           $('#calendar').fullCalendar('renderEvent', {
//          	id : schNo,
//             title: schDetail,
//             start: sDate,
//             end:   eDate,
//             backgroundColor : schColor,
// //             allDay: true
//           });
          alert('일정이 등록 완료되었습니다');
          scheduleList();
		  }, 
		  error:function(e){
// 			  console.log(e);
			  }
		  });
		}
	}
});

//일정편집버튼 클릭
$("#eddEventBtn").click(function(){
	 $("#editModalClose").trigger("click",function(){});
// 	 console.log("일정 디테일",$("#updateScheduleDetail").attr("value"));
// 	if($("#updateScheduleDetail").attr("value")==null){
// 		alert("값 안들어옴");
// // 		var placeHolder = $("#updateScheduleDetail").attr("placeholder");
// 		$("#updateScheduleDetail").attr({"value":$("#updateScheduleDetail").attr("placeholder")});
		
// 	}
	 console.log($("#editSechedule").serialize());
	 loading();
	 $.ajax({
		url:"/maven_project_lac/schedule/updateSchedule.json",
// 		dataType:"json",
		type:"POST",
		data:$("#editSechedule").serialize(),
		success:function(result){
			loading();
// 			console.log(result,"편집에이작스 성공");
			 $('#calendar').fullCalendar('removeEvents');
		 	 $('#calendar').fullCalendar('refetchEvents');
			 $('#calendar').fullCalendar('rerenderEvents');
		 	 alert("일정 수정 완료되었습니다.");
			 scheduleList();
		},
		error:function(e){
// 			console.log(e);
		}
	 });
});


//일정 삭제
$("#delEventBtn").click(function(){
	var no = $("#editSchNo").val();
// 	console.log("번호",  no);
	   $("#editScheModal").modal('hide');
$.ajax({
	url:"/maven_project_lac/schedule/deleteSchedule.json",
	dataType:"json",
	data:{'schNo':no},
	type:"POST",
	success:function(result){
		loading();
// 		console.log("일정삭제 에이작스 성공",result); 
		 $('#calendar').fullCalendar('removeEvents');
		 $('#calendar').fullCalendar('rerenderEvents');
	 	 $('#calendar').fullCalendar('refetchEvents');
		 alert("일정 삭제가 완료되었습니다.");
		 scheduleList();
	},
	error:function(e){
// 		  console.dir(e);
	  }
	});
});

//일정 드래그 편집
function dragEvent(event, delta){
	loading();
// 	console.log(event);
// 	console.log(delta);
// 	console.log(event.start._i);
// 	console.log("이벤트종시작년",event.start._i[0]);
// 	console.log("이벤트시작월",event.start._i[1]+1);
// 	console.log("이벤트시작일",event.start._i[2]);
	
// 	var dragEventStartM = event.end._i[1]+1;
// 	var dragEventStartD = event.end._i[2];
// 	if(dragEventStartM.toString().length < 2){dragEventStartM = '0'+dragEventStartM;}
// 	if(dragEventStartD.toString().length < 2){dragEventStartD = '0'+dragEventStartD;}
	
// 	var startDate = event.start._i[0].toString() +"-"+ dragEventStartM +"-"+ dragEventStartD;
// 	console.log("formatS",startDate);
	
// 	console.log("이벤트종료년",event.end._i[0]);
// 	console.log("이벤트종료월",event.end._i[1]+1);
// 	console.log("이벤트종료일",event.end._i[2]);
	
	var dragEventEndM = event.end._i[1]+1;
	var dragEventEndD = event.end._i[2];
	if(dragEventEndM.toString().length < 2){dragEventEndM = '0'+dragEventEndM;}
	if(dragEventEndD.toString().length < 2){dragEventEndD = '0'+dragEventEndD;}
	
	var endDate = event.end._i[0].toString() +"-"+ dragEventEndM +"-"+ dragEventEndD;
// 	console.log("formatE",endDate);
	
	$.ajax({
		url:"updateScheduleDate.json",
		data:{'startDate' :event.start._i, 'endDate' : endDate, 'schNo':event.id, 'delta': delta},
		type:"POST",
		success:function(){
			loading();
			alert("일정수정완료");
			 $('#calendar').fullCalendar('removeEvents');
			 $('#calendar').fullCalendar('rerenderEvents');
		 	 $('#calendar').fullCalendar('refetchEvents');
			scheduleList();
		},
		error:function(e){
			
// 			console.dir(e);
		}
		
	});
}
$("#editScheModal").on("hidden.bs.modal", function(){
 	$(this).find('form')[0].reset()
});
$("#newScheModal").on("hidden.bs.modal", function(){
 	$(this).find('form')[0].reset()
});
$(function() {
	setTimeout(() => {
		$("#exit_btn_button").fadeIn(1000);
		$("#create_btn_button").fadeOut(1000);
		$("#calendar_btn_button").fadeOut(1000);
	}, 100);
});
</script>
</body>

</html>