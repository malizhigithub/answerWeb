<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css"/>
<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/index.js"></script>
<style type="text/css">
#cl-dashboard {
	display: none;
}
</style>
</head>
<body>
	<header>
		<img src="${pageContext.request.contextPath }/resource/images/logo.jpg"/>
		<div class="find">
			<input type="text" placeholder="搜索..." />
			<button></button>
		</div>
	</header>
	<nav>
		<div>
			<div class="">
				<div class="info">
					<ul>
						<li>个人信息</li><b></b>
						<li class="alter" id="alterInfo">信息修改</li>
						<li class="alter" id="alterPsw">密码修改</li>
						<li class="alter" id="showrecords">答题情况</li>
					</ul>
				</div>				
			</div>
			<div class="user">
				<a href="#" id="showusername">用户名:&nbsp;${sessionScope.user.username }</a>
				<a href="${pageContext.request.contextPath }/user/sigeout" title="退出登录状态">
					<b></b>
					<img src="${pageContext.request.contextPath }/resource/images/Exit.png"/>
				</a>
			</div>
		</div>
	</nav>
	
	<div class="box" id="box">
			<div class="box1">
				<div class="box_alterInfo">
					<div class="x">
						<p class="x_p">x</p>
						<div style="clear: both;">
						
						</div>
					</div>
					
					<div class="top">
						个人信息
					</div>
						<div class="form">
							<div class="input">
								<label for="">用户名</label>
								<input type="text"  :value="user.username" readonly required id="username" name="username"/>
							</div>
							<div class="input" id="sex">
								<label for="">性别</label>
								<input type="text"  :value="user.sex" readonly required />
							</div>
							<div class="input" style="display:none" id="radiosex">
								<input type="radio" name="sex" value="男" checked/>男
								<input type="radio" name="sex" value="女" />女
							</div>
							<div class="input" style="clear: both;">
								<label for="">邮箱</label>
								<input type="email" name="email" id="email"  :value="user.email" readonly required/>
							</div>
							<div class="input" >
								<input type="button" value="修改" id="updateinfo" />
								<input type="submit" value="提交" style="display:none" id="confirmupdate">
							</div>
						</div>
				</div>
				<div class="box_alterPsw">
					<div class="x">
						<p class="x_p">x</p>
						<div style="clear: both;">
						
						</div>
					</div>
					<div class="top">
						修改密码
					</div>
					<form action="#" method="post" onsubmit="return alterpsw()">
						<div class="form">
							<div class="input">
								<label for="">原密码</label>
								<input type="password" placeholder="原密码" name="oldpsw" id="oldpsw" required />
							</div>
							<div class="input">
								<label for="">新密码</label>
								<input type="password"  placeholder="新密码" name="newpsw" required id="newpsw"  />
							</div>
							<div class="input">
								<label for="">确认新密码</label>
								<input type="password"  placeholder="确认新密码" required name="confirmpsw" id="confirmpsw" />
							</div>
							<div class="input">
								<input type="submit" value="修改" />
							</div>
						</div>
					</form>	
				</div>
				<div class="box_showrecords">
					<div class="x">
						<p class="x_p">x</p>
						<div style="clear: both;">
						
						</div>
					</div>
					<div class="top">
						答题情况
					</div>
					<div>
						<table v-if="record.length != 0" class="table table-striped">
							<thead style="font-size: 18px;">
								<th>题目类型</th>
								<th>答对题数</th>
								<th>答错题数</th>
							</thead>
							<tbody>
								<tr v-for="re in record" style="font-size: 15px;">
									<th>{{re.typename}}</th>
									<th>{{re.acnumber}}</th>
									<th>{{re.erunmber}}</th>
								</tr>
							</tbody>
						</table>
						<span v-if="record.length == 0">无答题记录</span>
					</div>
				</div>
			</div>
			
		</div>
	
	<section>
		<div class="menu">
			<ul class="first" id="first">
				<li class="topic">阶段</li>
				<li v-for="(data,index) in datas">
					<p v-bind:class="{active:index==flag}" v-on:click="loadSecond(data.typeno,index,data.typename)">{{data.typename}}</p>
					<ul class="second" v-if="index == flag" style="display:block">
						<li v-for="second in data1" v-on:click="loadThird(second.typeno,second.typename)">{{second.typename}}</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="">
			<div class="content" id="content">
				<div class="content_topic">
					<p>{{previous}}</p>
				</div>
				<a href="javascript:;" class="class" v-for="data in datas" v-on:click="toLink(data.typeno)">
					<img v-bind:src="data.imageurl" />
					<span >{{previous}}</span>
					<p>{{data.typename}}</p>
				</a>
				<div class="clear">	
				</div>
			</div>
		</div>
	</section>
	<footer>
		<p>地址: 岭南师范学院 &nbsp;| &nbsp; 联系邮箱: <a href="https://gitee.com/malizhigitee/projects" target="_blank" rel="nofollow">lizhi_ma@foxmail.com</a>
		<br>
		<a href="https://gitee.com/malizhigitee/projects" target="_blank" rel="nofollow">粤ICP备18084457号</a></p>
	</footer>
