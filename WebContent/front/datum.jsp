<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
    <title>个人资料 | 个人中心 </title>
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="keywords" content=e选房,客户选房,选房系统，e选房系统 />
    <meta name="description" content=e选房系统是一个通过网络购房的系统，以后拿着手机就可以轻松买房子，再也不用整天跑售楼处。 />
    <link  href="/logo.ico" rel="Shortcut Icon" />
   <link href="${pageContext.request.contextPath }/css/cs.css?v=bj4vTZsmMd-mPY3_--uHwCjKrnI" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/card.css">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
    <style>
    	/* 模态框样式 */
		.modal{
			/* 模态框样式 */
				 position: fixed;
				    top:90%;
				    left: 50%;
		}
		span{
			text-align: left;
			display: inline-block;
			color:red;
		}
    	.demo-container {
            width: 350px;
            margin: 50px auto;
        }
        #number1{
        	display:none;
        }
        #name1{
        	display:none;
        }
    </style>
    <script type="text/javascript">
    	
	    $(function(){
	    	//判断中文姓名是否合法
	    	$("#username").blur(function(){
	    		//alert("姓名");
	    		var reg=/^([\u4e00-\u9fa5]){2,7}$/;
	    		var name=$("#username").val();
	    		if(reg.test(name)){
	    			$("#inTip").text("姓名合法");
	    		}else{
	    			$("#inTip").text("*姓名不合法");
	    		}
	    	});
	    	
	    	//判断身份证号码是否合法
	    	$("#idcard").blur(function(){
	    		//alert("身份证");
	    		var idCard1=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
	    		var idCard=$("#idcard").val();
	    		if(idCard1.test(idCard)){
	    			$("#icTip").text("身份证合法");
	    		}else{
	    			$("#icTip").text("身份证不合法");
	    		}
	    	});
	    	
		  	
		  	//判断银行卡格式是否正确
		  	$("#bankcard").blur(function(){
		  		//alert("银行卡");
		  		var bank1=$("bankcard").val();
		  		var bank2=/^([1-9]{1})(\d{14}|\d{18})$/;
		  		if(true){
		  			$("#bcTip").text("银行卡格式合法");
		  		}else{
		  			$("#bcTip").text("*银行卡格式不合法");
		  		}
		  	});
		  	
		  	
		  	
		  	
		  	//判断支付密码格式是否正确
		  	$("#paypwd3").blur(function() {
				//alert("dd");
				var p1=$("#paypwd3").val();
				var mm=/^[1-9]\d{5,5}$/;
				if (mm.test(p1)){
					$("#payTip3").text("密码可用");
				} else {
					$("#payTip3").text("*密码不能为空，且必须为6位纯数字");
				}
			});
		  	
		  	
		  //修改登录密码，判断密码是否可用
			$("#pwd").blur(
					function() {
						if ($("#pwd").val().trim().length >= 6
								&& $("#pwd").val().trim().indexOf(" ") == -1) {
							$("#pwdTip").text("密码可用");
						} else {
							$("#pwdTip").text("密码长度必须大于6,不含空格!");
						}
					});
		  	
		  	
		  	//修改手机号码
		  	$("#phone").blur(function() {
				var phone = $("#phone").val();
				var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
				if (!myreg.test(phone)) {
					$("#phTip").text("*手机号码格式不正确!");
				} else {
					$("#phTip").text("手机号码可用!");
				}
			});
		  	
		  	
		  	
		  	//实名认证最终提交
		  	$("#idForm").submit(
					function() {
						if ($("#inTip").text() == "姓名合法"
								&& $("#icTip").text() == "身份证合法") {
							return true;
						} else {
							return false;
						}
					});
		  //绑定银行卡最终提交
		  	$("#bankFrom").submit(
					function() {
						if ($("#bcTip").text() == "银行卡格式合法"
								&& $("#payTip3").text() == "密码可用") {
							return true;
						} else {
							return false;
						}
					});
		  	
		});
	   
	    
    </script>
    <script type="text/javascript">
	    $(function(){
	    	//判断原密码是否输入正确
	    	$("#paypwd").blur(function(){
	    		var p=$("#paypwd").val();
	    		var paypwd=${sessionScope.u.u_paypwd};
	    		if(p==paypwd){
	    			$("#payTip").text("密码正确");
	    		}else{
	    			$("#payTip").text("*密码错误");
	    		}
	    	});
		  	//判断新密码是否可用
			$("#paypwd1").blur(function() {
				//alert("dd");
				var p1=$("#paypwd1").val();
				var mm=/^[1-9]\d{5,5}$/;
				if (mm.test(p1)) {
					$("#payTip1").text("密码可用");
				} else {
					$("#payTip1").text("*密码必须为6位纯数字");
				}
			});
		  	//判断验证新密码是否输入一致
		  	$("#paypwd2").blur(function(){
		  		var p1=$("#paypwd1").val();
		  		var p2=$("#paypwd2").val();
		  		if (p1==p2) {
					$("#payTip2").text("两次密码输入一致");
				} else {
					$("#payTip2").text("*两次密码输入不一致");
				}
		  	});
		  	
		  	$("#payForm").submit(
					function() {
						if ($("#payTip").text() == "密码正确"
								&& $("#payTip1").text() == "密码可用"
								&& $("#payTip2").text() == "两次密码输入一致") {
							return true;
						} else {
							return false;
						}
					});
		  	
		  	$("#ppForm").submit(
					function() {
						if ($("#pwdTip").text() == "密码可用"
								&& $("#phTip").text() == "手机号码可用!") {
							return true;
						} else {
							return false;
						}
					});
		  	
		
	    });
    </script>
