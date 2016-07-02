<%@ page import="com.weixuelin.usercenter.vo.User"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>职路探索</title>
<link rel="stylesheet" type="text/css" href="css/b_common.css">
<link rel="stylesheet" type="text/css" href="css/career-explor.css">
<script type="text/javascript" src="scripts/jquery.js"></script>
<script type="text/javascript" src="scripts/b_common.js"></script>
<script src="scripts/career-explor.js"></script>
</head>
<body>
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

	<!-- 头部开始 -->
	<header>
	<div class="head-logo">
		<a href="index.jsp"> <img src="img/logo.png" alt="logo">
		</a> <a href="index.jsp"><span>惟学林</span></a>
	</div>
	<!-- nav导航菜单开始 -->
	<ul id="nav">
		<li><a href="index.jsp">首页</a></li>
		<li><a href="<%=career_explor %>">职路搜索</a></li>
		<li><a href="#">个人手札</a></li>
		<li><a href="#">招募令</a></li>
		<li><a href="personal-center.jsp">个人中心</a></li>
		<li class="cur" id="cur"></li>
	</ul>
	<!-- nav导航菜单结束 --> <!-- login部分开始 -->
	<div id="login-area" class="nav-login">
		<button id="btnLogin" hidefocus="true" class="login-btn">登录</button>
		<button id="btnregister" hidefocus="false" class="register-btn">
			<a href="register.jsp">注册</a>
		</button>
	</div>
	<div class="clearboth"></div>
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


	<!-- 登陆弹框开始 -->
	<div id="login">
		<div class='loginCon'>
			<div class="loginTitle">登录</div>
			<div id='close'></div>
			<form method='post' action='xxx.jsp' name="form1" id='form1'>
				<div class="userPass">
					<label>用户名:</label><input type='text' name="username" id='username'
						class='username' required autofocus="focus"
						placeholder="只能输入6到10位数字,不含空格" /><br /> <label>密&nbsp;码:</label><input
						type='password' name="password" id='password' class='password'
						required placeholder="6到12位数字，字母，不含空格" /><br />
				</div>

				<div class="buttons">
					<button type='submit' id='submit' class='submit'>登录</button>
					<button type='reset' id='reset' class='reset'>重置</button>
				</div>
			</form>
			<div class="feedback"></div>
		</div>
	</div>
	<!-- 登陆弹框结束-->


	<!-- 尾部开始 -->
	<footer>
	<div class="about">
		<p class="get">Get in Touch</p>
		<p>Vestibulum id ligula porta felis euismod semper,malesuada
			euismod</p>
		<p>
			<span>地址：重庆市南岸区崇文路2号</span> <span>TEL:10086</span> <span>FAX:01)10086</span>
			<span>E-MAIL:asaweb@asweb.com</span>
		</p>
	</div>
	<div class="ft-about">
		<span><a href="#">关于本站</a></span> <span><a href="#">友情链接</a></span> <span><a
			href="#">联系我们</a></span> <span><a href="#">运行维护</a></span> <span><a
			href="#">版权申明</a></span>
	</div>
	</footer>
	<!-- 尾部结束 -->
</body>
</html>