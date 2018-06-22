<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>

	<main class="page landing-page">
	<section class="clean-block clean-hero"
		style="background-image: url(/maven_project_lac/src/main/webapp/resources/assets/img/tech/image4.jpg); color: rgba(9, 162, 255, 0.85);">
		<div class="float-right text col-md-6"
			style="margin: 0; margin-right: 0px; margin-left: -427px;">
			<h2>Learning And Code</h2>
			<p>러닝 앤 코드</p>
			<button class="btn btn-outline-light btn-lg" type="button">Learn
				More</button>
		</div>
		<div class="float-right text col-md-6 login-clean"
			style="margin-right: -383px;">
			<form method="post" action="login.do">
				<h2 class="sr-only">Login Form</h2>
				<div class="illustration">
					<i class="icon ion-ios-navigate"></i>
				</div>
				<div class="form-group">
					<input type="email" name="email" placeholder="Email"
						class="form-control" />
				</div>
				<div class="form-group">
					<input type="password" name="password" placeholder="Password"
						class="form-control" />
				</div>
				<div class="form-group">
					<button class="btn btn-primary btn-block" type="submit">로그인</button>
				</div>
			</form>
		</div>
	</section>
	</main>
<script>
$(()=>{if('${errMsg}'){
	switch ('${errMsg}') {
	case "001": swal('아이디를 확인해주세요'); break;
	case "002":swal('탈퇴된 회원입니다'); break;
	case "003": swal('비밀번호를 확인해주세요'); break;
	}
}});
</script>
</body>
</html>