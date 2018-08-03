<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0,viewport-fit=cover">
<title>回答问题</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/example.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-weui.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/demos.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-weui.js"></script>
<style type="text/css">
.answer{
	display: none;
}
/* 选项图片 */
.weui-cell__bd img{
	width: 24px;
	height: 24px;
}
.weui-media-box__desc{
	overflow: visible;
}
</style>
</head>
<body>
<!-- 顶部显示题目类型 -->
<header id="condition">
	<a class="weui-navbar__item weui-bar__item--on" href="javascript:;">
		{{title}}
	</a>
</header>
<!-- 显示题目 -->
<section id="question">
	<div class="weui-panel weui-panel_access">
        <div class="weui-panel__bd">
          <div class="weui-media-box weui-media-box_text" v-if="flag == 1">
            <textarea class="weui-textarea" placeholder="请输入文本" rows="7" disable>{{datas}}</textarea>
          </div>
          <div v-if="flag == 2">
          	<img :src="datas"/>
          </div>
          <div v-if="flag == 3">
          	<video :src="datas" controls></video>
          </div>
          <div v-if="flag == 4">
          	<audio :src="datas" controls></audio>
          </div>
        </div>
      </div>
</section>
<!-- 显示选项 -->
<section id="selection">
	<!-- 单选 -->
	<div class="weui-cells weui-cells_radio">
      <label v-for="(op,index) in datas" class="weui-cell weui-check__label" :for="index"  v-if="flag == 1">
        <div class="weui-cell__bd">
          <img alt="" :src="selectimg[index+1]">
          <span>{{op.content}}</span>
        </div>
        <div class="weui-cell__ft">
          <input type="radio" class="weui-check" name="radio1" :id="index" :value="op.status">
          <span class="weui-icon-checked"></span>
        </div>
      </label>
    </div>
    <!-- 多选 -->
    <div class="weui-cells weui-cells_checkbox">
      <label class="weui-cell weui-check__label" :for="index" v-for="(op,index) in datas" v-if="flag == 2">
        <div class="weui-cell__hd">
          <input type="checkbox" class="weui-check" name="checkbox" :id="index" :value="op.status">
          <i class="weui-icon-checked"></i>
        </div>
        <div class="weui-cell__bd">
        	<img alt="" :src="selectimg[index+1]">
          <span>{{op.content}}</span>
        </div>
      </label>
    </div>
</section>
<!-- 显示答案 -->
<section id="answer">
	<div class="weui-panel weui-panel_access answer">
        <div class="weui-panel__bd">
          <div class="weui-media-box weui-media-box_text" v-if="flag == 1">
            <textarea class="weui-textarea" placeholder="请输入文本" rows="7" disable>{{rightanswer}}
{{datas}}</textarea>
          </div>
          <div v-if="flag == 2">
          	<img :src="datas"/>
          </div>
        </div>
    </div>
	<div class='demos-content-padded'>
		<a href="javascript:;" class="weui-btn weui-btn_primary" id="submit">提交</a>
		<a href="javascript:;" class="weui-btn weui-btn_primary" id="next" style="display: none">下一题</a>
	</div>
</section>

</body>
<script type="text/javascript">
var questiondata;	//题目内容
var questionNumber = 0;	//当前题号
var maxNumber;	//最大题目数

