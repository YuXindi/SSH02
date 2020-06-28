<%@ page language="java" import="java.util.*,java.io.*,javazoom.jl.player.Player" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored ="false" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Music_Playing</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body onload="onInputFileChange()">
  <%
    String musicplay1=(String) request.getSession(true).getAttribute("musicplay1");
	String musicplay2=(String) request.getSession(true).getAttribute("musicplay2");
	musicplay2=musicplay2.replace('/', ' ');
	
	String filePath=musicplay2.trim()+"/"+musicplay1.trim()+".mp3";
	
    System.out.println(filePath);
   %> 
     <audio id="audio_id" controls  autoplay="autoplay" loop >Your browser can't support HTML5 Audio</audio>  
	<script>  
	function onInputFileChange() {  
   		
  	 document.getElementById("audio_id").src ="<%=filePath%>";  
}  
</script>
  </body>

</html>
