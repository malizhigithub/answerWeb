<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8" />
<title>User Account - Bootstrap Admin</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />

<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>css/bootstrap-responsive.min.css"
	rel="stylesheet" />


<link href="<%=basePath%>css/font-awesome.css" rel="stylesheet" />

<link href="<%=basePath%>css/adminia.css" rel="stylesheet" />
<link href="<%=basePath%>css/adminia-responsive.css" rel="stylesheet" />


<link href="<%=basePath%>css/pages/plans.css" rel="stylesheet" />


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">
	
</script>
</head>


<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">答题系统后台管理</a>

				<div class="nav-collapse">

					<ul class="nav pull-right">
						<li><a href="#"></a>
						</li>

						<li class="divider-vertical"></li>

						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle " href="#"> ${admins.adminname} <b
								class="caret"></b>
						</a>

							<ul class="dropdown-menu">

								<li><a
									href="${pageContext.request.contextPath}/admin/changepassword.jsp"><i
										class="icon-lock"></i> 修改密码</a></li>

								<li class="divider"></li>

								<li><a href="${pageContext.request.contextPath}/logout"><i class="icon-off"></i> 注销</a></li>
							</ul></li>
					</ul>

				</div>
				<!-- /nav-collapse -->

			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->




	<div id="content">

		<div class="container">

			<div class="row">

				<div class="span3">

					<div class="account-container">

						<div class="account-avatar">
							<img src="${pageContext.request.contextPath}/resource/images/headshot.png" alt="" class="thumbnail" />
						</div>
						<!-- /account-avatar -->

						<div class="account-details">

							<span class="account-name">${admins.adminname}</span> <span
								class="account-role"><c:choose>
									<c:when test="${admins.adminflag==1}">普通管理员</c:when>
									<c:otherwise>超级管理员</c:otherwise>
								</c:choose></span> <span class="account-actions">
							</span>

						</div>
						<!-- /account-details -->

					</div>
					<!-- /account-container -->

					<hr />

					<ul id="main-nav" class="nav nav-tabs nav-stacked">

						<li class="active"><a
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

					<br />

				</div>
				<!-- /span3 -->



				<div class="span9">



					<div class="row">

						<div class="span9">



							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>用户管理</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">

								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li class="active"><a
											href="#1" data-toggle="tab">用户信息</a></li>
										<!-- <li <c:if test="toid==1">class="active"</c:if>><a
											href="#2" data-toggle="tab">添加用户</a></li> -->
									</ul>

									<div class="tab-content" id="all">
										<div class="tab-pane active"
											id="1">
											<form id="userform" class="form-horizontal form-inline"
												method="post" action="selectUserByExample">
											<div class="form-group controls-row">
													<label>编号：</label> <input id="user_form_userno"
														type="text" name="userno" value="${user.userno }"
														class="input-mini" style="height:25px" /> <label>姓名：</label>
													<input id="user_form_username" type="text" name="username"
														value="${user.username }" class="input-mini"
														style="height:25px" /> <label>用户邮箱：</label> <input
														id="user_form_email" type="text" name="email"
														value="${user.email }" class="input-medium" style="height:25px" />
													<label>邮箱状态：</label> 
												<select id="user_form_status"
														class="input-small " name="status">
														<option <c:if test="${user.status==NULL}">selected</c:if>></option>
												        <option value="1" <c:if test="${user.status == 1}">selected</c:if>>已验证</option>
												        <option value="0" <c:if test="${user.status == 0}">selected</c:if>>未验证</option>
												</select>
														<label>用户性别：</label> 
												<select
														id="user_form_sex" class="input-mini disabled"
														name="sex">
														<option <c:if test="${user.sex==null}">selected</c:if>></option>
												    
												        <option value="男" <c:if test="${user.sex == '男'}">selected</c:if>>男</option>
												        <option value="女" <c:if test="${user.sex == '女'}">selected</c:if>>女</option>
												    
												</select> 
												
												<button type="submit" class="btn btn-info">查询</button>
												<button type="button" class="btn btn-success" onclick="reset_emp_form()">重置</button>
									</div>
									<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>编号</th>
									<th>姓名</th>
									<th>密码</th>
									<th>邮箱</th>
									<th>邮箱状态</th>
									<th>性别</th>
									<th style="width:100px">操作</th>
								</tr>
							</thead>
							
							<tbody>
							  <c:forEach items="${userListPageInfo.list}" var="user">
							    <tr>
									<td>${user.userno}</td>
									<td>${user.username}</td>
									<td>${user.password}</td>
									<td>${user.email}</td>
									<td><c:if test="${user.status == 1}">已验证</c:if>
									<c:if test="${user.status == 0}">未验证</c:if></td>
									<td>${user.sex}</td>
									<td class="action-td">
										  <div>
											<a class="btn btn-default btn-small" href="${pageContext.request.contextPath}/updateUserFirst?userno=${user.userno}&pn=${userListPageInfo.pageNum}">更新</a>
											<a class="btn btn-danger btn-small" href="${pageContext.request.contextPath}/deleteUser?ids=${user.userno}&pn=${userListPageInfo.pageNum}">删除</a>
										  </div>
										
										
									</td>
								</tr>
							  </c:forEach>
										</tbody>
									</table>
					
					</form>
					<!-- 分页信息 --> 
						<div class="pagination pagination-centered">
					<ul>
						<li><a href="#" onclick="form_pagination(1)">首页</a></li>
						<li><a href="#" onclick="form_pagination(${userListPageInfo.prePage})">&laquo;</a></li>
						<c:choose>
						<c:when test="${userListPageInfo.pages <=5}">
						<c:forEach begin="1" end="${userListPageInfo.pages }" varStatus="status">
										<li><a <c:if test="${userListPageInfo.pageNum == status.index  }">style="color:black"</c:if> href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${userListPageInfo.pageNum < 4 }">
									<c:forEach begin="1" end="5" varStatus="status">
										<li><a <c:if test="${userListPageInfo.pageNum == status.index  }">style="color:black"</c:if> href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${userListPageInfo.pageNum+2 >=userListPageInfo.total }">
											<c:forEach begin="${userListPageInfo.total-4 }" end="${userListPageInfo.total }" varStatus="status">
												<li><a <c:if test="${userListPageInfo.total == status.index  }">style="color:black"</c:if> href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach begin="${userListPageInfo.pageNum-2 }" end="${userListPageInfo.pageNum+2 }" varStatus="status">
												<li><a <c:if test="${userListPageInfo.pageNum == status.index  }">style="color:black"</c:if>href="#" onclick="form_pagination(${status.index})">${status.index }</a></li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
						</c:choose>
						
						<li><a href="#" 
						
							<c:if test="${userListPageInfo.hasNextPage}">onclick="form_pagination(${userListPageInfo.nextPage})"</c:if>
						<c:if test="${userListPageInfo.hasNextPage}">onclick="form_pagination(${userListPageInfo.pages})"</c:if>
						
						>&raquo;</a></li>
						<li><a href="#" onclick="form_pagination(${userListPageInfo.pages})">末页</a></li>
					</ul>
				</div>		
				
							</div> <!-- /widget -->
							
								<%-- <div class="tab-pane <c:if test="toid==1">active</c:if>" id="2">
									<form action="hireemp" class="form-horizontal" method="post" />
									<fieldset>
										<input type="hidden" name="resid" value=""/>
										
										
										
										
										
										
											
										<div class="form-actions">
											<button type="submit" class="btn btn-primary"  onclick="return validEmpty()">添加</button> 
											
										</div> <!-- /form-actions -->
									</fieldset>
									</form>
								</div> --%>
								
							</div>
						  
						  
						</div>	<!-- tabltable-->
								
							</div> <!-- /widget-content -->
							
						<!--   </div>  /widget -->
						
					</div> <!-- /span9 -->
					
				</div> <!-- /row -->
				
			</div> <!-- /span9 -->
			
			
		</div> <!-- /row -->
		
	</div> <!-- /container -->
	
