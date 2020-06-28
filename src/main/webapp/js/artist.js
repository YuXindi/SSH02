// JavaScript Document
	function showTips(spanId, tips) {
		var span = document.getElementById(spanId);
		span.innerHTML = tips;
	}
	
	function artnameC() {
		var value = document.getElementById("artname").value;
		var hint = document.getElementById("artnameError");
		if(!value) {
			hint.innerHTML = "请输入艺人名!";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	
	function companyC() {
		var value = document.getElementById("company").value;
		var hint = document.getElementById("companyError");
		if(!value) {
			hint.innerHTML = "请输入所属公司!";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	
	function styleC() {
		var value = document.getElementById("style").value;
		var hint = document.getElementById("styleError");
		if(!value) {
			hint.innerHTML = "请输入您的流派风格!";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	
	function artinsC() {
		var value = document.getElementById("artins").value;
		var hint = document.getElementById("artinsError");
		if(!value) {
			hint.innerHTML = "请输入您的介绍!";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	
	function artphotoC() {
		var value = document.getElementById("avatar").value;
		var hint = document.getElementById("artphotoError");
		if(!value) {
			hint.innerHTML = "请上传图片作为您的艺人头像!";
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}	

    function selectAllC() {  
        var names = document.getElementById("myAccept");                             
        var myAcceptError = document.getElementById("myAcceptError");
        	if(names.checked){
        		return true;
        		
        	 } else{
        		 myAcceptError.innerHTML = "请先接受《轻听音乐人网络服务使用协议》 ！";
        		 return false;
        	 }
        
    } 
	function check() {
		var f1 = artnameC();
		var f2 = companyC();
		var f3 = styleC();
		var f4 = artinsC();
		var f5 = artphotoC();
		var f6 = selectAllC();
	
		var allFlag = f1 && f2 && f3 && f4 && f5 && f6 ;
		
		return allFlag;
	}
	
	
	function nameC() {
		var value = document.getElementById("name").value;
		var hint = document.getElementById("nameError");
		if(!value) {
			
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	function ltC() {
		var value = document.getElementById("lt").value;
		var hint = document.getElementById("ltError");
		if(!value) {
		
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	function albumC() {
		var value = document.getElementById("album").value;
		var hint = document.getElementById("albumError");
		if(!value) {
			
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	function upSongC() {
		var value = document.getElementById("upSong").value;
		var hint = document.getElementById("upSongError");
		if(!value) {
			
			return false;
		} else {
			hint.innerHTML = "";
			return true;
		}
	}
	function checkUp() {
		var f1 = nameC();
		var f2 = ltC();
		var f3 = albumC();
		var f4 = upSongC();
	
		var allFlag = f1 && f2 && f3 && f4 ;
		
		return allFlag;
	}