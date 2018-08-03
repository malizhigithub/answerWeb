<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <title>添加二级菜单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/adminia.css" rel="stylesheet" /> 
    <link href="${pageContext.request.contextPath}/css/adminia-responsive.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/pages/plans.css" rel="stylesheet" />
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
			<a class="brand" href="./">添加三级菜单</a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li class="dropdown">
						<a data-toggle="dropdown" class="dropdown-toggle " href="#">
							${admins.adminname} <b class="caret"></b>							
						</a>
						
						<ul class="dropdown-menu">
							
							<li>
								<a href="${pageContext.request.contextPath}/admin/changepassword.jsp"><i class="icon-lock"></i> 修改密码</a>
							</li>
							
							<li class="divider"></li>
							
							<li>
								<a href="${pageContext.request.contextPath}/logout"><i class="icon-off"></i> 注销</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div id="content">
	<div class="container">
		<div class="row">
			<div class="span3">
				<div class="account-container">
					<div class="account-avatar">
						<img src="${pageContext.request.contextPath}/resource/images/headshot.png" alt="" class="thumbnail" />
					</div>
					<div class="account-details">
						<span class="account-name">${admins.adminname}</span>
						
						<span class="account-role"><c:choose><c:when test="${admins.adminflag == 1}">普通管理员</c:when><c:otherwise>超级管理员</c:otherwise></c:choose></span>
						
						<span class="account-actions">
						</span>
					</div>
				</div>
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
			</div>

			<div class="span9">
				<div class="row">
					<div class="span9">
						<div class="widget">
							<div class="widget-header">
								<h3>添加三级菜单</h3>
							</div>
							<div class="widget-content">
								<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								
								<!-- 下面是表单提交 action="${pageContext.request.contextPath}/addFirstQuestionType?pn=${pn}" -->
								
								<form id="edit-profile" class="form-horizontal" action="${pageContext.request.contextPath}/addQuestionThreeTypeSecond" method="post" enctype="multipart/form-data" />
									<fieldset>
									
										<div class="control-group">											
											<label class="control-label">目录名称：</label>
											<div class="controls">
												<input type="text" class="input-medium " id="typename" name="typename" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')"/>
											</div>
										</div>
										
										<div class="control-group">											
											<label class="control-label">上级目录：</label>
											<div class="controls">
												<select id="belongtype" name="belongtypeno">
													<c:forEach items="${questionSecondTypeList }" var="questionSecondType">
														<option value="${questionSecondType.typeno }">${questionSecondType.typename }</option>
													</c:forEach>
												</select>
											</div>
										</div>
																		
										<input type="hidden" id="filename" name="filename" value="upload.jpg"></input>
																		
										<div class="control-group">											
											<label class="control-label">菜单图片：</label>
											<div class="controls">
												<input type="file" class="input-medium" id="image_input" name="file" required="required"/>
											</div>
										</div>
										<div class="control-group">											
											<label class="control-label">预览图片：</label>
											<div class="controls">
												<img src="http://cn-malizhi-answerweb.gz.bcebos.com/temp/upload.jpg" style="width:150px;height:150px;" id="showimg"/>
											</div>
										</div>
										
												
										</div>									
										<div class="form-actions">
											<input type="submit" class="btn btn-primary" value="提交添加" />
											<input type="button" class="btn btn-primary" onclick="javascript:history.back(-1);" value="返回">
										</div>
									</fieldset>
								</form>
								</div>
							</div>
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<div id="footer">
	<div class="container">				
		<hr />
		<p>&copy; 2018 答题系统.</p>
	</div>
</div>
<!-- javascript================================================== -->

<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/WebCalendar.js" type="text/javascript"></script>

<script type="text/javascript">
function validEmpty(){
	//  获取输入框的值
	var name = document.getElementById('typename').value;
	if(name == null || name == '' ){
		alert("名称不能为空！");
		return false;
	}
	
	
	return true;
}

$(function(){
    $("#image_input").change(function(){
        var imagePath = $("#image_input").val();
        if (imagePath == '') {
            return false;
        }
        var strExtension = imagePath.substr(imagePath.lastIndexOf('.') + 1);
        if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {
            alert("请选择图片");
            return false;
        }
        $("#edit-profile").ajaxSubmit({
            type : 'POST',
            url : '${pageContext.request.contextPath}/addQuestionTypeImages',
            success : function(data) {
                $("#showimg").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
                $("#filename").val(data);
            },
            error : function() {
                alert("上传失败，请检查网络后重试");
            }
        });
    })
})

</script>


  </body>
</html>
