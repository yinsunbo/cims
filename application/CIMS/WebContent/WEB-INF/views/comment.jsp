<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${movie.movie_name }</title>

<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/img/favicon.png">


<script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/myCustomer.css"
	type="text/css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}
/* 创建三个列 */
.column1 {
	float: left;
	width: 20%;
	visibility: hidden;
}

.column2 {
	float: left;
	width: 60%;
}

.column3 {
	float: left;
	width: 20%;
	visibility: hidden;
}

.movie {
	width: 19%;
	float: left;
	border: 1px solid #000;
	margin: 2px;
}
/* 列后清除浮动 */
.row:after {
	content: "";
	display: table;
}

img {
	width: 200px;
	height: 300px;
}

.movieImg {
	float: left;
	width: 20%;
}

.movieDiv {
	float: left;
	width: 80%;
}

.comment {
	display: block;
	margin-top: 20px;
	font-size: 18px;
	line-height: 24px;
	color: #222;
	margin: 0 0 20px;
	padding: 0;
	border: 0;
	vertical-align: text-top;
}

.b-head {
	font-size: 18px;
	line-height: 24px;
	color: #222;
	margin: 0 0 20px;
}

.comment-m {
	font-family: Microsoft YaHei, Arial, Helvetica, sans-serif;
	zoom: 1;
	min-height: 100px;
	background: #fff;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default ">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">MovieShop</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="${pageContext.request.contextPath}/home">首页 <span
							class="sr-only"></span></a></li>


					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">电影类型 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach items="${types}" var="type">
								<li><a
									href="${pageContext.request.contextPath}/home/type/${type.type_id}">${type.type_name}</a></li>
							</c:forEach>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left"
					action="${pageContext.request.contextPath}/home/search"
					method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="电影名"
							name="movie_name">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${customer == null }">
						<li><a href="${pageContext.request.contextPath}/home/login">登录</a></li>
					</c:if>
					<c:if test="${customer != null }">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">${customer.customer_name } <span
								class="caret"></span></a>
							<ul class="dropdown-menu">


								<li><a
									href="${pageContext.request.contextPath}/home/customer">个人中心</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/home/order">我的订单</a></li>
								<li role="separator" class="divider"></li>
								<li><a
									href="${pageContext.request.contextPath}/home/logout">退出</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<div class="row">
		<div class="column1">
			<h2></h2>
		</div>

		<div class="column2">
			
			<div class="comment">
				<div>
					<div class="b-head">
						
					</div>
				</div>

				<div class="comment" style="position: relative;">
					<div class="comment-m" >
						<div class="comment-send">
							<div class="comment-m" style="display: none">
								<form method="post"
									action="${pageContext.request.contextPath}/home/addComment"
									id="form">
									<div class="el-form-item user-nick-name">
										<label class="el-form-item__label">标题:</label>
										<div class="el-input">
											<input class="el-input__inner" name="comment_title"
												style="width: 743px">
										</div>
									</div>
									<div class="el-form-item user-nick-name">
										<label class="el-form-item__label">内容:</label>
										<div class="el-input">
											<textarea cols="80" name="comment_content" rows="5"
												placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。"
												class="ipt-txt"></textarea>
										</div>
									</div>
									<div class="el-form-item user-my-btn">
										<div class="el-form-item__content">
											<div class="padding-dom" style="border-bottom: 6px"></div>
											<div class="user-my-btn-warp">
												<input type="hidden" name="movie_id"
													value="${movie.movie_id }">
												<button class="el-button el-button--primary"
													style="left: 28%">
													<span>发表</span>
												</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="comment-list" style="margin-left:33px">
						      <p class="sty" style="font-size: 25px;color:" >所有评论</p>
                            <c:forEach items="${comments }" var="comment">
                            <div class="list-item">
                            
                            <div class="content">
                                <div class="customer">
                                <p class="sty" style="font-size: 14px;">${comment.customer_name }:</p>
                                </div>
                                <p class="sty">标题：${comment.comment_title }</p>
                                <p class="sty" style="font-size: 16px;">${comment.comment_content }</p>
                                <div class="info">
                                    <span class="time">${comment.comment_time  }</span>
                                </div>
                                <c:if test="${user.power == 0 }">
                                <div class="sty">
                                    <a href="${pageContext.request.contextPath}/home/adminDelComment?comment_id=${comment.comment_id}">删除评论</a>
                                </div>
                                </c:if>
                            </div>
                            </div>
                            </c:forEach>
						</div>
					</div>
				</div>
				
			</div>

			<div class="column3">
				<h2></h2>
			</div>
		</div>
</body>
</html>