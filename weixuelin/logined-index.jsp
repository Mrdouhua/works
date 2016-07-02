<%@page import="com.weixuelin.usercenter.vo.User"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>惟学林</title>
	<link rel="stylesheet" type="text/css" href="css/logined-index.css">
	<link type="text/css" href="bootstrap-3.3.5-dist\css\bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.5-dist\css\bootstrap-theme.min.css">
	<script type="text/javascript" src="scripts/jquery.js"></script>
	<script type="text/javascript" src="scripts/logined-index.js"></script>
</head>
<!-- 登陆前后页面跳转控制 -->
<%
	String a_career_explor = "a_career-explor.jsp";
	String b_career_explor = "career-explor.jsp";
	String a_career_route = "a_career-route.jsp";
	String b_career_route = "career-route.jsp";
	String a_career_lesson = "a_career-lesson.jsp";
	String b_career_lesson = "career-lession.jsp";
	String career_explor = new String();
	String career_lesson = new String();
	String career_route = new String();
	if(session.getAttribute("user")==null){
		career_explor = b_career_explor;
	}else{
		career_explor = a_career_explor;
	}
		
%>
<body >
	<!-- 头部开始 -->
	<header>
		<div id="head-wrap">
			<div class="head-logo">
				<a href="logined-index.jsp">
					<img src="img/logo.png" alt="logo" title="logo">
				</a>				
				<a href="logined-index.jsp"><span>惟学林</span></a>	
			</div>		
		<!-- nav导航菜单开始 -->
			<ul id="nav">
				<li><a href="logined-index.jsp">首页</a></li>
				<li><a href="<%=career_explor %>">职路搜索</a></li>
				<li><a href="#">个人手札</a></li>
				<li><a href="#">招募令</a></li>
				<li><a href="personal-center.jsp">个人中心</a></li>
				<li class="cur" id="cur"></li>
			</ul>
		<!-- nav导航菜单结束 -->
		<!-- 导航栏头像部分开始 -->
		<%
			User user = (User)session.getAttribute("user");
		 %>
			<div class="navbar-user" id="navbar-user">
				<img src="<%=user.getPhoto() %>" alt="用户头像" title="用户头像">
			</div>
			<div id="avatar">
				<ul class="user-avatar">
				<li>昵称:<%=user.getUser_name() %></li>
				<li>签名:<%=user.getSelf_introduce() %></li>
				<li><a href="index.jsp">注销</a></li>
			</ul>
			</div>
			<!-- 导航栏头像部分结束 -->			
			<div class="clearboth"></div>
		</div>		
	</header>
	<!-- 头部结束 -->
	<!-- 内容开始 -->
	<div id="content">
		<!-- 轮播图开始 -->
		<div id="con-wrap">
			<div id="container">
				<div id="list" style="left: -1348px;">
					<img src="img/5.png" alt="1"/>
			        <img src="img/1.png" alt="1"/>
			        <img src="img/2.png" alt="2"/>
			        <img src="img/3.png" alt="3"/>
			        <img src="img/4.png" alt="4"/>
			        <img src="img/5.png" alt="5"/>
			        <img src="img/1.png" alt="5"/>
				</div>
				<div id="buttons">
					<span index="1" class="on"></span>
					<span index="2"></span>
					<span index="3"></span>
					<span index="4"></span>
					<span index="5"></span>
				</div>
				<a href="javascript:;" id="prev" class="arrow">&lt;</a>
				<a href="javascript:;" id="next" class="arrow">&gt;</a>
			</div>
		</div>	
		<!-- 轮播图结束 -->
		<div id="tit-wrap">
			<div class="mainTitles">
				<div class="title1">
					<div class="item">
						<div class="pic1"></div>
						<p>
							<a href="#">给你量身定做的<br/>学习计划</a>
						</p>				
					</div>
					
				</div>
				<div class="title2">
					<div class="item">
						<div class="pic2">
						</div>
						<p>
							<a href="#">给你量身定做的<br/>学习计划</a>
							
						</p>				
					</div>
				</div>
				<div class="title3">
					<div class="item">
						<div class="pic3"></div>
						<p>
							<a href="#">给你量身定做的<br/>学习计划</a>
						</p>				
					</div>
					
				</div>
			</div>
		</div>
		<div id="t-wrap">
			<div class="title">
				资源一览
			</div>
		</div>
		<div class="resourse">
				<div class="sourse-wrap">
					<div class="sourse-item">
					<img src="./img/java.jpg" alt="">
					</div>
					<div class="sourse-item">
						<img src="./img/android.jpg" alt="">
					</div>
					<div class="sourse-item">
						<img src="./img/machine learning.jpg" alt="">
					</div>
					<div class="sourse-item">
						<img src="./img/php.jpg" alt="">
					</div>
					<div class="sourse-item">
						<img src="./img/mobile learning.jpg" alt="">
					</div>
					<div class="sourse-item">
						<img src="./img/python.jpg" alt="">
					</div>
				</div>
		</div>
	<div class="clearboth"></div>
</div>		
	<!-- footer开始 -->
	<footer>
		<div id="ft-wrap">
			<div class="about">
				<p class="get">Get in Touch</p>
				<p>Vestibulum id ligula porta felis euismod semper,malesuada euismod</p>
				<p>
					<span>地址：重庆市南岸区崇文路2号</span>
					<span>TEL:10086</span>
					<span>FAX:01)10086</span>
					<span>E-MAIL:asaweb@asweb.com</span>
				</p>
			</div>
			<div class="ft-about">
				<span><a href="#">关于本站</a></span>
				<span><a href="#">友情链接</a></span>
				<span><a href="#">联系我们</a></span>
				<span><a href="#">运行维护</a></span>
				<span><a href="#">版权申明</a></span>
			</div>
		</div>
	</footer>
	<!-- footer结束 -->

</body>
</html>