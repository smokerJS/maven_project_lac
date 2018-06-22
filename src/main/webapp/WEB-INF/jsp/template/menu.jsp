<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here<sitemesh:write property="title"/></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css"> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar/fullcalendar.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar/fullcalendar.print.min.css" media="print">

<!-- <script src="../../js/jquery-3.2.1.js"></script> -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/coding/css/coding.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/chatting/css/chatting.css">
<link href="http://vjs.zencdn.net/5.4.4/video-js.css" rel="stylesheet">
<script src="http://vjs.zencdn.net/5.4.4/video.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/fullcalendar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/fullcalendar/theme.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/sweetalert/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/sweetalert/sweetalert2.all.min.js"></script>
    <sitemesh:write property="head"/>

<style>


</style>
</head>
<body>
<div id="back_ground_shadow">
</div>
<div id="back_ground_loding">
    <div class="loading_img">
        <img id="loading_img" src="${pageContext.request.contextPath}/resources/img/default/loading.gif"/>
    </div>
</div>


<div id="menu_bar">	
    <div id="menu_bar_row" class="row">
        <div class="menu_btn btn btn-default"><a href="${pageContext.request.contextPath}/main/logout.do"><i class="material-icons" style="font-size:36px">vpn_key</i></a></div>
        <div id="my_info_btn_button" class="menu_btn btn btn-default"><i class="fa fa-cog"></i></div>
        <a href="<c:url value="/project/lobby.do"/>"><div id="exit_btn_button" class="menu_btn btn btn-default">Exit</div></a>
        <div id="create_btn_button" class="menu_btn btn btn-default">New</div>
        <div id="friends_btn_button" class="menu_btn btn btn-default"><i class="fa fa-address-book friends_addr friends_addr_side"></i></div>
        <a href="<c:url value="/schedule/schedule.do"/>"><div id="calendar_btn_button" class="menu_btn btn btn-default"><span class="glyphicon glyphicon-calendar"></span></div></a>
        <div id="noti_box" class="menu_btn btn btn-default"><i class="fa fa-bell" style="font-size:24px"></i>
        <div id="noti_cnt"></div>
        </div> 
   
    </div>
</div>

<div>

</div>


<%-- 새 클래스 생성 --%>
<div id="create_class">
	<div>
		<div id="calss_name" contenteditable="true" placeholder="Project 이름을 알려주세요!"></div>
		<div ib="create_btn">
			<div id="create_btn_st" class="menu_btn btn btn-default">Finish</div>
		</div>
	</div>
</div>


<%-- 개인정보 수정 --%>
<div id="my_info">
		<div id="my_profile_img">
			<img src="${pageContext.request.contextPath}/resources/img/default/defaultImg.jpg"/>
		</div>
		<div id="my_profile_repair">
			<div>
				<input id="userNickname" placeholder="${user.nickname}" readonly click=0
				style="width:50px; background-color: rgba(0,0,0,0); border: none; text-align: center;"></input>
				<span id="nickEditIcon" class="profile_repair_btn btn btn-default"><i class="material-icons">mode_edit</i></span><br>
				(<span>${user.email}</span>)
			</div>
			<div id="changePassBtn" class="btn btn-default">
			비밀번호변경<br></div>
			<div id="unsubscribeBtn" class="btn btn-default">회원탈퇴</div>
		</div>
</div>


<%-- 친구관련 --%>
<div id="friends_list">
	<div id="my_friends" class="friends_area">
		<div id="my_friends_menu" class="friends_menu">
			My Friends
		</div>
		<div class="search_friends">
			<input id="srarch_my_friends" type="text" placeholder="내 친구 검색">
		</div>
		<div class="friends_search_list">

		</div>
	</div>
	<div id="new_friends" class="friends_area">
		<div id="new_friends_menu" class="friends_menu">
			New Friends
		</div>
		<div class="search_friends">
			<input type="text" id="srarch_new_friends" placeholder="새 친구 검색">
		</div>
		<div class="friends_search_list">
		

		</div>
	</div>
	<div id="request_friends" class="friends_area">
		<div id="request_friends_menu" class="friends_menu">
			Request
		</div>
		<div id="request_friends_list" class="friends_r_area">
			<div class="friends_r_list">
					<span>Request List</span>
			</div>
			<div class="friends_search_r_list">
				
			</div>
		</div>
		<div id="response_friends_list" class="friends_r_area">
			<div class="friends_r_list">
					<span>Response List</span>
			</div>
			<div class="friends_search_r_list">
				
				
			</div>
		</div>
	</div>
