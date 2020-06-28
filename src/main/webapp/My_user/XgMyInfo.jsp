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
    
    <title>修改个人信息</title>

    <link rel="stylesheet" href="css/share.css" />
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" href="css/My_user.css" />
	<link rel="stylesheet" href="css/song_list.css" />
	<script type="text/javascript" src="js/register.js?ver=1"></script>
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

		<form  action="updateUser" method="post" enctype="multipart/form-data" onsubmit="return checkXg()">
		    <div class="kind" style="height:60px;"><br />&nbsp;&nbsp;&nbsp;&nbsp;
	        	<span style="font-size:25px;">个人信息设置</span>
	        </div>	
			<table  border="0" style="margin-left:50px;margin-top:50px;">
				<tr style="height:60px;">		
					<td style="width:10px;">用户名：</td>
					<td ><input type="text"  class="xg" name="user.username"  readonly="true" value=<s:property value="#session.username"/> ></td>
					<td rowspan="2"> <img src="<s:property value="#session.photo"/>" style="width:180px; height:180px;margin-left:50px;"/></td>
				</tr>
				<tr style="height:60px;">		 
					<td>介绍(选填)：</td>
					<td><textarea cols="30" rows="8" name="user.ins" style="border: 2px solid #c2c2d6; "><s:property value="#session.ins"/> </textarea></td>
				</tr>
				<tr style="height:60px;">		 
					<td>手机号码：</td>
					<td><input type="text" name="user.phone" class="xg"  value=<s:property value="#session.phone"/>  id="phone" onfocus="showTips('phoneError','请输入格式为11位数字的手机号！')"  onblur="phoneCheck()">
					<br/><span class="error" id="phoneError"></span></td>
					<td>
						<div class="my_xg" style="margin-top:0px;margin-left:55px;width:130px;height:30px;">
							<a class="a_my_xg" href="toXgMyPhoto" style="line-height:30px;">更换头像</a>
						</div>
					</td>
				</tr>
				<tr style="height:60px;">		 
					<td>电子邮箱：</td>
					<td><input type="text" name="user.email" class="xg"  value=<s:property value="#session.email"/>  id="email" onfocus="showTips('emailError','请输入正确的邮箱地址！')"  onblur="emailCheck()">
					<br/><span class="error" id="emailError"></span></td>
					
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
