<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8" />
<title>登录</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>css/bootstrap-responsive.min.css"
	rel="stylesheet" />

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet" />
<link href="<%=basePath%>css/font-awesome.css" rel="stylesheet" />

<link href="<%=basePath%>css/adminia.css" rel="stylesheet" />
<link href="<%=basePath%>css/adminia-responsive.css" rel="stylesheet" />

<link href="<%=basePath%>css/pages/login.css" rel="stylesheet" />

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="./">Adminia Admin</a>

				<div class="nav-collapse">

					<ul class="nav pull-right">

						<li class=""><a href="javascript:;"><i
								class="icon-chevron-left"></i> 回到主页</a></li>
					</ul>

				</div>
				<!-- /nav-collapse -->

			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->


	<div id="login-container">


		<div id="login-header">

			<h3>登录</h3>

		</div>
		<!-- /login-header -->
		<form action="<%=basePath%>adminLogin" method="post" />
		<div id="login-content" class="clearfix">
			<fieldset>
				<p style="color:red;font-size:16px;">${loginError}</p>
				<div class="control-group">
					<label class="control-label" for="adminname">用户名</label>
					<div class="controls">
						<input type="text" name="adminname" class="inputh"
							value="${admins.adminname}" id="adminname" style="height:25px" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password">密码</label>
					<div class="controls">
						<input type="password" name="password" class="inputh"
							value="${admins.password}" id="password" style="height:25px" />
					</div>
				</div>
				<s:actionmessage />
			</fieldset>

			<div id="remember-me" class="pull-left">
				<input type="checkbox" name="remember" id="remember" /> <label
					id="remember-label" for="remember">记住密码</label>
			</div>

			<div class="pull-right">
				<button type="submit" class="btn btn-warning btn-large">登 录
				</button>

			</div>


		</div>
		<!-- /login-content -->
		</form>


	</div>
	<!-- /login-wrapper -->



	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>


	<script src="<%=basePath%>js/bootstrap.js"></script>

</body>
</html>
