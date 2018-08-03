$(function(){
	
	//个人信息和用户名之间的间隙~动态变化
	var distance=110;   //
	var width=$('.user').width(); //获取宽度
	$('.info').css('right',distance+(width-115));
	
	var box_height;		
	var time=null;
	function height_change(){
		time=setInterval(function(){
			box_height=$(document).outerHeight(true);
			$('.box').css('height',box_height);	
			$('.box .box1').css('height',$(window).height());
		},100)
	}
	height_change();
	
	
	//菜单栏
	$('.menu p').click(function(){
		$(this).parent().find('.second').slideToggle();
		$(this).parent().siblings().find('.second').slideUp();
		$(this).addClass('active');
		$(this).parent().siblings().find('p').removeClass('active');
	})
	
	//点击菜单，显示右边内容
	$('.menu li').click(function(){
		var id= $(this).attr("id");//获取属性为id的值
		if(id!=undefined){
			var str=".content_"+id;
			$(str).show().siblings().hide();
			
		}
	})
	
	//用户信息
	$('.info ul li:nth-of-type(1)').click(function(e){
		e.stopPropagation();
		$('.alter').fadeToggle();
			
	})
	
	$('div.info ul li.alter').click(function(e){
		e.stopPropagation();
	})
	
	$('#alterInfo').click(function(e){
		e.stopPropagation();
		$('.box').show();
		$('.box_alterInfo').show();
		box.loaduserinfo();
	})
	$('#alterPsw').click(function(e){
		e.stopPropagation();
		$('.box').show();
		$('.box_alterPsw').show();
	})
	$('#showrecords').click(function(e){
		e.stopPropagation();
		$('.box').show();
		$('.box_showrecords').show();
		box.loadrecords();
	})
	
	$(document).click(function(e){ 
		var name=e.target.className;
		if(name!="box" && name!="box1" &&name!="x_p" && name!="box_alterInfo" && name!="box_alterPsw"
			&& name!="box_showrecords"){
			$('.alter').fadeOut(); //点击其他地方，个人信息菜单收起来
		} else {
			//重置input内容
			$('#oldpsw').val("");
			$('#newpsw').val("");
			$('#confirmpsw').val("");
			$("#username").attr("readonly","readonly");
			$("#sex").css("display","block");
			$("#radiosex").css("display","none");
			$("#email").attr("readonly","readonly");
			$("#updateinfo").css("display","block");
			$("#confirmupdate").css("display","none");
		}
		if(name=="box"||name=="box1"){
			$('.box').hide();
			$('.box_alterInfo').hide();
			$('.box_alterPsw').hide();
			$('.box_showrecords').hide();
		}
	})
	
	$('.x p').click(function(){
		$('.box').hide();
		$('.box_alterInfo').hide();
		$('.box_alterPsw').hide();
		$('.box_showrecords').hide();
		
	})
	
	$("#updateinfo").click(function(){
		$("#username").removeAttr("readonly");
		$("#sex").css("display","none");
		$("#radiosex").css("display","block");
		$("#email").removeAttr("readonly");
		$(this).css("display","none");
		$("#confirmupdate").css("display","block");
	});
	
});

function is_email(email){
	reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	if(email == ""){
		return false;
	}
	else if(! reg.test(email)) {
		return false;
	}
	return true;
};