</div> <!-- /content -->
					
	
<div id="footer">
	
	<div class="container">				
		<hr />
		<p>&copy; 2018  答题系统.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->


    


<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>


<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/excanvas.min.js"></script>
	<script src="<%=basePath%>js/jquery.flot.js"></script>
	<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
	<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
	<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/charts/bar.js"></script>
	<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	<script src="<%=basePath%>js/excanvas.min.js"></script>
	<script src="<%=basePath%>js/jquery.flot.js"></script>
	<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
	<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
	<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/charts/bar.js"></script>
	
	<script type="text/javascript">
		function form_pagination(pageNo){
	  		$("#userform").attr("action","${pageContext.request.contextPath}/selectUserByExample?pn="+pageNo+"&toid=2");
	  		$("#userform").submit();
		}
		/* 重置调动表单中多条件清空输入框内容 */
		function reset_form(){
			$("#empid").val("");
			$("#empName").val("");
			$("#deptName").val("");
			$("#jobName").val("");
		}
		function form_submitemp(pageNo){
	  		$("#empform").attr("action","${pageContext.request.contextPath}/queryallemp?pageNo="+pageNo+"&toid=0");
	  		$("#empform").submit();
		}
		/* 重置员工表单多条件输入框内容*/
		function reset_emp_form(){
			$("#user_form_userno").val("");
			$("#user_form_username").val("");
			$("#user_form_email").val("");
			$("#user_form_status option:first").attr("selected","selected"); 
			$("#user_form_sex option:first").attr("selected","selected"); 
		}
		
	</script>
  </body>
</html>
