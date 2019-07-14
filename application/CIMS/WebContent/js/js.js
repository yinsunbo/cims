$(document).ready(function(){
	$("#zhuceBtn").click(function(){
		$("#zhuceDiv").show(500);
		$("#loginDiv").hide(500);
	});
	$("#loginBtn").click(function(){
		$("#loginDiv").show(500);
		$("#zhuceDiv").hide(500);
	});
});

