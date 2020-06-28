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
    <base href="<%=basePath%>">
    
    <title>注册成为轻听音乐人</title>
	<link type="text/css" rel="stylesheet" href="css/share.css" />
	<link type="text/css" rel="stylesheet" href="css/register.css" />	
	<link type="text/css" rel="stylesheet" href="css/My_user.css" />

	<script type="text/javascript" src="js/artist.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#avatsel").click(function(){
                $("input[type='file']").trigger('click');
            });
            $("#avatval").click(function(){
                $("input[type='file']").trigger('click');
            });
            $("input[type='file']").change(function(){
                $("#avatval").val($(this).val());
            });
        });
        
	    function showImg(input) {
	        var file = input.files[0];
	        var reader = new FileReader()
	        // 图片读取成功回调函数
	        reader.onload = function(e) {
	            document.getElementById('upload').src=e.target.result;
	        }
	        reader.readAsDataURL(file);
	    }
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
    	<div class="main">
        	<div class="welcome">&nbsp;&nbsp;欢迎成为轻听音乐人&nbsp;!</div>
            <div class="register">
            <form  action="artistRegister" method="post" enctype="multipart/form-data" onsubmit="return check()">
            	<table border="0">
                    <tr>
                      <td class="left">用户名：</td>
                      <td class="right"><input type="text" name="artist.username" readonly="true" value=<s:property value="#session.username"/> >&nbsp;&nbsp;</td>
					  <td> 艺人图片：<br/><span class="error" id="artphotoError"></span></td>
                    </tr>
                  
                    <tr>
                      <td class="left">艺人名：</td>
                      <td class="right"><input type="text"  name="artist.artname"  id="artname" onfocus="showTips('artnameError','请输入艺人名!')"  onblur="artnameC()" />
                      <br/><span class="error" id="artnameError"></span></td>

                      <td rowspan="4" style="text-align:center;">  
                      	  <a href="javascript:void(0);" id="avatsel" ><img src="images/pleaseUp.png"  id="upload"  style="width:180px; height:180px;"/></a>  <br/><br/>             					
						  <input type="text" id="avatval" placeholder="请上传您的艺人图片···" readonly="readonly" style="vertical-align: middle;"/>
			              <input type="file" name="artphoto" id="avatar" class="photo" onchange="showImg(this)"/><br/><br/>	         	            													  				
                      </td>
                    </tr>                 

					<tr >		 
						<td class="left">艺人身份：</td>
						<td class="right">
							<input type="radio" name="artist.identity" value="原创"  > 原创 &nbsp;
							<input type="radio" name="artist.identity" value="演唱"  > 演唱
						</td>
						
					</tr>

					<tr >		 
						<td class="left">流派风格：</td>
						<td class="right"><input type="text" name="artist.style"  id="style" onfocus="showTips('styleError','请输入您的流派风格!')"  onblur="styleC()" >
						<br/><span class="error" id="styleError"></span></td>
						
					</tr>
				
					<tr >		 
						<td class="left">所属公司/厂牌：</td>
						<td class="right"><input type="text" name="artist.company"  id="company" onfocus="showTips('companyError','请输入所属公司!')"  onblur="companyC()" >
						<br/><span class="error" id="companyError"></span></td>
						
					</tr>				
					<tr >		 
						<td class="left">介绍：</td>
						<td class="right"><textarea cols="30" rows="8" name="artist.artins" id="artins" onfocus="showTips('artinsError','请输入您的介绍!')"  onblur="artinsC()"> </textarea>
						<br/><span class="error" id="artinsError"></span></td>
					</tr>					
                  
                  	<tr>
	                    <td class="left">&nbsp;</td>
	                    <td class="right"><input type="checkbox" id="myAccept" /><span class="">&nbsp;&nbsp;我已阅读并接受<a href="" class="a2">《轻听音乐人网络服务使用协议》</a></span>
	                    <br/><span class="error" id="myAcceptError"></span></td>
                    </tr>
                    <tr>
	                    <td class="left">&nbsp;</td>
	                    <td class="right" style="text-align:right;"><input type="submit" style="width:190px; height:40px; font-size:20px"value="立即注册" /></td>
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
        	<a href="resume.html" class="a2">软工1702</a>（轻听公司）版权所有©1997-2019<br /><br />
			违法和不良信息举报电话：0571-89853516 举报邮箱：ncm5990@lde.com
    	</p>
    </div>  </body>
</html>
