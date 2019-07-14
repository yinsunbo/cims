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
<title>注册</title>
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
                    <h2 class="text-center">注册&nbsp;</h2>
                    <form action="${pageContext.request.contextPath}/home/regRequest" method="post" style="margin-top:15%;" id="loginForm">
                        <div><input class="form-control center-block inputTouming" type="text" name="customer_phone" placeholder="*手机号码" value="${customer.customer_phone }"></div>
                        
                        <div><input class="form-control center-block inputTouming" type="text" name="customer_name" placeholder="*用户名" value="${customer.customer_name }"></div>
                       
                        <div><input class="form-control center-block inputTouming" type="password" name="customer_password" placeholder="*密码"  value="${customer.customer_password }"></div>
                        
                        <div><input class="form-control center-block inputTouming" type="text" name="customer_email" placeholder="*邮箱"  value="${customer.customer_email }"></div>
                        
                        <div class="form-group">
                            <p >我已有账户?点击→ <a href="${pageContext.request.contextPath}/home/login">登录</a></p>
                        </div>
                        <div class="col-md-10 col-md-offset-1">
                            <input type="submit" value="注册" class="center-block btn btn-primary btn-block btn-lg" >
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
        	customer_name:{
        		required: true
        	},
        	customer_password:{
                required: true,
                minlength: 8
            },
            customer_email:{
            	required: true
            }
    
        },
        messages:{
        	customer_phone:{
                required: "请输入手机号码",
                minlength: "请输入正确的手机号码",
                maxlength: "请输入正确的手机号码"
           }
        }
        
    });
})

</script>
</html>