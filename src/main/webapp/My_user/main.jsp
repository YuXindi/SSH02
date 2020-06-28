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
	<base href="<%=basePath%>">
    <title>我的音乐</title>
    <base target="_self" />
    <link rel="stylesheet" href="css/share.css" />
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" href="css/My_user.css" />
	<link rel="stylesheet" href="css/song_list.css" />
	<link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
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
		<div class="my_l">
    		<div class="kind"><br />&nbsp;&nbsp;&nbsp;&nbsp;
	        	<span style="font-size:20px;">我的歌单</span>
	        </div>			
			<!-- 我的歌单 -->
			<table style="font-size: 12px;" border="1" bordercolor="#DDD" cellspacing="0">        
				<s:iterator value="#session.songListList" status="st1" >	    	
				    <tr <s:if test="#st1.even">bgcolor="#DDD"</s:if>  style="height:25px;">
					    <td style="width:50px;"><s:property value="#st1.count"/></td>	    				  		    		   
					    <td style="width:250px;">
					    <div class="delete_be">
					      <a  href="find_songlist?slname=<s:property />" ><s:property /></a>
					      <div class="delete_a"><a href="delete_mylist?songlist=<s:property />" class="close"></a></div>
					    </div>
					   </td>
				    </tr>	    	
				</s:iterator> 	
			</table>
		</div>
		<div class="my_r">
			<div class="my_info">
				<div class="my_xg" style="margin-top:10px;margin-left:350px; float:left;">
					<a class="a_my_xg" href="toXgMyInfo">编辑个人资料</a>
				</div>
				<div class="my_xg" style="margin-top:10px;margin-left:50px; margin-bottom:30px;float:left;">
					<a class="a_my_xg" href="toXgMyPwd">更改我的密码</a>
				</div>
				<table border="0" style="margin-left:50px;margin-top:0px;">
					<tr>
						<td rowspan="4" style="width:200px;"><img src="<s:property value="#session.photo"/>" style="width:160px; height:160px;"/></td>
						
						<td style="font-size:20px; color:#999; ">用户名：<s:property value="#session.username"/></td>
					</tr>
					<tr>
						<td style="font-size:20px; color:#999; ">手机号码：<s:property value="#session.phone"/></td>
					</tr>
					<tr>
						<td style="font-size:20px; color:#999; ">我的邮箱：<s:property value="#session.email"/></td>
					</tr>
					<tr>
						<td style="font-size:20px; color:#999; ">介绍：<s:property value="#session.ins"/></td>
					</tr>					
				</table>
			</div>
		<div class="my_history">
			    <div class="kind"><br />&nbsp;&nbsp;&nbsp;&nbsp;
	            	<span style="font-size:20px;">最近在听</span>&nbsp;&nbsp;&nbsp;&nbsp;
	            </div> 
	            
			    <table style="font-size: 12px;" border="1" bordercolor="#DDD" cellspacing="0" class="listtablee">
			    	<tr background="images/tshow1.jpg"  height="40px">
			    		<td  style="width:100px;" colspan="3" ></td>
			    		<td  style="width:250px;">歌曲标题</td>
			    		<td  style="width:100px;">时长</td>
			    		<td  style="width:100px;">歌手</td>
			    		<td  style="width:100px;">专辑</td>
			    	</tr> 
			    	 <% 
              List<Song> song_lists=new ArrayList<Song>();
    	      song_lists=(ArrayList)session.getAttribute("historyList");  
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
		    	      
        %><tr height="25px" bgcolor="#DDD">
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
              <td><a href=""><%=name%></a></td>
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
             
              	<td><div class="recentf">
					    <div class="recentl" style="color: #999;"><%=len_time %></div>
					    <div class="recentcc"><a href="delete_myfavorite?favorite=<%=name%>&zszl=0" title="不喜欢"><div class="heart1" style="margin-left: -1px;"></div></a></div>
					    <div class="delete_re"><a href="delete_myrecent?recent=<%=name%>" class="close" ></a></div>
					</div>
				 </td>
              
              
              <%}else{%>
              <td> <div class="recentf">
				        <div class="recentl" style="color: #999;"><%=len_time %></div>
					    <div class="recentcc" ><a href="insert_favorite_song?songname=<%=name%>&zszl=4" title="喜欢"><div class="heart" ></div></a></div>
					    <div class="delete_re"><a href="delete_myrecent?recent=<%=name%>" class="close" ></a></div>
					</div>
				 </td>
              
              <% }%>
              <td><a href=""><%=singer %></a></td>
              <td><a href=""><%=album%></a></td>
              </tr>
           
           
            <%
                
            } 
            
            %>
			  	</table><br>
			</div>
			
			<div class="my_like">
			    <div class="kind"><br />&nbsp;&nbsp;&nbsp;&nbsp;
	            	<span style="font-size:20px;">我喜欢听</span>&nbsp;&nbsp;&nbsp;&nbsp;
	            </div> 
			    <table style="font-size: 12px;" border="1" bordercolor="#DDD" cellspacing="0">    
			    	<tr background="images/tshow1.jpg"  height="40px">
			    		<td  style="width:100px;" colspan="3" ></td>
			    		<td  style="width:250px;">歌曲标题</td>
			    		<td  style="width:100px;">时长</td>
			    		<td  style="width:100px;">歌手</td>
			    		<td  style="width:100px;">专辑</td>
			    	</tr>            
				    <s:iterator value="#session.likeList" status="st1" >	    	
				    		<tr  style="height:25px;" <s:if test="#st1.even">bgcolor="#DDD"</s:if>>
					    		<td style="border-right-style: none;"><s:property value="#st1.count"/></td>			    		
               					<td align="center" width="20px" style="padding-bottom:10px;border-left-style: none;border-right-style: none;" >
					                <a href="insert_recentsong.action?songname=<s:property value="name"/>&filePath=<s:property value="path"/>"  target="_blank" title="播放">
					                    <div id="playBtn" class="circle" >
					                        <div class="circle_inner_play" ></div>
					                    </div>
					                </a>
					            </td>
					            <td align="center" width="30px" height="25px" style="padding-top:13px;border-left-style: none;" >
					                <a href="downloadMusic.action?FileName=<s:property value="name"/>.mp3&songname=<s:property value="name"/>&filePath=<s:property value="path"/>" >
					                	<div class="download"></div></a>
					            </td>	    				  		    		   
					    		<td><a href=""><s:property value="name"/></a> </td>
					    		<td>
					    		<div class="like_be">
              					<div class="ss"><s:property value="lenTime"/></div>
              					<a href="delete_myfavorite?favorite=<s:property value="name"/>&zszl=0" title="删除"><div class="heart1"></div></a>
              			        </div>
					    		
					            </td>
					    		<td><a href=""><s:property value="singer"/></a> </td>
					    		<td><a href=""><s:property value="album"/></a> </td>
				    		</tr>	    	
				    </s:iterator> 	
			  	</table><br>				
			</div>
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