</head>
<body>
	
	 <!-- 模态框1 修改支付密码 -->
  <div class="modal fade" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h5 class="modal-title">修改支付密码</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body">
          	<form id="payFrom" action="${pageContext.request.contextPath }/DatumController?op=payPwd&&u_id=${sessionScope.u.u_id}" method="post">
          		<table border="0" cellspacing="" cellpadding="" align="center">
          			<tr>
          				<td align="right" width="30px">原密码：</td>
          				<td><input type="password" id="paypwd" name="paypwd" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="payTip"></span></td>
          			</tr>
          			<tr>
          				<td align="right">新密码：</td>
          				<td><input type="password" id="paypwd1" name="paypwd1"  /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="payTip1"></span></td>
          			</tr>
          			<tr>
          				<td align="right" width="130px">确认新密码：</td>
          				<td><input type="password" id="paypwd2" name="paypwd2" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="payTip2"></span></td>
          			</tr>
          			<tr>
          				<td colspan="2" align="center"><input type="submit" class="btn" value="修改"/></td>
          			</tr>
          		</table>
          	</form>
        </div>
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
   
      </div>
    </div>
  </div>
  
  <!-- 模态框2 身份证绑定 -->
  <div class="modal fade" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h5 class="modal-title">实名认证</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body">
          	<form id="idFrom" action="${pageContext.request.contextPath }/DatumController?op=icard&&u_id=${sessionScope.u.u_id}" method="post">
          		<table border="0" cellspacing="" cellpadding="" align="center">
          			<tr>
          				<td align="right">姓名：</td>
          				<td><input type="text" id="username" name="username" value="" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="inTip"></span></td>
          			</tr>
          			
          			<tr>
          				<td align="right"  width="130px">身份证号：</td>
          				<td><input type="text" id="idcard" name="idcard" value="" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="icTip"></span></td>
          			</tr>
          			<tr>
          				<td colspan="2" align="center"><input type="submit" class="btn" value="认证"/></td>
          			</tr>
          		</table>
          	</form>
        </div>
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
   
      </div>
    </div>
  </div>


