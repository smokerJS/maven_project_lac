<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here<sitemesh:write property="title"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer-Basic.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Footer-Clean.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/simple-line-icons.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Login-Form-Clean.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Registration-Form-with-Photo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.print.min.css" media="print"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/fullcalendar.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/sweetalert/sweetalert2.css" />
<script src="${pageContext.request.contextPath}/sweetalert/sweetalert2.all.min.js"></script>
    <sitemesh:write property="head"/>
</head>
<body>
  <div class = "container">
    <div class = "header">
      <c:import url="/WEB-INF/jsp/decorator/topMenu.jsp"></c:import>
    </div>
    <div class = "content">
    <sitemesh:write property="body"/>
    </div>
    <div class = "footer">
      <c:import url="/WEB-INF/jsp/decorator/footer.jsp"></c:import>
    </div>
  </div>	
</body>
</html>