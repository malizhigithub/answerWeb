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
<title>答题系统</title>

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

<style type="text/css">
table{
 table-layout:fixed;
}
.table tbody tr td{
   overflow: hidden; 
   text-overflow:ellipsis; 
   white-space: nowrap; 
 }
</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


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

						<li ><a
							href="${pageContext.request.contextPath}/selectUserByExample"> <i
								class="icon-home"></i> 用户管理
						</a></li>

						<li ><a
							href="${pageContext.request.contextPath}/selectQuestion?toid=1">
								<i class="icon-th-list"></i> 试题库管理
						</a></li>

						<li class="active"><a href="${pageContext.request.contextPath}/admin/questionType.jsp">
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
								<h3>目录菜单管理</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">

								<div class="tabbable">
									<ul class="nav nav-tabs">
										<li class="<c:if test="${toid == 1 || toid == null }">active</c:if>"><a
											href="#1" data-toggle="tab">一级菜单</a></li>
										<li class="<c:if test="${toid == 2 }">active</c:if>"><a
											href="#2" data-toggle="tab">二级菜单</a></li>
										<li class="<c:if test="${toid == 3 }">active</c:if>"><a
											href="#3" data-toggle="tab">三级菜单</a></li>
									</ul>

									<div class="tab-content" id="all">
										<div class="tab-pane firstType <c:if test="${toid == 1 || toid == null }">active</c:if>" 
											id="1">
											<form id="firstTypeExampleForm" class="form-horizontal form-inline"
												>
											<div class="form-group controls-row">
													<label>目录编号：</label> <input id="firstTypeno"
														type="text" name="typeno" v-bind:value="firstTypeno"
														class="input-mini" style="height:25px" /> <label>目录名称：</label>
													<select id="firstTypename" class="input-small" name="typename" >
														<option  selected></option>
														
														<option  v-for="(defaultFirstType,index) in defaultFirstTypeList" v-bind:value="defaultFirstType.typename">{{defaultFirstType.typename}}</option>
													</select>
												<button type="button" class="btn btn-info" v-on:click="toPagination(1)">查询</button>
												<button type="button" class="btn btn-success"  onclick="reset_firstTypeExampleForm()">重置</button>
												
												<c:if test="${admins.adminflag == 2 }">
													<a class="btn " style="float:right;" href="${pageContext.request.contextPath }/admin/addQuestionFirstType.jsp">添加一级菜单</a>
												</c:if>
												
									</div>
									<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>目录编号</th>
									<th>目录名称</th>
									<c:if test="${admins.adminflag == 2 }">
										<th style="text-align: center;">操作</th>
									</c:if>
								</tr>
							</thead>
							
							<tbody >
							    <tr v-for="(questionFirstType,index) in questionFirstTypeList">
									<td>{{questionFirstType.typeno	}}</td>
									<td>{{questionFirstType.typename}}</td>
									
									<c:if test="${admins.adminflag == 2 }">
									<td class="action-td">
										  <div>
											<a class="btn btn-default btn-small" v-bind:href="updateOne+questionFirstType.typeno+updateTwo+firstTypePageInfo.pageNum">更新</a>
											<a class="btn btn-danger btn-small" v-bind:href="deleteOne+questionFirstType.typeno+deleteTwo+firstTypePageInfo.pageNum">删除</a>
										  </div>
									</td>
									</c:if>
									
								</tr>
										</tbody>
									</table>
					
					</form> 
					<!-- 分页信息 --> 
						<div class="pagination pagination-centered">
					<ul>
					
						<li><a href="#" v-on:click="toPagination(1)">首页</a></li>
						<li v-if="firstTypePageInfo.hasPreviousPage"><a href="#" v-on:click="toPagination(firstTypePageInfo.prePage)">&laquo;</a></li>
						<li :class="{'active':firstTypePageInfo.pageNum==nav}" v-for="(nav,index) in navigatepageNums"><a href="#"  v-on:click="toPagination(nav)">{{nav}}</a></li>
						<li v-if="firstTypePageInfo.hasNextPage"><a href="#" v-on:click="toPagination(firstTypePageInfo.nextPage)">&raquo;</a></li>
						<li><a href="#" v-on:click="toPagination(firstTypePageInfo.pages)">末页</a></li>
					</ul>
				</div>		
				
							</div> <!-- /widget -->
							
								<div class="tab-pane secondType <c:if test="${toid == 2 }">active</c:if>" id="2">
									<!-- 下面是表单提交 -->
								<form id="secondTypeExampleForm" class="form-horizontal form-inline"
												>
											<div class="form-group controls-row">
													<label>目录编号：</label> <input id="secondTypeno"
														type="text" name="typeno" v-bind:value="secondTypeno"
														class="input-mini" style="height:25px" /> <label>目录名称：</label>
													<select id="secondTypename" class="input-small" name="typename" >
														<option  selected></option>
														
														<option  v-for="(defaultSecondType,index) in defaultSecondTypeList" v-bind:value="defaultSecondType.typename">{{defaultSecondType.typename}}</option>
													</select>
													<label>上级目录：</label>
													<select id="secondBelongTypeno" class="input-small" name="belongtypeno" >
														<option  selected></option>
														
														<option  v-for="(defaultFirstType,index) in defaultFirstTypeList" v-bind:value="defaultFirstType.typeno">{{defaultFirstType.typename}}</option>
													</select>
												<button type="button" class="btn btn-info" v-on:click="toPagination(1)">查询</button>
												<button type="button" class="btn btn-success"  onclick="reset_secondTypeExampleForm()">重置</button>
												<a class="btn " style="float:right;" href="${pageContext.request.contextPath}/addQuestionSecondTypeFirst">添加二级菜单</a>
									</div>
									<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>目录编号</th>
									<th>目录名称</th>
									<th>上级目录</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							
							<tbody >
							    <tr v-for="(questionSecondType,index) in questionSecondTypeList">
									<td>{{questionSecondType.typeno	}}</td>
									<td>{{questionSecondType.typename}}</td>
									<td v-if="questionSecondType.belongtypeno == defaultFirstType.typeno" v-for="(defaultFirstType,index) in defaultFirstTypeList">{{defaultFirstType.typename}}</td>
									
									<td class="action-td">
										  <div>
											<a class="btn btn-default btn-small" v-bind:href="updateOne+questionSecondType.typeno+updateTwo+secondTypePageInfo.pageNum">更新</a>
											<a class="btn btn-danger btn-small" v-bind:href="deleteOne+questionSecondType.typeno+deleteTwo+secondTypePageInfo.pageNum">删除</a>
										  </div>
									</td>
								</tr>
										</tbody>
									</table>
					
					</form> 
					<!-- 分页信息  -->
						<div class="pagination pagination-centered">
					<ul>
					
						<li><a href="#" v-on:click="toPagination(1)">首页</a></li>
						<li v-if="secondTypePageInfo.hasPreviousPage"><a href="#" v-on:click="toPagination(secondTypePageInfo.prePage)">&laquo;</a></li>
						<li :class="{'active':secondTypePageInfo.pageNum==nav}" v-for="(nav,index) in navigatepageNums"><a href="#"  v-on:click="toPagination(nav)">{{nav}}</a></li>
						<li v-if="secondTypePageInfo.hasNextPage"><a href="#" v-on:click="toPagination(secondTypePageInfo.nextPage)">&raquo;</a></li>
						<li><a href="#" v-on:click="toPagination(secondTypePageInfo.pages)">末页</a></li>
					</ul>
				</div>	
								
								
								
								
								</div>
								
								
								<!--  ****************************************tab3******************************-->
								<div class="tab-pane threeType <c:if test="${toid == 3}">active</c:if>" id="3">
									<!-- 下面是表单提交 -->
									<form id="threeTypeExampleForm" class="form-horizontal form-inline"
												>
											<div class="form-group controls-row">
													<label>目录编号：</label> <input id="threeTypeno"
														type="text" name="typeno" v-bind:value="threeTypeno"
														class="input-mini" style="height:25px" /> <label>目录名称：</label>
													<select id="threeTypename" class="input-small" name="typename" >
														<option  selected></option>
														
														<option  v-for="(defaultThreeType,index) in defaultThreeTypeList" v-bind:value="defaultThreeType.typename">{{defaultThreeType.typename}}</option>
													</select>
													<label>上级目录：</label>
													<select id="threeBelongTypeno" class="input-small" name="belongtypeno" >
														<option  selected></option>
														
														<option  v-for="(defaultSecondType,index) in defaultSecondTypeList" v-bind:value="defaultSecondType.typeno">{{defaultSecondType.typename}}</option>
													</select>
												<button type="button" class="btn btn-info" v-on:click="toPagination(1)">查询</button>
												<button type="button" class="btn btn-success"  onclick="reset_threeTypeExampleForm()">重置</button>
												<a class="btn " style="float:right;" href="${pageContext.request.contextPath }/addQuestionThreeTypeFirst">添加三级菜单</a>
									</div>
									<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>目录编号</th>
									<th>目录名称</th>
									<th>上级目录</th>
									<th style="text-align: center;">操作</th>
								</tr>
							</thead>
							
							<tbody >
							    <tr v-for="(questionThreeType,index) in questionThreeTypeList">
									<td>{{questionThreeType.typeno	}}</td>
									<td>{{questionThreeType.typename}}</td>
									<td v-if="questionThreeType.belongtypeno == defaultSecondType.typeno" v-for="(defaultSecondType,index) in defaultSecondTypeList">{{defaultSecondType.typename}}</td>
									
									<td class="action-td">
										  <div>
											<a class="btn btn-default btn-small" v-bind:href="updateOne+questionThreeType.typeno+updateTwo+threeTypePageInfo.pageNum">更新</a>
											<a class="btn btn-danger btn-small" v-bind:href="deleteOne+questionThreeType.typeno+deleteTwo+threeTypePageInfo.pageNum">删除</a>
										  </div>
									</td>
								</tr>
										</tbody>
									</table>
					
					</form> 
					<!-- 分页信息  -->
						<div class="pagination pagination-centered">
					<ul>
					
						<li><a href="#" v-on:click="toPagination(1)">首页</a></li>
						<li v-if="threeTypePageInfo.hasPreviousPage"><a href="#" v-on:click="toPagination(threeTypePageInfo.prePage)">&laquo;</a></li>
						<li :class="{'active':threeTypePageInfo.pageNum==nav}" v-for="(nav,index) in navigatepageNums"><a href="#"  v-on:click="toPagination(nav)">{{nav}}</a></li>
						<li v-if="threeTypePageInfo.hasNextPage"><a href="#" v-on:click="toPagination(threeTypePageInfo.nextPage)">&raquo;</a></li>
						<li><a href="#" v-on:click="toPagination(threeTypePageInfo.pages)">末页</a></li>
					</ul>
				</div>	
								
								</div>
								
								
								
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


    
<script type="text/javascript" src="<%=basePath%>js/vue.js"></script>


