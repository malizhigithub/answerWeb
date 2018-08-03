<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/example.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/myindex.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/demos.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/pages/demos.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/sm.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/sm-extend.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-weui.js"></script>

<script src="${pageContext.request.contextPath }/js/zepto.js"></script>
<script src="${pageContext.request.contextPath }/js/config.js"></script>
<script src="${pageContext.request.contextPath }/js/sm.js"></script>
<script src="${pageContext.request.contextPath }/js/sm-extend.js"></script>
<script src="${pageContext.request.contextPath }/js/sm-city-picker.js"></script>


</head>
<body>
<!-- 下拉刷新 -->
<div class="weui-pull-to-refresh__layer">
    <div class='weui-pull-to-refresh__arrow'></div>
    <div class='weui-pull-to-refresh__preloader'></div>
    <div class="down">下拉刷新</div>
    <div class="up">释放刷新</div>
    <div class="refresh">正在刷新</div>
</div>

<!-- 页面显示 -->
<div class="page__bd" style="height: 100%;">
    <div class="weui-tab">
        <div class="weui-tab__panel">
            <div id="answer" class="weui-tab__bd-item">
                <div class="firsttab">
                    <img src="${pageContext.request.contextPath }/resource/images/logo.jpg" class=my_img>
                </div>
	            <div class="weui-grids" id="type">
	                <a href="javascript:;" class="weui-grid" v-for="data in datas" v-on:click="redirectSecond(data.typeno)">
	                    <div class="weui-grid__icon">
	                        <img :src="data.imageurl" alt="">
	                    </div>
	                    <p class="weui-grid__label">{{data.typename}}</p>
	                </a>
	            </div>
            </div>
            <div id="user" class="weui-tab__bd-item" style="display: none">
            	<div class="page-group">
            		<div id="page-icon-input" class="page">
						<header class="bar bar-nav">
							<h1 class="title">个人信息</h1>
						</header>
						<div class="content">
							<div class="list-block">
								<ul>
									<!-- Text inputs -->
									
									<li>
										<div class="item-content">
											<div class="item-media">
												<i class="icon"></i>
											</div>
											<div class="item-inner">
												<div class="item-title label">姓名</div>
												<div class="item-input">
													<input id="nickname" type="text" placeholder="呢称" name="nickname"
														v-bind:value="nickname" required="required">
													<input id="wechatuserno" type="hidden" value="${weChatUser.wechatuserno }"/>
												</div>
											</div>
										</div>
									</li>
									
								
									
									
									<!-- 	<li>
										<div class="item-content">
											<div class="item-media">
												<i class="icon icon-form-email"></i>
											</div>
											<div class="item-inner">
												<div class="item-input">
													<input type="email" placeholder="E-mail">
												</div>
											</div>
										</div>
									</li> -->
					
									<li>
										<div class="item-content">
											<div class="item-media">
												<i class="icon "></i>
											</div>
											<div class="item-inner">
											<div class="item-title label">性别</div>
												<div class="item-input">
													<select v-if="sex == '男'" id="sex" name="sex" required="required">
					
														<option value="男" selected>Male</option>
														<option value="女" >Female</option>
													</select>
													<select v-if="sex == '女'" id="sex" name="sex" required="required">
					
														<option value="男" >Male</option>
														<option value="女" selected>Female</option>
													</select>
												</div>
											</div>
										</div>
									</li>
									<!-- address -->
									<li>
										<div class="item-content">
											<div class="item-media">
												<i class="icon "></i>
											</div>
											<div class="item-inner">
											<div class="item-title label">地址</div>
												<div class="item-input">
													<input name="province" type="text" id='province' v-bind:value="province" required="required"/>
													<input name="city" type="text" id='city' v-bind:value="city" required="required"/>
													<input name="country" type="text" id='country' v-bind:value="country" required="required"/>
												</div>
											</div>
										</div>
									</li>
					<hr color="grey" width="100%" style=""/>
					<!-- 显示记录 -->
								<li>
										<div class="item-content">
											<div class="item-media">
												<i class="icon "></i>
											</div>
											<div class="item-inner">
											<div class="item-title label">答题类型</div>
												<div class="item-input">
													<select id="records" name="records" v-on:change="changeRecord()">
					
														<option v-for="record in recordsList" v-bind:value="record.typeno">{{record.typename}}</option>
														
													</select>
												</div>
											</div>
										</div>
									</li>
						<!-- 答对数 -->
									<li>
										<div class="item-content">
											<div class="item-media">
												<i class="icon "></i>
											</div>
											<div class="item-inner">
												<div class="item-title label">答对</div>
												<div class="item-input">
													<input id="acnumber" disabled type="text" v-bind:value="acnumber"/>
												</div>
											</div>
										</div>
									</li>
						
						
						<!-- 答错数 -->
									<li>
										<div class="item-content">
											<div class="item-media">
												<i class="icon "></i>
											</div>
											<div class="item-inner">
												<div class="item-title label">答错</div>
												<div class="item-input">
													<input id="ernumber" disabled type="text" v-bind:value="ernumber"/>
												</div>
											</div>
										</div>
									</li>
									
					
					
								</ul>
							</div>
							<div class="content-block" style="text-align: center;">
								<div class="row">
									<div class="col-50">
										<a href="javascript:history.back();"
											class="button button-big button-fill button-danger">取消</a>
									</div>
									<div class="col-50">
										<a id="save" href="#" v-on:click="updateInfo()" class="button button-big button-fill button-success">提交</a>
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
        </div>
        <div class="weui-tabbar">
            <a href="#answer" class="weui-tabbar__item weui-bar__item_on">
                <img src="${pageContext.request.contextPath }/resource/images/icon_nav_answer.png" alt="" class="weui-tabbar__icon">
                <p class="weui-tabbar__label">答题</p>
            </a>
            <a href="#user" class="weui-tabbar__item">
                <img src="${pageContext.request.contextPath }/resource/images/icon_nav_people.png" alt="" class="weui-tabbar__icon">
                <p class="weui-tabbar__label">我</p>
            </a>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">

