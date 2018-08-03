<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Admin Account</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />    
    
    <link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=basePath %>css/bootstrap-responsive.min.css" rel="stylesheet" />
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
    <link href="<%=basePath %>css/font-awesome.css" rel="stylesheet" />
    
    <link href="<%=basePath %>css/adminia.css" rel="stylesheet" /> 
    <link href="<%=basePath %>css/adminia-responsive.css" rel="stylesheet" /> 
    
    
    <link href="<%=basePath %>css/pages/plans.css" rel="stylesheet" /> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	
<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 				
			</a>
			
			<a class="brand" href="#">Adminia Admin</a>
			
			<div class="nav-collapse">
			
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					
					<li class="dropdown">
						
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							${admins.adminname} <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							
							<li>
								<a href="${pageContext.request.contextPath}/admin/changepassword.jsp"><i class="icon-lock"></i>修改密码</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="${pageContext.request.contextPath}/logout"><i class="icon-off"></i> 注销</a>
							</li>
						</ul>
					</li>
				</ul>
				
			</div> <!-- /nav-collapse -->
			
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->




<div id="content">
	
	<div class="container">
		
		<div class="row">
			
			<div class="span3">
				
				<div class="account-container">
				
					<div class="account-avatar">
						<img src="${pageContext.request.contextPath}/resource/images/headshot.png" alt="" class="thumbnail" />
					</div> <!-- /account-avatar -->
				
					<div class="account-details">
					
						<span class="account-name">${admins.adminname}</span>
						
						<span class="account-role"><c:choose><c:when test="${admins.adminflag == 1}">普通管理员</c:when><c:otherwise>超级管理员</c:otherwise></c:choose></span>
						
						<span class="account-actions">
						</span>
					
					</div> <!-- /account-details -->
				
				</div> <!-- /account-container -->
				
				<hr />
				
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					
					<li><a
							href="${pageContext.request.contextPath}/selectUserByExample"> <i
								class="icon-home"></i> 用户管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/selectQuestion?toid=1">
								<i class="icon-th-list"></i> 试题库管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/admin/questionType.jsp">
								<i class="icon-th-large"></i> 目录管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/logout">
								<i class="icon-signal"></i> 注销
						</a></li>
					
					
					
				</ul>	
				
				
				
				<hr />
				
				<div class="sidebar-extra">
					<p> </p>
				</div> <!-- .sidebar-extra -->
				
				<br />
		
			</div> <!-- /span3 -->
			
			
			
			<div class="span9">
				
				<h1 class="page-title">
					<i class="icon-th-large"></i>
					Admin Account					
				</h1>
				
				
				<div class="row">
					
					<div class="span9">
				
						<div class="widget">
							
							<div class="widget-header">
								<h3>Change Password</h3>
							</div> <!-- /widget-header -->
									
							<div class="widget-content">
								
								
								
								<div class="tabbable">
								<ul class="nav nav-tabs">
										<li class="active"><a
											href="#1" data-toggle="tab">修改密码</a></li>
										<li ><a
											href="#2" data-toggle="tab">注册管理员</a></li>
									</ul>
						
						
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								<form class="form-horizontal" action="${pageContext.request.contextPath}/changeAdminPassword" method="post">
									<fieldset>
									<input type="hidden" name="adminid" value="${admins.adminid}" />
										<div class="control-group">
											<label class="control-label">帐号：</label>
											<div class="controls">
												<input type="text" class="input-medium disabled" value="${admins.adminname}" disabled="" />
											</div> <!-- /controls -->
										</div> <!-- /control-group -->
										
										<div class="control-group">											
											<label class="control-label" for="password3">原密码</label>
											<div class="controls">
												<input type="password" class="input-medium" name="oldPassword" value=""  required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->

										<div class="control-group">											
											<label class="control-label" for="password1">新密码</label>
											<div class="controls">
												<input type="password" class="input-medium" name="password" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
											</div> <!-- /controls -->				
										</div> <!-- /control-group -->
										
										
										<div class="control-group">											
											<label class="control-label" for="password2">确认密码</label>
											<div class="controls">
												<input type="password" class="input-medium" name="comfirePassword" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
											</div> 			
										</div> 
										
											<br />
										
											
										<div class="form-actions">
											<button type="submit" class="btn btn-primary">保存</button> 
											<button class="btn">取消</button>
										</div> <!-- /form-actions -->
									</fieldset>
								</form>
								
							</div>

						</div>

							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->	
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 2018 答题系统.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"></script>


<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

  </body>
</html>