<!-- 模态框3 银行卡绑定 -->
  <div class="modal fade" id="myModal3">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h5 class="modal-title">绑定银行卡,设置支付密码 </h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body">
          	<form id="bankFrom" action="${pageContext.request.contextPath }/DatumController?op=bank&&u_id=${sessionScope.u.u_id}" method="post">
          		<table border="0" cellspacing="" cellpadding="" align="center">
          			<tr>
          				<td align="right" width="130px">银行卡号：</td>
          				<td><input type="text" id="bankcard" name="bankcard" value="" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="bcTip"></span></td>
          			</tr>
          			
          			<tr>
          				<td align="right" width="130px">支付密码：</td>
          				<td><input type="password" id="paypwd3" name="paypwd3" value="" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="payTip3"></span></td>
          			</tr>
          			<tr>
          				<td colspan="2" align="center"><input type="submit" class="btn" value="修改"/></td>
          			</tr>
          		</table>
          	</form>
        </div>
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
    </div>
  </div>
  
  
  <!-- 模态框4 修改登录密码和手机号 -->
  <div class="modal fade" id="myModal4">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- 模态框头部 -->
        <div class="modal-header">
          <h5 class="modal-title">修改基本信息</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
   
        <!-- 模态框主体 -->
        <div class="modal-body">
          	<form id="ppForm" action="${pageContext.request.contextPath }/DatumController?op=pwdph&&u_id=${sessionScope.u.u_id}" method="post">
          		<table border="0" cellspacing="" cellpadding="" align="center">
          			
          			<tr>
          				<td align="right" width="130px">登录密码：</td>
          				<td><input type="password" id="pwd" name="pwd" value="${sessionScope.u.u_pwd}" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="pwdTip"></span></td>
          			</tr>
          			
          			<tr>
          				<td align="right" width="130px">手机号码：</td>
          				<td><input type="text" id="phone" name="phone" value="${sessionScope.u.u_phone}" /></td>
          			</tr>
          			<tr>
          				<td></td>
          				<td align="left"><span id="phTip"></span></td>
          			</tr>
          			<tr>
          				<td colspan="2" align="center"><input type="submit" class="btn" value="修改"/></td>
          			</tr>
          		</table>
          	</form>
        </div>
        <!-- 模态框底部 -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
        </div>
      </div>
    </div>
  </div>
	

  
    <div class="navbar navbar-uprice navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a href="" title="e选房" class="brand">
                </a>

               <c:choose>
                      <c:when test="${sessionScope.u==null}">
	                       <div class="nav-collapse collapse">
		                    <ul class="nav pull-right">
		                            <li class="dropdown">
		                                <a href="${pageContext.request.contextPath }/front/login.jsp">请登录</a>
		                            </li>
		                            
		                    </ul>
		                </div>
                      </c:when>
                      <c:otherwise>
                      	<div class="nav-collapse collapse">
	                    <ul class="nav pull-right">
	                            <li class="dropdown">
	                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">您好，${sessionScope.u.u_nickname}<b class="caret"></b></a>
	                                <ul class="dropdown-menu">
	                                    <li><a href="${pageContext.request.contextPath }/front/datum.jsp">基本信息</a></li>
	
	                                </ul>
	                            </li>
	                            <li><a href="${pageContext.request.contextPath }/FrontController?op=Logout">【退出】</a></li>
	                    </ul>
	                </div>
                      </c:otherwise>
                     </c:choose>
            </div>
        </div>
    </div>
    
    <div class="navbar menubar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a href="" title="e选房系统" class="brand">
                    <img src="${pageContext.request.contextPath }/img/menubar_logo.png" alt="e选房系统" /></a>
                <div class="nav-collapse collapse">
                    <div class="pull-left">
                        <!-- <div class="togglecity">
                            <a href="/site" class="city">厦门 ▼</a>
                        </div> -->
                    </div>
                    <div class="">
                        <ul class="nav menubar_nav pull-right">
                            <li id="menubar_homepage"><a href="${pageContext.request.contextPath}/front/sy.jsp">首页</a></li>
                            <li id="menubar_target"><a href="${pageContext.request.contextPath}/front/housechoose.jsp">线上开盘</a></li>
                            <li id="menubar_profile"><a href="#">个人中心</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="page">
        <div id="main">
            <div class="container">
                <div class="afterheader"></div>
                
                
                
