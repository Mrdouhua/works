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
	<title>学习路线</title>
    <link rel="stylesheet" href="css/career-route.css">
	<link rel="stylesheet" type="text/css" href="css/a_common.css">
	<script type="text/javascript" src="scripts/jquery.js"></script>
	<script type="text/javascript" src="scripts/a_common.js"></script>
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
				career_lesson = b_career_lesson;
				career_route = b_career_route;
			}else{
				career_explor = a_career_explor;
				career_lesson = a_career_lesson;
				career_route = a_career_route;
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

    <div id="z_contWrap">
          <div id="z_con">

              <div class="routeTit">
                  <h3 class="routeName">JAVA工程师</h3>
                  <p class="lessonInfor">
                      <span class="lessonNum">32门课程</span>
                      <span class="studyNum">3200人学习</span>
                  </p>
              </div>

              <div class="routeCon">

                  <!-- 入门初窥阶段开始 -->
                  <!-- <iframe class="juniorLes" src="page01.html"> -->
                  <div class="juniorLes">
                      <h3 class="juniorLesTit">入门初窥</h3>
                      <iframe src="page01.jsp">

                      
                      </iframe>

                  </div>

                  <!-- </iframe> -->
                  <!-- 入门初窥阶段结束 -->

                  <!-- 逐步进阶阶段开始 -->
                  <div class="middleLes">
                      <h3 class="middleLesTit">逐步进阶</h3>

                      <iframe src="page02.jsp">
                      
                      </iframe>

                  </div>
                  <!-- 入门初窥阶段结束 -->

                  <!-- 逐鹿巅峰阶段开始 -->
                  <div class="seniorLes">
                      <h3 class="seniorLesTit">逐鹿巅峰</h3>

                      <iframe src="page03.jsp">
                      
                      </iframe>

                  </div>
                  <!-- 逐鹿巅峰阶段结束 -->

              </div>
              
          </div>
      </div>

  </div>
  <!-- 内容结束 -->


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