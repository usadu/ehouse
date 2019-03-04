<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <c:if test="${request.getSession()==null}">
	<c:redirect url="/mvc/sign.jsp"></c:redirect>
</c:if> --%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>管理员管理界面首页</title>
<link
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/album.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/table.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/laydate.js"></script>
<script type="text/javascript">

<%-- ***********************************************************JQ入口初始化数据*********************************************************** --%>
	$(function () {
		<%-- 页面加载完调用函数 --%>
		window.onload = function (){
				seach_f_user_all();
				seach_f_ht_all();
				seach_f_hx_all();
				seach_f_ha_all();
				seach_f_hs_all();
			};
		<%-- 页面加载完调用函数--房子类型插入显示 --%>
		function seach_f_ht_all() {
	        $.post(
	            "${pageContext.request.contextPath}/AdminController", {
	            op: "queryHT",
	        }, function (data) {
	        	var info = "";
	        	$.each(data, function (index,str) {
	                info+='<option value="'+str.ht_id+'">'+str.ht_name+'</option>';
	            });
	        	$(".f_type").html(info);
	        });
	    };
	    <%-- 页面加载完调用函数--房子户型插入显示 --%>
		function seach_f_hx_all() {
	        $.post(
	            "${pageContext.request.contextPath}/AdminController", {
	            op: "queryHX",
	        }, function (data) {
	        	var info = "";
	        	$.each(data, function (index,str) {
	                info+='<option value="'+str.un_id+'">'+str.un_name+'</option>';
	            });
	        	$(".f_hx").html(info);
	        });
	    };
	    <%-- 页面加载完调用函数--房子地区插入显示 --%>
		function seach_f_ha_all() {
	        $.post(
	            "${pageContext.request.contextPath}/AdminController", {
	            op: "queryHA",
	        }, function (data) {
	        	var info = "";
	        	$.each(data, function (index,str) {
	                info+='<option value="'+str.ar_id+'">'+str.ar_name+'</option>';
	            });
	        	$(".f_area").html(info);
	        });
	    };
	    <%-- 页面加载完调用函数--房子状态插入显示 --%>
		function seach_f_hs_all() {
	        $.post(
	            "${pageContext.request.contextPath}/AdminController", {
	            op: "queryHS",
	        }, function (data) {
	        	var info = "";
	        	$.each(data, function (index,str) {
	                info+='<option value="'+str.hs_id+'">'+str.hs_name+'</option>';
	            });
	        	$(".f_state").html(info);
	        });
	    };
<%-- ***********************************************************定义JQ属性--数据遍历显示*********************************************************** --%>
		<%-- 定义JQ属性--用户数据遍历显示 --%>
		$.fn.userShow_n =function (data, status) {
			var info = "";
			var Page = "";
			var mydata=data.data;
            $.each(mydata, function (index,str) {
                info+='<tr><td>' + str.u_id + '</td><td>' + str.u_nickname
                + '</td><td>' + str.u_pwd + '</td><td>' +str.u_name + '</td><td>' 
                + str.u_idcard + '</td><td>' + str.u_phone +'</td><td>' + str.u_paypwd 
                + '</td><td>' + str.u_bankcard 
                + '</td><td><a data-toggle="modal" data-target="#myModal1" data-id='
                +str.u_id+' data-name='+str.u_nickname+' data-pwd='
                +str.u_pwd+' data-phone='+str.u_phone
                +' class="btn btn-sm btn-primary text-dark">修改</a> <a data-toggle="modal" data-target="#myModal2" data-id='
                +str.u_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
           	for (var i = 1; i <= data.totalPage; i++) {
           		if (i==data.pageNo) {
               		Page+='<li class="page-item active"><a class="page-link text-dark" href="javascript:page('+i+')">'+i+'</a></li>';
				}else{
	           		Page+='<li class="page-item"><a class="page-link text-dark" href="javascript:page('+i+')">'+i+'</a></li>';
				}
			}
           	var nextPage=Number(data.pageNo)+Number(1);
           	var prePage=Number(data.pageNo)-Number(1);
           	if (parseInt(nextPage)>parseInt(data.totalPage)) {
           		nextPage=Number(data.pageNo);
			};
			if (parseInt(prePage)<=parseInt(0)) {
				prePage=Number(data.pageNo);
			};
           	$("#Page1").html('<li class="page-item" style="outline: none"><a class="page-link text-dark" href="javascript:page(1)">首页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark active" href="javascript:page('+prePage+')">上一页</a></li>'+ Page 
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page('+nextPage+')">下一页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page('+data.totalPage+')">末页</a></li>');
           	$("#seach_f").html('<form class="w-100" onsubmit="return seach_f_user()"> <input class="form-control form-control-dark w-100" type="text" placeholder="在这里搜用户 . . ." aria-label="Search" id="seach_in"></form>');
            $("#pcontent").html(info);
            $("#exf_title").text("用户列表");
            $("#exf_navbar").html('<a class="nav-link text-danger" href="#" data-toggle="modal" data-target="#myModal3"> 📖&nbsp&nbsp添加用户 </a>');          
            $("#pcontent_title").html("<th>编号</th><th>账户</th><th>密码</th><th>姓名</th><th>身份证号</th><th>电话</th><th>支付密码</th><th>银行卡号</th><th>操作</th>");
            
		};
		<%-- 定义JQ属性--用户数据搜索遍历显示 --%>
		$.fn.userShow_p =function (data, status) {
			var info = "";
			var Page = "";
			var mydata=data.data;
            $.each(mydata, function (index,str) {
                info+='<tr><td>' + str.u_id + '</td><td>' + str.u_nickname
                + '</td><td>' + str.u_pwd + '</td><td>' +str.u_name + '</td><td>' 
                + str.u_idcard + '</td><td>' + str.u_phone +'</td><td>' + str.u_paypwd 
                + '</td><td>' + str.u_bankcard 
                + '</td><td><a data-toggle="modal" data-target="#myModal1" data-id='
                +str.u_id+' data-name='+str.u_nickname+' data-pwd='
                +str.u_pwd+' data-phone='+str.u_phone
                +' class="btn btn-sm btn-primary text-dark">修改</a> <a data-toggle="modal" data-target="#myModal2" data-id='
                +str.u_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
           	for (var i = 1; i <= data.totalPage; i++) {
           		if (i==data.pageNo) {
               		Page+='<li class="page-item active"><a class="page-link text-dark" href="javascript:page('+i+')">'+i+'</a></li>';
				}else{
	           		Page+='<li class="page-item"><a class="page-link text-dark" href="javascript:page('+i+')">'+i+'</a></li>';
				}
			}
           	var nextPage=Number(data.pageNo)+Number(1);
           	var prePage=Number(data.pageNo)-Number(1);
           	if (parseInt(nextPage)>parseInt(data.totalPage)) {
           		nextPage=Number(data.pageNo);
			};
			if (parseInt(prePage)<=parseInt(0)) {
				prePage=Number(data.pageNo);
			};
           	$("#Page1").html('<li class="page-item" style="outline: none"><a class="page-link text-dark" href="javascript:page(1)">首页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark active" href="javascript:page('+prePage+')">上一页</a></li>'+ Page 
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page('+nextPage+')">下一页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page('+data.totalPage+')">末页</a></li>');
            $("#pcontent").html(info);
		};
		<%-- 定义JQ属性--房子数据遍历显示 --%>
		$.fn.houseShow_n =function (data, status) {
			var info = "";
			var Page = "";
			var mydata=data.data;
            $.each(mydata, function (index,str) {
                info+='<tr><td>' + str.h_id + '</td><td>' + str.h_name + '</td><td>' + str.ht_name + '</td><td>' +str.un_name + '</td><td>' 
                + str.h_unitprice + '</td><td>' + str.h_area + '</td><td>' + str.areas_name +'</td><td>' + str.hs_name + '</td><td>' + str.h_time 
                + '</td><td style="vertical-align: middle; width: 120px; display: block; overflow: hidden; word-break: keep-all; white-space: nowrap; text-overflow: ellipsis;">' 
                + str.h_photo + '</td><td><a data-toggle="modal" data-target="#myModalHUpd" data-h_id=' +str.h_id
                +' data-h_name='+str.h_name+' data-h_type='+str.ht_id+' data-h_hx='+str.un_id+' data-h_price='+str.h_unitprice+' data-h_area='+str.areas_id
                +' data-h_state='+str.hs_id+' data-h_time='+str.h_time+' data-h_photo='+str.h_photo +' data-h_mj='+str.h_area
                +' class="btn btn-sm btn-primary text-dark">修改</a> <a data-toggle="modal" data-target="#myModalHDel" data-id='
                +str.h_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
           	for (var i = 1; i <= data.totalPage; i++) {
           		if (i==data.pageNo) {
               		Page+='<li class="page-item active"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}else{
	           		Page+='<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}
			}
           	var nextPage=Number(data.pageNo)+Number(1);
           	var prePage=Number(data.pageNo)-Number(1);
           	if (parseInt(nextPage)>parseInt(data.totalPage)) {
           		nextPage=Number(data.pageNo);
			};
			if (parseInt(prePage)<=parseInt(0)) {
				prePage=Number(data.pageNo);
			};
           	$("#Page1").html('<li class="page-item" style="outline: none"><a class="page-link text-dark" href="javascript:page_house(1)">首页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark active" href="javascript:page_house('+prePage+')">上一页</a></li>'+ Page 
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+nextPage+')">下一页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+data.totalPage+')">末页</a></li>');
            $("#pcontent").html(info);
            $("#exf_title").text("房产列表");
            $("#exf_navbar").html('<a class="nav-link text-danger" href="#" data-toggle="modal" data-target="#myModalHAdd"> 📖&nbsp&nbsp添加房产 </a>');          
            $("#pcontent_title").html("<th>编号</th><th>房名</th><th>类型</th><th>户型</th><th>价格</th><th>面积</th><th>地区</th><th>状态</th><th>发售时间</th><th>预览图地址</th><th>操作</th>");
            $("#seach_f").html('<form class="w-100" onsubmit="return seach_f_house()"> <input class="form-control form-control-dark w-100" type="text" placeholder="在这里搜房产 . . ." aria-label="Search" id="seach_in"></form>');
            
		};
		<%-- 定义JQ属性--房子数据搜索遍历显示 --%>
		$.fn.houseShow_p =function (data, status) {
			var info = "";
			var Page = "";
			var mydata=data.data;
            $.each(mydata, function (index,str) {
                info+='<tr><td>' + str.h_id + '</td><td>' + str.h_name + '</td><td>' + str.ht_name + '</td><td>' +str.un_name + '</td><td>' 
                + str.h_unitprice + '</td><td>' + str.h_area + '</td><td>' + str.areas_name +'</td><td>' + str.hs_name + '</td><td>' + str.h_time 
                + '</td><td style="vertical-align: middle; width: 120px; display: block; overflow: hidden; word-break: keep-all; white-space: nowrap; text-overflow: ellipsis;">' 
                + str.h_photo + '</td><td><a data-toggle="modal" data-target="#myModalHUpd" data-h_id=' +str.h_id
                +' data-h_name='+str.h_name+' data-h_type='+str.ht_id+' data-h_hx='+str.un_id+' data-h_price='+str.h_unitprice+' data-h_area='+str.areas_id
                +' data-h_state='+str.hs_id+' data-h_time='+str.h_time+' data-h_photo='+str.h_photo +' data-h_mj='+str.h_area
                +' class="btn btn-sm btn-primary text-dark">修改</a> <a data-toggle="modal" data-target="#myModalHDel" data-id='
                +str.h_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
           	for (var i = 1; i <= data.totalPage; i++) {
           		if (i==data.pageNo) {
               		Page+='<li class="page-item active"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}else{
	           		Page+='<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}
			}
           	var nextPage=Number(data.pageNo)+Number(1);
           	var prePage=Number(data.pageNo)-Number(1);
           	if (parseInt(nextPage)>parseInt(data.totalPage)) {
           		nextPage=Number(data.pageNo);
			};
			if (parseInt(prePage)<=parseInt(0)) {
				prePage=Number(data.pageNo);
			};
           	$("#Page1").html('<li class="page-item" style="outline: none"><a class="page-link text-dark" href="javascript:page_house(1)">首页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark active" href="javascript:page_house('+prePage+')">上一页</a></li>'+ Page 
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+nextPage+')">下一页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+data.totalPage+')">末页</a></li>');
            $("#pcontent").html(info);
		};
		<%-- 定义JQ属性--管理员数据遍历显示 --%>
		$.fn.admShow_n =function (data, status) {
    		var info = "";
        	$.each(data, function (index,str) {
                info+='<tr><td>' + str.a_id + '</td><td>' + str.a_name
                + '</td><td>' + str.a_pwd + '</td><td><a data-toggle="modal" data-target="#myModal4" data-id='
                +str.a_id+' data-name='+str.a_name+' data-pwd='
                +str.a_pwd+' class="btn btn-sm btn-primary text-dark">修改</a> <a data-toggle="modal" data-target="#myModal5" data-id='
                +str.a_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
        	$("#pcontent").html(info);
        	$("#exf_title").text("管理员列表");
            $("#pcontent_title").html("<th>编号</th><th>账户</th><th>密码</th><th>操作</th>");
            $("#exf_navbar").html('<a class="nav-link text-danger" href="${pageContext.request.contextPath}/mvc/sign.jsp"> 📖&nbsp&nbsp注册新管理员 </a>');
            $("#Page1").html("");
		};
		<%-- 定义JQ属性--订单数据遍历显示 --%>
		$.fn.orderShow_n =function (data, status) {
			var info = "";
			var Page = "";
			var mydata=data.data;
            $.each(mydata, function (index,str) {
                info+='<tr><td>' + str.o_id + '</td><td>' + str.u_id + '</td><td>' + str.u_name + '</td><td>' +str.h_id + '</td><td>' 
                + str.h_name + '</td><td>' + str.o_time + '</td><td>' + str.o_price +'</td><td><a data-toggle="modal" data-target="#myModalODel" data-id=' 
                +str.o_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
           	for (var i = 1; i <= data.totalPage; i++) {
           		if (i==data.pageNo) {
               		Page+='<li class="page-item active"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}else{
	           		Page+='<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}
			}
           	var nextPage=Number(data.pageNo)+Number(1);
           	var prePage=Number(data.pageNo)-Number(1);
           	if (parseInt(nextPage)>parseInt(data.totalPage)) {
           		nextPage=Number(data.pageNo);
			};
			if (parseInt(prePage)<=parseInt(0)) {
				prePage=Number(data.pageNo);
			};
           	$("#Page1").html('<li class="page-item" style="outline: none"><a class="page-link text-dark" href="javascript:page_order(1)">首页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark active" href="javascript:page_order('+prePage+')">上一页</a></li>'+ Page 
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_order('+nextPage+')">下一页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_order('+data.totalPage+')">末页</a></li>');
            $("#pcontent").html(info);
            $("#exf_title").text("订单列表"); 
            $("#exf_navbar").html('<a class="nav-link text-danger" href="#" data-toggle="modal" data-target=""> 📖&nbsp&nbsp订单管理 </a>');
            $("#pcontent_title").html("<th>编号</th><th>用户编号</th><th>用户名</th><th>房产编号</th><th>房产名称</th><th>下单时间</th><th>订单价格(RMB)</th><th>操作</th>");
            $("#seach_f").html('<form class="w-100" onsubmit="return seach_f_order()"> <input class="form-control form-control-dark w-100" type="text" placeholder="在这里搜订单 . . ." aria-label="Search" id="seach_in"></form>');
            
		};
		<%-- 定义JQ属性--订单数据搜索遍历显示 --%>
		$.fn.orderShow_p =function (data, status) {
			var info = "";
			var Page = "";
			var mydata=data.data;
            $.each(mydata, function (index,str) {
                info+='<tr><td>' + str.o_id + '</td><td>' + str.u_id + '</td><td>' + str.u_name + '</td><td>' +str.h_id + '</td><td>' 
                + str.h_name + '</td><td>' + str.o_time + '</td><td>' + str.o_price +'</td><td><a data-toggle="modal" data-target="#myModalODel" data-id=' 
                +str.o_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
           	for (var i = 1; i <= data.totalPage; i++) {
           		if (i==data.pageNo) {
               		Page+='<li class="page-item active"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}else{
	           		Page+='<li class="page-item"><a class="page-link text-dark" href="javascript:page_house('+i+')">'+i+'</a></li>';
				}
			}
           	var nextPage=Number(data.pageNo)+Number(1);
           	var prePage=Number(data.pageNo)-Number(1);
           	if (parseInt(nextPage)>parseInt(data.totalPage)) {
           		nextPage=Number(data.pageNo);
			};
			if (parseInt(prePage)<=parseInt(0)) {
				prePage=Number(data.pageNo);
			};
           	$("#Page1").html('<li class="page-item" style="outline: none"><a class="page-link text-dark" href="javascript:page_order(1)">首页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark active" href="javascript:page_order('+prePage+')">上一页</a></li>'+ Page 
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_order('+nextPage+')">下一页</a></li>'
							+'<li class="page-item"><a class="page-link text-dark" href="javascript:page_order('+data.totalPage+')">末页</a></li>');
            $("#pcontent").html(info);
		};
		<%-- 定义JQ属性--售房状态数据遍历显示 --%>
		$.fn.hs_data =function (data, status) {
    		var info = "";
        	$.each(data, function (index,str) {
                info+='<tr><td>' + str.hs_id + '</td><td>' + str.hs_name
                + '</td><td><a data-toggle="modal" data-target="#myModalHSDel" data-id='
                +str.hs_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
        	$("#pcontent").html(info);
        	$("#exf_title").text("售房状态列表");
        	$("#exf_navbar").html('<a class="nav-link text-danger" href="#" data-toggle="modal" data-target="#myModalHSAdd"> 📖&nbsp&nbsp添加状态 </a>');
            $("#pcontent_title").html("<th>编号</th><th>售房状态</th><th>操作</th>");
            $("#Page1").html("");
		};
		<%-- 定义JQ属性--售房类型数据遍历显示 --%>
		$.fn.ht_data =function (data, status) {
    		var info = "";
        	$.each(data, function (index,str) {
                info+='<tr><td>' + str.ht_id + '</td><td>' + str.ht_name
                + '</td><td><a data-toggle="modal" data-target="#myModalHTDel" data-id='
                +str.ht_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
        	$("#pcontent").html(info);
        	$("#exf_title").text("房源类型列表");
        	$("#exf_navbar").html('<a class="nav-link text-danger" href="#" data-toggle="modal" data-target="#myModalHTAdd"> 📖&nbsp&nbsp添加类型 </a>');
            $("#pcontent_title").html("<th>编号</th><th>房源类型</th><th>操作</th>");
            $("#Page1").html("");
		};
		<%-- 定义JQ属性--房源户型数据遍历显示 --%>
		$.fn.hx_data =function (data, status) {
    		var info = "";
        	$.each(data, function (index,str) {
                info+='<tr><td>' + str.un_id + '</td><td>' + str.un_name + '</td><td>' + str.un_photo
                + '</td><td><a data-toggle="modal" data-target="#myModalHXDel" data-id='
                +str.un_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
        	$("#pcontent").html(info);
        	$("#exf_title").text("户型管理列表");
        	$("#exf_navbar").html('<a class="nav-link text-danger" href="#" data-toggle="modal" data-target="#myModalHXAdd"> 📖&nbsp&nbsp添加户型 </a>');
            $("#pcontent_title").html("<th>编号</th><th>房源户型</th><th>预览图地址</th><th>操作</th>");
            $("#Page1").html("");
		};
		<%-- 定义JQ属性--房源地区数据遍历显示 --%>
		$.fn.ha_data =function (data, status) {
    		var info = "";
        	$.each(data, function (index,str) {
                info+='<tr><td>' + str.ar_id + '</td><td>' + str.ar_name
                + '</td><td><a data-toggle="modal" data-target="#myModalHADel" data-id='
                +str.ar_id+' class="btn btn-sm btn-primary text-dark">删除</a></td></tr>';
            });
        	$("#pcontent").html(info);
        	$("#exf_title").text("房源地区列表");
        	$("#exf_navbar").html('<a class="nav-link text-danger" href="#" data-toggle="modal" data-target="#myModalHAAdd"> 📖&nbsp&nbsp添加地区 </a>');
            $("#pcontent_title").html("<th>编号</th><th>房源地区</th><th>操作</th>");
            $("#Page1").html("");
		};
		<%-- **********************************四表--模态框显示传值********************************** --%>
	    <%-- 售房状态删除--模态框显示传值 --%>
	    $("#myModalHSDel").on("show.bs.modal",function(e){
	    	var hs_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="hs_d"]').text("是否删除编号为"+hs_id+"的状态");
	    	$(e.currentTarget).find('input[id="hs_d_i"]').val(hs_id);
	    });
	    <%-- 房源类型删除--模态框显示传值 --%>
	    $("#myModalHTDel").on("show.bs.modal",function(e){
	    	var ht_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="ht_d"]').text("是否删除编号为"+ht_id+"的状态");
	    	$(e.currentTarget).find('input[id="ht_d_i"]').val(ht_id);
	    });
	    <%-- 房源户型删除--模态框显示传值 --%>
	    $("#myModalHXDel").on("show.bs.modal",function(e){
	    	var hx_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="hx_d"]').text("是否删除编号为"+hx_id+"的状态");
	    	$(e.currentTarget).find('input[id="hx_d_i"]').val(hx_id);
	    });
	    <%-- 房源地区删除--模态框显示传值 --%>
	    $("#myModalHADel").on("show.bs.modal",function(e){
	    	var ha_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="ha_d"]').text("是否删除编号为"+ha_id+"的状态");
	    	$(e.currentTarget).find('input[id="ha_d_i"]').val(ha_id);
	    });
		<%-- **********************************订单--模态框显示传值********************************** --%>
	    <%-- 删除--模态框显示传值 --%>
	    $("#myModalODel").on("show.bs.modal",function(e){
	    	var o_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="d_o"]').text("是否删除编号为"+o_id+"的订单");
	    	$(e.currentTarget).find('input[id="d_o_i"]').val(o_id);
	    });
	    <%-- **********************************用户--模态框显示传值********************************** --%>
	    <%-- 修改--模态框显示传值 --%>
	    $("#myModal1").on("show.bs.modal",function(e){
	    	var u_id=$(e.relatedTarget).data("id");
	    	var u_nickname=$(e.relatedTarget).data("name");
	    	var u_pwd=$(e.relatedTarget).data("pwd");
	    	var u_phone=$(e.relatedTarget).data("phone");
	    	$(e.currentTarget).find('h5[id="u_id"]').text("用户编号: "+u_id);
	    	$(e.currentTarget).find('input[id="u_id_i"]').val(u_id);
	    	$(e.currentTarget).find('input[name="u_nickname"]').val(u_nickname);
	    	$(e.currentTarget).find('input[name="u_pwd"]').val(u_pwd);
	    	$(e.currentTarget).find('input[name="u_phone"]').val(u_phone);
	    });
	    
	    <%-- 删除--模态框显示传值 --%>
	    $("#myModal2").on("show.bs.modal",function(e){
	    	var u_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="u_id_d_1"]').text("是否删除编号为"+u_id+"的用户");
	    	$(e.currentTarget).find('input[id="u_id_d"]').val(u_id);
	    });
	    <%-- **********************************管理员--模态框显示传值********************************** --%>
	    <%-- 修改--模态框显示传值 --%>
	    $("#myModal4").on("show.bs.modal",function(e){
	    	var u_id=$(e.relatedTarget).data("id");
	    	var u_nickname=$(e.relatedTarget).data("name");
	    	var u_pwd=$(e.relatedTarget).data("pwd");
	    	$(e.currentTarget).find('h5[id="u_id_adm"]').text("账户户编号: "+u_id);
	    	$(e.currentTarget).find('input[id="u_id_i_adm"]').val(u_id);
	    	$(e.currentTarget).find('input[name="u_nickname_adm"]').val(u_nickname);
	    	$(e.currentTarget).find('input[name="u_pwd_adm"]').val(u_pwd);
	    });
	    
	    <%-- 删除--模态框显示传值 --%>
	    $("#myModal5").on("show.bs.modal",function(e){
	    	var u_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="u_id_d_1_adm"]').text("是否删除编号为"+u_id+"的账户");
	    	$(e.currentTarget).find('input[id="u_id_d_adm"]').val(u_id);
	    });
	    <%-- **********************************房产--模态框显示传值********************************** --%>
	    <%-- 修改--模态框显示传值 --%>
	    $("#myModalHUpd").on("show.bs.modal",function(e){
	    	var f_id=$(e.relatedTarget).data("h_id");
	    	var f_name=$(e.relatedTarget).data("h_name");
	    	var f_type=$(e.relatedTarget).data("h_type");
	    	var f_hx=$(e.relatedTarget).data("h_hx");
	    	var f_price=$(e.relatedTarget).data("h_price");
	    	var f_area=$(e.relatedTarget).data("h_area");
	    	var f_state=$(e.relatedTarget).data("h_state");
	    	var f_time=$(e.relatedTarget).data("h_time");
	    	var f_photo=$(e.relatedTarget).data("h_photo");
	    	var f_mj=$(e.relatedTarget).data("h_mj");
	    	$(e.currentTarget).find('h5[id="f_id"]').text("房产编号: "+f_id);
	    	$(e.currentTarget).find('input[id="f_id_i"]').val(f_id);
	    	$(e.currentTarget).find('input[name="f_name"]').val(f_name);
	    	$(e.currentTarget).find('select[name="f_type"]').val(f_type);
	    	$(e.currentTarget).find('select[name="f_hx"]').val(f_hx);
	    	$(e.currentTarget).find('input[name="f_price"]').val(f_price);
	    	$(e.currentTarget).find('select[name="f_area"]').val(f_area);
	    	$(e.currentTarget).find('select[name="f_state"]').val(f_state);
	    	$(e.currentTarget).find('input[name="f_time"]').val(f_time);
	    	$(e.currentTarget).find('input[name="f_photo"]').val(f_photo);
	    	$(e.currentTarget).find('input[name="f_mj"]').val(f_mj);
	    });
	    
	    <%-- 删除--模态框显示传值 --%>
	    $("#myModalHDel").on("show.bs.modal",function(e){
	    	var u_id=$(e.relatedTarget).data("id");
	    	$(e.currentTarget).find('h5[id="f_id_d_1"]').text("是否删除编号为"+u_id+"的房产");
	    	$(e.currentTarget).find('input[id="f_id_d"]').val(u_id);
	    });
	    <%-- **********************************用户表单判断********************************** --%>
		<%-- 判断添加用户名是否重复 --%>
		$("#unickname").blur(function() {
			if ($("#unickname").val().trim() == "") {
				$("#nameTip_add").text("用户名不能为空 !")
			} else {
				$.post("${pageContext.request.contextPath}/AdminController", {
					unickname : $("#unickname").val(),
					op : "checkUserName"
				}, function(data, status) {
					//alert(data+status);
					$("#nameTip_add").text(data)
				});
			}
		});
		
		<%-- 判断添加用户密码是否可用 --%>
		$("#upwd").blur(
				function() {
					if ($("#upwd").val().trim().length >= 6
							&& $("#upwd").val().trim().indexOf(" ") == -1) {
						$("#pwdTip_add").text("密码可用")
					} else {
						$("#pwdTip_add").text("密码长度必须大于6位数 !")
					}
				});
		
		<%-- 判断添加用户电话是否可用 --%>
		$("#uphone").blur(
				function() {
					var phone = $("#uphone").val();
					var reg = /^[1][3,4,5,7,8,9,6][0-9]{9}$/ ;
					if (reg.test(phone)) {
						$("#uphoneTip_add").text("电话可用")
					} else {
						$("#uphoneTip_add").text("请输入正确的电话号码 !")
					}
				});
	
	<%-- 判断修改用户密码是否可用 --%>
	$("#u_pwd").blur(
			function() {
				if ($("#u_pwd").val().trim().length >= 6
						&& $("#u_pwd").val().trim().indexOf(" ") == -1) {
					$("#u_pwdTip").text("密码可用")
				} else {
					$("#u_pwdTip").text("密码长度必须大于6位数 !")
				}
			});
	
	<%-- 判断修改用户电话是否可用 --%>
	$("#u_phone").blur(
			function() {
				var phone = $("#u_phone").val();
				var reg = /^[1][3,4,5,7,8,9,6][0-9]{9}$/ ;
				;
				if (reg.test(phone)) {
					$("#u_phoneTip").text("电话可用")
				} else {
					$("#u_phoneTip").text("请输入正确的电话号码 !")
				}
			});
	
	<%-- 判断修改管理员密码是否可用 --%>
	$("#u_pwd_adm").blur(
			function() {
				if ($("#u_pwd_adm").val().trim().length >= 6
						&& $("#u_pwd_adm").val().trim().indexOf(" ") == -1) {
					$("#u_pwdTip_adm").text("密码可用")
				} else {
					$("#u_pwdTip_adm").text("密码长度必须大于6位数 !")
				}
			});
	
});
<%-- ***********************************************************Js原生脚本*********************************************************** --%>
<%-- ***********************************************************用户crud*********************************************************** --%>
	<%-- 添加用户 --%>
    function addFun(nickname,pwd,uphone) {
    	if ( $("#nameTip_add").text() == "用户名可用" && $("#pwdTip_add").text() == "密码可用" && $("#uphoneTip_add").text() == "电话可用") {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "addUser",
		            nickname: nickname,
		            pwd: pwd,
		            uphone: uphone
		        }, function (data) {
		        	$(this).userShow_n(data); 
		        });
    		$("#m_add_tip").text("保存成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModal3').modal('hide');
		    		$("#m_add_tip").text("～(￣▽￣～)(～￣▽￣)～");
		    		$("#nameTip_add").text("");
		    		$("#pwdTip_add").text("");
		    		$("#uphoneTip_add").text("");
	    		},1000); 
		}else{
			$("#m_add_tip").text("(╬▔^▔)凸请输入正确信息!");
			$("#nameTip_add").text("");
    		$("#pwdTip_add").text("");
    		$("#uphoneTip_add").text("");
		}
	};

	<%-- 用户修改 --%>
    function updFun(id,pwd,phone) {
    	if ($("#u_pwdTip").text() == "密码可用" && $("#u_phoneTip").text() == "电话可用") {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "upd",
		            id: id,
		            pwd: pwd,
		            phone: phone
		        }, function (data) {
		        	$(this).userShow_n(data); 
		        });
    		$("#m_upd_tip").text("修改成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModal1').modal('hide');
		    		$("#m_upd_tip").text("～(￣▽￣～)(～￣▽￣)～ ");
		    		$("#u_pwdTip").text("");
		    		$("#u_pwdTip_adm").text("");
	    		},1000);
		}else{
			$("#m_upd_tip").text("(╬▔^▔)凸请输入正确修改内容!");
			$("#u_pwdTip").text("");
    		$("#u_pwdTip_adm").text("");
		}
	};

	<%-- 用户删除 --%>
    function delFun(id) {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "del",
            id: id
        }, function (data) {
        	$(this).userShow_n(data);
        });
        $("#m_del_tip").text("删除成功! 即将关闭窗口!");
    	setTimeout(function () {
	    		$('#myModal2').modal('hide');
	    		$("#m_del_tip").text("～(￣▽￣～)(～￣▽￣)～");
    		},1000);
	};
	
	<%-- 用户翻页 --%>
    function page(id) {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "queryLikeByPage",
            search: $("#seach_in").val(),
            pageNo: id
        }, function (data) {
        	$(this).userShow_p(data);
        });
	};
	<%-- 用户模糊搜索查询 --%>
	function seach_f_user() {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "queryLikeByPage",
            search: $("#seach_in").val()
        }, function (data) {
        	$(this).userShow_p(data); 
        });
    };
    <%-- 用户查询所有 --%>
	function seach_f_user_all() {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "queryLikeByPage"
        }, function (data) {
        	$(this).userShow_n(data); 
        });
    };
	<%-- ***********************************************************管理员crud*********************************************************** --%>
	<%-- 删除用户 --%>
	 function delAdmFun(id) {
	        $.post(
	            "${pageContext.request.contextPath}/AdminController", {
	            op: "delAdm",
	            id: id
	        }, function (data) {
	        	$(this).admShow_n(data); 
	        });
	        $("#m_del_tip_adm").text("删除成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModal5').modal('hide');
		    		$("#m_del_tip_adm").text("～(￣▽￣～)(～￣▽￣)～");
	    		},1000);
		};

	<%-- 用户修改 --%>
    function updAdmFun(id,pwd) {
    	if ($("#u_pwdTip_adm").text() == "密码可用") {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "updAdm",
		            id: id,
		            pwd: pwd
		        },function (data) {
		        	$(this).admShow_n(data); 
		        });
    		$("#m_upd_tip_adm").text("修改成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModal4').modal('hide');
		    		$("#m_upd_tip_adm").text("～(￣▽￣～)(～￣▽￣)～ ");
		    		$("#u_pwdTip_adm").text("")
	    		},1000);
		}else{
			$("#m_upd_tip_adm").text("(╬▔^▔)凸请输入正确修改内容!");
			$("#u_pwdTip_adm").text("");
		}
	};
	<%-- 管理员遍历 --%>
    function admFun() {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "adm"
        }, function (data) {
        	$(this).admShow_n(data); 
        });
	};
	
	
	