<div class="row-fluid">
    <div class="span12">
        <div class="map">
            您所在的位置：<a href="${pageContext.request.contextPath}/front/sy.jsp" >首页</a> &gt;
             <a href="">个人中心</a> &gt;
             账号管理
        </div>
    </div>
</div>
<div class="row-fluid">
    <div class="span12">
        <div class="frame-lr-left">
            <dl class="dl-filter">
              
                <dt><span class="title">我的选房</span></dt>
                <dd>
                	 <c:choose>
                      <c:when test="${sessionScope.u!=null}">
		                    <ul class="checkable">
		                      	<li>
			                    	<a href="${pageContext.request.contextPath }/ordersController?op=queryByPage&uid=${sessionScope.u.u_id}">订单</a>
			                	</li>
		                    </ul>
		               </c:when>
		               <c:otherwise>
			               <ul class="checkable">
			                      	<li>
				                    	<a href="javascript:alert('登陆后查看订单');location.href='${pageContext.request.contextPath }/front/login.jsp'">订单</a>
				                	</li>
			                    </ul>
		               </c:otherwise>
		               </c:choose>
                </dd>
                
                <dt><span class="title">账号设置</span></dt>
                <dd>
                    <ul class="checkable">
                        <li class="selected">
                            <a href="#">基本信息</a>
                        </li>
                    </ul>
                </dd>

            </dl>
        </div>
        <div class="frame-lr-right">
            <div class="wrap">
                <div class="row-fluid">
                    <dl class="dl-form" style="border-top: 0;">
                        <dt>个人资料</dt>
                        <dd>
                            <ul class="dl-form-ul">
                           		<li><span class="dl-form-li-title">用户名：</span> ${sessionScope.u.u_nickname}</li>
                                <li><span class="dl-form-li-title">姓&nbsp;名：</span> ${sessionScope.u.u_name}</li>
                                <li><span class="dl-form-li-title">手&nbsp;机：</span> ${sessionScope.u.u_phone}</li>
                            </ul>
                            <a class="btn" style="width:150px" data-toggle="modal" data-target="#myModal4">修改登录密码和手机号</a>
                        </dd>
                    </dl>
                    
                    <dl class="dl-form account_password_wrap">
                        <dt>实名认证 <span class="dl-form-desc">实名认证后，账户信息更加安全，我们将严格保密。真实姓名会成为您绑定银行卡时的默认姓名，且无法修改，请慎重填写</span></dt>
                        <c:choose>
	                        <c:when test="${sessionScope.u.u_idcard==null}">
		                        <dd>
		                            <div>
		                                <span class="color-text-gray">当前实名认证：</span><a class="btn" data-toggle="modal" data-target="#myModal2"  href="">未认证</a>
		                            </div>
		                                <span class="red">实名认证之后才能进行选房操作</span>
		                        </dd>
	                        </c:when>
	                        <c:otherwise>
	                        	<dd>
		                            <div>
		                                <span class="color-text-gray">当前实名认证：</span>已认证<br>
		                                <span class="red">实名信息：</span>${sessionScope.u.u_name}
		                            </div>
		                                
		                        </dd>
	                        </c:otherwise>
                        </c:choose>
                    </dl>
                    
                    <dl class="dl-form">
	                        <dt>交易密码 <span class="dl-form-desc">设置交易密码后才可使用快捷支付，交易密码为6位纯数字组成</span></dt>
	                        <c:choose>
	                        	<c:when test="${sessionScope.u.u_bankcard==null }">
			                        <dd>
			                            <div>
			                                <span class="color-text-gray">交易密码：</span><a class="btn" data-toggle="modal" data-target="#myModal3">未设置</a>
			                            </div>
			                                <span class="red">请先完成实名认证，绑定银行卡并设置交易密码</span>
			                        </dd>
                       			 </c:when>
                        		<c:otherwise>
			                        <dd>
			                            <div>
			                                <span class="color-text-gray">交易密码：</span>已设置
			                            </div>
			                            <a class="btn" data-toggle="modal" data-target="#myModal1">修改交易密码</a>
			                        </dd>
                        		</c:otherwise>
                        	</c:choose>
                    </dl>

                    <dl class="dl-form">
                        <dt>银行卡 <span class="dl-form-desc">快捷绑定，无需输入分支行信息，可用于充值和提现；仅支持储蓄卡</span></dt>
                        <c:choose>
	                        <c:when test="${sessionScope.u.u_bankcard==null }">
		                        <dd>
		                            <div>
		                                <span class="color-text-gray ">当前银行卡信息：</span><a class="btn" data-toggle="modal" data-target="#myModal3">未绑定</a>
		                            </div>
		                                <span class="red">请先完成实名认证</span>
		                        </dd>
	                        </c:when>
	                        <c:otherwise>
	                        	<dd>
		                            <div>
		                                <span class="color-text-gray ">当前银行卡信息：</span>已绑定
		                            </div>
		                                <span class="red">银行卡号：${sessionScope.u.u_bankcard}</span>
		                        </dd>
		                        
		                       		<!--  银行卡 -->
		                        <div class="demo-container">
							        <div class="card-wrapper"></div>
							
							        <div class="form-container active">
							            <form action="">
							                <input placeholder="Card number" type="text" name="number1" id="number1" value="${sessionScope.u.u_bankcard}">
							                <input placeholder="Full name" type="text" id="name1" name="name" value="${sessionScope.u.u_name}">
							                <!-- <input placeholder="MM/YY" type="text" name="expiry">
							                <input placeholder="CVC" type="text" name="cvc">-->
							            </form>
							        </div>
							    </div>
							    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		    					<script src="${pageContext.request.contextPath}/js/card.js"></script>
		    					<script>
							        $('.active form').card({
							            container: $('.card-wrapper')
							        })
							    </script>
	                        </c:otherwise>
                        </c:choose>
                        
                        
                    </dl>
                </div>
            </div>

        </div>
    </div>