$(function(){
	init();
	showQuestion(questionNumber);
	console.log(questiondata);
	/*点击提交按钮时*/
	$('#submit').click(function(){
			$(this).hide();  /* 提交按钮消失 */
			$('.answer').fadeIn(); /*答案显示*/
			$('#next').show();/*下一题按钮显示*/
			$('input:radio').prop("disabled",true);
			if(selection.rightnumber == 1) {	//单选
				if($('input:radio:checked').val() == 1){
									
					condition.subimtAnswer(1);
				}
				else
					condition.subimtAnswer(0);
			} else {	//多选
				$("input[type='checkbox']").prop("disabled",true);
				var len = $("input[type='checkbox']:checked").length;
				if(len != selection.rightnumber)
					condition.subimtAnswer(0);
				else {
					var i = 0;
					$('input:checkbox:checked').each(function(){
						if($(this).val() == 0)
							i++;
					});
					if (i == 0)
						condition.subimtAnswer(1);
					else
						condition.subimtAnswer(0);
				}
			}
	});
	
	/*点击下一题按钮时*/
	$('#next').click(function(){
		questionNumber += 1;
		if(questionNumber < maxNumber)
			showQuestion(questionNumber);
		else {
			alert("题目已做完");
			window.location.href = "${pageContext.request.contextPath}/wechatuser/index.jsp";		
		}
		$(this).hide();  /* 下一题按钮消失 */
		$('.answer').hide(); /*答案消失*/
		$('#submit').show();/*提交按钮显示*/
		$('input:radio').prop('checked',false);
		$('input:radio').prop("disabled",false);
		$('input:checkbox').prop('checked',false);
		$('input:checkbox').prop('disabled',false);
	});
	
	//禁止使用F5页面刷新
	/*
	$(document).ready(function(){
		$(document).bind("keydown",function(e){
			e = window.event || e;
			if(e.keyCode == 116) {
				e.keyCode = 0;
				return false;
			}
		});
	});*/
	
});
//页面加载初始化
function init() {
	$.ajax({
		url: "${pageContext.request.contextPath}/user/getQuestion/${param.typeno}",
		async:false,
		success: function(data){
			questiondata = data.question;
			if (data.question.length == data.maxnumber)
				maxNumber = data.maxnumber;
			else 
				maxNumber = data.question.length;
			condition.title = data.title;
		}
	});
	for (i=1;i<=26;i++)
		selection.selectimg[i] = "${pageContext.request.contextPath }/resource/images/selection/" + i + ".png";
}

//对题目，选项等重新显示
function showQuestion(number){
	var q = questiondata[number];
	question.load(q.question);
	selection.load(q.option);
}

var path = "http://answerweb.gz.bcebos.com/resource";
//显示题目
var question = new Vue({
	el: "#question",
	data: {
		datas: null,
		flag: null
	},
	methods: {
		load: function(data) {
			question.datas = data.content;
			question.flag = data.constatus;
			//封装资源路径
			if (data.constatus == 2)
				question.datas = path + "/images/question/" + question.datas;
			else if (data.constatus == 3)
				question.datas = path + "/video/" + question.datas;
			else if (data.constatus == 4)
				question.datas = path + "/audio/" + question.datas;
			answer.datas = data.description;
			answer.flag = data.desstatus;
			if (answer.flag == 2)
				answer.datas = path + "/images/answer/" + answer.datas;
		}
	}
});
//显示选项
var selection = new Vue({
	el: "#selection",
	data: {
		datas: [],
		falg: null,
		rightnumber: 0,
		selectimg: []
	},
	methods: {
		load: function(data) {
			selection.datas = data;
			var confirm = 0;
			var myop = new Array("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R",
				"S","T","U","V","W","X","Y","Z");
			answer.rightanswer = "答案是：";
			for (var i=0; i<data.length; i++) {
				if(data[i].status == 1){
					confirm += 1;
					answer.rightanswer += myop[i];	
				}
			}
			selection.rightnumber = confirm;
			if(confirm == 1)
				selection.flag = 1;	//单选
			else {
				selection.flag = 2;	//多选
				if(question.flag == 1)
					question.datas = "(多选)" + question.datas;			
			}
		}
	}
});
//显示答案
var answer = new Vue({
	el: "#answer",
	data: {
		datas: [],
		flag: null,
		rightanswer: ""
	}
});
//统计部分
var condition = new Vue({
	el: "#condition",
	data: {
		title: null, 
		right: 0,
		error: 0
	},
	methods: {
		subimtAnswer: function(status){
			if (status == 1)
				condition.right++;
			else
				condition.error++;
			$.ajax({
				url: "${pageContext.request.contextPath}/user/refreshRecord/${param.typeno}/"+status ,
			});
		
		}
	}
});

</script>
</html>