<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <title>更新试题信息</title>
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
			<a class="brand" href="./">更改试题信息</a>
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

						<li class="active"><a
							href="${pageContext.request.contextPath}/selectQuestion?toid=1">
								<i class="icon-th-list"></i> 试题库管理
						</a></li>

						<li><a href="${pageContext.request.contextPath}/admin/questionType.jsp">
								<i class="icon-th-large"></i> 目录管理
						</a></li>

						<li><a
							href="${pageContext.request.contextPath}/logout">
								<i class="icon-signal"></i>注销
						</a></li>
				</ul>
			</div>

			<div class="span9">
				<div class="row">
					<div class="span9">
						<div class="widget">
							<div class="widget-header">
								<h3>试题基本信息</h3>
							</div>
							<div class="widget-content">
								<div class="tabbable">
							<div class="tab-content">
								<div class="tab-pane active" id="1">
								
								<!-- 下面是表单提交 -->
								
								<form id="edit-profile" class="form-horizontal" action="${pageContext.request.contextPath}/updateQuestionSecond?pn=${pn}" method="post" enctype="multipart/form-data" />
									<fieldset>
										
										<input type="hidden" name="questionno" value="${question.questionno}" />
										<input type="hidden" name="oldContent" value="${question.content}" />
										<input type="hidden" name="oldDescription" value="${question.description}" />
									
									<div class="control-group">											
											<label class="control-label">题目编号：</label>
											<div class="controls">
												<input type="text" disabled value="${question.questionno}" style="width:90px;"/>
											</div>
									</div>
									
									<div class="control-group">											
											<label class="control-label">试题类型：</label>
											<div class="controls">
											<select id="typeno" 
														class="input-small " name="typeno">
														<option <c:if test="${question.typeno==NULL}">selected</c:if>></option>
														<c:forEach items="${questionTypeList}" var="questionType">
												        <option value="${questionType.typeno }" <c:if test="${question.typeno == questionType.typeno}">selected</c:if>>${questionType.typename}</option>
														</c:forEach>
												</select>
											</div>
										</div>
									
									<div class="control-group">											
											<label class="control-label">内容类型：</label>
											<div class="controls">
												<select id="constatus"
														class="input-small " name="constatus">
												        <option value="1" <c:if test="${question.constatus == 1}">selected</c:if>>文本</option>
												        <option value="2" <c:if test="${question.constatus == 2}">selected</c:if>>图片</option>
												        <option value="3" <c:if test="${question.constatus == 3}">selected</c:if>>视频</option>
												        <option value="4" <c:if test="${question.constatus == 4}">selected</c:if>>语音</option>
												</select>
											</div>
										</div>
									
									<div class="control-group">											
											<label class="control-label">题目内容：</label>
											<div id="div_content" class="controls">
											<c:if test="${question.constatus ==1}">
												<textarea id="question_content" name="content" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')">${question.content }</textarea>
											</c:if>
											
											<c:if test="${question.constatus == 2}">
												<input id="question_content" type="hidden" name="content"  value="${question.content}"/>
												<input type="file" id="updateQuestion_content" name="file" >
												<img id="showfile" style="hight:150px;width:300px;" src="http://cn-malizhi-answerweb.gz.bcebos.com/resource/images/question/${question.content}"/>
												<span style="color:red;" id="message"></span>
											</c:if>
											
											<c:if test="${question.constatus == 3}">
												<input id="question_content" type="hidden" name="content" value="${question.content}"/>
												<input type="file" id="updateQuestion_content" name="file" >
												<embed id="showfile" src="http://cn-malizhi-answerweb.gz.bcebos.com/resource/video/${question.content}">
												<span style="color:red;" id="message"></span>
											</c:if>
											
											<c:if test="${question.constatus == 4}">
												<input id="question_content" type="hidden" name="content" value="${question.content}"/>
												<input type="file" id="updateQuestion_content" name="file" >
												<embed id="showfile" src="http://cn-malizhi-answerweb.gz.bcebos.com/resource/audio/${question.content}">
												<span style="color:red;" id="message"></span>
											</c:if>
											
											</div>
										</div>
										
										
										<div class="control-group">											
											<label class="control-label">答案类型：</label>
											<div class="controls">
												<select
														id="desstatus" class="input-mini disabled"
														name="desstatus">
												        <option value="1" <c:if test="${question.desstatus == 1}">selected</c:if>>文本</option>
												        <option value="2" <c:if test="${question.desstatus == 2}">selected</c:if>>图片</option>
												    
												</select> 
											</div>
										</div>	
										
										
										<div class="control-group">											
											<label class="control-label">答案详解：</label>
											<div id="div_des" class="controls">
											<c:if test="${question.desstatus == 1}">
												<textarea id="description" name="description" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')">${question.description }</textarea>
											</c:if>
											<c:if test="${question.desstatus == 2}">
												<input type="hidden" id="description" name="description" value="${question.description}"/>
												<input type="file" name="desFile" id="updateQuestion_description" />
												<img id="showimg" style="height:150px;width:300px;" src="http://cn-malizhi-answerweb.gz.bcebos.com/resource/images/answer/${question.description}"/>
												<span style="color:red;" id="answermessage"></span>
											</c:if>
											</div>
										</div>
										
									<!-- 候选答案 -->
									<c:forEach items="${optionsList}" var="options" varStatus="status">
										<div class="control-group">											
											<label class="control-label">候选答案${status.count}：</label>
											<div class="controls">
												<input name="optionsList[${status.count-1}].optionsno" value="${options.optionsno }" type="hidden"/>
												<input name="optionsList[${status.count-1}].questionno" value="${options.questionno }" type="hidden"/>
												<textarea name="optionsList[${status.count-1}].content" required="required" onkeyup="this.value=this.value.replace(/\s+/g,'')">${options.content }</textarea>
												<select
														id="" class="input-mini disabled"
														name="optionsList[${status.count-1}].status">
														<option <c:if test="${options.status==null}">selected</c:if>></option>
												        <option value="1" <c:if test="${options.status == 1}">selected</c:if>>正确</option>
												        <option value="0" <c:if test="${options.status == 0}">selected</c:if>>错误</option>
												</select> 
											</div>
										</div>		
									</c:forEach>
										
										</div>									
										<div class="form-actions" style="text-align: center;">
											<input type="submit" class="btn btn-primary" value="更新"/>
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
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/WebCalendar.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

