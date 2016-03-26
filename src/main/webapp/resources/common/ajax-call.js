/**
 * 
 */

var ajaxParams= {url:"", data:"", formType: ""};

function ajaxRequest(){
	var flag;
	$.ajax({
		async: false,
		url: ajaxParams.url,
		type: "POST",
		data: ajaxParams.data,
		success: function(response){
			flag = setResponse(response);
		},
		error: function(){
		}
	});
	return flag;
}

function setResponse(response){
	switch(ajaxParams.formType){
	case "module":{
		if(response == true){
			/*$("[name='moduleName']").empty().parent().append('Module Already Exist'); */  
			$("#error").empty().html("&nbsp; <br> Module Already Exist");    
			document.getElementById("error").style.color = "red";

			flag =  true;
		}else{
			return false;
		}
	}
	
	case "role":{
		if(response == true){
			$("[name='roleName']").parent().append('Role Already Exist');
			flag =  false;
		}else{
			flag =  true;
		}
	}
	}
}