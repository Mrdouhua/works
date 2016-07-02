<%@page import="com.weixuelin.usercenter.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="java.util.*" %>
<%@ page import="com.weixuelin.comment.vo.*" %>
<%@ page import="com.weixuelin.comment.factory.*" %>
<% 
    //获取资源连接(视频、文字等)
	String learning_path = (String)session.getAttribute("learning_path");
	System.out.println(learning_path);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>课程学习</title>
	<link rel="stylesheet" type="text/css" href="css/a_common.css">
	<link rel="stylesheet" href="css/career-lesson.css">
	<script type="text/javascript" src="scripts/jquery.js"></script>
	<script type="text/javascript" src="scripts/a_common.js"></script>
	<script src="scripts/career-lesson.js"></script>
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
				<li>昵称:<span class="z_nickName"><%=user.getUser_name() %></span></li>
				<li>签名:<%=user.getSelf_introduce() %></li>
				<li><a href="index.jsp">注销</a></li>
			</ul>
			</div>
			<!-- 导航栏头像部分结束 -->			
			<div class="clearboth"></div>
		</div>		
	</header>
	<!-- 头部结束 -->
    <!-- 主体开始 -->
    <div id="z_contWrap">
        <div id="z_con">

            <!-- 课程视频开始 -->
            <div class="lesVideo">
                <video src="<%= learning_path %>" class="lesVideoItem" type="application/x-shockwave-flash" controls>
                    <!-- 需要设置视频地址 -->
                </video>
            </div>
            <!-- 课程视频结束 -->

            <!-- 课程评论开始 -->
            <div class="lesComme">

                <!-- 评论编辑开始 -->
                <div class="commEdi">

                    <div class="commEdiTit">
                        <span class="lessEdi">评论</span> | 
                        <span class="lessNot">手札</span>
                    </div>

                    <div class="commEdiPar">
                        <img class="commEdiPic" src="<%=user.getPhoto()%>">
                        <textarea id="comment" class="comment" type="text" name="comment"></textarea> 
                        <button id="commSubBtn" class="commSubBtn">发表评论</button>
                    </div>
                </div>
                <!-- 评论编辑结束 -->

                <!-- 评论内容开始 -->
                <div class="commCon">
                    <div class="commConPar">

<%
	 Comment comment=new Comment();
     List<Comment> comments=DAOFactory.getICommentDAOInstance().findAll();
	 Iterator iter=comments.iterator();
		while(iter.hasNext()){
			comment=(Comment) iter.next();
%>
                         <!-- 评论模板开始 -->
                        <div class="commConItem">
                            <!-- 用户头像 -->
                            <img class="commConPic" src="<%=comment.getPath() %>">
                            <div class="commConInf">
                                <!-- 用户名 -->
                                <span class="commConName"><%=comment.getUsername() %></span>
                                <!-- 评论内容 -->
                                <p class="commConPara"><%=comment.getContent() %></p>
                                <!-- 评论时间 -->
                                <span class="commConDate">时间：<%=comment.getDate() %></span>
                            </div>
                        </div>
                        <!-- 评论模板结束 -->

 <%
 } 
 %>
          
          
                    
                    
                </div>
                <!-- 评论内容结束 -->
                <div class="commConTab">
                        <span class="commConTabFir">首页</span>
                        <span class="commConTabBef">上一页</span>
                        <ul class="commentPage">
                            <!-- 页数区域，内容的数目决定页数 -->
                        </ul>
                        <span class="commConTabNex">下一页</span>
                        <span class="commConTabLas">尾页</span>
                </div>

            </div>
            <!-- 课程评论结束 -->

        </div>
    </div>

    <!-- 主体结束 -->
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