$(function () {
    $(".weui-tabbar__item").click(function () {
        $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
        var tab = $(this).attr("href");
        $(tab).css("display","block");
        $(tab).siblings().css("display","none");
        wechatuserRecords.load();
        questiontype.loadtype();
    });
    questiontype.loadtype();
    
    $(document.body).pullToRefresh(function () {
		// 下拉刷新触发时执行的操作放这里。
		// 从 v1.1.2 版本才支持回调函数，之前的版本只能通过事件监听
		setTimeout(function() {
			questiontype.loadtype();
			wechatuserRecords.load();
			$(document.body).pullToRefreshDone();
		}, 2000);
	});

});

var path = "http://answerweb.gz.bcebos.com/resource/images/type/"; 


var questiontype = new Vue({
	el: "#type",
	data: {
		datas: []
	},
	methods: {
		loadtype: function() {
			$.ajax({
				url:"${pageContext.request.contextPath}/user/getType",
				type:"POST",
				success: function(data){
					questiontype.datas = data.firstlist;
					for (var i=0; i<questiontype.datas.length; i++) {
						questiontype.datas[i].imageurl = path + questiontype.datas[i].imageurl;
					}
				}					
			});
		},
		redirectSecond: function(typeno) {
			window.location = "${pageContext.request.contextPath}/wechatuser/index2.jsp?typeno=" + typeno;
		}
	}
});

/* ------------------------------个人信息VUE ----------------------------------------- */
var wechatuser = new Vue({
	el:"user",
	data:{
		nickname:null,
		sex:null,
		province:null,
		city:null,
		country:null
	},
	mounted(){
		this.load();
	},
	methods:{
		load:function(){
			wechatuser.nickname = "${weChatUser.nickname}",
			wechatuser.sex = "${weChatUser.sex}",
			wechatuser.province = "${weChatUser.province}",
			wechatuser.city = "${weChatUser.city}",
			wechatuser.country = "${weChatUser.country}"
		},
		updateInfo:function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/updateWechatUser?nickname="+$("#nickname").val()+"&sex="+$("#sex").val()+"&province="+$("#province").val()+"&city="+$("#city").val()+"&country="+$("#country").val()+"&wechatuserno=${weChatUser.wechatuserno}",
				type:"POST",
				success:function(data){
					wechatuser.nickname = data.nickname,
					wechatuser.sex = data.sex,
					wechatuser.province = data.province,
					wechatuser.city = data.city,
					wechatuser.country = data.country
				}
			})
		}
	}
});

/* -------------------------------------个人记录VUE----------------------------------- */
var wechatuserRecords = new Vue({
	el:"#user",
	data:{
		recordsList:[],
		acnumber:0,
		ernumber:0
	},
	mounted(){
				this.load();
	},
	methods:{
		load:function(){
			$.ajax({
				url:"${pageContext.request.contextPath}/getAllRecords?wechatuserno=${sessionScope.weChatUser.wechatuserno}",
				type:"POST",
				success:function(list){
					wechatuserRecords.recordsList = list;
					wechatuserRecords.acnumber = list[0].acnumber;
					wechatuserRecords.ernumber = list[0].erunmber;
				}
			})
		},
		
		changeRecord:function(){
			for(var i =0;i<wechatuserRecords.recordsList.length;i++){
				if(wechatuserRecords.recordsList[i].typeno == $('#records option:selected').val()){
					wechatuserRecords.acnumber = wechatuserRecords.recordsList[i].acnumber;
					wechatuserRecords.ernumber = wechatuserRecords.recordsList[i].erunmber;
				}
			}
		}
		
	}
});

$("#save").click(function(){
			var nickname = $("#nickname").val();
			var sex = $("#sex option:selected").val();
			var address = $("#city").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/updateWechatUser?nickname="+nickname+"&sex="+sex+"&address="+address+"&wechatuserno=${weChatUser.wechatuserno}",
				type:"POST",
				success:function(data){
					window.location.href="${pageContext.request.contextPath}/wechatuser/index.jsp";
				}
			});
});

$("#city").cityPicker({
			toolbarTemplate : '<header class="bar bar-nav">\
	    <button class="button button-link pull-right close-picker">确定</button>\
	    <h1 class="title">选择居住地址</h1>\
	    </header>'
	});

</script>
</html>