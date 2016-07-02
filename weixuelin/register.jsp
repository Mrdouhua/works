<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>注册页面</title>
	<link rel="stylesheet" type="text/css" href="css/common.css">
	<link rel="stylesheet" href="css/register.css">
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
	            <form class="z_form" method="post">
	                <p class="z_formItem">
	                    <label for="user_id">账号：</label>
	                    <input id="z_user_id" class="z_formItemInp" type="text" name="user_id">
	                    <span id="z_user_id_after">请输入6-10位的数字</span>
	                </p>
	                <p class="z_formItem">
	                    <label for="sex">性别：</label>
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    男：
	                    <input type="radio" name="sex" value="男" checked="checked">
	                    女：
	                    <input type="radio" name="sex" value="女">
	                </p>
	                <p class="z_formItem">
	                    <label for="password">输入密码：</label>
	                    <input id="z_password" class="z_formItemInp" type="password" name="password">
	                    <span id="z_password_after">请输入6-12位数字或字母</span>
	                </p>
	                <p class="z_formItem">
	                    <label for="z_aPassword">确定密码：</label>
	                    <input id="z_aPassword" type="password" class="z_formItemInp" name="aPassword">
	                    <span id="z_aPassword_after"></span>
	                </p>
	                <p class="z_formItem">
	                    <label for="nickName">昵称：</label>
	                    <input id="z_nickName" type="text" class="z_formItemInp" name="nickName">
	                    <span id="z_nickName_after">请输入中文昵称</span>
	                </p>
	                <p class="z_formItem">
	                    <label for="province">省份：</label>
	                    <select id="z_province" type="text" class="z_formItemInp" name="province">
	                        <option value="北京市">北京市</option>
	                        <option value="天津市">天津市</option>
	                        <option value="重庆市">重庆市</option>
	                        <option value="上海市">上海市</option>
	                        <option value="河北省">河北省</option>
	                        <option value="山西省">山西省</option>
	                        <option value="辽宁省">辽宁省</option>
	                        <option value="吉林省">吉林省</option>
	                        <option value="黑龙江省">黑龙江省</option>
	                        <option value="江苏省">江苏省</option>
	                        <option value="浙江省">浙江省</option>
	                        <option value="安徽省">安徽省</option>
	                        <option value="福建省">福建省</option>
	                        <option value="江西省">江西省</option>
	                        <option value="山东省">山东省</option>
	                        <option value="河南省">河南省</option>
	                        <option value="湖北省">湖北省</option>
	                        <option value="湖南省">湖南省</option>
	                        <option value="广东省">广东省</option>
	                        <option value="海南省">海南省</option>
	                        <option value="四川省">四川省</option>
	                        <option value="贵州省">贵州省</option>
	                        <option value="云南省">云南省</option>
	                        <option value="陕西省">陕西省</option>
	                        <option value="甘肃省">甘肃省</option>
	                        <option value="青海省">青海省</option>
	                        <option value="台湾省">台湾省</option>
	                        <option value="内蒙古自治区">内蒙古自治区</option>
	                        <option value="广西壮族自治区">广西壮族自治区</option>
	                        <option value="西藏自治区">西藏自治区</option>
	                        <option value="宁夏回族自治区">宁夏回族自治区</option>
	                        <option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
	                        <option value="香港特别行政区">香港特别行政区</option>
	                        <option value="澳门特别行政区">澳门特别行政区</option>
	                    </select>
	                </p>
	                <p class="z_formItem">
	                    <label for="school">学校：</label>
	                    <input id="z_school" type="text" class="z_formItemInp" name="school">
	                    <span id="z_school_after">请输入中文省份</span>
	                </p>
	                <p class="z_formItem">
	                    <button id="z_submit" type="submit">注册</button>
	                </p>
	            </form>
	        </div>
	    </div>


	</div>
	<!-- 内容结束 -->

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

	<script type="text/javascript" src="scripts/jquery.js"></script>
	<script type="text/javascript" src="scripts/common.js"></script>
	<script type="text/javascript" src="scripts/register.js"></script>
</body>
</html>