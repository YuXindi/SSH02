// JavaScript Document
	
	function showTips(spanId, tips) {
		var span = document.getElementById(spanId);
		span.innerHTML = tips;
	}
//头像
	function photo() {
		var value = document.getElementById("avatar").value;
		var hint = document.getElementById("photoError");
		if(!value) {
			hint.innerHTML = "请上传图片作为您的账号头像!";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}	
	
	/**
	 * 校验用户名
	 */
	function hint() {
		var value = document.getElementById("username").value;
		var hint = document.getElementById("usernameError");
		if(value.length > 16 || value.length==0) {
			hint.innerHTML = "请输入长度不大于16的用户名!";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	 
	/**
	 * 校验密码
	 */
	 
	function checkPass() {
		var value = document.getElementById("password").value;
		var hint = document.getElementById("passwordError");
		var ls=0; 
		if(value.match(/([a-zA-Z])+/)){  ls++; }  
		if(value.match(/([0-9])+/)){  ls++; }  				
		if(ls<2 || value.length<8 || value.length>16) {
			hint.innerHTML = "请输入由字母和数字组合的8-16位密码！";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	 

	/***
	 * 确认密码的校验
	 */
	function checkPassPass() {
		var papavalue = document.getElementById("password2").value;
		var value = document.getElementById("password").value;
		var papahint = document.getElementById("password2Error");
		if(papavalue != value) {
			papahint.innerHTML = "两次密码不一致!";
			return false;
		} else {
			papahint.innerHTML = "";
			return true;
		}
	}
	 
	
	/**
	 * 校验手机号
	 */
	function checkMobile( strMobile )
	{	//13588888888
	    var regu = /^[1][3456789][0-9]{9}$/;
	    var re = new RegExp(regu);
	    if (re.test(strMobile)) {
	        return true;
	    }
	    else {
	        return false;
	    }
	};
	function phoneCheck() {
		var phone = document.getElementById("phone").value;
		var phone_hint = document.getElementById("phoneError");
		var phoneFlag = checkMobile(phone);
		if(phoneFlag) {
			phone_hint.innerHTML = "";
			return true;
		} else {
			phone_hint.innerHTML = "请输入格式为11位数字的手机号！";
			return false;
		}
	}
	 

	 
	/**
	 * 校验邮箱
	 */
	function checkEmail(strEmail) 
	{      
	    var emailReg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	    if ( emailReg.test(strEmail) ) {
	        return true;
	    }
	    else {
	        return false;
	    }
	};
	function emailCheck() {
		var emailValue = document.getElementById("email").value;
		var email_hint = document.getElementById("emailError");
		var emailFlag = checkEmail(emailValue);
		if(emailFlag) {
			email_hint.innerHTML = "";
			return true;
		} else {
			email_hint.innerHTML = "请输入正确的邮箱地址！";
			return false;
		}
	}
//同意协议	 
    function selectAll() {  
        var names = document.getElementById("myAccept");                             
        var myAcceptError = document.getElementById("myAcceptError");
        	if(names.checked){
        		return true;
        		
        	 } else{
        		 myAcceptError.innerHTML = "请先接受《轻听音乐网络服务使用协议》 ！";
        		 return false;
        	 }
        
    }  
	
	function check() {
		var f1 = emailCheck();
		var f2 = checkPass();
		var f3 = checkPassPass();
		var f4 = hint();
		var f5 = phoneCheck();
		var f6 = selectAll();
		var f7 = photo();
		var allFlag = f1 && f2 && f3 && f4 && f5 && f6 && f7;
		
		return allFlag;
	}
	function checkXg() {
		var f1 = emailCheck();
	
		var f2 = phoneCheck();
	
		var allFlag = f1 && f2 ;
		
		return allFlag;
	}
	