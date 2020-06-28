<%@ page language="java" import="java.util.*,java.sql.*,com.ldu.model.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page isELIgnored ="false" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>" />
    
    <title>音乐人中心</title>

    <link rel="stylesheet" href="css/share.css" />
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" href="css/My_user.css" />
	<link rel="stylesheet" href="css/song_list.css" />
	<link rel="stylesheet" href="css/artist.css" />
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
	<script>
 	 var errorMsg="${requestScope.errorMessage}";
  		if(errorMsg!=""){
   				 alert(errorMsg);
 			 }
    </script>
    
    <script>
 	 var errorlikeMsg="${requestScope.errorlikeMsg}";
  		if(errorlikeMsg!=""){
   				 alert(errorlikeMsg);
 			 }
    </script>
    
    <script>
 	 var errorddMessage="${requestScope.errorddMessage}";
  		if(errorddMessage!=""){
   				 alert(errorddMessage);
 			 }
    </script>
	<script>
	    $(function(){
	        $('.has_menu').hover(function(){
	        $(this).find('ul').slideDown("1500");
	    },function(){
	        $(this).find('ul').slideUp("fast");
	    });
	    })
	    
	</script>  
    
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

  <div class="top">
  	<div class="logo"><a href="index.jsp" title="返回主页面"><img src="images/qingting_logo.PNG" /></a></div>
    <div class="navigation">
      <ul>
        <li><a href="findHistory_">我的音乐</a></li>
        <li class="has_menu"><a href="#">发现音乐</a>
          <ul>
            <li><a href="#">排行榜</a></li>
            <li><a href="#">歌单</a></li>
            <li><a href="#">歌手</a></li>
            <li><a href="#">电台</a></li>
          </ul>
        </li>
        <li><a href="#">朋友</a></li>
        <li class="has_menu"><a href="#">商城</a>
          <ul>
            <li><a href="#">充值会员</a></li>
            <li><a href="#">购买歌曲</a></li>
            <li><a href="#">购买专辑</a></li>
          </ul>
        </li>
        <li><a href="#">音乐人</a></li>
        <li><a href="http://y.qq.com/download/qt.html?part=1&adtag=yqq" title="轻听音乐app下载">下载客户端</a></li>
      </ul>
    </div>
     <div class="search">
      <form class="search"  action="searchfind">
         <input name="searchvalue" class="search" type="text" placeholder="请输入歌曲...">
         <button type="submit"></button>
      </form>
    </div>
    <div class="r_l">
		
	        <ul>
		       <li class="has_menu navigation">
			   	   <a href="My_user/main.jsp" ><img class="mypicture" src="<s:property value="#session.photo"/>" ></a>
			       <ul>
			           <li  ><a href="findHistory_" >查看信息</a></li>
			           <li  ><a href="exitLogin" >退出登录</a></li>
			       </ul>
		       </li>
	    	</ul>

    </div>
  </div>
  

  <div class="main" style="z-index:0;">
  	<div class="null_l" style="width:19.85%;"></div>
    <div class="left" style="width:59.85%;">
				
			<div class="artist_info">
				<div class="my_xg" style="margin-top:10px;margin-left:650px;">
					<a class="a_my_xg" href="toUploadWork">上传我的作品</a>
				</div>
				
				<table border="0" style="margin-left:200px;margin-top:5px;">
					<tr>
						<td rowspan="4" style="width:220px;"><img src="<s:property value="#session.artphoto"/>" style="width:160px; height:160px;"/></td>
						
						<td style="font-size:20px; color:#999; ">艺人名：<s:property value="#session.artname"/></td>
					</tr>
					<tr>
						<td style="font-size:20px; color:#999; ">歌手类型：<s:property value="#session.identity"/></td>
					</tr>
					<tr>
						<td style="font-size:20px; color:#999; ">歌曲流派风格：<s:property value="#session.style"/></td>
					</tr>
					<tr>
						<td style="font-size:20px; color:#999; ">艺人简介：<s:property value="#session.artins"/></td>
					</tr>					
				</table>
			</div>
			<div class="artist_work">
			    <div class="kind" style="margin-left:100px; width:663px;"><br />&nbsp;&nbsp;&nbsp;&nbsp;
	            	<span style="font-size:20px;">已发布的歌曲</span>&nbsp;&nbsp;&nbsp;&nbsp;
	            </div> 
	           <table class="listtablee" style="font-size: 12px; margin-left:100px;" border="1" bordercolor="#DDD" cellspacing="0">
        	
	              <tr background="images/tshow1.jpg"  height="40px">
	                <td width='100px'colspan="3"></td>
	                <td width='250px'>歌曲标题</td>
	                <td width='100px'>时长</td>
	                <td width='100px'>歌手</td>
	                <td width='100px'>专辑</td>
	              </tr>
	              <% 
	              ArrayList<Song> song_lists=new ArrayList<Song>();
	    	      song_lists=(ArrayList)session.getAttribute("workList");  
	    	     String username=(String)session.getAttribute("username"); 
	        
	              int i=0;
				for(Song sl:song_lists){
			     i++;
			      int no=sl.getNo();
			      String name=sl.getName();
			      String len_time=sl.getLenTime();
			      String singer=sl.getSinger();
			      String album=sl.getAlbum();
			      String filepath=sl.getPath();
			      String filename=name.trim()+".mp3";
			    	      
	        %>
	              <tr height="25px" bgcolor="#DDD">
	               <td style="border-right-style: none;"><%=i%></td>
	               <!-- 播放 看我看我看我 -->
	               <td align="center" width="20px" style="padding-bottom:10px;border-left-style: none;border-right-style: none;" >
	                 
	    			 <a  href="insert_recentsong.action?FileName=<%=filename%>&songname=<%=name%>&filePath=<%=filepath%>" target="_blank" title="播放">
	                     <div id="playBtn" class="circle" >
	                        <div class="circle_inner_play" ></div>
	                     </div>
	                	</a>
				
	              </td>
	              <td align="center" width="30px" height="25px" style="padding-top:13px;border-left-style: none;" >
	                  <a href="downloadMusic.action?FileName=<%=filename%>&songname=<%=name%>&filePath=<%=filepath%>" title="下载" ><div class="download"></div></a>
	              </td>
	              <td><a href=""><%=name %></a></td>
	              <%--<%
	              	Connection conn;
	                PreparedStatement stmt;
	                ResultSet rs;
	                String sql="select * from my_like where username='"+username+"' and song='"+name+"'";
	                conn=DBConn.getConnection();
			 	    stmt=conn.prepareStatement(sql);
			 	    rs=stmt.executeQuery();
	    	       
	    	        if(rs.next()){
	               %>--%>
					  <%
						  ArrayList<Song> likeList=new ArrayList<Song>();
						  likeList = (ArrayList)session.getAttribute("likeList");

						  Song thisSong = new Song(name);
						  if(likeList!=null && likeList.contains(thisSong)){
					  %>
	              <td><div class="like_be">
	              					<div class="ss"><%=len_time %></div>
	              					<a href="delete_myfavorite?favorite=<%=name%>&zszl=6" title="删除"><div class="heart1"></div></a>
	                 </div>
	              	 
	              </td>
	              <%}else{ %>
	               <td><div class="like_be">
	              					<div class="ss"><%=len_time%></div>
	              					<a href="insert_favorite_song?songname=<%=name%>&zszl=6" title="收藏"><div class="heart"></div></a>
	              					
	              	 </div>	 
	              </td>
	              <% }%>
	              <td><a href=""><%=singer %></a></td>
	              <td><a href=""><%=album%></a></td>
	              </tr>
	           
	           
	            <%
	                
	            } %>
            </table>  
			  				
			</div>
			
		
    </div>
   
    <div class="null_r" style="width:20%;"></div>
    
  </div>
  
  <div class="bot">
  	<p style="font-size:12px; color:#999; text-align:center;">
    <br /><br />
  		<a href="#" class="a2">关于轻听</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="#" class="a2">客户服务</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="#" class="a2">服务条款</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="#" class="a2">隐私政策</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="#" class="a2">版权投诉指引</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="#" class="a2">意见反馈</a><br /><br />
        <a href="resume.html" class="a2">软工1702</a>（轻听公司）版权所有©1997-2019<br /><br />
		违法和不良信息举报电话：0571-89853516 举报邮箱：ncm5990@lde.com
    </p>
    <s:debug/>
  </div>
  
 
  
  </body>
</html>