<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>


<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/excanvas.min.js"></script>
	<script src="<%=basePath%>js/jquery.flot.js"></script>
	<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
	<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
	<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/charts/bar.js"></script>
	<script src="<%=basePath%>js/excanvas.min.js"></script>
	<script src="<%=basePath%>js/jquery.flot.js"></script>
	<script src="<%=basePath%>js/jquery.flot.pie.js"></script>
	<script src="<%=basePath%>js/jquery.flot.orderBars.js"></script>
	<script src="<%=basePath%>js/jquery.flot.resize.js"></script>
	<script src="<%=basePath%>js/bootstrap.js"></script>
	<script src="<%=basePath%>js/charts/bar.js"></script>
	
	<script type="text/javascript">
	
		var questionFirstType = new Vue({
			el:'.firstType',
			data:{
				defaultFirstTypeList:[],
				questionFirstTypeList:[],
				navigatepageNums:[],
				firstTypePageInfo:null,
				firstTypeno:null,
				firstTypename:null,
				deleteOne:"${pageContext.request.contextPath }/deleteQuestionFirstType?typeno=",
				deleteTwo:"&pn=",
				updateOne:"${pageContext.request.contextPath }/updateQuestionFirstTypeFirst?typeno=",
				updateTwo:"&pn="
			},
			mounted(){
				this.load();
			},
			methods:{
			
				load:function(){
					$.ajax({
						url:"${pageContext.request.contextPath}/questionFirstType",
				 		type:"POST",
				 		data:"pn=${FirstTypepn}",
						success:function(map){
							if(map == "IsAjax"){
								window.location.href="${pageContext.request.contextPath }/admin/login.jsp";
							}
							questionFirstType.questionFirstTypeList = map.pageInfo.list;
							questionFirstType.firstTypePageInfo = map.pageInfo;
							questionFirstType.navigatepageNums = map.pageInfo.navigatepageNums;
							questionFirstType.firstTypeno = map.questionType.typeno;
							questionFirstType.firstTypename = map.questionType.typename;
							questionFirstType.defaultFirstTypeList = map.defaultFirstType;
						}
					});
				},
			
			toPagination:function(pn){
				$.ajax({
					url:"${pageContext.request.contextPath}/questionFirstType?pn="+pn,
					type:"POST",
					data:$("#firstTypeExampleForm").serialize(),
					success:function(map){
						questionFirstType.questionFirstTypeList = map.pageInfo.list;
						questionFirstType.firstTypePageInfo = map.pageInfo;
						questionFirstType.navigatepageNums = map.pageInfo.navigatepageNums;
						questionFirstType.firstTypeno = map.questionType.typeno;
						questionFirstType.firstTypename = map.questionType.typename;
						questionFirstType.defaultFirstTypeList = map.defaultFirstType;
					}
				});
				
				
			}
				
			}
			
			
		});
		
		
		/* 重置一级菜单多条件输入框内容*/
		function reset_firstTypeExampleForm(){
			$("#firstTypeno").val("");
			$("#firstTypename option:first").attr("selected","selected"); 
		}
	
		/**************************************二级菜单VUE**********************************/
		var questionSecondType = new Vue({
			el:'.secondType',
			data:{
				defaultSecondTypeList:[],
				questionSecondTypeList:[],
				navigatepageNums:[],
				defaultFirstTypeList:[],
				secondTypePageInfo:null,
				secondTypeno:null,
				secondTypename:null,
				deleteOne:"${pageContext.request.contextPath }/deleteQuestionSecondType?typeno=",
				deleteTwo:"&pn=",
				updateOne:"${pageContext.request.contextPath }/updateQuestionSecondTypeFirst?typeno=",
				updateTwo:"&pn="
			},
			mounted(){
				this.load();
			},
			methods:{
			
				load:function(){	
					$.ajax({
						url:"${pageContext.request.contextPath}/questionSecondType",
				 		type:"POST",
				 		data:"pn=${SecondTypepn}",
						success:function(map){
							questionSecondType.questionSecondTypeList = map.pageInfo.list;
							questionSecondType.secondTypePageInfo = map.pageInfo;
							questionSecondType.navigatepageNums = map.pageInfo.navigatepageNums;
							questionSecondType.secondTypeno = map.questionType.typeno;
							questionSecondType.secondTypename = map.questionType.typename;
							questionSecondType.defaultSecondTypeList = map.defaultSecondType;
							questionSecondType.defaultFirstTypeList = map.defaultFirstTypeList;
							
						}
					});
				},
			
			toPagination:function(pn){
				$.ajax({
					url:"${pageContext.request.contextPath}/questionSecondType?pn="+pn,
					type:"POST",
					data:$("#secondTypeExampleForm").serialize(),
					success:function(map){
						questionSecondType.questionSecondTypeList = map.pageInfo.list;
						questionSecondType.secondTypePageInfo = map.pageInfo;
						questionSecondType.navigatepageNums = map.pageInfo.navigatepageNums;
						questionSecondType.secondTypeno = map.questionType.typeno;
						questionSecondType.secondTypename = map.questionType.typename;
						questionSecondType.defaultSecondTypeList = map.defaultSecondType;
						questionSecondType.defaultFirstTypeList = map.defaultFirstTypeList;
					}
				});
				
				
			}
				
			}
			
		});
		
		/* 重置二级菜单多条件输入框内容*/
		function reset_secondTypeExampleForm(){
			$("#secondTypeno").val("");
			$("#secondTypename option:first").attr("selected","selected"); 
			$("#secondBelongTypeno option:first").attr("selected","selected"); 
		}
	
	/*  ---------------------------------------------三级菜单VUE---------------------------------------                */
		var questionThreeType = new Vue({
			el:'.threeType',
			data:{
				defaultThreeTypeList:[],
				questionThreeTypeList:[],
				navigatepageNums:[],
				defaultSecondTypeList:[],
				threeTypePageInfo:null,
				threeTypeno:null,
				threeTypename:null,
				deleteOne:"${pageContext.request.contextPath }/deleteQuestionThreeType?typeno=",
				deleteTwo:"&pn=",
				updateOne:"${pageContext.request.contextPath }/updateQuestionThreeTypeFirst?typeno=",
				updateTwo:"&pn="
			},
			mounted(){
				this.load();
			},
			methods:{
			
				load:function(){	
					$.ajax({
						url:"${pageContext.request.contextPath}/questionThreeType",
				 		type:"POST",
				 		data:"pn=${ThreeTypepn}",
						success:function(map){
							questionThreeType.questionThreeTypeList = map.pageInfo.list;
							questionThreeType.threeTypePageInfo = map.pageInfo;
							questionThreeType.navigatepageNums = map.pageInfo.navigatepageNums;
							questionThreeType.threeTypeno = map.questionType.typeno;
							questionThreeType.threeTypename = map.questionType.typename;
							questionThreeType.defaultThreeTypeList = map.defaultThreeType;
							questionThreeType.defaultSecondTypeList = map.defaultSecondTypeList;
							
						}
					});
				},
			
			toPagination:function(pn){
				$.ajax({
					url:"${pageContext.request.contextPath}/questionThreeType?pn="+pn,
					type:"POST",
					data:$("#threeTypeExampleForm").serialize(),
					success:function(map){
						questionThreeType.questionThreeTypeList = map.pageInfo.list;
						questionThreeType.threeTypePageInfo = map.pageInfo;
						questionThreeType.navigatepageNums = map.pageInfo.navigatepageNums;
						questionThreeType.threeTypeno = map.questionType.typeno;
						questionThreeType.threeTypename = map.questionType.typename;
						questionThreeType.defaultThreeTypeList = map.defaultThreeType;
						questionThreeType.defaultSecondTypeList = map.defaultSecondTypeList;
					}
				});
				
				
			}
				
			}
			
		});
		
		/* 重置三级菜单多条件输入框内容*/
		function reset_threeTypeExampleForm(){
			$("#threeTypeno").val("");
			$("#threeTypename option:first").attr("selected","selected"); 
			$("#threeBelongTypeno option:first").attr("selected","selected"); 
		}
		
	</script>
  </body>
</html>