<%-- **********************************************************************房产管理crud********************************************************************** --%>

	<%-- 房产查询所有 --%>
	function seach_f_house_all() {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "houseShowByPage"
        }, function (data) {
        	$(this).houseShow_n(data); 
        });
    };
    
    <%-- 房产翻页 --%>
    function page_house(id) {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "houseShowByPage",
            search: $("#seach_in").val(),
            pageNo: id
        }, function (data) {
        	$(this).houseShow_p(data);
        });
	};
	
	<%-- 房产模糊搜索查询 --%>
	function seach_f_house() {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "houseShowByPage",
            search: $("#seach_in").val()
        }, function (data) {
        	$(this).houseShow_p(data);
        });
    };
	<%-- 添加房产 --%>
    function addHouse(H_name_,Ht_id_,Un_id_,H_unitprice_,H_area_,Hs_id_,H_time_,H_photo_,Areas_id_) {
    	if ($("#f_add_name").val().trim() != ""&&$("#f_add_price").val().trim() != ""&&$("#f_add_mj").val().trim() != "") {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "addHouse",
		            H_name: H_name_,
		            Ht_id: Ht_id_,
		            Un_id: Un_id_,
		            H_unitprice: H_unitprice_,
		            H_area: H_area_,
		            Hs_id: Hs_id_,
		            H_time: H_time_,
		            H_photo: H_photo_,
		            Areas_id: Areas_id_
		        }, function (data) {
		        	$(this).houseShow_n(data); 
		        });
    		$("#h_add_tip").text("保存成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModalHAdd').modal('hide');
		    		$("#h_add_tip").text("～(￣▽￣～)(～￣▽￣)～");
	    		},1000); 
		}else{
			$("#h_add_tip").text("(╬▔^▔)凸请补全房产信息!");
		}
	};

	<%-- 房产修改 --%>
    function updHouse(H_id_,H_name_,Ht_id_,Un_id_,H_unitprice_,H_area_,Hs_id_,H_time_,H_photo_,Areas_id_) {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "updHouse",
		            H_id: H_id_,
		            H_name: H_name_,
		            Ht_id: Ht_id_,
		            Un_id: Un_id_,
		            H_unitprice: H_unitprice_,
		            H_area: H_area_,
		            Hs_id: Hs_id_,
		            H_time: H_time_,
		            H_photo: H_photo_,
		            Areas_id: Areas_id_
		        }, function (data) {
		        	$(this).houseShow_n(data); 
		        });
    		$("#h_upd_tip").text("修改成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModalHUpd').modal('hide');
		    		$("#h_upd_tip").text("～(￣▽￣～)(～￣▽￣)～ ");
	    		},1000);
	};

	<%-- 房产删除 --%>
    function delHouse(id) {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "delhouse",
            id: id
        }, function (data) {
        	$(this).houseShow_n(data);
        });
        $("#h_del_tip").text("删除成功! 即将关闭窗口!");
    	setTimeout(function () {
	    		$('#myModalHDel').modal('hide');
	    		$("#h_del_tip").text("～(￣▽￣～)(～￣▽￣)～");
    		},1000);
	};