<script type="text/javascript">

/* 根据选择的内容类型显示对应的标签 */
		$("#constatus").change(function(){
			var input_value = $("#constatus option:selected").val();
			if(input_value == 1){
				var input_text = document.createElement("textarea");
				input_text.style="overflow-x:hidden";
				input_text.id="updateQuestion_content";
				input_text.name="content";
				input_text.required="required";
				input_text.onkeyup="this.value=this.value.replace(/\s+/g,'')";
				
				
				
				$("#div_content").empty().append(input_text);
				
			}else{
				
				var input_file = document.createElement("input");
				input_file.type="file";
				input_file.name="file";
				input_file.id="updateQuestion_content";
				input_file.required="required";
				
				var message = document.createElement("span");
				message.innerText="";
				message.style="color:red;";
				message.id="message";
				
				var fileContent = document.createElement("input");
				fileContent.type="hidden";
				fileContent.name="content";
				fileContent.id="fileContent";
				fileContent.value="upload.jpg";
				
				var showfile = document.createElement("img");
				showfile.style="width:150px;height:150px;";
				showfile.src="http://cn-malizhi-answerweb.gz.bcebos.com/temp%2Fupload.jpg";
				
				showfile.id="showfile";
				
				$("#div_content").empty().append(input_file).append(fileContent).append(showfile).append(message);
				
				$("#updateQuestion_content").change(function(){
				
					/* 显示正在上传 */
					$("#message").attr("style","color:red;");
					$("#message").text("正在上传");
				
			        var imagePath = $("#updateQuestion_content").val();
			        if (imagePath == '') {
			            return false;
			        }
			        var strExtension = imagePath.substr(imagePath.lastIndexOf('.') + 1);
			        if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp'
			        	&&	strExtension != 'mp4' &&	strExtension != 'mp3' 
			        	) {
			            alert("请选择对应的格式资源");
			            return false;
			        }
			        $("#edit-profile").ajaxSubmit({
			            type : 'POST',
			            url : '${pageContext.request.contextPath}/addQuestionFile?flag=1',
			            success : function(data) {
			            	/* <embed autostart="false" play="false"  flashvars="autoplay=false&play=false" menu="false" hidden="false" loop="false" 
							src="${pageContext.request.contextPath}/resource/images/type/63519-1523185519322-a59836cd9522f795669c5624de3b379e.mp4" />
							*/
							if(strExtension=="mp4"||strExtension=="mp3"){
								$("#showfile").remove();
								var showfile = document.createElement("embed");
								showfile.id="showfile";
								showfile.style="width:150px;height:150px;";
								showfile.autostart="false";
								showfile.flashvars="autoplay=false&play=false"
								
								/* 显示进度条 */
								$("#message").remove();
								var message = document.createElement("span");
								message.innerText="上传完毕";
								message.style="color:green;";
								message.id="message";
								
								$("#div_content").append(showfile).append(message);
							}
			                $("#fileContent").val(data);
			                
			                /* 修改进度条 */
							$("#message").attr("style","color:green;");
							$("#message").text("上传完毕");
			                
			                if(strExtension=="mp4"){
				                $("#showfile").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
			                }else if(strExtension == "mp3"){
				                $("#showfile").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
			                }else{
				                $("#showfile").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
			                }
			            },
			            error : function() {
			                alert("上传失败，请检查网络后重试");
			            }
			        });
			    });
				
			}
		});



