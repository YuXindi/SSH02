<%@ page language="java" import="java.util.*,java.io.*,javazoom.jl.player.Player" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Song_Playing.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%String songname=request.getParameter("songname");
     String filepath=request.getParameter("filepath");
        File file = new File("C:/Users/Eleven/Workspaces/MyEclipse 10/javaShixun/WebRoot"+filepath.trim()+songname.trim()+".mp3");
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream stream = new BufferedInputStream(fis);
		Player player = new Player(stream);
		player.play();
   
    %>
  </body>
</html>
