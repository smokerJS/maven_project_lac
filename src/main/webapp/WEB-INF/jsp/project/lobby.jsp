<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home - Brand</title>
    <style>
    div{
    	border: none !important;
    }
    .room-title{
   	    width: 90%;
	    height: 90%;
	    position: absolute;
	    margin: 2%;
	    border: 0 solid transparent;
    }
    .room-titleTop{
    	width: 100%;
    	background-color: #3454d1;
    	height: 100px;
	    border: 0 solid transparent;
	    border-radius: .28571429rem .28571429rem 0 0;
	    position: absolute;
    }
    .room{
    	display: inline-block;
    	float:left;
  	   	margin: 25px;
    	background-color: white;
    	width: 25rem;
	    box-shadow: 0 1px 3px 0 #e9eef2, 0 0 0 2px #e9eef2;
        border-radius: .28571429rem;
    }
    .room:hover{
    	box-shadow: 0 1px 3px 0 #3454d1, 0 0 0 2px #3454d1;
    }
    .room-titleTop-title{
        margin-left: 19px;
    	color:white;
   	    padding: 1%;
    }
    .room-top{
        border-radius: .28571429rem .28571429rem 0 0!important;
   	    background-color: #5a27be;
	    color: #fff;
	    text-shadow: none;
    	width: 25rem;
    	height:70px;
   	    box-shadow: inset 0 0 0 0 rgba(34,36,38,.15);
   	    text-align: center;
    }
    .room-common{
    	height:100px;
    }
    .room-list{
    	height:90%;
    	align-content:center;
    	background-color: white;
    	margin-top:100px;
   	    overflow: auto;
        padding: 0 4%;
    }
    .room{
    	cursor: pointer;
    }
    span{
    	color:rgba(0,0,0,.68);
   	    margin: 0 0 10px 10px;
    }
    .projectImg{
    	width: 100%;
    	height: 100%;
    }
    .projectName{
		text-overflow:ellipsis;
		white-space:nowrap;
		word-wrap:normal;
		width:250px;
		overflow:hidden;
		display: inline-block;
    }
    .glyphicon-calendar{
		left: -4px;
	}
    </style>
</head>
<body>
	<div class="room-title">
		<div class="room-titleTop">
			<h2 id="room-titleTop-title"class="room-titleTop-title">${user.nickname} 의 프로젝트</h2>
		</div>
	    <div id="myProject" class="room-list">
	
	    </div>
	</div>
    
    
    
    
    
    
    
    
    
    <script>
	$(function() {
		setTimeout(() => {
			$("#exit_btn_button").fadeOut(1000);
			$("#create_btn_button").fadeIn(1000);
		}, 100);
	});
	$(refresh)
	
	function refresh() {
		let myProject = $("#myProject");
		loading()
		$.ajax({
			url:'${pageContext.request.contextPath}/project/refreshList.json',
			type:"POST",
			data: {"userNo":userNo}
		}).done(function (projectList) {
				myProject.html("")
				for(project of projectList){
					myProject.append(`
						<a href="${pageContext.request.contextPath}/project/`+project.projectNo+`/codingRoom.do">
					    <div class="room">
							<input type="hidden" value="`+project.projectNo+`"/>
							<div class="room-top"><img class="projectImg" src="${pageContext.request.contextPath}/`+project.projectPic+`"/></div>
						    <div class="room-common">
						    	<h2><span class="projectName" title="`+project.projectName+`">`+project.projectName+`</span></h2>
						    	<span>마스터 : </span><span class="master">`+project.maseterUserNickname+`</span><br>
						    	<span>참여자 수 : </span><span class="userCount">`+project.userCount+`</span>
						    </div>
						</div>
						</a>
					`)
				}
			})
	}
	

	
    </script>
</body>

</html>