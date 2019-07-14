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
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/css/jquery.seat-charts.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/colors/blue.css"
	id="theme" rel="stylesheet">
nav-item dropdown show
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.j8 s/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar card-no-border">
	<div class="preloader">
		<svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none"
				stroke-width="2" stroke-miterlimit="10" /> </svg>
	</div>

	<div id="main-wrapper">

		<header class="topbar">
			<nav class="navbar top-navbar navbar-toggleable-sm navbar-light">

				<div class="navbar-header">
					<a class="navbar-brand"
						href="${pageContext.request.contextPath}/homepage"> </b> <img
						src="${pageContext.request.contextPath}/img/logo.png"
						class="light-logo" alt="homepage" /></span>
					</a>
				</div>

				<div class="navbar-collapse">

					<ul class="navbar-nav mr-auto mt-md-0">

						<li class="nav-item"><a
							class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark"
							href="javascript:void(0)"><i class="mdi mdi-menu"></i></a></li>

						<li class="nav-item hidden-sm-down search-box"><a
							class="nav-link hidden-sm-down text-muted waves-effect waves-dark"
							href="javascript:void(0)"><i class="ti-search"></i></a>
							<form class="app-search">
								<input type="text" class="form-control"
									placeholder="Search & enter"> <a class="srh-btn"><i
									class="ti-close"></i></a>
							</form></li>
					</ul>
					<ul class="navbar-nav my-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
							href="" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">${sessionScope.user.userName}</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<aside class="left-sidebar">
			<div class="scroll-sidebar">
				<nav class="sidebar-nav">
					<ul id="sidebarnav">

						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/cinema"
							aria-expanded="false"><i class="fa fa-file-movie-o fa-4x"></i>
								</command><span class="hide-menu">影院管理</span></a></li>
						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/movie"
							aria-expanded="false"><i class="fa fa-video-camera fa-4x"></i><span
								class="hide-menu">电影管理</span></a></li>
						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/seat"
							aria-expanded="false"><i class="fa fa-wheelchair fa-4x"></i><span
								class="hide-menu">座位管理</span></a></li>
						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/scene"
							aria-expanded="false"><i class="fa  icon-film fa-4x"></i><span
								class="hide-menu">场次管理</span></a></li>
						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/order"
							aria-expanded="false"><i class="fa fa-file fa-4x"></i><span
								class="hide-menu">订单管理</span></a></li>
						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/count"
							aria-expanded="false"><i class="fa fa-bar-chart fa-4x"></i><span
								class="hide-menu">统计信息</span></a></li>
						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/user"
							aria-expanded="false"><i class="fa fa-user-o fa-4x"></i><span
								class="hide-menu">用户管理</span></a></li>
						<li><a class="waves-effect waves-dark"
							href="${pageContext.request.contextPath}/type"
							aria-expanded="false"><i class="fa fa-file-text-o fa-4x"></i><span
								class="hide-menu">分类管理</span></a></li>
					</ul>

				</nav>

			</div>
			<!-- End Sidebar scroll-->
			<!-- Bottom points-->
			<div class="sidebar-footer">
				<!-- item-->
				<a href="" class="link" data-toggle="tooltip" title="Settings"><i
					class="ti-settings"></i></a>
				<!-- item-->
				<a href="" class="link" data-toggle="tooltip" title="Email"><i
					class="mdi mdi-gmail"></i></a>
				<!-- item-->
				<a href="${pageContext.request.contextPath}/logout" class="link"
					data-toggle="tooltip" title="Logout"><i class="mdi mdi-power"></i></a>
			</div>
		</aside>

		<div class="page-wrapper">

			<div class="container-fluid">

				<div class="row page-titles">
					<div class="col-md-5 col-8 align-self-center">
						<h1 class="text-themecolor m-b-0 m-t-0">修改座位</h1>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/homepage">主页</a></li>
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/seat">座位管理</a></li>
							<li class="breadcrumb-item active">修改座位</li>
						</ol>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12 col-4 align-self-center">
						<div class="card">

							<div class="card-block">
								<div class="form-group">
									<center>
										<label for="example-email" class="col-md-12"
											style="color: red">* 过道占一个单位，输入行数和列数时请把过道算入。</label>
									</center>
								</div>
								<form class="form-horizontal form-material" method="post"
                                    action="updateSeatMap?Id=${seat.seat_id }" id="form">
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">行数</label>
                                        <div class="col-md-12">
                                            <input type="number" class="form-control form-control-line"
                                                id="seat_row" name="seat_row" value="${seat.seat_row }" placeholder="取值范围1-50" min="0" max="50">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="example-email" class="col-md-12">列数</label>
                                        <div class="col-md-12">
                                            <input type="number" class="form-control form-control-line"
                                                id="seat_column" name="seat_column" value="${seat.seat_column }" placeholder="取值范围1-50" min="0" max="50">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <center>
                                                <button class="btn btn-success col-sm-3" type="submit">修改座位地图</button>
                                            </center>
                                        </div>
                                    </div>
                                </form>
							</div>


						</div>
						<div class="card" id="generateDiv">
							<form class="form-horizontal form-material" method="post"
								action="updateSeatMapRequest?Id=${seat.seat_id }" id="form2">
								<div class="form-group">
									<div class="card-block">
										<div class="form-group">
											<div class="col-md-12">

												<div style="width: 100%; text-align: center;">
													<div class="container">

														<div id="seat-maps">
															<center>
																<label for="example-email" class="col-md-12"
																	style="color: red">请从座位表中选择过道</label>
															</center>
															<div class="front-indicator">屏幕</div>
															<div id="seat-map"></div>
														</div>

													</div>
												</div>
											</div>
										</div>
									</div>


									<div class="col-md-12">
										<input type="text" id="input_map"
											class="form-control form-control-line" name="seat_map"
											style="display: none;"> <input type="text"
											value="${seat.seat_row }" class="form-control form-control-line"
											name="seat_row" style="display: none;"> <input type="text"
											value="${seat.seat_column }" class="form-control form-control-line"
											name="seat_column" style="display: none;">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-12">
										<center>
											<button class="btn btn-success col-sm-3" type="submit">完成修改</button>
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
	</div>

	<script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>
	<script
		src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/tether.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/js/jquery.slimscroll.js"></script>
	<script src="${pageContext.request.contextPath}/js/waves.js"></script>
	<script src="${pageContext.request.contextPath}/js/sidebarmenu.js"></script>
	<script src="${pageContext.request.contextPath}/js/sticky-kit.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/js/jquery.seat-charts.js"></script>

	<script>$(document).ready(function(){
		
		firstSeatLabel = 1;
    	var row=${seat.seat_row};//获取座位行数
    	var column=${seat.seat_column};//获取座位列数
    	$('#seat-maps').css("width",(column+2)*30.5+"px")
    	$('.front-indicator').css("width",column*30.5+"px");
    	$('#seat-map').css({"width":column*40+"px", "display":"table-cell"});
    	$('.seatCharts-row').css("width",(column+2)*30.5+"px");
    	map = [];
    	for(var i=0;i<row;i++){//根据行数和列数生成数组
    		map[i]="";
    		for(var j=0;j<column;j++){
    			 map[i]+="s";
    		}
    	}
    	$('#input_map').val(map);//把数组存进input里
    	var sc = $('#seat-map').seatCharts({//生成座位列表
    		map:map,//数据源
            naming: {
            	top: false,//不显示列数标识
                getLabel: function(character, row, column) { //返回座位信息 
                    return firstSeatLabel++;
                }
            },
    		click: function () {//点击事件
    			if (this.status() == 'available') {//点击后选中状态，把数组值换成'_' 
    				map[this.settings.row]=map[this.settings.row].substring(0,this.settings.column)+"_"+map[this.settings.row].substring(this.settings.column+1);//数组map值变成”_”
    				$('#input_map').val(map);//把变化后的数组值放人input中
    				return 'selected';
    			} else if (this.status() == 'selected') {//点击后取消选中状态，把数组值换成's' 
    				map[this.settings.row]=map[this.settings.row].substring(0,this.settings.column)+"s"+map[this.settings.row].substring(this.settings.column+1);//数组map值变成”s”
    				$('#input_map').val(map); //把变化后的数组值放人input中
    				return 'available';
    			} else if (this.status() == 'unavailable') {
    				return 'unavailable';
    			} else {
    				return this.style();
    			}
    		}
    	});
    	

	})</script>

	<script src="${pageContext.request.contextPath}/js/jquery.validate.js"> </script>
	<script src="${pageContext.request.contextPath}/js/messages_zh.js"> </script>
	<script>
    $(document).ready(function(){
        $("#form").validate({
            rules:{
            	seat_row:{
                    required: true,
                    max:50,
                    min:1
                },
                seat_column:{
                    required: true,
                    max:48,
                    min:1
                }
            },
            messages:{
            	seat_row:{
                    required: "请输入行数"
                },
                seat_column:{
                    required: "请输入列数"
                }
            }
        });
        $("#form2").validate({
            rules:{
            	seat_row:{
                    required: true,
                    max:40
                },
                seat_column:{
                    required: true,
                    max:40
                },seat_name:{
                    required: true,
                }
            },
            messages:{
            	seat_row:{
                    required: "请输入行数"
                },
                seat_column:{
                    required: "请输入列数"
                },
                seat_name:{
                    required: "请输入名称",
                }
            }
        })
    })</script>
</body>

</html>
