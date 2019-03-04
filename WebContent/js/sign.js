/********************************管理员登陆注册脚本********************************/
function cambiar_login() {
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_login";
	document.querySelector('.cont_form_login').style.display = "block";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.opacity = "1";
	}, 400);

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
	}, 200);
}

function cambiar_sign_up(at) {
	document.querySelector('.cont_forms').className = "cont_forms cont_forms_active_sign_up";
	document.querySelector('.cont_form_sign_up').style.display = "block";
	document.querySelector('.cont_form_login').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.opacity = "1";
	}, 100);

	setTimeout(function() {
		document.querySelector('.cont_form_login').style.display = "none";
	}, 400);

}

function ocultar_login_sign_up() {

	document.querySelector('.cont_forms').className = "cont_forms";
	document.querySelector('.cont_form_sign_up').style.opacity = "0";
	document.querySelector('.cont_form_login').style.opacity = "0";

	setTimeout(function() {
		document.querySelector('.cont_form_sign_up').style.display = "none";
		document.querySelector('.cont_form_login').style.display = "none";
	}, 500);

}

/*$(function() {
	//判断用户名是否重复
	$("#ureName").blur(function() {
		if ($("#ureName").val().trim()=="") {
			$("#nameTip").text("用户名不能为空!")
		} else {
			$.post("/cms1.2/UserController", {
				ureName: $("#ureName").val(),
				op : "checkName"
			}, function(data, status) {
				$("#nameTip").text(data)
			});
		}
	});
	//判断密码是否可用
	$("#urePwd").blur(function() {
		if ($("#urePwd").val().trim().length>=6 && $("#urePwd").val().trim().indexOf(" ")==-1) {
			$("#pwdTip").text("密码可用")
		} else {
			$("#pwdTip").text("密码长度必须大于6,不含空格!")
		}
	});
	//密码确认事件
	$("#rePwd").blur(function() {
		var urePwd=$("#urePwd").val();
		var rePwd=$("#rePwd").val();
		if (urePwd==rePwd) {
			$("#rePwdTip").text("密码确认成功!")
		} else {
			$("#rePwdTip").text("两次密码输入不一致!")
		}
	});
	//最终表达提交
	$(".regForm").submit(function() {
		if ($("#nameTip").text()=="用户名可用" && $("#pwdTip").text()=="密码可用" && $("#rePwdTip").text()=="密码确认成功!") {
			return true;
		} else {
			return false;
		}
	});
});*/