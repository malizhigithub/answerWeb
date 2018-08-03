<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
<title>类型</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/example.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/demos.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-weui.js"></script>
<style type="text/css">
.mynone{
	display: none;
}
.myclick{
	display: block;
}
#questionType{
	margin-top: 0;
	background: #99d4f1;
}
#first_p{
	padding-left: 5px;
    color: #FFE;
    font-size: 21px;
    font-weight: bold;
}

#weui-cell_id{
	width: 332px;
    padding: 10px 15px;
    background: #fff;
    margin: 0 0 10px 14px;
    border-radius: 4px;
}
</style>
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
<div class="weui-cells" id="questionType">
	<div v-for="(se,index) in second">
		<a class="weui-cell weui-cell_access myclick" href="javascript:;" v-on:click="loadthird(se.typeno,index)">
		    <div class="weui-cell__bd">
		      <p id="first_p">{{se.typename}}</p>
		    </div>
		    <div class="weui-cell__ft"></div>
	    </a>
	    <div id=third v-if="index == flag">
	    	<a id="weui-cell_id" class="weui-cell weui-cell_access" href="javascript:;" v-for="th in third" v-on:click="redirectJsp(th.typeno)">
			    <div class="weui-cell__bd">
			      <p>{{th.typename}}</p>
			    </div>
			    <div class="weui-cell__ft"></div>
	    	</a>
	    </div>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	questionType.loadsecond();
	$(document.body).pullToRefresh(function () {
		// 下拉刷新触发时执行的操作放这里。
		// 从 v1.1.2 版本才支持回调函数，之前的版本只能通过事件监听
		setTimeout(function() {
			questionType.loadsecond();
			$(document.body).pullToRefreshDone();
		}, 2000);
	});
});



var questionType = new Vue({
	el: "#questionType",
	data: {
		second:[],
		third:null,
		flag : null
	},
	methods: {
		loadsecond: function() {
			$.ajax({
				url: "${pageContext.request.contextPath }/user/getType/${param.typeno}",
				success: function(data){
					questionType.second = data.secondlist;
				}
			});
		},
		loadthird: function(typeno,index) {
			$.ajax({
				url: "${pageContext.request.contextPath }/user/getType/" + typeno,
				success: function(data){
					var error = data.error;
					if (error == null) {
						questionType.third = data.secondlist;
						questionType.flag = index;
					}
					else 
						questionType.redirectJsp(data.error);
				}
			});
		},
		redirectJsp: function(typeno) {
			window.location = "${pageContext.request.contextPath }/wechatuser/knowleage.jsp?typeno="+ typeno;
		}
	}
});

</script>
</html>