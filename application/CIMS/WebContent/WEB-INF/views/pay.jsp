<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>订单详情</title>

<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/img/favicon.png">


<script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
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
  visibility:hidden;
}
.column2{
  float: left;
  width: 60%;
}
.column3 {
  float: left;
  width: 20%;
  visibility:hidden;
}
.movie{

    width:19%;
    float: left;
    border:1px solid #000;
    margin:2px;
}
/* 列后清除浮动 */
.row:after {
  content: "";
  display: table;
  
}
img{

width:200px;
height:300px;
}
</style>
</head>
<body>
<nav class="navbar navbar-default ">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">MovieShop</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/home">首页 <span class="sr-only"></span></a></li>
        
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">电影类型 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <c:forEach items="${types}" var="type">
            <li><a href="${pageContext.request.contextPath}/home/type/${type.type_id}">${type.type_name}</a></li>
            </c:forEach>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left" action = "${pageContext.request.contextPath}/home/search" method="post">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="电影名" name="movie_name">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${customer == null }">
        <li><a href="${pageContext.request.contextPath}/home/login">登录</a></li>
        </c:if>
        <c:if test="${customer != null }">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${customer.customer_name } <span class="caret"></span></a>
          <ul class="dropdown-menu">
            
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/home/customer">个人中心</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/home/order">我的订单</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="${pageContext.request.contextPath}/home/logout">退出</a></li>
          </ul>
        </li>
        </c:if>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="row">
  <div class="column1" >
    <h2></h2>
     </div>
  
  <div class="column2">
  <div>
       <a href="${pageContext.request.contextPath}/home/order" class="btn btn-primary">返回</a><br> 订单号：${order.order_id } 
  </div> 
  <div>
        <table class="table">
        <tr><th>电影</th><th>场次</th><th>座位</th><th>付款金额</th></tr>
        <tr style="height:100px;">
        <td>${movie.movie_name }</td>
        <td>${scene.scene_name }</td>
        <td>${order.seat_location }</td>
        <td>${order.order_price }</td>
        </tr>
        
        </table>
        
        <c:if test="${order.order_state==0 }">
        <a class="btn btn-default" href="${pageContext.request.contextPath}/home/payOrder?order_id=${order.order_id}" style="float:right ">确认付款</a></c:if>
        
  </div> 
  </div>
  
  <div class="column3">
    <h2></h2>
     </div>
</div>
</body>
</html>