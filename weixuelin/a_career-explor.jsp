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
	<title>职路探索</title>
	<link rel="stylesheet" type="text/css" href="css/a_common.css">
	<link rel="stylesheet" type="text/css" href="css/career-explor.css">
	<script type="text/javascript" src="scripts/jquery.js"></script>
	<script type="text/javascript" src="scripts/a_common.js"></script>
	<script src="scripts/career-explor.js"></script>
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

		<div id="z_contWrap">
			<div id="z_con">

				<!-- 职路探索导航开始 -->
				<div class="carExplorNav">
					<h2 class="carExplorNavTit">职路探索</h2>
					<div class="carExplorNavCon">

						<!-- 学科导航开始 -->
						<ul class="proNav">
							<li class="proNavItemTit">学科:</li>
							<li class="proNavItem"><a href="#">工学</a></li>
							<li class="proNavItem"><a href="#">医学</a></li>
							<li class="proNavItem"><a href="#">商学</a></li>
							<li class="proNavItem"><a href="#">理学</a></li>
							<li class="proNavItem"><a href="#">艺术学</a></li>
						</ul>
						<!-- 学科导航结束 -->

					</div>
				</div>
				<!-- 职路探索导航结束 -->

				<!-- 热门职业开始 -->
				<div class="hotWork">
					<h2 class="hotWorkTit">热门职业</h2>
					<div class="hotLesson">
						<div class="hotLessonCon">

							<!-- 模板开始 -->
							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <!-- 课程图片(宽260px，高220px) -->
									<img class="hotLessonImg" src="img/java工程师.jpg" />
								</a>
								<div class="hotLessonInfor">

									<!-- 课程名称 -->
									<h3 class="hotLessonInfTit">Java工程师</h3>
									<p class="hotLessonInfNum">
										<!-- 课程数量 -->
										<span class="lessonNum">28门课程</span>
										<!-- 学习人数 -->
										<span class="studyNum">125人学习</span>
									</p>
									<!-- 课程链接 -->
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>
							<!-- 模板结束 -->

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/电子工程师.jpg" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">电子工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">14门课程</span> <span class="studyNum">65人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/系统架构师.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">系统架构师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">21门课程</span> <span class="studyNum">86人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <!-- 图片宽260px，高220px -->
									<img class="hotLessonImg" src="img/数据挖掘工程师.jpg" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">数据挖掘工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">27门课程</span> <span class="studyNum">124人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/前端工程师.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">前端工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">15门课程</span> <span class="studyNum">54人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/数据分析师.jpg" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">数据分析师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">38门课程</span> <span class="studyNum">164人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">7Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">8Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">9Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">10Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">11Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">12Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">13Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

							<div class="hotLessonItem">
								<a class="hotLessonLink" href="#"> <img class="hotLessonImg"
									src="img/xx.png" />
								</a>
								<div class="hotLessonInfor">
									<h3 class="hotLessonInfTit">14Java工程师</h3>
									<p class="hotLessonInfNum">
										<span class="lessonNum">36门课程</span> <span class="studyNum">3200人学习</span>
									</p>
									<a class="studyBut" href="#">我要学习</a>
								</div>
							</div>

						</div>
						<div class="hotLessonTab">
							<span class="hotLessonTabFir">首页</span> <span
								class="hotLessonTabBef">上一页</span>
							<ul class="hotLessonPage">
								<!-- 页数区域，内容的数目决定页数 -->
							</ul>
							<span class="hotLessonTabNex">下一页</span> <span
								class="hotLessonTabLas">尾页</span>
						</div>
					</div>
				</div>
				<!-- 热门职业结束 -->

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