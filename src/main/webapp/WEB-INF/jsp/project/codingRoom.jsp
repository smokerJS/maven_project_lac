<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- blockly 스크립트  -->
<script src="${pageContext.request.contextPath}/blockly-master/blockly_compressed.js"></script>
<script src="${pageContext.request.contextPath}/blockly-master/blocks_compressed.js"></script>
<script src="${pageContext.request.contextPath}/blockly-master/java_uncomp.js"></script>
<script src="${pageContext.request.contextPath}/blockly-master/msg/js/ko.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.js"></script>

<!-- 코드미러 스크립트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/codemirror/lib/codemirror.css">
<script src="${pageContext.request.contextPath}/codemirror/lib/codemirror.js"></script>
<script src="${pageContext.request.contextPath}/codemirror/mode/xml/xml.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/coding/css/coding.css">
</head>
<body>

    <div id="side_bar">
        <div id="side_bar_row" class="row">
            <div id="side_bar_btn">open</div>
            
            <div id="side_box">
                <div id="side_name">
                <span title="${project.projectName}">${project.projectName}</span>
                <span value="0" id="change_projectName" class="update_btns btn btn-default"><i class="material-icons">create</i></span>
                </div>
				<div id="side_img">
					<img src="${pageContext.request.contextPath}/${project.projectPic}">
					<span class="side_img_btns btn btn-default"><i class="material-icons">wallpaper</i></span>
				</div>
				<div id="side_board">
					<span title="${project.projectInfo}">${project.projectInfo}</span>
				    <span value="0"  id="change_projectInfo" class="side_board_update_btn btn btn-default">수정</span>
				</div>
				<div id="side_member_list">
					<div id="side_member_text">참여목록 ${project.userCount}</div>
					<div id="side_member_info">
					<c:forEach items="${userList}" var="list">
						<div class="side_member_icon friedns_icon">
							<img src="${pageContext.request.contextPath}/${list.profilePic}">
							<span>${list.nickname}</span>
						</div>
					</c:forEach>
					
					</div>
				</div>
				<div id="friends_invitation_btn" class="side_btn_button btn btn-primary" >친구초대</div>
				<div id="leave_class" class="side_btn_button btn btn-danger">프로젝트 탈퇴</div>
            </div>
        </div>
    </div>
    <div id="search_invite"  style="display:none;">
		<input id="srarch_my_invite" type="text" placeholder="내 친구 검색">
	</div>
	<div id="firends_invite" class="col-md-3" style="display:none;" >
	</div>
	</div>




    <div id="main_area" class="col-md-11"> <!-- start #main_area -->


        <div class="screen row">   <!-- start .screen -->
			 <div id="coding_area" class="col-md-8"> <!-- start #coding_area -->
                <div class="content_box row">
	                <div id="blocklyDiv" class="blocklyDiv col-md-6">   <!-- start .content_box -->
	                </div>
	                <div class="text_line col-md-6">   <!-- 소스 작성 부분-->
	                	<textarea class="source_box" id="importExport" readonly="readonly" wrap="off">
	                	</textarea>
	                	<textarea class="compile_box" readonly="readonly" wrap="off">
	                	</textarea>
	                </div>  
                    <button id="compile" type="button" class="btn btn-default btn-sm">
			          <span class="glyphicon glyphicon-play"></span> Compile
			        </button>
                </div>
                
                <!-- end .content_box -->
                
            </div>  <!-- end #coding_area -->

        </div>  <!-- end .screen -->

        <div id="chatting_area" class="col-md-4 row"> <!-- start #chatting_area -->
			<div id="inAndOutNoti"></div>
            <div class="chatting_box" id="chatting_content">    <!-- start #chatting_content -->
				<div id="uploadForm">
					<form id="uploadPicForm" action="/chatting/fileUpload.json" enctype="multipart/form-data">
						<input type="hidden" name="fileMapping"/>
						<input type="hidden" name="sendDate"/>
					</form>
					
					<form id="uploadFileByNode" action="/upload" method="post"  enctype="multipart/form-data">
						<input id="nodeUploadFile" type="file" name="nodeUpload">
					</form>
					<form id="uploadMp4ByNode" action="/upload" method="post"  enctype="multipart/form-data">
						<input id="nodeUploadMp4" type="file" name="nodeUpload" accept ="video/mp4">
					</form>


					
				</div>
				<div id="nodeUploadArea">
					<div id="uploadProgName"></div>
					 <meter id="uploadProgBar" min="0" max="100" value="77"></meter>
					 <span id="uploadProgNum"></span>
				</div>
				<div id="emoArea">
						<c:forEach var="i" begin="1" end="116">
							<span class="emoBox">
								<img class="emoImg" src="/maven_project_lac/resources/img/emoticon/${i}.png"/>
							</span>
						</c:forEach>
				</div>
            </div>                                              <!-- end #chatting_content -->

            <div class="chatting_box" id="chatting_write">  <!-- start #chatting_writet -->
				<div id="attachLoadingImgBox"><img src="/maven_project_lac/resources/img/default/blockloading.gif"/></div>

                <div id="chatting_clip">    <!-- start #chatting_clip -->
                    
                    <div id="cilp_emoticon_btn" class="clip_btn btn btn-default">
                        <i class="clip_icon material-icons">insert_emoticon</i>
                    </div>
                    <div id="clip_file_btn" class="clip_btn add_btn btn btn-default">
                        <i class="clip_icon material-icons">attach_file</i>
                    </div>
                    <div id="clip_poto_btn" class="clip_btn btn btn-default">
                        <i class="clip_icon material-icons">add_a_photo</i>
                    </div>
                    <div id="clip_video_btn" class="clip_btn btn btn-default">
                        <i class="clip_icon material-icons">video_call</i>
                    </div>

                </div>  <!-- end #chatting_clip -->


                <div id="chatting_text_box">    <!-- start #chatting_text_box -->

                    <div id="chatting_text">
                        <div id="text_box" contenteditable="true"></div>
                    </div>

                    <div id="chatting_text_btn">
                        <div id="onchat" class="menu_btn btn btn-default" title="ctrl+Enter">
                            <i class="material-icons onchat">chat</i>
                        </div>
                    </div>

                </div>  <!-- end #chatting_text_box -->



            </div>  <!-- end #chatting_writet -->

        </div>  <!-- end #chatting_area -->

    </div>  <!-- end #main_area -->
    <xml id="toolbox" style="display: none">
    <category name="조건문">
      <category name="If">
        <block type="controls_if"></block>
        <block type="controls_if">
          <mutation else="1"></mutation>
        </block>
        <block type="controls_if">
          <mutation elseif="1" else="1"></mutation>
        </block>
      </category>
      <category name="Boolean">
        <block type="logic_compare"></block>
        <block type="logic_operation"></block>
        <block type="logic_negate"></block>
        <block type="logic_boolean"></block>
        <block type="logic_null"></block>
        <block type="logic_ternary"></block>
      </category>
    </category>
    <category name="반복문">
      <block type="controls_repeat_ext">
        <value name="TIMES">
          <block type="math_number">
            <field name="NUM">10</field>
          </block>
        </value>
      </block>
      <block type="controls_whileUntil"></block>
      <block type="controls_for">
        <field name="VAR">i</field>
        <value name="FROM">
          <block type="math_number">
            <field name="NUM">1</field>
          </block>
        </value>
        <value name="TO">
          <block type="math_number">
            <field name="NUM">10</field>
          </block>
        </value>
        <value name="BY">
          <block type="math_number">
            <field name="NUM">1</field>
          </block>
        </value>
      </block>
      <block type="controls_forEach"></block>
      <block type="controls_flow_statements"></block>
    </category>
    <category name="연산">
      <block type="math_number">
        <field name="NUM">123</field>
      </block>
      <block type="math_arithmetic"></block>
      <block type="math_single"></block>
      <block type="math_trig"></block>
      <block type="math_constant"></block>
      <block type="math_number_property"></block>
      <block type="math_round"></block>
      <block type="math_on_list"></block>
      <block type="math_modulo"></block>
      <block type="math_constrain">
        <value name="LOW">
          <block type="math_number">
            <field name="NUM">1</field>
          </block>
        </value>
        <value name="HIGH">
          <block type="math_number">
            <field name="NUM">100</field>
          </block>
        </value>
      </block>
      <block type="math_random_int">
        <value name="FROM">
          <block type="math_number">
            <field name="NUM">1</field>
          </block>
        </value>
        <value name="TO">
          <block type="math_number">
            <field name="NUM">100</field>
          </block>
        </value>
      </block>
      <block type="math_random_float"></block>
    </category>
    <category name="리스트">
      <block type="lists_create_empty"></block>
      <block type="lists_create_with"></block>
      <block type="lists_repeat">
        <value name="NUM">
          <block type="math_number">
            <field name="NUM">5</field>
          </block>
        </value>
      </block>
      <block type="lists_length"></block>
      <block type="lists_isEmpty"></block>
      <block type="lists_indexOf"></block>
      <block type="lists_getIndex"></block>
      <block type="lists_setIndex"></block>
    </category>
    <category name="변수" custom="VARIABLE"></category>
    <category name="함수" custom="PROCEDURE"></category>
    <sep></sep>
    <category name="Library" expanded="true">
      <category name="출력">
        <block type="text_print">
          <value name="TEXT">
            <block type="text">
              <field name="TEXT">Hello world!!!!</field>
            </block>
          </value>
        </block>
      </category>
    </category>
  </xml>
  <div id="secondaryDiv"></div>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.1/socket.io.dev.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/coding/js/coding.js"></script>
