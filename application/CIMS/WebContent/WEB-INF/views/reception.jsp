<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首页</title>

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
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
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
}

.movie {
	width: 19%;
	height: 30%;
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
.page{
    overflow: hidden;
    line-height: 40px;
    font-family: Arial;
    margin: 0 0 5px;
    display: block;
    width: 100%;
    margin-top: 20px;
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
			<div>
				<c:forEach items="${movies }" var="movie">
					<div class="movie">
						<center>
							<c:if test="${movie.img_url ne ''}">
								<img alt="${movie.movie_name }"
									src="http://localhost:8080/src/${movie.img_url }">
							</c:if>
							<c:if test="${movie.img_url eq ''}">
								<img alt="${movie.movie_name }"
									src="http://localhost:8080/src/img/fm.png">
							</c:if>
							<p>${movie.movie_name }</p>
							<a class="btn btn-default" style="width: 100%"
								href="${pageContext.request.contextPath}/home/showMovie/${movie.movie_id }">点击购票</a>
						</center>
					</div>
				</c:forEach>
			</div>
			<div class="page">
				<div>
					<nav aria-label="Page navigation">
						<ul class="pagination">
							<c:forEach begin="1" end="${countMovie }" var="c">
								<li><a href="${pageContext.request.contextPath}/home/${c }"
									class="btn">${c }</a></li>
							</c:forEach>

						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="column3">
			<p></p>

		</div>
	</div>
</body>
</html>