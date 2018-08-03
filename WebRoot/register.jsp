<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/register.css"/>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath }/js/login_register.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div class="container">
		<div class="banner">
			<div class="bg bg1 "></div>
			<div class="bg bg2"></div>
		</div>
		<div class="login">
			<div class="topic">
				注册
			</div>
			<div class="error">
				${error}
			</div>
			<form action="${pageContext.request.contextPath }/register" method="post">
				<div class="form">
					<div class="input">
						<label for="">用户名</label>
						<input type="text" id="user" placeholder="用户名" name="username" required />
					</div>
					<div class="input">
						<label for="">密&nbsp;&nbsp;&nbsp;码</label>
						<input type="password" name="password" placeholder="密码" required />
					</div>
					
					<div class="input">
						<label for="">邮&nbsp;&nbsp;&nbsp;箱</label>
						<input type="email" name="email" placeholder="邮箱" required />
					</div>
					<div class="input">
						<input type="radio" name="sex" value="男" checked/>男
						<input type="radio" name="sex" value="女" />女
					</div>
					<div class="input">
						<input type="submit" name="submit" value="注册" />
					</div>
					<div class="bottom">
						<ul>
							<li>我已注册，现在就 &nbsp;<a href="${pageContext.request.contextPath }/login.jsp">登录</a></li>						
						</ul>
					</div>
				</div>
			</form>				
		</div>
	</div>
</body>
</html>