<script>
var host = "http://192.168.10.83";
	$("#leave_class").on("click",function(){
		swal({
			  title: '정말 클래스를 탈퇴하시겠습니까?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Leave'
			}).then((result) => {
			  if (result.value) {
			    swal(
			      '탈퇴하였습니다,',
			      'success'
			    )
				location.href="${pageContext.request.contextPath}/project/leaveClass.do?projectNo=${project.projectNo}&userNo=${user.userNo}";
			  }
			})
	});
	
	$("#side_name").on("keyup",'span:nth-child(1)',function(e){
		if(e.keyCode==13)$("#change_projectName").click();
	});
	$("#side_board").on("keyup",'span:nth-child(1)',function(e){
		if(e.keyCode==13)$("#change_projectInfo").click();
	});
	
	$("#side_name").on("click",'#change_projectName', function(){
		if($(this).attr("value")==0){
			$("#side_name > span:nth-child(1)").attr("contenteditable","true").css("background-color","white").focus();
			$(this).attr("value",1);
		}else{
			var projectName = $("#side_name > span:nth-child(1)").text();
			$.ajax({
				url:'${pageContext.request.contextPath}/project/updateProjectName.json',
				data: {"projectName":projectName,"projectNo":'${project.projectNo}',"type":'projectName'}
			}).done(function(result){
				$("#side_name").html('');
				$("#side_name").html(`<span title="`+projectName+`">`+projectName+`</span>
		                <span value="0" id="change_projectName" class="update_btns btn btn-default">
		                <i class="material-icons">create</i></span>
			               `);
			});
		}
		
	});
	
	$("#side_board").on("click",'#change_projectInfo', function(){
		if($(this).attr("value")==0){
			$("#side_board > span:nth-child(1)").attr("contenteditable","true").css("background-color","white").focus();
			$(this).attr("value",1);
		}else{
			var projectInfo= $("#side_board > span:nth-child(1)").text();
			$.ajax({
				url:'${pageContext.request.contextPath}/project/updateProjectName.json',
				data: {"projectInfo":projectInfo,"projectNo":'${project.projectNo}',"type":'projectInfo'}
			}).done(function(result){
				$("#side_board").html('');
				$("#side_board").html(`<span title="`+projectInfo+`">`+projectInfo+`</span>
					    <span value="0"  id="change_projectInfo" class="side_board_update_btn btn btn-default">수정</span>`);
			});
		}
		
	});
	
	$("#firends_invite").on("click",".inbb",function(){
		let resUserNo = $(this).attr("name");
		let data = {
			sql1:["00202",resUserNo,${project.projectNo}],
		    sql2:["00202",${user.userNo},resUserNo,${project.projectNo},'${project.projectName}'],
			"noti_res_no":resUserNo
		};
		noti.emit("requsetNotiByProject",data);
		$(this).parent().fadeOut(200);
	})
	
	$("#friends_invitation_btn").on("click",function(){
			$("#firends_invite").fadeToggle(300);
			$("#search_invite").fadeToggle(300);
			$("#back_ground_shadow").fadeToggle(300);
			var nickname = "";
			if($("#srarch_my_invite").val()!=""){
				nickname=$("#srarch_my_invite").val();
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/project/selectInviteFriends.json',
				data: {"userNo":'${user.userNo}',"type":"friends","nickname":nickname,"projectNo":'${project.projectNo}'}
			}).done(function (result) {
				area = $("#firends_invite").html('');
				for(info of result){
						area.append(`
						<div class="side_member_icon friedns_icon">
						<img src="${pageContext.request.contextPath}/`+info.profilePic+`">
						<span>`+info.nickname+`</span>
						<div class="inbb btn btn-default" name="`+info.userNo+`">초대</div>
						</div>
						`);				
				}
			})
	});
	$("#srarch_my_invite").on("keyup",function(){
		noLoading();
		$.ajax({
			url:'${pageContext.request.contextPath}/project/selectInviteFriends.json',
			data: {"userNo":'${user.userNo}',"type":"friends","nickname":this.value,"projectNo":'${project.projectNo}'}
		}).done(function (result) {
			area = $("#firends_invite").html('');
			for(info of result){
						area.append(`
						<div class="side_member_icon friedns_icon">
						<img src="${pageContext.request.contextPath}/`+info.profilePic+`">
						<span>`+info.nickname+`</span>
						<div class="inbb btn btn-default" name="`+info.userNo+`">초대</div>
						</div>
						`);				
			}
		})
	});	
	var socket = io.connect(host+':3000');
	var user = {};
	var screen = $("#chatting_content");
	var lastDate = null;
	var lastSender = null;
	
	
	
	// ------------------------------------------------ 채팅출력시 스크롤 위치 기능 함수
	function screenScroll(type,user,msg) {
		let msgNoti = $("#inAndOutNoti");
		msgNoti.children("#newMsgNoti").remove();
		switch (type) {
		case 1: if(screen.scrollTop() > screen[0].scrollHeight-900) screen.scrollTop(screen[0].scrollHeight);
				else{
					msgNoti.append(`
							<div id="newMsgNoti" class="newMsgNoti">
							  <div>
							  	  <span class="newMsgNickname">`+user.nickname+`</span>
							  </div>
							  <div class="profilePic">
			              		  <img src="${pageContext.request.contextPath}`+user.profilePic+`"/>
			              	  </div>
			              	  <div>
			              	  	  <span class="newMsgText">`+msg+`</span>
			              	  </div>
			              	  <span class="newMsgTri"></span>
						</div>
					`)
					let newMsg = $("#newMsgNoti");
					newMsg.fadeIn(300);
			        setTimeout(()=>{newMsg.fadeOut(300);},3000);
				}
		break;
		case 2: screen.scrollTop(screen[0].scrollHeight*2); break;
		}
	}
	$("#inAndOutNoti").on("click","#newMsgNoti",()=>{
		screenScroll(2);
	})
	// ------------------------------------------------ 채팅출력시 스크롤 위치 기능 함수
	
	// ------------------------------------------------ 조인 기능 함수
	
	$(()=>{
		user["userNo"] = ${user.userNo};
		user["nickname"] = "${user.nickname}";
		user["email"] = "${user.email}";
		user["profilePic"] = "${user.profilePic}";
		user["loginStateCode"] = "${user.loginStateCode}";
		socket.emit("conn",{"userNo":${user.userNo},projectNo:${project.projectNo}});
	});
	socket.on("${project.projectNo}conn${user.userNo}",function(result){
		chattingListLoad(result);
	});
    socket.on(${project.projectNo}+"join",function(result){
        $("#inAndOutNoti").append(`<div id="`+result.userNo+`join" class="joinMsg"><span>[ `+result.nickname+` ]님이<br> </span><span>입장하셨습니다.</span></div>`);
        let msg = $("#"+result.userNo+"join");
        msg.fadeIn(300);
        setTimeout(()=>{msg.fadeOut(300);},3000);
    })
	
    // ------------------------------------------------ 조인 기능 함수

	// ------------------------------------------------ 채팅방 입장시 DB에서 불러오는 기능 함수
	
	function chattingListLoad(result) {
    	for(data of result){
 			let loadData = {};
			loadData["user"] = {"userNo":data.user_no,"nickname":data.nickname,"profilePic":data.profile_pic}
			loadData["sql"] = [data.project_no,			// 0. 프로젝트 번호
							   data.send_user_no,		// 1. 보낸 유저 번호
							   data.message,			// 2. 메세지 (이미지 : 미리보기, 동영상: URL)
							   data.msg_type_code,		// 3. 메세지 타입
							   data.send_date,			// 4. 보낸 시간
							   data.chatting_no,		// 5. 메세지 번호
							   data.file_size,			// 6. null 파일 사이즈
							   data.ori_file_name,		// 7. null 원본 파일명
							   data.download_path,		// 8. null 다운로드 경로
							   data.ori_file_name,		// 9. 원본파일명 출력시
							   data.file_size]		// 10. 파일 사이즈 출력시
			loadData["chattingNo"] = data.chatting_no;
			switch (data.msg_type_code) {
			case "00301": chattingViewByMsg(loadData);    break;
			case "00302": chattingViewByPic(loadData);    break;
			case "00303": chattingViewByVideo(loadData);  break;
			case "00304": chattingViewByFile(loadData);   break;
			case "00305": chattingViewByEmoticon(loadData); break;
			}
		}
		socket.emit("join",{"user":user,projectNo:${project.projectNo}});
		screenScroll(2);
	}
	
	// ------------------------------------------------ 채팅방 입장시 DB에서 불러오는 기능 함수
	
	
    // ------------------------------------------------ 채팅 출력시 마지막 메세지를 보낸 사람과 날짜 비교 함수
    function lastSendData(userNo,date) {
		if(lastSender == null){
			lastSender = {"userNo":userNo,"date":date};
			return false;
		}
		if(lastSender.userNo == userNo && lastSender.date == date) return true;
		lastSender = {"userNo":userNo,"date":date};
		return false;
	}
    // ------------------------------------------------ 채팅 출력시 마지막 메세지를 보낸 사람과 날짜 비교 함수
    
    
    
    
    // ------------------------------------------------ 메세지 기능 함수
    
    $("#onchat").on("click",()=>{
    	onMsg();
    })
    $("#text_box").on("keyup",function(e){
        if(e.keyCode==13&&e.ctrlKey){ onMsg() }
    })
    function onMsg(){
    	let msg = $("#text_box");
    	if(msg.html().length < 1) return;
    	else{
    		socket.emit("msg",{"user":user,"sql":[${project.projectNo},user.userNo,msg.html(),"00301",new Date()]});
    		msg.html("");
    	}
	}
    
	socket.on(${project.projectNo}+"msg",function(result){
		chattingViewByMsg(result);
	})
	
	function chattingViewByMsg(result) {
		let user = result.user;
		let msg = result.sql[2];
		let date = date_info(result.sql[4]);
		
		if(lastSendData(user.userNo,date)){
			$(`.sendTime[name="`+user.userNo+date+`"]`).each(function (index,ele) {
				ele.remove();
			})
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
		             <div class="myChainMsg myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
			              		`+msg+`
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
		              	</div>
		              </div>
		        		`);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
			          <div class="unknownChainMsg unknownChatView chatView">
		              	  <div class="unknownUserMsg userMsg">
		              	      `+msg+`
		              	      <div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
	    		`);
				screenScroll(1,user,msg);
			}
		}else{
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
		             <div class="myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
			              		`+msg+`
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
			              	<span class="msgTri"></span>
		              	</div>
		              </div>
		        		`);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
			          <div class="unknownChatView chatView">
		              	  <h6><span class="userNickname">`+user.nickname+`</span></h6>
		              	  <div class="profilePic">
		              		  <img src="${pageContext.request.contextPath}`+user.profilePic+`"/>
		              	  </div>
		              	  <div class="unknownUserMsg userMsg">
		              	      `+msg+`
		              	      <div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              	
		              </div>
	    		`);
				screenScroll(1,user,msg);
			}
		}
	}
	
	
	
	// ------------------------------------------------ 메세지 기능 함수
	
	
	
	
	
	
	// ------------------------------------------------ 사진전송 기능 함수
	var fileLength = null;
	var fileIndex = 0;
	
	
	
	$("#clip_poto_btn").on("click",function(){
        $(".imgInp").remove(); 
		$("#uploadPicForm").append($("<input>").attr({type:"file",class:"imgInp",name:"uploadPic",multiple:"true",accept:"image/*"}).click());
	})
	
	$("#uploadPicForm").on("change","input.imgInp",function(){
    	let fileext = $(this).val();
    	fileext = fileext.slice(fileext.indexOf(".")+1).toUpperCase();
    	if(fileext != "JPG"
    	 &&fileext != "PNG"
    	 &&fileext != "GIF"
    	 &&fileext != "BMP"
    	){
    		swal('이미지 파일만 선택이 가능합니다.');
        	$(".imgInp").remove();
    		return;
    	}else{
    		$("#attachLoadingImgBox").css({"display":"block"});
    	}
    	
		noLoading();
		

		var fileData = [];
		var files = this.files;
		for(let i = 0 ; i < this.files.length ; i++){
        	var reader = new FileReader();
        	reader.onload = function (e) {
        		fileData[i] = {e:e.target.result,fileName:files[i].name}
            }
        	reader.readAsDataURL(this.files[i]);
		}
        var fileLength = this.files.length;
		$.ajax({
			url:'${pageContext.request.contextPath}/chatting/send.json',
			type:"POST",
			data: {"projectNo":"${project.projectNo}","sendUserNo":"${user.userNo}","message":"","msgTypeCode":"00302","sendDate":new Date(),"fileLength":fileLength}
		}).done(function (chattingList) {
			$("#attachLoadingImgBox").css({"display":"none"});
			let DBDate = new Date();
			let index = 0;
			let fileMapping = "";
			for(data of chattingList){
				fileMapping = fileMapping+[fileData[index].fileName]+":"+data+";";
	 		    socket.emit("pic",{loading:true,fileInfo:fileData[index],"user":user,"projectNo":${project.projectNo},"chattingNo":data,"sql":[${project.projectNo},user.userNo,fileData[index++].e,"00302",DBDate]});
			}
			var f = $("#uploadPicForm")[0];
			f.sendDate.value = DBDate; 
			f.fileMapping.value = fileMapping; 
			var formData = new FormData(f);
			$.ajax({
				url:'${pageContext.request.contextPath}/chatting/fileUpload.json',
				type:"POST",
				processData: false,
				contentType: false,
				data: formData
			}).done((successData)=>{
				socket.emit("successLoad",{"projectNo":${project.projectNo},"successData":successData})
			})
		})
	})
	
	socket.on(${project.projectNo}+"successLoad",function(result){
		for(chattingNo of result.successData){
			$("#"+chattingNo.chattingNo+" img").attr("src",chattingNo.message);
			$("#"+chattingNo.chattingNo+" img.getFileLoadingImgs").remove();
			
		}
    })
	socket.on(${project.projectNo}+"pic",function(result){
		chattingViewByPic(result,result.fileLoadName);
    })

	function chattingViewByPic(result) {
		let loadingImg = "";
		let chattingNo = result.sql[5];
		if(result.chattingNo != 0){
			loadingImg = ` id="`+result.chattingNo+`" `;
			chattingNo = result.chattingNo;
		}

		let msg = result.sql[2];
		let user = result.user;
		let date = date_info(result.sql[4]);
		if(lastSendData(user.userNo,date)){
			$(`.sendTime[name="`+user.userNo+date+`"]`).each(function (index,ele) {
				ele.remove();
			})
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div `+loadingImg+` class="myChainMsg myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
			              		<div class="chattingImgArea">
		              				`+fileUploadIcon(chattingNo,false,result.loading,true)+`
			              			<img src="`+msg+`"/>
			              		</div>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div `+loadingImg+` class="unknownChainMsg unknownChatView chatView">
		              	  <div class="unknownUserMsg userMsg">
		              	      	<div class="chattingImgArea">
		              	     		 `+fileUploadIcon(chattingNo,false,result.loading)+`
			              			<img src="`+msg+`"/>
			              		</div>
			              		<div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(사진)");
			}
		}else{
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div `+loadingImg+` class="myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
			              		<div class="chattingImgArea">
			              			`+fileUploadIcon(chattingNo,true,result.loading,true)+`
			              			<img src="`+msg+`"/>
			              		</div>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
			              	<span class="msgTri"></span>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div `+loadingImg+` class="unknownChatView chatView">
		              	  <h6><span class="userNickname">`+user.nickname+`</span></h6>
		              	  <div class="profilePic">
		              		  <img src="${pageContext.request.contextPath}`+user.profilePic+`"/>
		              	  </div>
		              	  <div class="unknownUserMsg userMsg">
		              				`+fileUploadIcon(chattingNo,true,result.loading)+`
		              	  			<img src="`+msg+`"/>
			              		</div>
			              		<div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(사진)");
			}
		}
	}
	
	// ------------------------------------------------ 사진전송 기능 함수

	// ------------------------------------------------ 동영상 및 파일 기능 함수

	$("#clip_file_btn").on("click",()=>{
		$("#nodeUploadFile").click();
	});
	$("#clip_video_btn").on("click",()=>{
		$("#nodeUploadMp4").click();
	});
	
	$("#uploadMp4ByNode").on("change","#nodeUploadMp4",function(){
    	let fileext = $(this).val();
    	fileext = fileext.slice(fileext.indexOf(".")+1).toUpperCase();
    	if(fileext != "MP4"){
    		swal('MP4 파일만 선택이 가능합니다.');
    		return;
    	}else{
    		$("#uploadProgName").text($(this)[0].files[0].name);
    		$("#attachLoadingImgBox").css({"display":"block"});
    	}
    	fileUploadNodeServer(new FormData($("#uploadMp4ByNode")[0]),"00303");
	});
	
	$("#uploadFileByNode").on("change","#nodeUploadFile",function(){
    	let fileext = $(this).val();
    	fileext = fileext.slice(fileext.indexOf(".")+1).toUpperCase();
    	$("#uploadProgName").text($(this)[0].files[0].name);
    	$("#attachLoadingImgBox").css({"display":"block"});
    	if(fileext == "MP4"){
    		fileUploadNodeServer(new FormData($("#uploadFileByNode")[0]),"00303");
    	}else{
    		fileUploadNodeServer(new FormData($("#uploadFileByNode")[0]),"00304");
    	}
	});

	function fileUploadNodeServer(form,msgType) {
		$("#nodeUploadArea").css({"display":"block"});
		noLoading();
	     $.ajax({
	            url: host+':3000/upload',
	            type: 'post',
	            data: form,
	            processData: false,
	            contentType: false,
	            xhr:function(){
	                var xhr = $.ajaxSettings.xhr();
	                if( xhr.upload ){
	                    xhr.upload.addEventListener("progress", function(ev){
	                        var prog = parseInt( (ev.loaded / ev.total) * 100 );
	                        var val = prog.toString()+"%";
	                    	$("#uploadProgNum").html(prog.toString()+"%");
	                    	$("#uploadProgBar").attr({"value":prog.toString()});
	                    }, false);
	              
	                }
	                return xhr;
	            }
	     }).done((data)=>{
	            $("#attachLoadingImgBox").css({"display":"none"});
	            $("#uploadProgBar").attr({"value":"0"});
            	$("#uploadProgNum").text("0%");
            	$("#nodeUploadArea").css({"display":"none"});
            	$("#nodeUploadMp4").remove();
            	$("#nodeUploadFile").remove();
            	$("#uploadFileByNode").append($("<input>").attr({type:"file",id:"nodeUploadFile",name:"nodeUpload"}))
            	$("#uploadMp4ByNode").append($("<input>").attr({type:"file",id:"nodeUploadMp4",name:"nodeUpload",accept:"video/mp4"}))
            	let downPath = msgType == "00303" ? host+":3000/download/video/" : host+":3000/download/file/";
            	let DBData = {
            		"user":user,
            		"sql":[${project.projectNo},
            			   user.userNo,
            			   data.filename,
            			   msgType,
            			   new Date(),
            			   data.size,
            			   data.originalname,
            			   downPath+data.filename,
            			   downPath+data.filename,
            			   data.originalname,
            			   data.size
            			]
            	}
            	socket.emit("fileAndVideo",DBData);
	        })
	   	 
	}
	
	socket.on(${project.projectNo}+"video",function(result){
		chattingViewByVideo(result);
    })
	socket.on(${project.projectNo}+"file",function(result){
		chattingViewByFile(result);
    })
    
	function chattingViewByVideo(result) {
		let msg = result.sql[2];
		let user = result.user;
		let date = date_info(result.sql[4]);
		if(lastSendData(user.userNo,date)){
			$(`.sendTime[name="`+user.userNo+date+`"]`).each(function (index,ele) {
				ele.remove();
			})
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div class="myChainMsg myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
								<div class="getFileBtn">
					  	      		<a class="getFileBtnATag" href="`+result.sql[8]+`">
					          			<i class="material-icons getFileBtnIcon fristIcons myViewIconLoading">get_app</i>
					          		</a>
				  				</div>	
				  			        <video class="streamVideo video-js vjs-default-skin" controls preload="none" width="400" height="300" data-setup="{}">
				  			  			<source src="`+host+`:3002/stream/`+result.sql[2]+`" type='video/mp4' />
				  			    	</video>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div class="unknownChainMsg unknownChatView chatView">
		              	  <div class="unknownUserMsg userMsg">
								<div class="getFileBtn">
					  	      		<a class="getFileBtnATag" href="`+result.sql[8]+`">
					          			<i class="material-icons getFileBtnIcon fristIcons">get_app</i>
					          		</a>
				  				</div>	
				  			        <video class="streamVideo video-js vjs-default-skin" controls preload="none" width="400" height="300" data-setup="{}">
			  			  				<source src="`+host+`:3002/stream/`+result.sql[2]+`" type='video/mp4' />
			  			    		</video>
			              		<div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(동영상)");
			}
		}else{
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div class="myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
								<div class="getFileBtn">
					  	      		<a class="getFileBtnATag" href="`+result.sql[8]+`">
					          			<i class="material-icons getFileBtnIcon fristIcons myViewIconLoading">get_app</i>
					          		</a>
				  				</div>	
			  			       		<video class="streamVideo video-js vjs-default-skin" controls preload="none" width="400" height="300" data-setup="{}">
		  			  					<source src="`+host+`:3002/stream/`+result.sql[2]+`" type='video/mp4' />
		  			    			</video>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
			              	<span class="msgTri"></span>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div class="unknownChatView chatView"> 
		              	  <h6><span class="userNickname">`+user.nickname+`</span></h6>
		              	  <div class="profilePic">
		              		  <img src="${pageContext.request.contextPath}`+user.profilePic+`"/>
		              	  </div>
		              	  <div class="unknownUserMsg userMsg">
							<div class="getFileBtn">
				  	      		<a class="getFileBtnATag" href="`+result.sql[8]+`">
				          			<i class="material-icons getFileBtnIcon fristIcons">get_app</i>
				          		</a>
			  				</div>	
		  			        	<video class="streamVideo video-js vjs-default-skin" controls preload="none" width="400" height="300" data-setup="{}">
	  			  					<source src="`+host+`:3002/stream/`+result.sql[2]+`" type='video/mp4' />
	  			    			</video>
			              		<div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(동영상)");
			}
		}
	}
	
	function chattingViewByFile(result) {
		let msg = result.sql[2];
		let user = result.user;
		let date = date_info(result.sql[4]);
		if(lastSendData(user.userNo,date)){
			$(`.sendTime[name="`+user.userNo+date+`"]`).each(function (index,ele) {
				ele.remove();
			})
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div class="myChainMsg myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
			              		<a href="`+result.sql[8]+`">
			              		<div class="myFileUpload fileUploads">파일명    : `+result.sql[9]+`</div>
			              		<div class="myFileUpload fileUploads">파일크기 : `+result.sql[10]+`byte</div>
			              		</a>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div class="unknownChainMsg unknownChatView chatView">
		              	  <div class="unknownUserMsg userMsg">
			              		<a href="`+result.sql[8]+`">
			              		<div class="fileUploads">파일명    : `+result.sql[9]+`</div>
			              		<div class="fileUploads">파일크기 : `+result.sql[10]+`byte</div>
			              		</a>
			              		<div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(파일)");
			}
		}else{
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div class="myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
			              		<a href="`+result.sql[8]+`">
			              		<div class="myFileUpload fileUploads">파일명    : `+result.sql[9]+`</div>
			              		<div class="myFileUpload fileUploads">파일크기 : `+result.sql[10]+`byte</div>
			              		</a>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
			              	<span class="msgTri"></span>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div class="unknownChatView chatView">
		              	  <h6><span class="userNickname">`+user.nickname+`</span></h6>
		              	  <div class="profilePic">
		              		  <img src="${pageContext.request.contextPath}`+user.profilePic+`"/>
		              	  </div>
		              	  <div class="unknownUserMsg userMsg">
		              	      <a href="`+result.sql[8]+`">
		              		  <div class="fileUploads">파일명    : `+result.sql[9]+`</div>
		              		  <div class="fileUploads">파일크기 : `+result.sql[10]+`byte</div>
		              		  </a>
			              	  <div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(파일)");
			}
		}
	}
	
	
	
	// ------------------------------------------------ 동영상 및 파일 기능 함수
	
	
	// ------------------------------------------------ 이모티콘 전송 함수
	$("#cilp_emoticon_btn").on("click",()=>{
		$("#emoArea").fadeToggle(200);
	})
	
	$(".emoImg").one("click",function(){
		let msg = $(this).attr("src");
		$("#emoArea").fadeToggle(200);
    	let DBData = {
        		"user":user,
        		"sql":[${project.projectNo},
        			   user.userNo,
        			   msg,
        			   "00305",
        			   new Date(),
        			]
        	}
        socket.emit("msg",DBData);
	})
	socket.on(${project.projectNo}+"emoticon",function(result){
		chattingViewByEmoticon(result);
    })
    
    function chattingViewByEmoticon(result) {
		let msg = result.sql[2];
		let user = result.user;
		let date = date_info(result.sql[4]);
		if(lastSendData(user.userNo,date)){
			$(`.sendTime[name="`+user.userNo+date+`"]`).each(function (index,ele) {
				ele.remove();
			})
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div class="myChainMsg myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
								<div class="viewEmoBox">
									<img class="viewEmoImg" src="`+msg+`"/>
								<div>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div class="unknownChainMsg unknownChatView chatView">
		              	  <div class="unknownUserMsg userMsg">
							<div class="viewEmoBox">
								<img class="viewEmoImg" src="`+msg+`"/>
							<div>
			              		<div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(이모티콘)");
			}
		}else{
			if(${user.userNo}==user.userNo){
		        $("#chatting_content").append(`
					  <div class="myChatView chatView">
		              	<div class="myMsgArea">
			              	<div class="myUserMsg userMsg">
								<div class="viewEmoBox">
									<img class="viewEmoImg" src="`+msg+`"/>
								<div>
			              		<div class="sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
			              	</div>
			              	<span class="msgTri"></span>
		              	</div>
		              </div>
			    `);
		        screenScroll(2);
			}else{
				$("#chatting_content").append(`
						<div class="unknownChatView chatView">
		              	  <h6><span class="userNickname">`+user.nickname+`</span></h6>
		              	  <div class="profilePic">
		              		  <img src="${pageContext.request.contextPath}`+user.profilePic+`"/>
		              	  </div>
		              	  <div class="unknownUserMsg userMsg">
							<div class="viewEmoBox">
								<img class="viewEmoImg" src="`+msg+`"/>
							<div>
			              	  <div class="unknownSendTime sendTime" name="`+user.userNo+date+`">`+parseDateScreen(date)+`</div>
		              	  </div>
		              </div>
				`);
				screenScroll(1,user,"(이모티콘)");
			}
		}
	}
	
	// ------------------------------------------------ 이모티콘 전송 함수
	
	
	
	// ------------------------------------------------ 파일 업로드 아이콘 함수
		function fileUploadIcon(chattingNo,frist,loading,myView) {
		    var getFiles = "";
		    var loadImges = "";
		    var myScreen = "";
		    if(myView){
		    	myScreen = " myViewIconLoading";
		    }
		    if(loading){
		    	loadImges = "<img src='/maven_project_lac/resources/img/default/fileLoading.gif' class='getFileLoadingImgs"+myScreen+"'/>";
		    }
		    var loadClass = "  "
		    if(frist){
					getFiles = `
								<div class="getFileBtn">
					  	      		<a class="getFileBtnATag" href="${pageContext.request.contextPath}/chatting/`+chattingNo+`/filedown.do">
					          			<i class="material-icons getFileBtnIcon fristIcons `+myScreen+`">get_app</i>
					          		</a>
					          		`+loadImges+`
					  			</div>	
								`;
			}
		    else{
					getFiles = `
								<div class="getFileBtn">
					  	      		<a class="getFileBtnATag" href="${pageContext.request.contextPath}/chatting/`+chattingNo+`/filedown.do">
					          			<i class="material-icons getFileBtnIcon `+myScreen+`">get_app</i>
					          		</a>
					          		`+loadImges+`
					  			</div>	
								`;
		    }
			return getFiles;
		};
	
	// ------------------------------------------------ 파일 업로드 아이콘 함수
	
	
	// ------------------------------------------------ 파일 업로드 완료 함수
	socket.on(${project.projectNo}+"fileLoad",function(result){
		$(`.getFileBtn[name="`+result.fileLoadName+`"]`).each(function (index,ele) {
			$(ele).append(`
	  	      		<a class="getFileBtnATag" href="${pageContext.request.contextPath}/chatting/`+result.chattingNoList[index]+`/filedown.do">
          				<i class="material-icons getFileBtnIcon">get_app</i>
          			</a>
					`);
		})
    });
	// ------------------------------------------------ 파일 업로드 완료 함수
	// ------------------------------------------------ 날짜출력 기능 함수
	function printToday(sendDate) {
		let week = ['일', '월', '화', '수', '목', '금', '토'];
		let date = new Date(sendDate);
		
		let today = date.getFullYear()    + "년 " 
                  + (date.getMonth() + 1) + "월 " 
                  + date.getDate()        + "일 "
				  + week[date.getDay()]   + "요일";
		let lastDay = "";
		if(lastDate != null)
            lastDay = lastDate.getFullYear()    + "년 " 
                    + (lastDate.getMonth() + 1) + "월 " 
                    + lastDate.getDate()        + "일 "
                    + week[lastDate.getDay()]   + "요일";
		
		if(today == lastDay) return;
		
		lastDate = date;
		$("#chatting_content").append(`
				<div class="printToday">`+today+`</div>
				`)
		lastSender = null;
	};
	
    function date_info(sendDate){
        var date = new Date(sendDate); 
		printToday(date);
		let getHours = parseInt(date.getHours());
		let getMinutes = parseInt(date.getMinutes());
		var time = "";
		time =  (getHours >= 13 ? time+ "오후 " + (getHours-12)
				                : time+ "오전 " + getHours)
				 + "시 "
		         + getMinutes
		         + "분";
		
	    return time+":"
		+ parseInt(date.getFullYear())
        + parseInt((date.getMonth() + 1))
        + parseInt(date.getDate());
    };
    
    function parseDateScreen(date) {
		return date.split(":")[0]
	};
