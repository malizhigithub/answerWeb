<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/forgetPsw.css"/>

  </head>
  
 <body>
	<div class="box">
		<div class="text1">
			找回密码
		</div>
		<div class="text2">
			请输入你的注册邮箱，获取密码。
		</div>
		<div class="email_error">
			<c:if test="${not empty error}">
				该邮箱未注册，请前往
			</c:if>
			<c:if test="${not empty success}">密码已发送到邮箱，请
				<a href="${pageContext.request.contextPath }/login.jsp">登录</a>。
			</c:if>
		</div>
		<div class="form">
			<form action="${pageContext.request.contextPath }/findpassword" method="post">
				<div class="input">
					<input  type="email" name="email" placeholder="邮箱" required />
				</div>
				<div class="input">
					<input type="submit" name="submit" value="提交" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>
