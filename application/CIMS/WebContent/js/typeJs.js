function addTypeBtn(){//添加类型按钮点击事件
	if($('#addtr').length==0){
			var tr = $('<tr />', {id:'addtr'});
			var inputTd = $('<td />');
			var btnTd = $('<td />');
        	var input = $('<input />',{id:'type_name'});
        	var sumbitBtn = $('<button >',{id:'sumbit', class:'btn btn-success',onclick:'addType()'}).text("添加");
        	var cancelBtn = $('<button >',{id:'cancel', class:'btn btn-danger',onclick:'cancelAdd()'}).text("取消");
        	btnTd.append(sumbitBtn);
        	btnTd.append(cancelBtn);
        	inputTd.append(input)
        	tr.append($('<td />'));
        	tr.append(inputTd);
        	tr.append(btnTd);
        	var tbody=$("#tbody");
        	tbody.append(tr);
		}
	};
function adminDelete(id){//删除
	if(confirm("确定删除吗")){
		$.ajax({
			url: "type/deleteType",
			type: "POST",
			dataType:'json',
			data:{"type_id":id},
			success: function(data){
				if(data.success!=undefined){
					$("#"+id).remove();
					alert("删除成功");
				}
				if(data.failed!=undefined){
					alert("删除失败");
				}
			}
		})
		return true;
		}
	return false;
};
function update(id,name){//更新
	updateType(id,name)
}


function addType(){//添加请求
	$.ajax({
		url: "type/addType",
		type: "POST",
		dataType:'json',
		data: {"type_name":$("#type_name").val()},
		success: function(data){
			if(data.e!=undefined){
				alert(data.e);
			}else{
				var id = data.type_id;
				var name = data.type_name;
				var str = id+",'"+name+"'";
				console.log(str);
				$("#addtr").remove();
				var tr=$("<tr/>",{id:data.type_id});
				var idTd=$("<td/>").text(id);
				var nameTd=$("<td/>").text(name);
				var actionTd = $("<td/>");
				var updateBtn = $('<button >',{class:'btn btn-success', onclick:"updateType("+str+")", herf:'javascript:void(0)'}).text("修改");
	        	var deleteBtn = $('<button >',{class:'btn btn-danger', onclick:'return adminDelete('+id+')', herf:'javascript:void(0)'}).text("删除");
	        	actionTd.append(updateBtn);
	        	actionTd.append(deleteBtn);
				tr.append(idTd);
				tr.append(nameTd);
				tr.append(actionTd);
				var tbody=$("#tbody");
	        	tbody.append(tr);
			}
		},
		error: function(e){
			console.log(e);
		}
	})
}

function cancelAdd(){//取消添加
	$("#addtr").remove();
}

function updateType(id,name){//更新按钮事件
	var tr=$("#"+id);
	var child = tr.children();
	var inputTd = $('<td />');
	var btnTd = $('<td />', {id: 'updateBtn'});
	var input = $('<input />', {id: 'name',value: name});
	var completeBtn = $('<button >',{id:'complete', class:'btn btn-success', onclick:'complete('+id+')'}).text("完成");
	var cancelBtn = $('<button >',{id:'cancel', class:'btn btn-danger', onclick:"cancelUpdate("+id+",'"+name+"')"}).text("取消");
	btnTd.append(completeBtn);
	btnTd.append(cancelBtn);
	inputTd.append(input);
	$(child[1]).replaceWith(inputTd);
	$(child[2]).replaceWith(btnTd);
}


function complete(id){//更新请求
	var val = $("#name").val();
	console.log(val);
	$.ajax({
		url:"type/updateType",
		type: "POST",
		dataType:'json',
		data: {"type_name":val, "type_id": id},
		success: function(data){
			if(data.e!=undefined){
				alert(data.e);
			}else{
			var name = data.type_name;
			var td = $("<td >").text(name);
			var actionTd = $("<td/>");
			var updateBtn = $('<button >',{class:'btn btn-success ', onclick:"updateType("+id+",'"+name+"')", herf:'javascript:void(0)'}).text("修改");
        	var deleteBtn = $('<button >',{class:'btn btn-danger', onclick:'return adminDelete('+id+')', herf:'javascript:void(0)'}).text("删除");
        	actionTd.append(updateBtn);
        	actionTd.append(deleteBtn);
			$("#name").replaceWith(name);
			$("#updateBtn").replaceWith(actionTd);
			}
		}
	})
}
function cancelUpdate(id,name){//取消修改
	var actionTd = $("<td/>");
	var updateBtn = $('<button >',{class:'btn btn-success', onclick:"updateType("+id+",'"+name+"')", herf:'javascript:void(0)'}).text("修改");
	var deleteBtn = $('<button >',{class:'btn btn-danger', onclick:'return adminDelete('+id+')', herf:'javascript:void(0)'}).text("删除");
	actionTd.append(updateBtn);
	actionTd.append(deleteBtn);
	$("#name").replaceWith(name);
	$("#updateBtn").replaceWith(actionTd);
}