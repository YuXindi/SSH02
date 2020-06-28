<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored ="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <base href="<%=basePath%>">
    <title>轻听音乐登录</title>
    <link rel="stylesheet" type="text/css" href="css/share.css" />
	<link type="text/css" rel="stylesheet" href="css/login.css" />
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
    	<div class="logo">
        	<a href="index.jsp" title="返回主页面"><img src="images/qingting_logo.PNG" /></a>
        </div>
        <div class="null1"></div>
        <div class="hrefs">
        	<br /><br />
        	<a href="email_login.html" title="免费邮箱">免费邮箱</a>&nbsp;|&nbsp;
            <a href="email_login.html" title="VIP邮箱">VIP邮箱</a>&nbsp;|&nbsp;
            <a href="email_login.html" title="企业邮箱">企业邮箱</a>      
        </div>
    </div>
	<div class="middle">	
    	<div class="main2">
        	<div class="welcome2"><br />轻听音乐登录</div>
            <div class="login">
            	<form action="login">
            		
            		<table border="0" style="margin-top:40px;">
            			<tr>
            				<td class="left">用户名：</td>
            				<td class="right"><input type="text"  name="user.username"  class="xg" /></td>
            			</tr>
            			<tr style="height:30px;">
            				<td></td>
            				<td class="right"><span class="span1"><s:fielderror fieldName="usernameError"/></span></td>          				
            			</tr>
            			<tr>
            				<td class="left"> 密码：</td>
            				<td class="right"><input type="password" name="user.password"  class="xg" /></td>
            			</tr>
            			<tr style="height:30px;">
            				<td></td>
            				<td class="right"><span class="span1"><s:fielderror fieldName="passwordError"/></span></td>          				
            			</tr>
            			<tr>
            				<td colspan="2">
            					<input type="checkbox" checked="checked" style="margin-left:80px;"/>&nbsp;自动登录
            					<input type="checkbox" checked="checked" style="margin-left:30px;"/>&nbsp;全程加密
            				</td>
            			</tr>
            			<tr style="height:40px;">
            				<td colspan="2" style="text-align: center;"><span style="text-align:right; "><a href="#" class="a2">忘记密码？</a></span></td>          				
            			</tr>
            			<tr>
            				<td colspan="2">
            					<input type="submit" value="登录" class="xgButton" style="margin-left:80px;"/>
            					<input type="button"style="margin-left:30px;" value="注册" onclick="javascrtpt:window.location.href='register.jsp'" class="xgButton" />
            				</td>
            			</tr>
            		</table>	            		              	               
	               
            	</form>
            </div>
        	
        </div>
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
        	<a href="resume.html" class="a2">软工1702-于新迪-20172202983</a>（轻听公司）版权所有©1997-2019<br /><br />
			违法和不良信息举报电话：0571-89853516 举报邮箱：ncm5990@lde.com
    	</p>
    </div>
  </body>
</html>