</div>



            </div>
            <div class="afterbottom"></div>
        </div>
    </div>

<div id="footer" style="height:160px">
    <div class="container columns ">
        <div class="row-fluid">
            <div class="span8">
                <div class="row-fluid">
                    <div class="span3">
                        <ul class="column">
                            <li>
                                <h2>公&nbsp;司</h2>
                            </li>
                            <li><a target="_blank" href="">关于我们</a></li>
                            <li><a target="_blank" href="">联系我们</a></li>
                        </ul>
                    </div>
                    <div class="span3">
                        <ul class="column">
                            <li>
                                <h2>支&nbsp;持</h2>
                            </li>
                            <li><a target="_blank" href="" >帮助中心</a></li>
                        </ul>
                    </div>
                    <div class="span3">
                        <ul class="column">
                            <li>
                                <h2>更&nbsp;多</h2>
                            </li>
                            <li><a target="_blank" href="">法律声明</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="span4">
                <div class="row-fluid">
                    <div class="span7">
                        <ul class="column colum-right">
                            <li><a>
                                <img src="${pageContext.request.contextPath }/img/bottom_logo.png" alt="e选房系统"></a></li>
                            <li>
                                <h6>e选房系统 版权所有</h6>
                                <h6>京ICP备16050553号</h6>
                            </li>
                            <li>  </li>
                        </ul>
                    </div>
                    <div class="span5 alcent ">
                            <p class="marbot5 ">
                                <img src="${pageContext.request.contextPath }/img/666.jpg" style="width:90px; margin-top:0px"/>
                            </p>
                            <span>扫二维码有惊喜</span>
                        <p>
                          
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
   <script src="/Yswee/Home/js.js?v=SzMY7OOJkzZMDcGNTydYvhNQN9c"></script>
    
   <script src="${pageContext.request.contextPath }/js/js.js"></script>
   <script src="/Yswee/Page/Account.js"></script>

    <script>
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?7f8a3fed4e5181142e4c1f289ba3dd80";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</body>
</html>