<%-- **********************************************************************订单管理crud********************************************************************** --%>

	<%-- 订单查询所有 --%>
	function seach_f_order_all() {
	       $.post(
	           "${pageContext.request.contextPath}/AdminController", {
	           op: "ordersShowByPage"
	       }, function (data) {
	       	$(this).orderShow_n(data); 
	       });
	   };
    <%-- 订单翻页 --%>
    function page_order(id) {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "ordersShowByPage",
            search: $("#seach_in").val(),
            pageNo: id
        }, function (data) {
        	$(this).orderShow_p(data);
        });
	};
	
	<%-- 订单模糊搜索查询 --%>
	function seach_f_order() {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "ordersShowByPage",
            search: $("#seach_in").val()
        }, function (data) {
        	$(this).orderShow_p(data);
        });
    };
    <%-- 订单删除 --%>
    function delOrder(id) {
        $.post(
            "${pageContext.request.contextPath}/AdminController", {
            op: "delOrder",
            id: id
        }, function (data) {
        	$(this).orderShow_n(data);
        });
        $("#d_o_t").text("删除成功! 即将关闭窗口!");
    	setTimeout(function () {
	    		$('#myModalODel').modal('hide');
	    		$("#d_o_t").text("～(￣▽￣～)(～￣▽￣)～");
    		},1000);
	};
	