/*      function date_info(date){
        var date = new Date(); 
		if(date){
			date = new Date(date);
		}
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + date.getHours() + ":"
		         + date.getMinutes() + ":"
		         + date.getSeconds();
	    return time;
    } */
	// ------------------------------------------------ 날짜출력 기능 함수
	
	
    
    
	$(function() {
		setTimeout(() => {
			$("#exit_btn_button").fadeIn(1000);
			$("#create_btn_button").fadeOut(1000);
		}, 100);
	});
	
    var side_bar_btn = false;
    var side_box = $("#side_bar_row");
    var side_btn = $("#side_bar_btn");
    side_box.on("click",function(){
        if(!side_bar_btn){ side_open() }
        return false;
    })
    side_btn.on("click",function(){
        if(!side_bar_btn){ side_open() }
        else{
            side_box.css({"cursor":"pointer"})
                    .animate({"left":"-400"},130)
                    .animate({"left":"-280"},180)
                    .animate({"left":"-400"},100)
                    .animate({"left":"-360"},200)
                    .animate({"left":"-400"},100)
                    .animate({"left":"-390"},100)
                    .animate({"left":"-400"},100)
            side_btn.text("open");
            side_bar_btn = false;
        }
        return false;
    });

    function side_open(){
        side_box.css({"cursor":"auto"})
                .clearQueue()
                .animate({"left":"0"},400)
        side_btn.text("close");
        side_bar_btn = true;
    };
	




</script>	
</body>
</html>