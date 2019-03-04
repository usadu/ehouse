<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String userName = "";
	String userPwd = "";
	String isChecked = "unChecked";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			if (c.getName().equals("userName")) {
				userName = c.getValue();
			}
			if (c.getName().equals("userPwd")) {
				userPwd = c.getValue();
			}
			if (c.getName().equals("isChecked")) {
				isChecked = c.getValue();
			}
		}
	}
	pageContext.setAttribute("userName", userName);
	pageContext.setAttribute("userPwd", userPwd);
	pageContext.setAttribute("isChecked", isChecked);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登陆与注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.slider.css" />
<link
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet">
<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<script
	src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sign.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.slider.min.js"></script>

<style>
	
	
	#result{
		display:none;
		
	}
	.slider{
		align-content: center;
		margin: 20px 0px 10px 10px;
	}
	.cont_form_login>h2 {
		margin-top:50px;
	}
	.hk{
		margin: 0;
		padding: 0;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		
		//滑块验证码
		$("#slider").slider({
			width: 260, // width
			height: 50, // height
			sliderBg: "rgb(134, 134, 131)", // 滑块背景颜色
			color: "#fff", // 文字颜色
			fontSize: 16, // 文字大小
			bgColor: "#33CC00", // 背景颜色
			textMsg: "按住滑块，拖拽验证", // 提示文字
			successMsg: "验证通过了哦", // 验证成功提示文字
			successColor: "red", // 滑块验证成功提示文字颜色
			time: 400, // 返回时间
			callback: function(result) { // 回调函数，true(成功),false(失败)
				$("#result").text(result);
			}
		});
		
		
		
		//判断用户名是否重复
		$("#ureName").blur(function() {
			//alert("鼠标移开");
			if ($("#ureName").val().trim() == "") {
				$("#nameTip").text("用户名不能为空!");
			} else {
				$.post("${pageContext.request.contextPath}/FrontController",{ureName: $("#ureName").val(),op:"checkName"},function(data,status){
					//alert(data+status);
					$("#nameTip").text(data);
				});
			}
		});
		//判断密码是否可用
		$("#urePwd").blur(
				function() {
					if ($("#urePwd").val().trim().length >= 6
							&& $("#urePwd").val().trim().indexOf(" ") == -1) {
						$("#pwdTip").text("密码可用");
					} else {
						$("#pwdTip").text("密码长度必须大于6,不含空格!");
					}
				});
		//密码确认事件
		$("#rePwd").blur(function() {
			var urePwd = $("#urePwd").val();
			var rePwd = $("#rePwd").val();
			if (urePwd == rePwd && rePwd.trim() !== "") {
				$("#rePwdTip").text("密码确认成功!");
			} else if (rePwd.trim() == "") {
				$("#rePwdTip").text("不能为空！");
			} else {
				$("#rePwdTip").text("两次密码输入不一致");
			}
		});
		$("#phone").blur(function() {
			var phone = $("#phone").val();
			var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
			if (!myreg.test(phone)) {
				$("#phTip").text("手机号码格式不正确!");
			} else {
				$("#phTip").text("手机号码可用!");
			}
		});
		//最终表达提交
		$("#regForm").submit(
				function() {
					if ($("#nameTip").text() == "用户名可用"
							&& $("#pwdTip").text() == "密码可用"
							&& $("#rePwdTip").text() == "密码确认成功!") {
						return true;
					} else {
						return false;
					}
				});
		
		
		//登陆最终表达提交
		$(".cont_form_login").submit(
				function() {
					if ($("#result").text() == "true") {
						return true;
					} else {
						alert("请通过登陆验证");
						return false;
					}
				});
		
		
	});
</script>
</head>
<body>
	<div class="cotn_principal">
		<div class="cont_centrar">
			<div class="cont_login">
				<div class="cont_info_log_sign_up">
					<div class="col_md_login">
						<div class="cont_ba_opcitiy">
							<h2>登陆</h2>
							<p>用户登陆界面</p>
							<button class="btn_login" onClick="cambiar_login()">密码登陆</button>
						</div>
					</div>
					<div class="col_md_sign_up">
						<div class="cont_ba_opcitiy">
							<h2>注册</h2>
							<p>申请注册账号</p>
							<button class="btn_sign_up" onClick="cambiar_sign_up()">立即注册</button>
						</div>
					</div>
				</div>
				<div class="cont_back_info">
					<div class="cont_img_back_grey">
						<img src="${pageContext.request.contextPath}/img/op.jpg" alt="" />
					</div>
				</div>
				<div class="cont_forms">
					<div class="cont_img_back_">
						<img src="${pageContext.request.contextPath}/img/op.jpg" alt="" />
					</div>
					<form class="cont_form_login"
						action="${pageContext.request.contextPath}/FrontController?op=login"
						method="post">
						<a href="#" onClick="ocultar_login_sign_up()"> <i
							class="material-icons">&#xE5C4;</i></a>
						<h2>登陆</h2>
						<input type="text" placeholder="用户名" name="userName" required value="${userName}" /> 
						<input type="password" placeholder="密码" name="userPwd" required value="${userPwd}" />
						<!-- 滑块验证码 -->
						<div id="hk">
							<div id="slider" class="slider"></div>
							<div class="result"><span id="result"></span></div>
						</div>
						<div class="checkbox">
							<c:if test="${isChecked eq 'checked'}">
								<div class="remember-me">
									<input type="checkbox" value="remember-me" name="remember-me"
										checked> 记住我
								</div>
							</c:if>
							<c:if test="${isChecked eq 'unChecked'}">
								<div class="remember-me">
									<input type="checkbox" value="remember-me" name="remember-me">
									记住我
								</div>
							</c:if>
						</div>
						<button class="btn_login" onClick="cambiar_login()" type="submit">登陆</button>
					</form>
					<form class="cont_form_sign_up"
						action="${pageContext.request.contextPath}/FrontController?op=register"
						method="post" id="regForm">
						<a href="#" onClick="ocultar_login_sign_up()"> <i
							class="material-icons">&#xE5C4;</i></a>
						<h2>注册</h2>
						<input type="text" placeholder="用户名" id="ureName" name="ureName"
							 />
						<div id="nameTip">以字母开头，由字母和数字组成</div>
						<input type="password" placeholder="密码" id="urePwd" name="urePwd"
							required />
						<div id="pwdTip"></div>
						<input type="password" placeholder="确认密码" id="rePwd" required />
						<div id="rePwdTip"></div>
						<input type="text" placeholder="手机号码" id="phone" name="phone" />
						<div id="phTip"></div>
						<button class="btn_sign_up" onClick="cambiar_sign_up()"
							type="submit">注册</button>
					</form>
				</div>
			</div>
		</div>
		<div id="e_foot">
			<img src="${pageContext.request.contextPath}/img/exf2.png">
		</div>
	</div>
</body>
</html>