<%-- **********************************************************************售房状态crud********************************************************************** --%>	
<%-- 状态查询所有 --%>
function seach_f_state_all() {
       $.post(
           "${pageContext.request.contextPath}/AdminController", {
           op: "queryHS"
       }, function (data) {
       	$(this).hs_data(data); 
       });
   };
   <%-- 状态删除 --%>
   function delHS(id) {
       $.post(
           "${pageContext.request.contextPath}/AdminController", {
           op: "delHS",
           id: id
       }, function (data) {
       	$(this).hs_data(data);
       });
       $("#hs_d_t").text("删除成功! 即将关闭窗口!");
   	setTimeout(function () {
	    		$('#myModalHSDel').modal('hide');
	    		$("#hs_d_t").text("～(￣▽￣～)(～￣▽￣)～");
   		},1000);
	};
	<%-- 添加状态 --%>
    function addHS(hs) {
    	if ($("#hs_a_i").val().trim() != "") {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "addHS",
		            hs: hs
		        }, function (data) {
		        	$(this).hs_data(data); 
		        });
    		$("#hs_a_t").text("保存成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModalHSAdd').modal('hide');
		    		$("#hs_a_t").text("～(￣▽￣～)(～￣▽￣)～");
	    		},1000); 
		}else{
			$("#hs_a_t").text("(╬▔^▔)凸请补全售房状态信息!");
		}
	};
