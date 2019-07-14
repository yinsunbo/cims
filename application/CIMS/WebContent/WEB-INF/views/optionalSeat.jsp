<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>选择座位</title>

<link rel="icon" type="image/png" sizes="16x16"
    href="${pageContext.request.contextPath}/img/favicon.png">


<script src="${pageContext.request.contextPath}/js/jquery-min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/jquery.seat-charts.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/jquery.seat-charts.js"></script>

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
    width: 40%;
}
.column3 {
    float: left;
    width: 20%;
    height:700px;
    
}
.column4 {
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
.row:after {
    content: "";
    display: table;
}
img {
    width: 100px;
    height: 150px;
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
                        <input type="text" class="form-control" placeholder="电影名" name="movie_name">
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

                                <li role="separator" class="divider"></li>
                                <li><a href="${pageContext.request.contextPath}/home/customer">个人中心</a></li>
            <li><a href="${pageContext.request.contextPath}/home/order">我的订单</a></li>
            <li><a href="${pageContext.request.contextPath}/home/logout">退出</a></li>
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
        <center><br><br><h1>${scene.scene_name }</h1><br><br>
            <div id="seat-maps">
                <div class="front-indicator">屏幕</div><br><br>
                <div id="seat-map"></div>
            </div>
            
            
            </center>
        </div>

        <div class="column3" ><center>
            <c:if test="${movie.img_url ne ''}">
        <img alt="${movie.movie_name }" src="http://localhost:8080/src/${movie.img_url }" >
        </c:if>
        <c:if test="${movie.img_url eq ''}">
        <img alt="${movie.movie_name }" src="http://localhost:8080/src/img/fm.png" >
        </c:if>
        </center>
            <h3>电影名：${movie.movie_name }</h3>
            <p>影院：${cinema.cinema_name }</p>
            <p>影厅：${seat.seat_name }</p>
            <h4 style="color:red">订单总价：<p id="price"></p></h4>
            <p>点击左侧座位图选择座位，再次点击取消</p>
            <p id="seat">座位：</p>
            <form action="${pageContext.request.contextPath}/home/addOrder?scene_id=${scene.scene_id}" method="post" id="form">
            <input type="hidden" name="seat_location" id="seat_location">
            <input type="hidden" name="order_price" id="order_price">
            <center><button class="btn"  >确认下单</button></center>
            </form>
        </div>
        <div class="column4">
            <h2></h2>
        </div>
    </div>
</body>
<script>$(document).ready(function(){
	if("${param.error}"==1){
	alert("请选择座位"); 
	}
    var input=$("#seat_location");
    var val=new Array();
    var flag=0;
    var price=0;
    firstSeatLabel=1
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
                return ;
            }
        },
            click: function () {//点击事件
                if (this.status() == 'available') {
                    var div=$('<div>',{id:"select",value:this.settings.id}).text(this.settings.id.substring(0,1)+'排'+this.settings.id.substring(2)+'座')
                    val[flag] = this.settings.id;
                    flag++;
                    price = flag*${scene.price};
                    $("#price").text(price);
                    $("#order_price").val(price);
                    input.val(val);
                    $("#seat").append(div);
                    return 'selected';
                } else if (this.status() == 'selected') { 
                    var tem=new Array();
                    var i;
                    var j=0;
                    for(i in val){
                        if(val[i] != this.settings.id){
                            tem[j]=val[i];
                            j++;
                        }
                    }
                    flag--;
                    price = flag*${scene.price};
                    console.log(price);
                    $("#price").text(price);
                    val=tem;
                    input.val(val);
                    $("#select[value='"+this.settings.id+"']").remove();
                    return 'available';
                } else if (this.status() == 'unavailable') {
                    return 'unavailable';
                } else {
                    return this.style();
                }
            }
        });
    var str="${selectedSeat}";
    var arr = new Array();
    arr = str.split(",")
    console.log(arr);
    sc.get(arr).status('unavailable');
})</script>

</html>