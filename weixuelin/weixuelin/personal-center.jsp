<%@ page import="com.weixuelin.usercenter.impl.Dao_User_Profession"%>
<%@ page import="com.weixuelin.usercenter.vo.ProfessionManager"%>
<%@ page import="com.weixuelin.usercenter.vo.User"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人中心</title>
<script type="text/javascript" src="scripts/jquery.js"></script>
<link type="text/css" href="bootstrap-3.3.5-dist\css\bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.5-dist\css\bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/personal-center.css">
<link rel="stylesheet" type="text/css" href="css/a_common.css">
<script type="text/javascript" src="scripts/personal-center.js"></script>
</head>
<body>
		<%
			User user = (User)session.getAttribute("user");
			Dao_User_Profession dao_User_Profession = new Dao_User_Profession();
			List<ProfessionManager> professionList = dao_User_Profession.show_user_profession(user);
		 %>
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
			<a href="logined-index.jsp"> <img src="img/logo.png" alt="logo">
			</a> <a href="logined-index.jsp"><span>惟学林</span></a>
		</div>
		<!-- 导航菜单开始 -->
		<ul id="nav">
			<li><a href="logined-index.jsp">首页</a></li>
			<li><a href="<%=career_explor %>">职路搜索</a></li>
			<li><a href="#">个人手札</a></li>
			<li><a href="#">招募令</a></li>
			<li><a href="personal-center.jsp">个人中心</a></li>
			<li class="cur" id="cur"></li>
		</ul>
		<!-- 导航菜单结束 -->
		<!-- login部分开始 -->
		<div class="navbar-user" id="navbar-user">
			<img src="<%= user.getPhoto() %>" alt="用户头像" title="用户头像">
		</div>
		<div id="avatar">
			<ul class="user-avatar">
				<li><a href="#">昵称:<%= user.getUser_name() %></a></li>
				<li><a href="#">签名:<%= user.getSelf_introduce() %></a></li>
				<li><a href="index.jsp">注销</a></li>
			</ul>
		</div>
		<div class="clearboth"></div>
	</header>
	<!-- 头部结束 -->
	<!-- 内容开始 -->
	<div id="content">
		<!-- perBg背景图开始 -->
		<div class="perBg">
			<img src="img/perBg.png" alt="">
		</div>
		<!-- perBg背景图结束 -->
		<!-- 页面主题部分开始 -->
		<div id="main-wrap">
			<div id="main">
				<div class="proto">
					<img src="img/qq.jpg" alt="">
				</div>
				<div class="main-content">
					<!-- 左边tab-titles部分开始 -->
					<ul class="tab-titles">
						<li class="perIn selected"><span
							class="glyphicon glyphicon-user"></span>个人信息<span
							class="glyphicon glyphicon-play"></span></li>
						<li class="stu"><span class="glyphicon glyphicon-list-alt"></span>学习计划<span
							class="glyphicon glyphicon-play"></span></li>
						<li class="perS"><span class="glyphicon glyphicon-file"></span>个人手札<span
							class="glyphicon glyphicon-play"></span></li>
						<li class="recuilt"><span class="glyphicon glyphicon-flag"></span>招募令&nbsp;<span
							class="glyphicon glyphicon-play"></span></li>
						<li class="foc"><span class="glyphicon glyphicon-eye-open"></span>关注人&nbsp;<span
							class="glyphicon glyphicon-play"></span></li>
					</ul>
					<!-- 左边tab-titles部分结束-->
					<!-- 右边tab_box部分开始  -->
					<div class="tab_box">
						<!-- 个人信息部分开始 -->
						<div class="personal-inf" style="z-index: 6">
							<div class="tab_box_title">个人信息</div>
							<form action="" id="tab-form">
								<div class="nickName">
									<label for="">昵称&nbsp;</label> <input type="text"
										class="tab-form-input" id="nickName" value="<%=user.getUser_name() %>"><br />
								</div>
								<div class="nickAfter"></div>
								<div class="password">
									<label for="">密码&nbsp;</label> <input type="password"
										class="tab-form-input" id="password" value="<%=user.getPassword() %>"><br />
								</div>
								<div class="passwordAfter"></div>
								<div class="sex">
									<label for="">性别&nbsp;</label> <input type="radio"
										name="gender" value="保密" class="sex-input" checked="checked"><label
										for="">保密</label> <input type="radio" name="gender" value="男"
										class="sex-input"><label for="">男</label> <input
										type="radio" name="gender" value="女" class="sex-input"><label
										for="">女</label>
								</div>
								<div class="sexAfter"></div>
								<div class="school">
									<label for="">学校&nbsp;</label> <input type="text"
										class="tab-form-input" id="school" value= "<%=user.getSchool() %>"><br />
								</div>
								<div class="schoolAfter"></div>
								<div class="area">
									<label for="">地区&nbsp;</label> <select id="area" type="text"
										class="tab-form-input" name="province">
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
								</div>
								<div class="areaAfter"></div>
								<div class="introduction">
									<label for="" class="int">个人<br />简介&nbsp;
									</label>
									<textarea class="intro" id="introduction"><%=user.getSelf_introduce() %></textarea>
								</div>
								<input type="submit" value="保存" class="tab-form-save"
									id="inforSend">
							</form>
						</div>		
						
						<!-- 个人信息部分结束 -->
						<!-- 学习计划部分开始 -->
						<div class="personal-inf">
							<div class="tab_box_title">学习计划</div>
						
						<%
						ProfessionManager pro = new ProfessionManager();
						Iterator<ProfessionManager> iter=professionList.iterator();
						while(iter.hasNext()){
							pro = iter.next();
						%>	
							
							
							<!-- 模版开始 -->
							<div class="myPlan">
								<div class="left-pro">
									<img src="<%= pro.getProfession_head_path() %>" alt="">
								</div>
								<div class="center-con">
									<h3><%= pro.getProfession_name() %></h3>
									<p></p>
								</div>
								<a href = "a_result.jsp"><button type="submit" class="right-continue">继续征程</button></a>
							</div>
							<!-- 模版结束 -->
							
							<%
						      }
							%>

						
						</div>
						<!-- 学习计划部分结束 -->
						<!-- 个人手札部分开始 -->
						<div class="personal-inf">
							<div class="tab_box_title">
								个人手札
							</div>	
						</div>
						<!-- 个人手札部分结束-->
						<!-- 招募令部分开始 -->
						<div class="personal-inf">
							<div class="tab_box_title">
								招募令
							</div>
						</div>
						<!-- 招募令部分结束 -->
						<!-- 关注人部分开始 -->
						<div class="personal-inf">
							<div class="tab_box_title">
								关注人
							</div>
						</div>
						<!-- 关注人部分结束-->
					<!-- 右边tab_box部分结束 -->
					</div>
			</div>
		</div>
	<!-- 页面主题部分结束 -->
	</div>
<!-- 内容结束 -->
<!-- 尾部开始 -->
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
	<!-- 尾部结束 -->
</body>
</html>