<%-- **********************************************************************房源类型crud********************************************************************** --%>	
	<%-- 房源类型查询所有 --%>
	function seach_f_type_all() {
	       $.post(
	           "${pageContext.request.contextPath}/AdminController", {
	           op: "queryHT"
	       }, function (data) {
	       	$(this).ht_data(data); 
	       });
	   };
	   <%-- 房源类型删除 --%>
	   function delHT(id) {
	       $.post(
	           "${pageContext.request.contextPath}/AdminController", {
	           op: "delHT",
	           id: id
	       }, function (data) {
	       	$(this).ht_data(data);
	       });
	       $("#ht_d_t").text("删除成功! 即将关闭窗口!");
	   	setTimeout(function () {
		    		$('#myModalHTDel').modal('hide');
		    		$("#ht_d_t").text("～(￣▽￣～)(～￣▽￣)～");
	   		},1000);
		};
		<%-- 添加房源类型 --%>
	    function addHT(ht) {
	    	if ($("#ht_a_i").val().trim() != "") {
	    		$.post(
			            "${pageContext.request.contextPath}/AdminController", {
			            op: "addHT",
			            ht: ht
			        }, function (data) {
			        	$(this).ht_data(data); 
			        });
	    		$("#ht_a_t").text("保存成功! 即将关闭窗口!");
		    	setTimeout(function () {
			    		$('#myModalHTAdd').modal('hide');
			    		$("#ht_a_t").text("～(￣▽￣～)(～￣▽￣)～");
		    		},1000); 
			}else{
				$("#ht_a_t").text("(╬▔^▔)凸请补全房源类型信息!");
			}
		};
