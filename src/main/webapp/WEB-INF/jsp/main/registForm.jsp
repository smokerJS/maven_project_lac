<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main class="page landing-page"></main>
	<div class="register-photo" style="margin-top: 80px;">
		<div class="form-container">
			<div class="image-holder"></div>
			<form method="post" id="regist"  onsubmit="return check()" action="registUser.do">
				<h2 class="text-center">
					<strong>새로운 계정을</strong>추가하세요.
				</h2>
				<div class="form-group">
					<input class="form-control" type="email" name="email"
						placeholder="Email">
				</div>
<!-- 				<div class="form-group">
					<button id="emailChk" value="0" class="btn btn-primary btn-block" type="button">이메일 중복확인</button>
				</div> -->
				<div class="form-group">
					<input class="form-control" type="text" name="nickname"
						placeholder="nickname">
				</div>
				<div class="form-group">
					<input class="form-control" type="password" name="password"
						placeholder="Password">
				</div>
				<div class="form-group">
					<input class="form-control" type="password" name="password-repeat"
						placeholder="Password (repeat)">
				</div>
				<div class="form-group">
					<button class="btn btn-primary btn-block" type="submit">회원 가입</button>
				</div>
				<a href="#" class="already">이미 계정이 있으신가요? 로그인하기</a>
			</form>
		</div>
	</div>

<script>
/* 	$("#emailChk").on("click",function(){
		console.log("클릭");
		if($("input[name=email]").val().length <1){
			swal("이메일을 입력해주세요!");
			return;
		}
	 	$.ajax({
			url:"/maven_project_lac/main/emailCheck.json",
			data:$("input[name=email]").val(),
			dataType:"json",
			success:(data)=>{
				console.log(data);
				if(data=='2'){
					$("#emailChk").attr("value",'1');
					swal("사용가능한 메일입니다.");
				}else{
					swal("사용불가능한 메일입니다.");
				}
			}
		})
		
	}); */
	function check() {
		var regExp1 = /^[a-zA-Z0-9]{4,12}$/;
		//id와 비밀번호의 유효성 검사
		var regExp2 = /[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}/i;
		//e-mail의 유효성 검사
		var regname = /^[가-힝]{2,}$/;
		//이름의 유효성 검사

		// 아이디가 null인지 체크 
		if ($("input[name=email]").val() == "") {
			swal("이메일은  필수 입력값입니다.");
			$("input[name=email]").focus();
			return false;
		}
		if($("#emailChk").attr("value")=="0"){
			swal("이메일 중복체크를 해주세요.");
			return false;
		}
		// 비밀번호 null인지 체크 
		if ($("input[name=password]").val() == "") {
			swal("비밀번호를 입력해주세요.");
			$("input[name=password]").focus();
			return false;
		}
		;
		// 비밀번호 일치 하는지 체크 
		if ($("input[name=password]").val() != $("input[name=password-repeat]").val()) {
			swal("비밀번호가 일치하지않습니다. 다시 확인해주세요.");
			$("input[name=password]").focus();
			return false;
		}

		// 이름 입력체크 
		if ($("input[name=nickname]").val() == "") {
			swal("별명을 입력해주세요.");
			$("#joinName").focus();
			return false;
		};
		
		swal("가입이 완료되었습니다.로그인해주세요!");

	};
</script>
</body>
</html>