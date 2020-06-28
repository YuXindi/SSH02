<%@ page language="java" import="java.util.*,java.sql.*,com.ldu.model.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <base href="<%=basePath%>">
    <title>轻听音乐</title>
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
   <!--二级菜单-->
    <div class="navigation">
      <ul>   <s:if  test="#session.username!=null" >  </s:if><s:else>   </s:else>  
        <li>
        	<s:if  test="#session.username!=null" >
        		<a href="findHistory_">我的音乐</a>
        	</s:if><s:else>
        		<a href="login.jsp">我的音乐</a>
        	</s:else> 
        </li>
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
    <!--列表栏下的搜索 -->
    <div class="search">
      <form class="search"  action="searchfind">
         <input name="searchvalue" class="search" type="text" placeholder="请输入歌曲...">
         <button type="submit"></button>
      </form>
    </div>
   
    <!--用户登录注册 -->
    <div class="r_l">
                                          
		<s:if  test="#session.username!=null" >
	        <ul>
		       <li class="has_menu navigation">
			   	   <a href="My_user/main.jsp" ><img class="mypicture" src="<s:property value="#session.photo"/>" ></a>
			       <ul>
			           <li  ><a href="findHistory_" >查看信息</a></li>
			           <li  ><a href="exitLogin" >退出登录</a></li>
			       </ul>
		       </li>
	    	</ul>
		</s:if><s:else>
	        <a href="login.jsp" style="line-height:80px;">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        <a href="register.jsp" style="line-height:80px;">注册</a>
		</s:else> 

   
    </div>
  </div>
  <!--轮播图  -->
  <div class="rpm">
    <div id='container'>
    	<ul id='photos'><!--轮播图 图片 -->
            <li class='pictures' id='black' style='z-index: 2;'><img src='images/rpm1.PNG' width="1030px" height="350px" /></li>
            <li class='pictures' id='#FC9'><img src='images/rpm2.PNG' width="1030px" height="350px" /></li>
            <li class='pictures' id='#0CF'><img src='images/rpm3.PNG' width="1030px" height="350px" /></li>
            <li class='pictures' id='pink'><img src='images/rpm4.PNG' width="1030px" height="350px" /></li>
            <li class='pictures' id='purple'><img src='images/rpm5.PNG' width="1030px" height="350px" /></li>
            <li class='pictures' id='#ff9933'><img src='images/rpm6.PNG' width="1030px" height="350px" /></li>
            <li class='pictures' id='#cce5ff'><img src='images/rpm7.PNG' width="1030px" height="350px" /></li>
            <div id='arrows'>
                <span class='arrow'><</span>
                <span class='arrow' style="float: right;">></span>
            </div>
         </ul>
     </div>
     <div id='buttons'><!--轮播图 小圆点 -->
         <span class='button' style='background-color:#3FC;'></span>
         <span class='button'></span>
         <span class='button'></span>
         <span class='button'></span>
         <span class='button'></span>
         <span class='button'></span>
         <span class='button'></span> 
     </div>
  </div>
  <!--轮播图设置 -->
  <script>
	var count = 0;  //定义图片变更次数
	var FI=null; //存储淡入interval循环
	var timer=null;//存储轮播interval循环
    var fullBox = document.getElementById('container');//用于设置背景颜色
    var pictures=document.getElementsByClassName('pictures');//存储图片
    var arrow=document.getElementsByClassName('arrow');//存储左右箭头
    var button=document.getElementsByClassName('button');//存储下部圆圈
    var percent = 0;//淡入循环变量
    function fadeIn(){//淡入函数
        FI = setInterval(function (){
        	percent += 0.010000; //精确浮点数精度
            if(percent>=1){
				clearInterval(FI);
			}
            else{
            	pictures[count].style.opacity=percent;
			}
		},10);
		percent = 0;
	}
    function pic(){//图像变换函数
    	for(var i=0;i<pictures.length;i++){
        	pictures[i].style.opacity=0;
		}//所有图片透明

        fullBox.style.backgroundColor = pictures[count].id//背景图片颜色等于相应图片的id
		
        for(var c=0;c<button.length;c++){//底部按钮颜色变化
            button[c].style.backgroundColor = 'grey';
        }
            button[count].style.backgroundColor='#3FC';    
	}  
    //主轮播循环
    showtime();
    function showtime(){
		timer=setInterval(show,3000);
	}
    function show(){//轮播循环函数
                count ++;
                if(count > pictures.length - 1){
                count = 0;};
                fadeIn();               
                pic();
            }
            
            //左右箭头
            for(var i=0;i<arrow.length;i++){
                arrow[i].onmouseover=function(){
                    clearInterval(timer);
                };
                arrow[i].onmouseout=function(){
                    showtime();
                };
                arrow[i].onclick=function(){
                    if(this.title == 'left'){
                        count--;
                        if(count < 0){count = pictures.length - 1;}
                    }else{
                        count++;
                        if(count>pictures.length - 1){count = 0;}
                    };
                fadeIn();
                pic();
                }
            }
            //底部圆点
            for(var i=0;i<button.length;i++){
                button[i].index = i;
                button[i].onmouseover=function(){
                    clearInterval(timer);
                    count = this.index;//确保count值不会出错
                    fadeIn();
                    pic();
                };
                button[i].onmouseout=function(){showtime()};
                }
        </script>

  <div class="main">
  	<div class="null_l"></div>
    <div class="left">
    	<div class="recom">

        	<div class="kind"><br />&nbsp;&nbsp;&nbsp;&nbsp;
            	<span style="font-size:20px;">热门推荐</span>&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="#" class="a1">华语</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#" class="a1">流行</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#" class="a1">摇滚</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#" class="a1">民谣</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#" class="a1">电子</a>
            </div>


            <table border="0" cellspacing="13px" >
                <%
                    ArrayList<Songlist> ssl=new ArrayList<Songlist>();
                    ssl=(ArrayList)session.getAttribute("allSonglist");

                    int i=0;
                    for(Songlist sl:ssl){
                        i=i+1;
                        String name=sl.getListName();
                        String cover=sl.getCover();
                        String introdu=sl.getIntrodu();
                        String coverimg=cover+name+".jpg";

                        if( (i-1) %4 ==0 ){
                %>
                <tr>              <%} %>
                    <td style="width:150px; height:200px;">

                        <div   class="demo">
                            <div class="iii" >
                                <img width="150px" height="150px" src="<%=coverimg%>" class="bigger" style="border:1px solid #CCC;" />
                            </div>
                            <div class="mask">
                                <div class="right_r">
                                    <a href="find_songlist?slname=<%=name%>" class="cc"  >
                                        <div id="playBtn1" class="circle1" >
                                            <div class="circle_inner_play1" ></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <p style="padding-top: 10px;"><a href="find_songlist?slname=<%=name%>" class="a1"><%=name%></a></p>
                    </td>

                    <%if(i%4 ==0 ){%>
                </tr>
                <%} %>
                <%} %>

            </table>
		</div>
        <div class="ranks">
        	<div class="kind"><br />&nbsp;&nbsp;&nbsp;&nbsp;
            	<span style="font-size:20px;">轻听音乐榜单</span>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="rrr">
            <table border="1px" bordercolor="#CCCCCC" background="images/bg.PNG" cellspacing="0">
              <tr>
                <td style="width:250px; height:150px;"><img src="images/rank1.PNG" /></td>
                <td style="width:250px; height:150px;"><img src="images/rank2.PNG" /></td>
                <td style="width:250px; height:150px;"><img src="images/rank3.PNG" /></td>
              </tr>
              <tr>
                <td style="width:250px; height:40px;"><a href="#" class="a1">木偶人</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">得不到你</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">暖一杯茶</a></td>
              </tr>
              <tr>
                <td style="width:250px; height:40px;"><a href="#" class="a1">Un-Oh</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">祝你爱我到天荒地老</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">你们俩</a></td>
              </tr>
              <tr>
                <td style="width:250px; height:40px;"><a href="#" class="a1">Yellow</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">孤身</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">庸人</a></td>
              </tr>
              <tr>
                <td style="width:250px; height:40px;"><a href="#" class="a1">Don't Check On Me</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">这一生关于你的风景</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">解药</a></td>
              </tr>
              <tr>
                <td style="width:250px; height:40px;"><a href="#" class="a1">失眠飞行</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">你曾是少年</a></td>
                <td style="width:250px; height:40px;"><a href="#" class="a1">三个</a></td>
              </tr>
              <tr>
                <td style="width:250px; height:40px; text-align:right;"><a href="#" class="a2">查看全部></a>&nbsp;&nbsp;</td>
                <td style="width:250px; height:40px; text-align:right;"><a href="#" class="a2">查看全部></a>&nbsp;&nbsp;</td>
                <td style="width:250px; height:40px; text-align:right;"><a href="#" class="a2">查看全部></a>&nbsp;&nbsp;</td>
              </tr>
            </table>
			</div>
        </div>
    </div>
    <div class="right">
        
        <s:if  test="#session.username!=null" ><!-- 处于登录状态 -->
          <div class="kind"><br />&nbsp;&nbsp;&nbsp;&nbsp;
           <span style="font-size:20px;">个人信息</span>&nbsp;&nbsp;&nbsp;&nbsp;
         </div>
          <div class="myinfoo">
    		<table border="0" cellpadding="0" cellspacing="0">
    		  	<tr>
                    <td rowspan="4" style="padding: 20px;">
    		            <div class="myimgg"><img  width="140px" height="140px" src="<s:property value="#session.photo"/>"/></div>
                    </td>
    		       <td  height="90px"></td>
                </tr>
	     		 <tr><td width="100px;" height="30px"><span style="font-size: 12px;color: #999;">昵称：</span><s:property value="#session.username"/></td></tr>
	     		 <tr><td  style="color: #999;font-size: 12px;"><s:property value="#session.ins"/></td></tr>
	     		 <tr><td   height="30px" ></td></tr>
    		</table>
    		<br><br>
          </div>
    	</s:if><s:else>
        		<div style="width:100%;height: 150px; ">
        		
        		<pre style="font-size: 16px;color: #333;">        
        
         想要获取更多资讯？
         
         登录 发现更大世界吧！
          </pre>     <div class="my_xg1" style="margin-top:5px;margin-left:110px;">
					<a class="a_my_xg1" style="color: #FFFFFF;" href="login.jsp">登录</a>
				    </div> 
        		</div>
        </s:else> 
        
        <div class="kind"><br />&nbsp;&nbsp;&nbsp;&nbsp;
            	<span style="font-size:20px;">入驻歌手</span>&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        
	        <table border="0" cellpadding="0" cellspacing="0">
		    	<%
                    ArrayList<Artist> al=new ArrayList<Artist>();
                    al = (ArrayList)session.getAttribute("allArtist");

                    int k=0;
                    for(Artist a:al){
                        k=k+1;
                        String arname=a.getArtname();
                        String ariden=a.getIdentity();
                        String arstyle=a.getStyle();
                        String artins=a.getArtins();
                        String arphoto=a.getArtphoto();
			     %>
			    <tr>
			      
			        <table  border="0" cellpadding="0" cellspacing="0" >
                        <tr height="15px"></tr>
                        <tr height="50px" ><td rowspan="3" style="border-bottom-style: ridge;"><img style="box-shadow: 0 0 2px rgba(0,0,0,0.8);margin: 20px;" src="<%=arphoto%>"  width="80px" height="80px"/></td>
                             <td  colspan="2" width="140px" style="vertical-align: bottom;font-size: 18px;" ><a href="toArtist?artname=<%=arname%>" style="color: #000;"><%=arname%></a></td></tr>
                        <tr height="15px" style="font-size: 12px;color: #999;"><td  > <a href="" class="aaa">流派：<%=ariden%></a></td><td><a href="" class="aaa">|分类：<%=arstyle%></a> </td> </tr>
                        <tr height="30px" style="font-size: 12px;color: #999;"> <td colspan="2" style="border-bottom-style: ridge;vertical-align: text-top;" ><%=artins%></td> </tr>
			        </table>
			      
			    </tr>
			     <%
                     if(k==3){
                     break;}
                     }
                 %>
	    </table>
	    <br>
     	 
     	<s:if  test="#session.username==null" >
     		<div class="my_xg1" style="margin-top:5px;margin-left:70px;width: 150px;">
				<a class="a_my_xg1"  style="color: #FFFFFF;width: 150px;" href="login.jsp">成为歌手</a>
			</div>
        </s:if><s:else>
        	<s:if test="#session.isartist==1">
        		<div class="my_xg1" style="margin-top:5px;margin-left:70px;width: 150px;">
					<a class="a_my_xg1"  style="color: #FFFFFF;width: 150px;" href="toArtistMain">查看我的音乐人中心</a>
				</div>
        		
        	</s:if><s:else>
        		<div class="my_xg1" style="margin-top:5px;margin-left:70px;width: 150px;">
					<a class="a_my_xg1"  style="color: #FFFFFF;width: 150px;" href="Artist/artist_register.jsp">成为歌手</a>
				</div>
        	</s:else> 
        </s:else> 
    
    </div>
    
    <div class="null_r"></div>   
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
  </div>
  

  </body>
</html>