<%-- **********************************************************************房源户型crud********************************************************************** --%>	
<%-- 户型查询所有 --%>
function seach_f_hx_all() {
       $.post(
           "${pageContext.request.contextPath}/AdminController", {
           op: "queryHX"
       }, function (data) {
       	$(this).hx_data(data); 
       });
   };
   <%-- 户型删除 --%>
   function delHX(id) {
       $.post(
           "${pageContext.request.contextPath}/AdminController", {
           op: "delHX",
           id: id
       }, function (data) {
       	$(this).hx_data(data);
       });
       $("#hx_d_t").text("删除成功! 即将关闭窗口!");
   	setTimeout(function () {
	    		$('#myModalHXDel').modal('hide');
	    		$("#hx_d_t").text("～(￣▽￣～)(～￣▽￣)～");
   		},1000);
	};
	<%-- 添加户型 --%>
    function addHX(hx,ph) {
    	if ($("#hx_a_i").val().trim() != "") {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "addHX",
		            hx: hx,
		            ph: ph
		        }, function (data) {
		        	$(this).hx_data(data); 
		        });
    		$("#hx_a_t").text("保存成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModalHXAdd').modal('hide');
		    		$("#hx_a_t").text("～(￣▽￣～)(～￣▽￣)～");
	    		},1000); 
		}else{
			$("#hx_a_t").text("(╬▔^▔)凸请补全房源户型信息!");
		}
	};
<%-- **********************************************************************房源地区crud********************************************************************** --%>	
<%-- 房源地区查询所有 --%>
function seach_f_area_all() {
       $.post(
           "${pageContext.request.contextPath}/AdminController", {
           op: "queryHA"
       }, function (data) {
       	$(this).ha_data(data); 
       });
   };
   <%-- 房源地区删除 --%>
   function delHA(id) {
       $.post(
           "${pageContext.request.contextPath}/AdminController", {
           op: "delHA",
           id: id
       }, function (data) {
       	$(this).ha_data(data);
       });
       $("#ha_d_t").text("删除成功! 即将关闭窗口!");
   	setTimeout(function () {
	    		$('#myModalHADel').modal('hide');
	    		$("#ha_d_t").text("～(￣▽￣～)(～￣▽￣)～");
   		},1000);
	};
	<%-- 添加地区 --%>
    function addHA(ha) {
    	if ($("#ha_a_i").val().trim() != "") {
    		$.post(
		            "${pageContext.request.contextPath}/AdminController", {
		            op: "addHA",
		            ha: ha
		        }, function (data) {
		        	$(this).ha_data(data); 
		        });
    		$("#ha_a_t").text("保存成功! 即将关闭窗口!");
	    	setTimeout(function () {
		    		$('#myModalHAAdd').modal('hide');
		    		$("#ha_a_t").text("～(￣▽￣～)(～￣▽￣)～");
	    		},1000); 
		}else{
			$("#ha_a_t").text("(╬▔^▔)凸请补全房源地区信息!");
		}
	};			
</script>
</head>

