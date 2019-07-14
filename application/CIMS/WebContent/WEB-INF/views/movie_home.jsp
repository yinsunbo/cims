c<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">

	</style>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>影院管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/nav.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
    <!-- BEGIN: load jquery -->
    <script src="js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="js/jqPlot/jquery.jqplot.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <!-- END: load jqplot -->
    
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="js/setup.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupLeftMenu();
			setSidebarHeight();
        });
    </script>
</head>
<body>
<%response.setCharacterEncoding("UTF-8"); %>
	<div class="container_12">
		<div class="grid_12 header-repeat">
			<div id="branding">
				<div class="floatleft">
					<h1 style="color: white">影院管理系统</h1>
				</div>
				<div class="floatright">
					<div class="floatleft">
						<img src="img/img-profile.jpg" alt="Profile Pic" />
					</div>
					<div class="floatleft marginleft10">
						<ul class="inline-ul floatleft">
                            <li>Hello,张三</li>
                            <li><a href="login.do">Logout</a></li>
                        </ul>
                        <br />
                        <span class="small grey">Last Login:</span>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="grid_12">
			<ul class="nav main">    
                 <li class=ic-biaodan><a href="movie.do"><span>电影管理</span></a></li>
                <li class="ic-meiti"><a href="media.do"><span>媒体管理</span></a></li>
            </ul>
		</div>

		<div class="clear"></div>
		<div class="grid_2">
			<div class="box sidemenu">
				<div class="block" id="section-menu">
					<ul class="section menu">
                        <li><a class="menuitem" href="mediaList.do">操作</a>
                            <ul class="submenu">
                            	<center>
                              	<li>
                              	<form method="post" action="${pageContext.request.contextPath}/lookupMovie.do">
                              	<input  placeholder="搜索" name="keyword" >
                              	<button type="submit">
                              	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                              	</button>
                              	</form>
                              	</li>
                              	<li><a href="addMovieView.do">添加电影</a></li>
                            	</center>
                            	
                                
                            </ul>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div>
               <div class="grid_10">
            <div class="box round first grid">
                <h1>电影列表</h1>
                <div class="block">   
                </div>
            </div>
        </div>
   		<div class="grid_10">
            <div class="box round grid">
        <table border="1" width="80%" class="table table-hover">
        <tr>
        	<th width="40%">电影名称</th>
            <th width="25%">电影类型</th>
            <th width="25%">电影语言</th>
            <th width="10%">上映日期</th>
        </tr>
        <c:forEach items="${movies}" var="movie">
            <tr>
            	<td><a href="${pageContext.request.contextPath}/findMovie.do?movie_id=${movie.movie_id}">${movie.movie_name}</a></td>
                <td>${movie.movie_type}</td>
                <td>${movie.movie_language}</td>
                <td>${movie.movie_date}</td>
            </tr>
        </c:forEach>
       
   	</table>
                <div class="block">   
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
</body>
</html>
