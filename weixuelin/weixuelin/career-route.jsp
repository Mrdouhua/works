<%@page import="com.weixuelin.usercenter.vo.User"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
	<title>学习路线</title>
    <link rel="stylesheet" href="css/career-route.css">
	<link rel="stylesheet" type="text/css" href="css/b_common.css">
	<script type="text/javascript" src="scripts/jquery.js"></script>
	<script type="text/javascript" src="scripts/b_common.js"></script>
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
<body>


  <!-- 头部开始 -->
  <header>
    <div class="head-logo">
      <a href="index.jsp">
        <img src="img/logo.png" alt="logo" >
      </a>        
      <a href="#"><span>惟学林</span></a>  
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
    <!-- nav导航菜单结束 -->
    <!-- login部分开始 -->
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


  <!-- 登陆弹框开始 -->
  <div id="login">
    <div class='loginCon'>
      <div class="loginTitle">登录</div>
      <div id='close'></div>
      <form method='post' action='xxx.jsp' name="form1" id='form1'>
      <div class="userPass">
        <label>用户名:</label><input type='text' name="username" id='username' class='username' required autofocus="focus" placeholder="只能输入6到10位数字,不含空格" /><br/>
        <label>密&nbsp;码:</label><input type='password' name="password" id='password' class='password' required placeholder="6到12位数字，字母，不含空格" /><br/>
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
  </footer>
  <!-- 尾部结束 -->
</body>
</html>