<body>
	<%-- 头部 --%>
	<header>
		<div class="collapse" id="navbarHeader">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-7 py-4">
						<h4 class="text-white">e选房</h4>
						<p class="text-muted">-----数据管理界面</p>
					</div>
					<div class="col-sm-4 offset-md-1 py-4">
						<h4 class="text-white">选项</h4>
						<ul class="list-unstyled">
							<li><a href="javascript:admFun()" class="text-white">管理员账户信息</a></li>
							<li><a href="${pageContext.request.contextPath}/mvc/sign.jsp" class="text-white">注册新管理员</a></li>
							<li><a href="${pageContext.request.contextPath}/AdminController?op=qtLogout" class="text-white">安全退出</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-dark box-shadow">
			<div class="container d-flex justify-content-between exf_tb">
				<a href="#" class="navbar-brand d-flex align-items-center"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="mr-2">
						<path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
						<circle cx="12" cy="13" r="4"></circle></svg> <strong>欢迎${sessionScope.user.userName}</strong>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarHeader" aria-controls="navbarHeader"
					aria-expanded="false" aria-label="Toggle navigation"
					style="outline: none">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>


	<%-- 表格 --%>
	<div class="album exf_bg">

		<%-- 表格搜索栏 --%>
		<nav
			class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 exf_tb">
			<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">e选房 后台管理系统 </a>
			<div id="seach_f" class="w-100">
				<form class="w-100" onsubmit="return seach_f_user()">
					<input class="form-control form-control-dark w-100" type="text" placeholder="在这里搜用户 . . ." aria-label="Search" id="seach_in">
				</form>
			</div>
			<ul class="navbar-nav px-3">
				<li class="nav-item text-nowrap"><a class="nav-link" style="color: #fff"
					href="${pageContext.request.contextPath}/mvc/admIndex.jsp">退回管理首页</a></li>
			</ul>
		</nav>
		<%-- 表格侧栏菜单 --%>
		<div class="container-fluid">
			<div class="row">
				<nav class="col-md-2 d-none d-md-block bg-light sidebar">
					<div class="sidebar-sticky">
						<ul class="nav flex-column exf_nav">
							<li class="nav-item"><a class="nav-link text-danger active" href="${pageContext.request.contextPath}/mvc/userShow.jsp?#">
									<span data-feather="file-text"></span> 详情页面 <span class="sr-only"></span>
							</a></li>
							<%-- Ajax侧栏菜单 --%>
							<li class="nav-item"><div id="exf_navbar"></div></li>
						</ul>
						<h6
							class=" d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted exf_sjgl">
							<span>数据管理页面选项栏</span> <a
								class="d-flex align-items-center text-muted" href="#"> <span
								data-feather="plus-circle"></span>
							</a>
						</h6>
						<ul class="nav flex-column mb-2 exf_nav">
							<li class="nav-item" id="exf_nav1"><a class="nav-link text-danger" href="javascript:seach_f_user_all()"
								id="userShow"> <span data-feather="users"></span> 用户管理
							</a></li>
							<li class="nav-item"><a class="nav-link text-danger" href="javascript:seach_f_house_all()"> 
								<span data-feather="home"></span> 房产管理
							</a></li>
							<li class="nav-item"><a class="nav-link text-danger" href="javascript:seach_f_order_all()"> <span
									data-feather="shopping-cart"></span> 订单管理
							</a></li>
							<li class="nav-item"><a class="nav-link text-danger" href="javascript:seach_f_state_all()"> <span
									data-feather="bar-chart-2"></span> 售房状态
							</a></li>
							<li class="nav-item"><a class="nav-link text-danger" href="javascript:seach_f_type_all()"> <span
									data-feather="layers"></span> 房源类型
							</a></li>
							<li class="nav-item"><a class="nav-link text-danger" href="javascript:seach_f_hx_all()"> <span
									data-feather="file-text"></span> 户型管理
							</a></li>
							<li class="nav-item"><a class="nav-link text-danger" href="javascript:seach_f_area_all()"> <span
									data-feather="file"></span> 地区管理
							</a></li>
						</ul>
					</div>
				</nav>

<%-- ***************************************************************表格管理界面*************************************************************** --%>
				<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main exf-user">
					<%-- Ajax表格标题 --%>
					<h2 class="sub-header ttop text-dark"  id="exf_title"></h2>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<%-- Ajax表头--%>
								<tr class="text-dark" id="pcontent_title"></tr>
							</thead>
							<%-- Ajax表格内容 --%>
							<tbody id="pcontent">
								
							</tbody>
						</table>

						<div class="col-md-12 column esf_pg">
							<%-- Ajax表格翻页 --%>
							<ul class="pagination  pagination-md" id="Page1">
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- Icons表格侧栏菜单图标 --%>
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>
	<%-- 底部 --%>
	<footer class="text-muted exf_foot_bg">
		<div class="container">
			<p class="float-right">
				<a class="btn btn-sm btn-primary text-dark" href="#">回顶部</a>
			</p>
			<p>e选房后台管理系统 版权所有</p>
			<p>
				私人企业股份有限公司<a class="text-muted" href="#"> 法律声明 </a> <a
					class="text-muted" href="#">网站支持</a>
			</p>
		</div>
	</footer>
