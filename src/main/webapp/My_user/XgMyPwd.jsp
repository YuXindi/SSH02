<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>更改密码</title>

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
			   	   <a href="findHistory_" ><img class="mypicture" src="<s:property value="#session.photo"/>" ></a>
			       <ul>
			           <li  ><a href="My_user/main.jsp" >查看信息</a></li>
			           <li  ><a href="exitLogin" >退出登录</a></li>
			       </ul>
		       </li>
	    	</ul>
		

    </div>
  </div>
  

  <div class="main" style="z-index:0;">
  	<div class="null_l" style="width:19.85%;"></div>
    <div class="left" style="width:59.85%;">

		<form  action="XgMyPwd" method="post">
		    <div class="kind" style="height:60px;"><br />&nbsp;&nbsp;&nbsp;&nbsp;
	        	<span style="font-size:25px;">更改我的密码</span>
	        </div>	
			<table  border="0" style="margin-left:200px;margin-top:100px;">
				<tr style="height:45px;">		
					<td style="width:10px;">旧密码：</td>
					<td style="width:350px;"><input type="password"  class="xg" name="oldPwd" >	
					<br><span class="span1"><s:fielderror fieldName="oldPwdError"/></span></td>				
				</tr>

				<tr style="height:45px;">		 
					<td>新密码：</td>
					<td><input type="password" name="newPwd" class="xg" >
					<br><span class="span1"><s:fielderror fieldName="newPwdError"/></span></td>
				</tr>
				<tr style="height:45px;">		 
					<td>确认密码：</td>
					<td><input type="password" name="newPwd2" class="xg" >
					<br><span class="span1"><s:fielderror fieldName="newPwd2Error"/></span></td>					
				</tr>	
					
				<tr style="height:100px;">
					<td> <input type="submit" class="xgButton" value="保存" > </td>
					<td> <input type="reset" class="xgButton" value="重置" > </td>
				</tr>
		
			</table>
		</form>
		
    	<s:debug></s:debug>
		
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
  
  <script type="text/javascript">
	var aLink=document.getElementsByTagName('a');
	for(var i=0;i<aLink.length;i++)
	{
		aLink[i].target='_self';
	}
  </script>
  
  </body>
</html>