</body>
<script type="text/javascript">
$(function(){
	$("#confirmupdate").click(function(){
		var username = $.trim($("#username").val());
		var sex = $("input[name='sex']:checked").val();
		var email = $.trim($("#email").val());
		if (username == ""){
			alert("用户名不能为空");
			return false;
		} else if (email == "") {
			alert("邮箱不能为空");
			return false;
		} else if (!is_email(email)) {
			alert("邮箱格式不正确");
			return false;
		}
		$.ajax({
			url: "${pageContext.request.contextPath}/user/updateinfo",
			data: {
				username: username,
				sex: sex,
				email: email
			},
			success: function(data) {
				if(data.updateEmail != null)
					alert("除邮箱外其他信息修改成功，已发送验证信息给修改邮箱，请前往修改邮箱进行验证后修改邮箱");
				else 
					alert("修改成功");
			}
		});
		$('.box').hide();
		$('.box_alterPsw').hide();
		$("#username").attr("readonly","readonly");
		$("#sex").css("display","block");
		$("#radiosex").css("display","none");
		$("#email").attr("readonly","readonly");
		$("#updateinfo").css("display","block");
		$("#confirmupdate").css("display","none");
		$("#showusername").text("用户名: " + username);
	});
});

function alterpsw(){
	var oldpsw = $.trim($('#oldpsw').val());
	var newpsw = $.trim($('#newpsw').val());
	var confirmpsw = $.trim($('#confirmpsw').val());
	if (oldpsw == "") {
		alert("原密码不能为空");
		return false;		
	}
	else if (newpsw == "") {
		alert("新密码不能为空");
		return false;
	}
	else if (confirmpsw == "") {
		alert("确认密码不能为空");
		return false;			
	}
	else if (newpsw != confirmpsw) {
		alert("两次输入新密码不一致");
		return false;
	}
	$.ajax({
		url: "${pageContext.request.contextPath}/user/updatepassword",
		data: {
			oldpsw: oldpsw,
			newpsw: newpsw
		},
		dataType: "json",
		success: function(data){
			var error = data.error;
			if (error!=null && error!="")
				alert(error);
			var success = data.success;
			if (success!=null && success!="") {
				alert("修改成功");
				$('.box').hide();
				$('.box_alterPsw').hide();			
			}
			$('#oldpsw').val("");
			$('#newpsw').val("");
			$('#confirmpsw').val("");
		}
	});
	return false;
};
		
	var path = "http://answerweb.gz.bcebos.com/resource/images/type/";
	var first = new Vue({
		el: '#first',
		data: {
			datas: [],
			data1: [],
			flag: null
		},
		mounted(){
			this.load();
		},
		methods: {
			load: function(){
    			$.ajax({
					url:"${pageContext.request.contextPath}/user/getType",
					type:"POST",
					success: function(data){
							first.datas = data.firstlist;
							first.loadSecond(data.firstlist[0].typeno,0);
					}					
				});
    		},
    		loadSecond: function(id,index,previous) {
				$.ajax({
					url: "${pageContext.request.contextPath}/user/getType/"+id,
					type: "POST",
					success: function(data) {
						if (data.grade == "two") {
							content.datas = data.secondlist;
							for(var i=0; i<content.datas.length; i++)
								content.datas[i].imageurl = path + content.datas[i].imageurl;
							content.previous = previous;
							first.flag = null;
						} else {
							first.data1 = data.secondlist;
							first.loadThird(data.secondlist[0].typeno,data.secondlist[0].typename);
							first.flag = index;
						}
					} 
				});
    		},
    		loadThird: function(id, previous) {
    			$.ajax({
					url: "${pageContext.request.contextPath}/user/getType/"+id,
					type: "POST",
					success: function(data) {
						content.datas = data.secondlist;
						for(var i=0; i<content.datas.length; i++)
								content.datas[i].imageurl = path + content.datas[i].imageurl;
						content.previous = previous;
					} 
				});
    		}
		}
	});
	
	var content = new Vue({
		el: '#content',
		data: {
			datas: [],
			previous: null
		},
		methods: {
			toLink: function(typeno) {
				window.location = "${pageContext.request.contextPath}/user/knowleage.jsp?typeno=" + typeno;
    		}
		}
	});
	
	var box = new Vue({
		el: '#box',
		data: {
			user:[],
			record:[]
		},
		methods: {
			loaduserinfo: function() {
				$.ajax({
					url: "${pageContext.request.contextPath}/user/findWebUserInfo",
					success: function(data) {
						box.user = data.user;
					}
				});
			},
			loadrecords: function() {
				$.ajax({
					url: "${pageContext.request.contextPath}/user/findWebUserInfo",
					success: function(data) {
						box.record = data.recordsList;
					}
				});
			}
		}
	});
	
</script>
</html>