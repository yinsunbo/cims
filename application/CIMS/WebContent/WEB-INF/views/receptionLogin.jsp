<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%> 
<base href="<%=basePath%>"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/css.css"/>


<script src="<%=basePath%>/js/jquery-min.js"></script>
<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/js.js"></script>

<script src="<%=basePath%>/js/jquery.validate.js"> </script>
<script src="<%=basePath%>/js/messages_zh.js"> </script>

</head>
<body style="background:url(<%=basePath%>/img/bg.jpg);background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">

    <div class="container container-fluid">
        <div class="row">
            <div class="col-md-4 col-md-offset-8" style="padding-top:2%;padding-bottom:2%;margin-top:12%;border-radius:5px;background:rgba(255,255,255,0.5);">
                <div class="col-md-12" id="loginDiv">
                    <h2 class="text-center">登录&nbsp;</h2>
                    <form action="${pageContext.request.contextPath}/home/loginRequest" method="post" style="margin-top:15%;" id="loginForm">
                        <div><img  src="<%=basePath%>/img/用户.png"/><input class="form-control center-block inputTouming" type="text" name="customer_phone" placeholder="手机号" value = "${customer.customer_phone }"></div>
                        <div><img  src="<%=basePath%>/img/密码.png"/><input class="form-control center-block inputTouming" type="password" name="customer_password" placeholder="密码" value = "${customer.customer_password }" ></div>
                        <div class="form-group">
                            <p >还没注册?点击→ <a href="${pageContext.request.contextPath}/home/reg">注册</a></p>
                        </div>
                        <div class="col-md-10 col-md-offset-1">
                            <input type="submit" value="登录" class="center-block btn btn-primary btn-block btn-lg" >
                        </div>
                        
                    </form>
                </div>
                
            </div>
        </div>
    </div>
</body>
<script>
$(document).ready(function(){
	if("${error}" != ""){
        alert("${error}");
    }
	
    $("#loginForm").validate({
        rules:{
        	customer_phone:{
                required: true,
                minlength: 11,
                maxlength: 11
            },
            customer_password:{
                 required: true,
                 minlength: 8
            }
        },
        messages:{
        	customer_phone:{
                required: "请输入手机号",
            },
            customer_password:{
                 required: "请输入密码",
                 minlength: "密码不得少于8位数"
            }
        }
        
    });
})

</script>
</html>