/* 直接开始就点击更换内容 */
$("#updateQuestion_content").change(function(){
					
					/* 显示进度条 */
					$("#message").attr("style","color:red;");
					$("#message").text("正在上传");

			        var imagePath = $("#updateQuestion_content").val();
			        if (imagePath == '') {
			            return false;
			        }
			        var strExtension = imagePath.substr(imagePath.lastIndexOf('.') + 1);
			        if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp'
			        	&&	strExtension != 'mp4' &&	strExtension != 'mp3' 
			        	) {
			            alert("请选择对应的格式资源");
			            return false;
			        }
			        $("#edit-profile").ajaxSubmit({
			            type : 'POST',
			            url : '${pageContext.request.contextPath}/addQuestionFile?flag=1',
			            success : function(data) {
			            	/* <embed autostart="false" play="false"  flashvars="autoplay=false&play=false" menu="false" hidden="false" loop="false" 
							src="${pageContext.request.contextPath}/resource/images/type/63519-1523185519322-a59836cd9522f795669c5624de3b379e.mp4" />
							*/
							if(strExtension=="mp4"||strExtension=="mp3"){
								$("#showfile").remove();
								var showfile = document.createElement("embed");
								showfile.id="showfile";
								showfile.style="width:200px;height:150px;";
								showfile.autostart="false";
								showfile.flashvars="autoplay=false&play=false"
								
								/* 显示进度条 */
								$("#message").remove();
								var message = document.createElement("span");
								message.innerText="上传完毕";
								message.style="color:green;";
								message.id="message";
								
								
								$("#div_content").append(showfile).append(message);
							}
							
							/* 修改进度条 */
							$("#message").text("上传完毕");
							$("#message").attr("style","color:green");
							
			                $("#question_content").val(data);
			                
			                
			                
			                if(strExtension=="mp4"){
				                $("#showfile").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
			                }else if(strExtension == "mp3"){
				                $("#showfile").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
			                }else{
				                $("#showfile").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
			                }
			            },
			            error : function() {
			                alert("上传失败，请检查网络后重试");
			            }
			        });
			    });


