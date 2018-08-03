<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/forgetPsw.css"/>
<style type=text/css>
	.box .success {
		text-align: center;
		color: red;
		padding-top: 130px;
	}
</style>
</head>
<body>
<div class="box">
	<div class="success">
		${success},将在<span id="mes">5</span>秒后跳转到登录界面<br>
		<a href="${pageContext.request.contextPath }/login.jsp" >若浏览器无反应点击此处跳转</a>
	</div>			
</div>
</body>
<script type="text/javascript">
var i = 5; 
var intervalid; 
intervalid = setInterval("fun()", 1000); 
function fun() { 
	if (i == 0) { 
		window.location.href = "${pageContext.request.contextPath }/login.jsp"; 
		clearInterval(intervalid); 
	} 
	document.getElementById("mes").innerHTML = i; 
	i--; 
}
</script>
</html>