<%-- ***************************************************************管理员模态框部分*************************************************************** --%>
	<%-- 删除订单--模态框 --%>
	<div class="modal fade" id="myModalODel" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除订单</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="d_o" class="text-info text-center"></h5>
								<input id="d_o_i" style="display: none">
							</div>
							<h5 id="d_o_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delOrder($('#d_o_i').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%-- ***************************************************************房子模态框部分*************************************************************** --%>
	<%-- 房子修改--模态框 --%>
	<div class="modal fade" id="myModalHUpd" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">修改房产信息</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
									<input type="text" class="form-control input-sm" style="display: none" id="f_id_i"/>
									<h5 id="f_id" class="text-info text-center"></h5>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产名称：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_name" id="f_name" readonly/>
									<div class="text-info text-center" id="f_nameTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">房产类型：</label>
								<div class="col-xs-8">
									<%-- ajax--房子类型选择框 --%>
									<select class="form-control f_type" name="f_type" id="f_type"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_type" id="f_type" /> -->
									<div class="text-info text-center" id="f_typeTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产户型：</label>
								<div class="col-xs-8">
									<%-- ajax--房子类型选择框 --%>
									<select class="form-control f_hx" name="f_hx" id="f_hx"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_hx" id="f_hx" /> -->
									<div class="text-info text-center" id="f_hxTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产价格：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_price" id="f_price"/>
									<div class="text-info text-center" id="f_priceTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产面积：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_mj" id="f_mj"/>
									<div class="text-info text-center" id="f_mjTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">房产地区：</label>
								<div class="col-xs-8">
									<%-- ajax--房子类型选择框 --%>
									<select class="form-control f_area" name="f_area" id="f_area"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_area" id="f_area"/> -->
									<div class="text-info text-center" id="f_areaTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">销售状态：</label>
								<div class="col-xs-8">
									<%-- ajax--房子类型选择框 --%>
									<select class="form-control f_state" name="f_state" id="f_state"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_state" id="f_state" /> -->
									<div class="text-info text-center" id="f_stateTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">发售时间：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_time" id="f_time"/>
									<script>
										laydate.render({
											elem : '#f_time',
											type : 'datetime'
										});
									</script>
									<div class="text-info text-center" id="f_timeTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">预览图地址：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_photo" id="f_photo"/>
									<div class="text-info text-center" id="f_photoTip"></div>
								</div>
							</div>
								<h5 id="h_upd_tip" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> 
								<a href="javascript:updHouse($('#f_id_i').val(),
															$('#f_name').val(),
															$('#f_type').val(),
															$('#f_hx').val(),
															$('#f_price').val(),
															$('#f_mj').val(),
															$('#f_state').val(),
															$('#f_time').val(),
															$('#f_photo').val(),
															$('#f_area').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 房子删除--模态框 --%>
	<div class="modal fade" id="myModalHDel" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除房产</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="f_id_d_1" class="text-info text-center"></h5>
								<input id="f_id_d" style="display: none">
							</div>
							<h5 id="h_del_tip" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delHouse($('#f_id_d').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 添加房子--模态框 --%>
	<div class="modal fade" id="myModalHAdd" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-add">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">添加房产</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产名称：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_add_name" id="f_add_name"/>
									<div class="text-info text-center" id="f_add_nameTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">房产类型：</label>
								<div class="col-xs-8">
									<%-- ajax--房子类型选择框 --%>
									<select class="form-control f_type" name="f_add_type"  id="f_add_type"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_add_type" id="f_add_type"/> -->
									<div class="text-info text-center" id="f_add_typeTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产户型：</label>
								<div class="col-xs-8">
									<%-- ajax--房子户型选择框 --%>
									<select class="form-control f_hx" name="f_add_hx"  id="f_add_hx"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_add_hx" id="f_add_hx" /> -->
									<div class="text-info text-center" id="f_add_hxTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产价格：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_add_price" id="f_add_price"/>
									<div class="text-info text-center" id="f_add_priceTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房产面积：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_add_mj" id="f_add_mj"/>
									<div class="text-info text-center" id="f_add_mjTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">房产地区：</label>
								<div class="col-xs-8">
									<%-- ajax--房子地区选择框 --%>
									<select class="form-control f_area" name="f_add_area"  id="f_add_area"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_add_area" id="f_add_area"/> -->
									<div class="text-info text-center" id="f_add_areaTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">销售状态：</label>
								<div class="col-xs-8">
									<%-- ajax--房子状态选择框 --%>
									<select class="form-control f_state" name="f_add_state" id="f_add_state"></select>
									<!-- <input type="text" class="form-control input-sm" name="f_add_state" id="f_add_state" /> -->
									<div class="text-info text-center" id="f_add_stateTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">发售时间：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_add_time" id="f_add_time"/>
									<script>
										laydate.render({
											elem : '#f_add_time',
											type : 'datetime'
										});
									</script>
									<div class="text-info text-center" id="f_add_timeTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">预览图地址：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="f_add_photo" id="f_add_photo"/>
									<div class="text-info text-center" id="f_add_photoTip"></div>
								</div>
							</div>
								<h5 id="h_add_tip" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a>
								<a href="javascript:addHouse($('#f_add_name').val(),
															$('#f_add_type').val(),
															$('#f_add_hx').val(),
															$('#f_add_price').val(),
															$('#f_add_mj').val(),
															$('#f_add_state').val(),
															$('#f_add_time').val(),
															$('#f_add_photo').val(),
															$('#f_add_area').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- ***************************************************************房源地区框部分*************************************************************** --%>
	<%-- 房源地区删除--模态框 --%>
	<div class="modal fade" id="myModalHADel" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除房源地区</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="ha_d" class="text-info text-center"></h5>
								<input id="ha_d_i" style="display: none">
							</div>
							<h5 id="ha_d_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delHA($('#ha_d_i').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 添加房源地区--模态框 --%>
	<div class="modal fade" id="myModalHAAdd" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-add">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">添加房源地区</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房源地区：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="ha_a_i" />
								</div>
							</div>
								<h5 id="ha_a_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a>
								<a href="javascript:addHA($('#ha_a_i').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- ***************************************************************房源户型框部分*************************************************************** --%>
	<%-- 房源户型删除--模态框 --%>
	<div class="modal fade" id="myModalHXDel" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除房源户型</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="hx_d" class="text-info text-center"></h5>
								<input id="hx_d_i" style="display: none">
							</div>
							<h5 id="hx_d_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delHX($('#hx_d_i').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 房源户型状态--模态框 --%>
	<div class="modal fade" id="myModalHXAdd" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-add">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">添加房源户型</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房源户型：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="hx_a_i" />
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">预览图地址：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="hx_a_i_ph" />
								</div>
							</div>
								<h5 id="hx_a_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a>
								<a href="javascript:addHX($('#hx_a_i').val(),$('#hx_a_i_ph').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- ***************************************************************房源类型框部分*************************************************************** --%>
	<%-- 房源类型删除--模态框 --%>
	<div class="modal fade" id="myModalHTDel" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除房源类型</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="ht_d" class="text-info text-center"></h5>
								<input id="ht_d_i" style="display: none">
							</div>
							<h5 id="ht_d_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delHT($('#ht_d_i').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 房源类型状态--模态框 --%>
	<div class="modal fade" id="myModalHTAdd" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-add">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">添加房源类型</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">房源类型：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="ht_a_i" />
								</div>
							</div>
								<h5 id="ht_a_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a>
								<a href="javascript:addHT($('#ht_a_i').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- ***************************************************************售房状态框部分*************************************************************** --%>
	<%-- 售房状态删除--模态框 --%>
	<div class="modal fade" id="myModalHSDel" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除售房状态</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="hs_d" class="text-info text-center"></h5>
								<input id="hs_d_i" style="display: none">
							</div>
							<h5 id="hs_d_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delHS($('#hs_d_i').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 添加售房状态--模态框 --%>
	<div class="modal fade" id="myModalHSAdd" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-add">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">添加售房状态</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">售房状态：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="hs_a_i" />
								</div>
							</div>
								<h5 id="hs_a_t" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a>
								<a href="javascript:addHS($('#hs_a_i').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%-- ***************************************************************管理员模态框部分*************************************************************** --%>
	<%-- 管理员修改--模态框 --%>
	<div class="modal fade" id="myModal4" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">修改管理员信息</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
									<input type="text" class="form-control input-sm" style="display: none" id="u_id_i_adm"/>
									<h5 id="u_id_adm" class="text-info text-center"></h5>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">管理员账号：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="u_nickname_adm" id="u_nickname_adm" readonly/>
									<div class="text-info text-center" id="u_nicknameTip_adm"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">管理员密码：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="u_pwd_adm" id="u_pwd_adm"/>
									<div class="text-info text-center" id="u_pwdTip_adm"></div>
								</div>
							</div>
								<h5 id="m_upd_tip_adm" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> 
								<a href="javascript:updAdmFun($('#u_id_i_adm').val(),$('#u_pwd_adm').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 管理员删除--模态框 --%>
	<div class="modal fade" id="myModal5" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除管理员</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="u_id_d_1_adm" class="text-info text-center"></h5>
								<input id="u_id_d_adm" style="display: none">
							</div>
							<h5 id="m_del_tip_adm" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delAdmFun($('#u_id_d_adm').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%-- ***************************************************************用户模态框部分*************************************************************** --%>
	<%-- 用户修改--模态框 --%>
	<div class="modal fade" id="myModal1" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">修改用户信息</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
									<input type="text" class="form-control input-sm" style="display: none" id="u_id_i"/>
									<h5 id="u_id" class="text-info text-center"></h5>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">用户账号：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="u_nickname" id="u_nickname" readonly/>
									<div class="text-info text-center" id="u_nicknameTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">用户密码：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="u_pwd" id="u_pwd"/>
									<div class="text-info text-center" id="u_pwdTip"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">用户电话：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" name="u_phone" id="u_phone" />
									<div class="text-info text-center" id="u_phoneTip"></div>
								</div>
							</div>
								<h5 id="m_upd_tip" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> 
								<a href="javascript:updFun($('#u_id_i').val(),$('#u_pwd').val(),$('#u_phone').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 用户删除--模态框 --%>
	<div class="modal fade" id="myModal2" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-del">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">删除用户</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div class="form-group ">
								<h5 id="u_id_d_1" class="text-info text-center"></h5>
								<input id="u_id_d" style="display: none">
							</div>
							<h5 id="m_del_tip" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a> <a
									href="javascript:delFun($('#u_id_d').val())"
									class="btn btn-sm btn-primary">确 定</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 添加用户--模态框 --%>
	<div class="modal fade" id="myModal3" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content exf-mcbg-add">
				<div class="modal-header">
					<h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ecf_mb">
					<div class="container-fluid ecf_mb2">
						<form class="form-horizontal ecf_mb3">
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">用户账号：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="unickname" />
									<div class="text-info text-center" id="nameTip_add"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sOrd" class="col-xs-3 control-label">用户密码：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="upwd"/>
									<div class="text-info text-center" id="pwdTip_add"></div>
								</div>
							</div>
							<div style="height:103px">
								<label for="sLink" class="col-xs-3 control-label">用户电话：</label>
								<div class="col-xs-8">
									<input type="text" class="form-control input-sm" id="uphone" />
									<div class="text-info text-center" id="uphoneTip_add"></div>
								</div>
							</div>
								<h5 id="m_add_tip" class="text-info text-center" style="height:39px">～(￣▽￣～)(～￣▽￣)～</h5>
							<div class="modal-footer exf_cf">
								<a class="btn btn-sm btn-primary text-dark" data-dismiss="modal">取 消</a>
								<a href="javascript:addFun($('#unickname').val(),$('#upwd').val(),$('#uphone').val())"
									class="btn btn-sm btn-primary">保 存</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