/* 根据选择的答案类型显示对应的标签 */		 
		$("#desstatus").change(function(){
			var input_value = $("#desstatus option:selected").val();
			if(input_value ==1){
				var input_text = document.createElement("textarea");
				input_text.style="overflow-x:hidden";
				input_text.id="addQuestion_description";
				input_text.name="description";
				input_text.required="required";
				input_text.onkeyup="this.value=this.value.replace(/\s+/g,'')";
				$("#div_des").empty().append(input_text);
			}else{
				var input_file = document.createElement("input");
				input_file.type="file";
				input_file.id="updateQuestion_description";
				input_file.name="desFile";
				input_file.required="required";
				
				var showfile = document.createElement("img");
				showfile.style="width:300px;height:150px;";
				showfile.src="http://cn-malizhi-answerweb.gz.bcebos.com/temp/upload.jpg";
				showfile.id="showimg";
				
				var fileContent = document.createElement("input");
				fileContent.type="hidden";
				fileContent.name="description";
				fileContent.value="upload.jpg";
				fileContent.id="description";
				
				/* 显示进度条 */
				var answermessage = document.createElement("span");
				answermessage.innerText="";
				answermessage.style="color:red;";
				answermessage.id="answermessage";
				
				
				
				$("#div_des").empty().append(input_file).append(showfile).append(fileContent).append(answermessage);
				
				$("#updateQuestion_description").change(function(){
					
					/* 修改进度条 */
					$("#answermessage").text("正在上传");
					$("#answermessage").attr("style","color:red");
				
			        var imagePath = $("#updateQuestion_description").val();
			        if (imagePath == '') {
			            return false;
			        }
			        var strExtension = imagePath.substr(imagePath.lastIndexOf('.') + 1);
			        if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {
			            alert("请选择对应的格式资源");
			            return false;
			        }
			        $("#edit-profile").ajaxSubmit({
			            type : 'POST',
			            url : '${pageContext.request.contextPath}/addQuestionFile?flag=2',
			            success : function(data) {
			            	
			                $("#description").val(data);
				            $("#showimg").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
				            $("#answermessage").text("上传完毕");
							$("#answermessage").attr("style","color:green");
			                
			            },
			            error : function() {
			                alert("上传失败，请检查网络后重试");
			            }
			        });
			    });
				
			}/* else */
		});


/* 直接点击更换答案类型 */
$("#updateQuestion_description").change(function(){
					/* 修改进度条 */
					$("#answermessage").text("正在上传");
					$("#answermessage").attr("style","color:red");
			       
			        var imagePath = $("#updateQuestion_description").val();
			        if (imagePath == '') {
			            return false;
			        }
			        var strExtension = imagePath.substr(imagePath.lastIndexOf('.') + 1);
			        if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {
			            alert("请选择对应的格式资源");
			            return false;
			        }
			        $("#edit-profile").ajaxSubmit({
			            type : 'POST',
			            url : '${pageContext.request.contextPath}/addQuestionFile?flag=2',
			            success : function(data) {
			            	
			                $("#description").val(data);
				            $("#showimg").attr("src", 'http://cn-malizhi-answerweb.gz.bcebos.com/temp/'+data);
			                
			                /* 修改进度条 */
							$("#answermessage").text("上传完毕");
							$("#answermessage").attr("style","color:color");
			                
			            },
			            error : function() {
			                alert("上传失败，请检查网络后重试");
			            }
			        });
			    });


function validEmpty(){
	//  获取输入框的值
	var name = document.getElementById('question_content').value;
	if(name == null || name == '' ){
		alert("不能为空！");
		return false;
	}
	var tel = document.getElementById('description').value;
	if(tel == null || tel == '' ){
		alert("不能为空！");
		return false;
	}
	var fax = document.getElementById('constatus').value;
	if(fax == null || fax == '' ){
		alert("不能为空！");
		return false;
	}
	var fax = document.getElementById('desstatus').value;
	if(fax == null || fax == '' ){
		alert("不能为空！");
		return false;
	}
	var fax = document.getElementById('typeno').value;
	if(fax == null || fax == '' ){
		alert("不能为空！");
		return false;
	}
	
	return true;
}
</script>


  </body>
</html>
