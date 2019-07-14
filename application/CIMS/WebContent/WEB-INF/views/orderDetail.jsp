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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/homepage">
                      
                            
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
                <!-- item--><a href="${pageContext.request.contextPath}/logout" class="link" data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a> </div>
        </aside>
        
        <div class="page-wrapper">
            
            <div class="container-fluid">
                
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h1 class="text-themecolor m-b-0 m-t-0">订单详情</h1>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/homepage">主页</a></li>
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/cinema">订单管理</a></li>
                            <li class="breadcrumb-item active">订单详情</li>
                        </ol>
                    </div>
                    
                </div>
                <div class="row">
                	 <div class="col-md-12 col-4 align-self-center">
                        <div class="card">
                            <div class="card-block">
                                 <form class="form-horizontal form-material" method="post" action="addCinemaRequest">
                                    <div class="form-group">
                                        <label class="col-md-12">订单时间</label>
                                        <div class="col-md-12">
                                            <input type="text" value="${order.order_time }" readonly  unselectable="on" class="form-control form-control-line"  name="cinema_name">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">位置</label>
                                        <div class="col-md-12">
                                            <input type="text" value="${order.seat_location }" readonly  unselectable="on" class="form-control form-control-line"  name="location">
                                            
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">场次名称</label>
                                        <div class="col-md-12">
                                            <input type="text" value="${scene.scene_name }" readonly  unselectable="on" class="form-control form-control-line" name="tel" >
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">顾客名称</label>
                                        <div class="col-md-12">
                                            <input type="text" value="${customerName }" readonly  unselectable="on" class="form-control form-control-line" name="tel" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">订单金额</label>
                                        <div class="col-md-12">
                                            <input type="text" value="${order.order_price }" readonly  unselectable="on" class="form-control form-control-line" name="tel" >
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
    <script>function adminDelete(){
            if(confirm("确定删除吗")){
                
                return true;
            }
            return false;
        };
        </script></body>

</html>
