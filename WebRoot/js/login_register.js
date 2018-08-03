$(function(){
	var num=1;
	var time=null;
	function change(){ //背景图片切换
		time=setInterval(function(){
			num++;
			if(num>2) num=1;
			var str=".bg"+num;
           $(str).fadeIn().siblings().fadeOut();
		},3000)
	}
	change();
	
	
	//验证邮箱
	$('#email').blur(function(){
		var email=$('#email').val();
		if(is_email(email)){
			$('.email_error').html("");
		}else{
			$('.email_error').html("电子邮箱格式不正确");
		}
		
	})
	
	function is_email(email){
		reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if(email == ""){
			return false;
		}
		else if(! reg.test(email)) {
			return false;
		}
		return true;
	}

})