</div>


<div id="noti_area">
	<div id="noti_screen">
		
	</div>
	<div id="noti_tri"></div>
</div>

    <sitemesh:write property="body"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.1/socket.io.dev.js"></script>
<script>
	var host = "http://192.168.10.83";
	var noti = io.connect(host+':3001');
	var userNo = ${user.userNo}
	var notiInfo = {nickname:"${user.nickname}",profile_pic:"${user.profilePic}",user_no:${user.userNo}};
	
	$(()=>{noti.emit("join",userNo)});
	noti.on(userNo+"join",function(result){
		printNoti(result)
	});
	noti.on(userNo+"noti",function(result){
		noti.emit("join",userNo);
	});
	
	noti.on(userNo+"notiCnt",function(result){
		$("#noti_cnt").html(result);
	});
	
	$("#noti_screen").one("click",".noti_del_btn",function(){
		let notiNo = $(this).attr("name");
		$(this).parent().parent().fadeOut(200);
		noti.emit("deleteNoti",[notiNo,userNo+"notiCnt"]);
	});
	
	$("#noti_screen").one("click",".noti_info",function(){
		let notiNo = $(this).attr("name");
		$(this).find(".noti_new").fadeOut(200);
		noti.emit("viewNoti",[notiNo,userNo+"notiCnt"]);
	});
	
	$("#noti_screen").one("click",".projectJoin",function(){
		let projectNo = $(this).attr("name");
		noti.emit("insertProjectParticipant",[userNo,projectNo]);
		location.href="${pageContext.request.contextPath}/project/"+projectNo+"/codingRoom.do";
	});
	
	function printNoti(data){
		let area = $("#noti_screen");
		let newNotiCnt = 0;
		area.html("");
		$("#noti_cnt").html("");
		for(d of data){
			let newNoti = ""
			if(d.noti_state_code=="00204"){
				newNoti = `<i class="noti_new material-icons">fiber_new</i>`
				newNotiCnt++;
			}
			
			$("#noti_cnt").html(newNotiCnt == 0 ? "" : newNotiCnt);
			switch (d.noti_type_code) {

			case "00201": 
				area.prepend(`
						<div class="noti_info" id="`+d.noti_no+`noti" name="`+d.noti_no+`">
							<div class="noti_img">
								<img src="${pageContext.request.contextPath}`+d.profile_pic+`">
							</div>
							<div class="noti_text">
								<span>`+d.nickname+`</span><br>
								<span>친구요청이 왔습니다.</span>
								`+newNoti+`
								<i class="noti_del_btn material-icons" name="`+d.noti_no+`">cancel</i>
							</div>
						</div>
						`)
				break;
			case "00202": 
				area.append(`
						<div class="noti_info" id="`+d.noti_no+`noti" name="`+d.noti_no+`">
							<div class="noti_img">
								<img src="${pageContext.request.contextPath}`+d.profile_pic+`">
							</div>
							<div class="noti_text">
								<span>`+d.noti_attach_msg+`</span><br>
								<span>초대장이 왔습니다!</span>
								<button class="projectJoin btn btn-primary" name="`+d.project_no+`">수락</button>
								`+newNoti+`
								<i class="noti_del_btn material-icons" name="`+d.noti_no+`">cancel</i>
							</div>
						</div>
						`)
				break;
			case "00205": 
				area.prepend(`
						<div class="noti_info" id="`+d.noti_no+`noti" name="`+d.noti_no+`">
							<div class="noti_img">
								<img src="${pageContext.request.contextPath}`+d.profile_pic+`">
							</div>
							<div class="noti_text">
								<span>`+d.nickname+`</span><br>
								<span>`+d.noti_attach_msg+`</span>
								`+newNoti+`
								<i class="noti_del_btn material-icons" name="`+d.noti_no+`">cancel</i>
							</div>
						</div>
						`)
				break;
	
			}
		}
	}
	
	
	
	$("#back_ground_shadow").on("click",function(){
		$(this).fadeToggle(300)
		$("#create_class").fadeOut(300);
		$("#my_info").fadeOut(300);
		$("#friends_list").fadeOut(300);
		$("#firends_invite").fadeOut(300);
		$("#search_invite").fadeOut(300);
	})
	$("#create_btn_button").on("click",()=>{
		$("#create_class").fadeToggle(300);
		$("#back_ground_shadow").fadeToggle(300);
	})
	$("#my_info_btn_button").on("click",()=>{
		$("#my_info").fadeToggle(300);
		$("#back_ground_shadow").fadeToggle(300);
	})
	$("#friends_btn_button").on("click",()=>{
		searchFriends($("#srarch_my_friends").val(),"friends",$("#my_friends div.friends_search_list"),"삭제")
		searchFriends("","request",$("#request_friends_list div.friends_search_r_list"),"취소")
		searchFriends("","response",$("#response_friends_list div.friends_search_r_list"),"수락")
		searchFriends("","unknown",$("#new_friends div.friends_search_list"),"추가")
		$("#friends_list").fadeToggle(300);
		$("#back_ground_shadow").fadeToggle(300);
	})
	$($("#calendar_btn_button").fadeIn(300));
	
	
	
	
	$("#nickEditIcon").click(function(){
		console.dir ($("#userNickname").attr("click"));
		if($("#userNickname").attr("click")==0){
// 			alert("일반클릭");
			$("#userNickname").attr("readonly", false);
			$("#userNickname").attr("style", "width:100px;");
			$("#userNickname").focus();
			$("#userNickname").attr("click",1);
		}else{
// 			alert("수정클릭");
			$("#userNickname").attr("click",0);
			alert("닉네임변경이 완료되었습니다.");
			loading();
			 location.href="${pageContext.request.contextPath}/main/editNick.do?userNo=${user.userNo}&nickname="+$("#userNickname").val();
		}
	});
	
	$("#changePassBtn").click(function(){
		swal.mixin({
			  input: 'text',
			  confirmButtonText: 'Next &rarr;',
			  showCancelButton: true,
			  progressSteps: ['1', '2', '3']
			}).queue([
			 '기존비밀번호를 입력하세요',
			  {
				    title: '새 비밀번호를 입력하세요.',
				    text: '기존의 비밀번호와 다른 비밀번호'
			  },
			  '새 비밀번호를 입력하세요'
			]).then((result) => {
			  if (result.value) {
				  console.log(result.value);
				  $.ajax({
					  url:"/maven_project_lac/main/editPass.json",
					  data:{'userNo':${user.userNo},'password':result.value[0], 'newPassword':result.value[1],'checkNewPassword':result.value[2]},
					  dataType:"json",
					  type:"POST",
					  success:function(result){
						  titleResult = result;
					    swal({
					    
					      title: result,
		// 			      html:
		// 			        'Your answers: <pre>' +
		// 			          JSON.stringify(result.value) +
		// 			        '</pre>',
					      confirmButtonText: '닫기'
					    })
					  },
					  error:function(e){
						 	console.log(e);
					  }
				  });
			  }
			})
	});
	
	$("#unsubscribeBtn").click(function(){
		swal({
			  title: '정말 탈퇴하시겠습니까?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네!',
			  cancelButtonText: '아니오',
			}).then((result) => {
			  if (result.value) {
				  location.href="${pageContext.request.contextPath}/main/leaveId.do?userNo=${user.userNo}";
					  }
			  	})	
			
	});
	
	
	
	
	$("#new_friends_menu").on("click",function(){
		$(this).css({"background-color":"aliceblue","cursor":"auto"});
		$("#my_friends_menu").css({"background-color":"#A0A2AA","cursor":"pointer"});
		$("#request_friends_menu").css({"background-color":"#A0A2AA","cursor":"pointer"});
		$("#new_friends").css({"z-index":1500});
		$("#my_friends").css({"z-index":1400});
		$("#request_friends").css({"z-index":1400});
		
	})
	
	$("#my_friends_menu").on("click",function(){
		$(this).css({"background-color":"aliceblue","cursor":"auto"});
		$("#new_friends_menu").css({"background-color":"#A0A2AA","cursor":"pointer"});
		$("#request_friends_menu").css({"background-color":"#A0A2AA","cursor":"pointer"});
		$("#my_friends").css({"z-index":1500});
		$("#new_friends").css({"z-index":1400});
		$("#request_friends").css({"z-index":1400});
		
	})
	
	$("#request_friends_menu").on("click",function(){
		$(this).css({"background-color":"aliceblue","cursor":"auto"});
		$("#new_friends_menu").css({"background-color":"#A0A2AA","cursor":"pointer"});
		$("#my_friends_menu").css({"background-color":"#A0A2AA","cursor":"pointer"});
		$("#request_friends").css({"z-index":1500});
		$("#my_friends").css({"z-index":1400});
		$("#new_friends").css({"z-index":1400});
	})
	
	$("#noti_box").on("click",function(){
		$("#noti_area").fadeToggle(300);
	})
	
	
 	$("#srarch_my_friends").on("keyup",function(){
		searchFriends($(this).val(),"friends",$("#my_friends div.friends_search_list"),"삭제")
	})
	
	$("#srarch_new_friends").on("keyup",function(){
		searchFriends($(this).val(),"unknown",$("#new_friends div.friends_search_list"),"추가")
	})
	
	function loading() {
		$(document).ajaxStart(function(){
			$("#back_ground_loding").css({"display":"block"});
		}).ajaxStop(function(){
			$("#back_ground_loding").css({"display":"none"});
		});
	}
	function noLoading() {$(document).ajaxStart(function(){$("#back_ground_loding").css({"display":"none"});})}

	
	
	
	
	$("#my_friends").on("click","span.friends_utill_btn",function(){
		let remove = $(this).parent(".friedns_icon");
		loading();
		$.ajax({
			url:'${pageContext.request.contextPath}/friends/delete.json',
			type:"POST",
			data: {"fReqUNo":userNo,"fResUNo":$(this).siblings("input").val()}
		}).done(function (result) {
				remove.fadeOut(100);
				searchFriends("","unknown",$("#new_friends div.friends_search_list"),"추가")
			})
	})
	
	$("#new_friends").on("click","span.friends_utill_btn",function(){
		let remove = $(this).parent(".friedns_icon");
		let resNo = $(this).siblings("input").val();
		loading();
		$.ajax({
			url:'${pageContext.request.contextPath}/friends/request.json',
			type:"POST",
			data: {"fReqUNo":userNo,"fResUNo":resNo}
		}).done(function (result) {
				searchFriends("","request",$("#request_friends_list div.friends_search_r_list"),"취소")
				remove.fadeOut(100);
				notiInfo["noti_type_code"] = "00201";
				notiInfo["noti_req_no"] = userNo;
				notiInfo["noti_res_no"] = resNo;
				notiInfo["sql"] = ["00201",userNo,resNo];
				noti.emit("requsetNoti",notiInfo);
			})
	})
	
	$("#response_friends_list").on("click","span.friends_utill_btn",function(){
		let remove = $(this).parent(".friedns_icon");
		loading();
		$.ajax({
			url:'${pageContext.request.contextPath}/friends/insert.json',
			type:"POST",
			data: {"fReqUNo":userNo,"fResUNo":$(this).siblings("input").val()}
		}).done(function (result) {
				searchFriends($("#srarch_my_friends").val(),"friends",$("#my_friends div.friends_search_list"),"삭제")
				remove.fadeOut(100);
			})
	})
	
	$("#request_friends_list").on("click","span.friends_utill_btn",function(){
		let remove = $(this).parent(".friedns_icon");
		remove.fadeOut(100);
		loading();
		$.ajax({
			url:'${pageContext.request.contextPath}/friends/requestDelete.json',
			type:"POST",
			data: {"fReqUNo":userNo,"fResUNo":$(this).siblings("input").val()}
		}).done(function (result) {
				searchFriends($("#srarch_new_friends").val(),"unknown",$("#new_friends div.friends_search_list"),"추가");
			})
	})
	
	
	
	
	
	
	
	function searchFriends(nickname,type,area,btn) {
		loading();
		$.ajax({
			url:'${pageContext.request.contextPath}/friends/search.json',
			type:"POST",
			data: {"userNo":userNo,"nickname":nickname,"type":type}
		}).done(function (result) {
				area.html("");
			for(info of result){
				area.append(`
						<div class="friedns_icon">
						<img src="${pageContext.request.contextPath}`+info.profilePic+`">
						<span>`+info.nickname+`</span>
						<span class="friends_utill_btn btn btn-default">`+btn+`</span>
						<input type="hidden" value="`+info.userNo+`"/>
						</div>
						`);				
			}
		})
	}

	
	
	$("#calss_name").on("keydown",function(e){
		if(e.keyCode==13)$("#create_btn_st").click();
	})
	$("#create_btn_st").on("click",()=>{
		let projectName = $("#calss_name");
		loading();
		$.ajax({
			url:'${pageContext.request.contextPath}/project/createProject.json',
			type:"POST",
			data: {"userNo":userNo,"projectName":projectName.text()}
		}).done(function () {
				projectName.text("");
				$("#create_class").fadeOut(300);
				$("#back_ground_shadow").fadeOut(300);
				$(refresh)
			})
		})
</script>

</body>
</html>