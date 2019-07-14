<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>影院管理系统</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/colors/blue.css" id="theme" rel="stylesheet">nav-item dropdown show
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar card-no-border">
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
   
    <div id="main-wrapper">
    
        <header class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
               
                <div class="navbar-header">
                    <a class="navbar-brand" href="homepage">
                      
                            
                        </b>
                          
                         <img src="${pageContext.request.contextPath}/img/logo.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                
                <div class="navbar-collapse">
                   
                    <ul class="navbar-nav mr-auto mt-md-0">
                      
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                      
                        <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search">
                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>
                        </li>
                    </ul>
                    <ul class="navbar-nav my-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${sessionScope.user.userName}</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <aside class="left-sidebar">
            <div class="scroll-sidebar">
                <nav class="sidebar-nav">
                   <ul id="sidebarnav">

                        <li> <a class="waves-effect waves-dark" href="cinema" aria-expanded="false"><i class="fa fa-file-movie-o fa-4x"></i></command><span class="hide-menu">影院管理</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="movie" aria-expanded="false"><i class="fa fa-video-camera fa-4x"></i><span class="hide-menu">电影管理</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="seat" aria-expanded="false"><i class="fa fa-wheelchair fa-4x"></i><span class="hide-menu">座位管理</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="scene" aria-expanded="false"><i class="fa  icon-film fa-4x"></i><span class="hide-menu">场次管理</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="order" aria-expanded="false"><i class="fa fa-file fa-4x"></i><span class="hide-menu">订单管理</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="count" aria-expanded="false"><i class="fa fa-bar-chart fa-4x"></i><span class="hide-menu">统计信息</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="user" aria-expanded="false"><i class="fa fa-user-o fa-4x"></i><span class="hide-menu">用户管理</span></a>
                        </li><li> <a class="waves-effect waves-dark" href="${pageContext.request.contextPath}/type" aria-expanded="false"><i class="fa fa-file-text-o fa-4x"></i><span class="hide-menu">分类管理</span></a>
                        </li>
                    </ul>
                </nav>
                
            </div>
            <!-- End Sidebar scroll-->
            <!-- Bottom points-->
            <div class="sidebar-footer">
                <!-- item--><a href="" class="link" data-toggle="tooltip" title="Settings"><i class="ti-settings"></i></a>
                <!-- item--><a href="" class="link" data-toggle="tooltip" title="Email"><i class="mdi mdi-gmail"></i></a>
                <!-- item--><a href="logout.do" class="link" data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a> </div>
        </aside>
        
        <div class="page-wrapper">
            
            <div class="container-fluid">
                
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h1 class="text-themecolor m-b-0 m-t-0">修改电影信息</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/homepage">主页</a></li>
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/movieList">电影管理</a></li>
                            <li class="breadcrumb-item active">修改电影信息</li>
                        </ol>
                    </div>
                    
                </div>
                <div class="row">
                    
                   
                	 <div class="col-md-12 col-4 align-self-center">
                        <div class="card">
                            <div class="card-block">
                                 <form class="form-horizontal form-material" method="post" action="updateMovieRequest?Id=${movie.movie_id }" id="form"  enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label class="col-md-12">电影名称</label>
                                        <div class="col-md-12">
                                            <input type="text" value="${movie.movie_name }" class="form-control form-control-line"  name="movie_name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">影片类型</label>
                                        <div class="col-sm-12">
                                            <select name="type_id" class="form-control form-control-line">
												<c:forEach items="${types }" var="type">
												
                                                    <option value="${type.type_id }" <c:if test="${type.type_id==movie.type_id}">selected</c:if>>${type.type_name }</option>
                                                </c:forEach>
											</select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">电影语言</label>
                                        <div class="col-sm-12">
                                            <select name="movie_language" class="form-control form-control-line">
												<option value="">请选择语言</option>
												<option value="国语" <c:if test="${'国语'==movie.movie_language}">selected</c:if>>国语</option>
					<option value="英语" <c:if test="${'英语'==movie.movie_language}">selected</c:if>>英语</option>
					<option value="俄语" <c:if test="${'俄语'==movie.movie_language}">selected</c:if>>俄语</option>
					<option value="德语" <c:if test="${'德语'==movie.movie_language}">selected</c:if>>德语</option>
					<option value="法语" <c:if test="${'法语'==movie.movie_language}">selected</c:if>>法语</option>
					<option value="韩语" <c:if test="${'韩语'==movie.movie_language}">selected</c:if>>韩语</option>
					<option value="日语" <c:if test="${'日语'==movie.movie_language}">selected</c:if>>日语</option>
					<option value="泰语" <c:if test="${'泰语'==movie.movie_language}">selected</c:if>>泰语</option>
					<option value="其他" <c:if test="${'其他'==movie.movie_language}">selected</c:if>>其他</option>
											</select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="col-md-12">影片介绍</label>
                                        <div class="col-md-12">
                                            <textarea rows="5"  class="form-control form-control-line" name="movie_introduce">${movie.movie_introduce }</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">上映日期</label>
                                        <div class="col-sm-12">
                                             <input type="date" class="form-control form-control-line" name="movie_date" value="${movie.movie_date }">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">关键词</label>
                                        <div class="col-sm-12">
                                            <input type="text" value="${movie.key_word }"class="form-control form-control-line" name="key_word">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-12">封面图</label>
                                        <div class="col-sm-12">
                                            <input type="file" class="form-control form-control-line"
                                                name="file" accept="image/*">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                        	<center>
                                        	<input type="text" value="${movie.img_url }"class="form-control form-control-line" name="img_url" style="display:none">
                                        	
                                            <button class="btn btn-success col-sm-3" type="submit">修改完成</button>
                                            </center>
                                        </div>
                                    </div>
                             	</form>
                            </div>
                        </div>
                    </div>
                
                </div>
                
            </div>
            
        </div>
    </div>
  
    <script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>
  	<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tether.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/js/jquery.slimscroll.js"></script>
    <script src="${pageContext.request.contextPath}/js/waves.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebarmenu.js"></script>
    <script src="${pageContext.request.contextPath}/js/sticky-kit.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.validate.js"> </script>
    <script src="${pageContext.request.contextPath}/js/messages_zh.js"> </script>
    <script >
    $(document).ready(function(){
        $("#form").validate({
            rules:{
                movie_name:{
                    required:true
                },movie_date:{
                    required:true
                }
                
            },
            messages:{
                movie_name:{
                    required:"请输入电影名称"
                },movie_date:{
                    required:"请选择上映日期"
                }
            }
        })
    })</script>
</body>

</html>
