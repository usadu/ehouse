<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>

<html>
<head>
<title>线上开盘 - e选房</title>
<meta charset="utf-8" />
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="keywords" content=e选房,客户选房,选房系统，e选房系统 />
<meta name="description"
	content=e选房系统是一个通过网络购房的系统，以后拿着手机就可以轻松买房子，再也不用整天跑售楼处。 />
<link href="/logo.ico" rel="Shortcut Icon" />
<link
	href="${pageContext.request.contextPath }/css/cs.css?v=bj4vTZsmMd-mPY3_--uHwCjKrnI"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/css/font-awesome.min.css"
	rel="stylesheet" />
	
	<style type="text/css">
	
	#hu a{
	margin-right: 50px;
	}
	
DIV.green-black {
	PADDING-RIGHT: 3px;
	PADDING-LEFT: 3px;
	PADDING-BOTTOM: 3px;
	MARGIN: 3px;
	PADDING-TOP: 3px;
	TEXT-ALIGN: center
}

DIV.green-black A {
	BORDER-RIGHT: #f8f6f2 1px solid;
	PADDING-RIGHT: 5px;
	BORDER-TOP: #f8f6f2 1px solid;
	PADDING-LEFT: 5px;
	BACKGROUND: #f8f6f2;
	PADDING-BOTTOM: 2px;
	BORDER-LEFT: #f8f6f2 1px solid;
	COLOR: #484744;
	MARGIN-RIGHT: 2px;
	PADDING-TOP: 2px;
	BORDER-BOTTOM: #f8f6f2 1px solid;
	TEXT-DECORATION: none
}

/* DIV.green-black A:hover {
	BORDER-RIGHT: #da4f4a 1px solid;
	BORDER-TOP: #da4f4a 1px solid;
	BACKGROUND:  #da4f4a;
	BORDER-LEFT: #da4f4a 1px solid;
	COLOR: #fff;
	BORDER-BOTTOM: #da4f4a 1px solid
} */

DIV.green-black A:active {
	BORDER-RIGHT: #da4f4a 1px solid;
	BORDER-TOP: #da4f4a 1px solid;
	BACKGROUND: #da4f4a;
	BORDER-LEFT: #da4f4a 1px solid;
	COLOR: #fff;
	BORDER-BOTTOM: #da4f4a 1px solid
}

/* DIV.green-black SPAN.current {
	BORDER-RIGHT: #da4f4a 1px solid;
	PADDING-RIGHT: 5px;
	BORDER-TOP: #da4f4a 1px solid;
	PADDING-LEFT: 5px;
	FONT-WEIGHT: bold;
	BACKGROUND: #da4f4a;
	PADDING-BOTTOM: 2px;
	BORDER-LEFT: #da4f4a 1px solid;
	COLOR: #fff;
	MARGIN-RIGHT: 2px;
	PADDING-TOP: 2px;
	BORDER-BOTTOM: #da4f4a 1px solid
}

DIV.green-black SPAN.disabled {
	BORDER-RIGHT: #f3f3f3 1px solid;
	PADDING-RIGHT: 5px;
	BORDER-TOP: #f3f3f3 1px solid;
	PADDING-LEFT: 5px;
	PADDING-BOTTOM: 2px;
	BORDER-LEFT: #f3f3f3 1px solid;
	COLOR: #ccc;
	MARGIN-RIGHT: 2px;
	PADDING-TOP: 2px;
	BORDER-BOTTOM: #f3f3f3 1px solid
} */

	</style>

<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
	
<script type="text/javascript">
	$(function(){
		
		/**
		* 动态添加option列表
		*/
		$.post("${pageContext.request.contextPath}/HouseController",{op:"addoption"},function(data){
			 optionlist=JSON.parse(data);
			$.each(optionlist,function(i){
				$("#areas").append("<option value='"+optionlist[i].ar_id+"' title='"+optionlist[i].ar_name+"'>"+optionlist[i].ar_name+"</option>");
			});
			/**
			初始地区全部显示 
			*/
			 $.post("${pageContext.request.contextPath}/HouseController",{op:"queryallbyareaid",areaid:$("#areas").val()},function(data){
				 	houselist=JSON.parse(data);
					$("#housetable").html("");
					$.each(houselist,function(i){
						$("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+houselist[i].h_id+"'>"+houselist[i].h_name+"</a></td>"+
								"<td class='alcent'>"+houselist[i].ht_name+"</td>"+
								"<td class='alcent'>"+houselist[i].h_time+"</td>"+
								"<td class='alcent'>"+houselist[i].hs_name+"</td>"+
								"<td class='alcent'>"+houselist[i].un_name+"</td>"+
								"<td class='alcent'>"+houselist[i].h_area+"</td>"+
								"<td class='alcent'>"+houselist[i].h_unitprice+"</td>"+
								"</tr>");
					});
			}); 
			
			 /*
				下拉框添加change
				*/
				$("#areas").change(function(){
					$("#pagefen").html("");
					$.post("${pageContext.request.contextPath}/HouseController",{op:"queryallbyareaid",areaid:$(this).val()},function(data){
				 		houselist=JSON.parse(data);
						$("#housetable").html("");
						$.each(houselist,function(i){
							$("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+houselist[i].h_id+"'>"+houselist[i].h_name+"</a></td>"+
									"<td class='alcent'>"+houselist[i].ht_name+"</td>"+
									"<td class='alcent'>"+houselist[i].h_time+"</td>"+
									"<td class='alcent'>"+houselist[i].hs_name+"</td>"+
									"<td class='alcent'>"+houselist[i].un_name+"</td>"+
									"<td class='alcent'>"+houselist[i].h_area+"</td>"+
									"<td class='alcent'>"+houselist[i].h_unitprice+"</td>"+
									"</tr>");	
						});
					});
					
				});
			
		});
		
		
		/**
		 全部按钮添加地区查询
		*/
		/* $("#all").click(function(){
				$.post("${pageContext.request.contextPath}/HouseController",{op:"queryallbyareaid",areaid:$("#areas").val()},function(data){
			 		houselist=JSON.parse(data);
					$("#housetable").html("");
					$.each(houselist,function(i){
						$("#housetable").append("<tr><td class='border_lf'>"+houselist[i].h_name+"</td>"+
								"<td class='alcent'>"+houselist[i].ht_name+"</td>"+
								"<td class='alcent'>"+houselist[i].h_time+"</td>"+
								"<td class='alcent'>"+houselist[i].hs_name+"</td>"+
								"<td class='alcent'>"+houselist[i].un_name+"</td>"+
								"<td class='alcent'>"+houselist[i].h_area+"</td>"+
								"<td class='alcent'>"+houselist[i].h_unitprice+"</td>"+
								"</tr>");	
					});
				});
		});
		 */
		/*
		动态插入类型,户型
		*/
		 $.post("${pageContext.request.contextPath}/HouseController",{op:"houseType"},function(data){
			htype=JSON.parse(data);
			$("#fylx").append("<li class='thistype'><a href='javascript:void(0)' >全部</a></li>");
			 $.each(htype,function(i){
				$("#fylx").append("<li class='thistype'><a href='javascript:void(0)' >"+htype[i]+"</a></li>");
			}); 
			
			$(".thistype").click(function(){
				$(".thistype").css("background-color","#FFFFFF");
				$(this).css("background-color","#eeece8");
					$("#yen").text($(this).text());
					
				if($(this).text()=="房源"){
					$.post("${pageContext.request.contextPath}/HouseController",{op:"houseunits"},function(data){
						hunits=JSON.parse(data);
						str="<span style='font-size:16px;padding-right:20px;'>户型:</span>";
						$.each(hunits,function(i){
							str+="<a href='javascript:void(0)'  class='thisunits'>"+hunits[i]+"</a>";
						});
						$("#hu").html(str);
						
						$("#hu .thisunits").click(function(){
							$.post("${pageContext.request.contextPath}/HouseController",{op:"qbyuntisname",name:$(this).text(),areaid:$("#areas").val()},function(data){
								hlist=JSON.parse(data);
								$("#housetable").html("");
								$.each(hlist.data,function(i){
									$("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
											"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
											"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
											"</tr>")	
								});
								ye=hlist.totalPage;
								
								cye=hlist.pageNo;
								
								$("#yema").text(cye);
								$("#pagefen").html("");
								$("#pagefen").append("<a href='javascript:void(0)' id='prepage'>上一页</a>")
								for (var i = 1; i <= ye; i++) {
								$("#pagefen").append("<a href='javascript:void(0)' class='curpage'>"+i+"</a>");
								} //生成页码标签
								$("#pagefen").append("<a href='javascript:void(0)' id='nextpage'>下一页</a>")
								//类型分页添加
								
								
								
								$("#pagefen a:eq(1)").css("background-color","#da4f4a");
				 				$("#pagefen a:eq(1)").css("color","#f8f6f2");
					
									 
								
							
								
								$("#prepage").click(function(){
									yema=parseInt($("#yema").text());
									pre=yema-1;
									if(yema>1){
									$.post("${pageContext.request.contextPath}/HouseController",
											{op:"qbyuntisname",
										name:$("#housetable td:eq(4)").text(),
										areaid:$("#areas").val(),
										page:pre},function(data){
										hlist=JSON.parse(data);
										$("#housetable").html("");
										$.each(hlist.data,function(i){
											  $("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
											"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
											"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
											"</tr>")  
										});
									});
									$("#yema").text(pre);
									
									 $(".curpage").css("background-color","#f8f6f2");
									 $(".curpage").css("color","#484744");
									 a=parseInt($("#yema").text());
									 $("#pagefen a:eq("+a+")").css("background-color","#da4f4a");
									 $("#pagefen a:eq("+a+")").css("color","#f8f6f2");
									 /* $("#pagefen .a").mouseover(function(){
											$(this).css("background","#da4f4a");
										});
										$("#pagefen .a").mouseout(function(){
											$(this).css("background","#f8f6f2");
										}); */
								}
								
								});
								
								
								
								$(".curpage").click(function(){
									/* $("#pagefen a").css("backgroud-color","#f8f6f2");
									a=parseInt($("#yema").text())-1;
									$("#pagefen a:eq("+a+")").css("backgroud-color","#da4f4a");
									 */$.post("${pageContext.request.contextPath}/HouseController",
											{
										    op:"qbyuntisname",
											name:$("#housetable td:eq(4)").text(),
											areaid:$("#areas").val(),
											page:$(this).text()},function(data){
										hlist=JSON.parse(data);
										$("#housetable").html("");
										$.each(hlist.data,function(i){
											  $("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
											"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
											"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
											"</tr>")  
										});
									});
									 $("#yema").text($(this).text());
										
									 $(".curpage").css("background-color","#f8f6f2");
									 $(".curpage").css("color","#484744"); a=parseInt($("#yema").text());
										 $("#pagefen a:eq("+a+")").css("background-color","#da4f4a");
										 $("#pagefen a:eq("+a+")").css("color","#f8f6f2");
										/*  $("#pagefen .a").mouseover(function(){
												$(this).css("background","#da4f4a");
											});
											$("#pagefen .a").mouseout(function(){
												$(this).css("background","#f8f6f2");
											}); */
								});
								
								
								$("#nextpage").click(function(){
									yema=parseInt($("#yema").text());
									max=parseInt($(".curpage:last").text());
									next=yema+1;
									if(yema<max){
										
									$.post("${pageContext.request.contextPath}/HouseController",
											{
										op:"qbyuntisname",
										name:$("#housetable td:eq(4)").text(),
										areaid:$("#areas").val(),
										page:next},function(data){
										hlist=JSON.parse(data);
										$("#housetable").html("");
										$.each(hlist.data,function(i){
											  $("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
											"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
											"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
											"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
											"</tr>")  
										});
									});
									$("#yema").text(next);
									
									 $(".curpage").css("background-color","#f8f6f2");
									 $(".curpage").css("color","#484744");
									 a=parseInt($("#yema").text());
									 $("#pagefen a:eq("+a+")").css("background-color","#da4f4a");
									 $("#pagefen a:eq("+a+")").css("color","#f8f6f2");
									 /* $("#pagefen .a").mouseover(function(){
											$("#pagefen .a").css("background","#da4f4a");
										});
										$("#pagefen .a").mouseout(function(){
											$("#pagefen .a").css("background","#f8f6f2");
										}); */
								}
								});
								
								
							});//房源列表显示结束
							
							
						});
					});
				  }else{
					  $("#hu").html("");
				  }
				
				$.post("${pageContext.request.contextPath}/HouseController",{op:"queryhousebytname",name:$(this).text(),areaid:$("#areas").val()},function(data){
					hlist=JSON.parse(data);
					$("#housetable").html("");
					$.each(hlist.data,function(i){
						  $("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
						"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
						"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
						"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
						"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
						"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
						"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
						"</tr>")  
					});
					
					ye=hlist.totalPage;
					cye=hlist.pageNo;
					
					$("#yema").text(cye);
					$("#pagefen").html("");
					$("#pagefen").append("<a href='javascript:void(0)' id='prepage'>上一页</a>")
					for (var i = 1; i <= ye; i++) {
					$("#pagefen").append("<a href='javascript:void(0)' class='curpage'>"+i+"</a>");
					} //生成页码标签
					$("#pagefen").append("<a href='javascript:void(0)' id='nextpage'>下一页</a>")
					//类型分页添加
					$("#pagefen a:eq(1)").css("background-color","#da4f4a");
				 	$("#pagefen a:eq(1)").css("color","#f8f6f2");
								
					
				
					
					$("#prepage").click(function(){
						yema=parseInt($("#yema").text());
						pre=yema-1;
						if(yema>1){
						$.post("${pageContext.request.contextPath}/HouseController",
								{op:"queryhousebytname",
							name:$("#yen").text(),
							areaid:$("#areas").val(),
							page:pre},function(data){
							hlist=JSON.parse(data);
							$("#housetable").html("");
							$.each(hlist.data,function(i){
								  $("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
								"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
								"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
								"</tr>")  
							});
						});
						$("#yema").text(pre);
						
						 $(".curpage").css("background-color","#f8f6f2");
						 $(".curpage").css("color","#484744");
						 a=parseInt($("#yema").text());
						 $("#pagefen a:eq("+a+")").css("background-color","#da4f4a");
						 $("#pagefen a:eq("+a+")").css("color","#f8f6f2");
						 /* $("#pagefen .a").mouseover(function(){
								$("#pagefen .a").css("background","#da4f4a");
							});
							$("#pagefen .a").mouseout(function(){
								$("#pagefen .a").css("background","#f8f6f2");
							}); */
					}
					
					});
					
					
					$(".curpage").click(function(){
						
						$.post("${pageContext.request.contextPath}/HouseController",
								{
							    op:"queryhousebytname",
								name:$("#yen").text(),
								areaid:$("#areas").val(),
								page:$(this).text()},function(data){
							hlist=JSON.parse(data);
							$("#housetable").html("");
							$.each(hlist.data,function(i){
								  $("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
								"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
								"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
								"</tr>")  
							});
						});
						 $("#yema").text($(this).text());
						 $(".curpage").css("background-color","#f8f6f2");
						 $(".curpage").css("color","#484744");
						 a=parseInt($("#yema").text());
						 $("#pagefen a:eq("+a+")").css("background-color","#da4f4a");
						 $("#pagefen a:eq("+a+")").css("color","#f8f6f2");
							/*  $(".curpage").mouseover(function(){
								$(this).css("background","#da4f4a");
							});
							$(".curpage").mouseout(function(){
								$(this).css("background","#f8f6f2");
							});  */
						 /* $("#pagefen a").css("backgroud-color","#f8f6f2");
						
						$("#pagefen a:eq("+a+")").css("backgroud-color","#da4f4a");
						  */
					});
					
					
					$("#nextpage").click(function(){
						yema=parseInt($("#yema").text());
						max=parseInt($(".curpage:last").text());
						next=yema+1;
						if(yema<max){
							
						$.post("${pageContext.request.contextPath}/HouseController",
								{
							op:"queryhousebytname",
							name:$("#yen").text(),
							areaid:$("#areas").val(),
							page:next},function(data){
							hlist=JSON.parse(data);
							$("#housetable").html("");
							$.each(hlist.data,function(i){
								  $("#housetable").append("<tr><td class='border_lf'><a href='${pageContext.request.contextPath}/front/house.jsp?hid="+hlist.data[i].h_id+"'>"+hlist.data[i].h_name+"</a></td>"+
								"<td class='alcent'>"+hlist.data[i].ht_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_time+"</td>"+
								"<td class='alcent'>"+hlist.data[i].hs_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].un_name+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_area+"</td>"+
								"<td class='alcent'>"+hlist.data[i].h_unitprice+"</td>"+
								"</tr>")  
							});
						});
						$("#yema").text(next);
						$(".curpage").css("background-color","#f8f6f2");
						$(".curpage").css("color","#484744");
						 a=parseInt($("#yema").text());
						 $("#pagefen a:eq("+a+")").css("background-color","#da4f4a");
						 $("#pagefen a:eq("+a+")").css("color","#f8f6f2");
						/*  $("#pagefen .a").mouseover(function(){
								$("#pagefen .a").css("background","#da4f4a");
							});
							$("#pagefen .a").mouseout(function(){
								$("#pagefen .a").css("background","#f8f6f2");
							}); */
							
					}
					});
					
					
					
				
					
					
				});//类型按钮添加ajax
				
			});//类型按钮添加事件结束
			
		 });
		
		
		
		
	});//入口结束
	//分页用
	function fenye(opv,url,zye,cye){
		
	}
</script>
</head>
<body>
	<div class="navbar navbar-uprice navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a href="/site?site=1" title="e选房" class="brand"> <img
					src="https://fang-vanke-com.oss-cn-beijing.aliyuncs.com/20161101/131224814969504615.png"
					alt="e选房">
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
	                                    <li><a href="${pageContext.request.contextPath }/ordersController?op=queryByPage">个人中心</a></li>
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
				<a href="#" title="e选房系统" class="brand"> 
				<img src="${pageContext.request.contextPath}/img/logo.jpg" alt="e选房系统" />
				</a>
				<div class="nav-collapse collapse">
					<div class="pull-left">
						<div class="togglecity">
							<select name="" id="areas" style="width: 100px;height:30px;overflow-y:auto;"  size="1" >
								
							</select>
							
						</div>
					</div>
					<div class="">
						<ul class="nav menubar_nav pull-right">
							<li id="menubar_homepage"><a href="${pageContext.request.contextPath }/front/sy.jsp">首页</a></li>
							<li id="menubar_target"><a href="#">线上开盘</a></li>
							
							<li id="menubar_profile"><a href="${pageContext.request.contextPath }/front/datum.jsp">个人中心</a></li>
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
					<div class="span4">
						<div class="map ">
							您所在的位置：<a href="${pageContext.request.contextPath }/front/sy.jsp">首页</a> &gt; <a href="#">线上开盘</a>
						</div>
					</div>
					<div class="map" id="hu">
						<!-- 户型：<a href="/?site=1">户型1</a>
							<a href="/Bidding?site=1">户型2</a>
							<a href="/Bidding?site=1">户型3</a>
							<a href="/Bidding?site=1">户型4</a> -->
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="frame-lr-left">


							<dl class="dl-filter">
								<dt>
									<span class="title">房源类型</span>
								</dt>
								<dd>
									<ul class="checkable" id="fylx">
									</ul>
								</dd>

							</dl>

						</div>
						<div class="frame-lr-right">
							<div class="wrap ">
								<table id="mtable" class="table activity table-hover"
									width="100%" cellpadding="0" cellspacing="0">
									<thead class="t-header">
										<tr>
											<th style="width: 160px" class="border_lf">名称</th>
											<th style="width: 80px" class="alcent">标的类型</th>
											<th style="width: 160px" class="alcent">选房时间</th>
											<th style="width: 65px" class="alcent">状态</th>
											<th style="width: 50px;" class="alcent">户型</th>
											<th style="width: 65px;" class="alcent">面积</th>
											<th style="width: 65px;" class="alcent">单价</th>
										</tr>
									</thead>
									<tbody id="housetable">
									
									</tbody>
								</table>
								<div class="green-black" id="pagefen">
								
								</div>
								<p id="yema" hidden=""></p>
								<p id="yen" hidden=""></p>
							</div>

						</div>
					</div>
				</div>

				<form action="/Home/SearchActivity" class="form-inline"
					id="searchfrm" method="post">
					<input type="hidden" id="Btype" name="Btype" value="0" /> <input
						type="hidden" id="Site" name="Site" value="1" /> <input
						name="__RequestVerificationToken" type="hidden"
						value="CfDJ8Of92WBgN0ZPuqyrUJkrytuMQ6wvDlMc1R_-7UtI7brRn3pJ2pB_AjdxvXJ7nX4YSNZufNvpnugkRY_4f7k4UI_Rmc_WmamPaQVHadkPHkGyczxLVvc8eiw9zHJ947gBdWHzaFlnWcn3bKqPO-7qNz3lBZuNCAIBQkv_mhjsJmmUzAGT6hX3efm9m9gYJentQA" />
				</form>



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
	<div id="other-container">
		<ul
			class="messenger messenger-fixed messenger-on-top messenger-theme-tip"></ul>
		<div id="__someKindOfTrigger"></div>
	</div>
	<script
		src="${pageContext.request.contextPath }/js/js.js?v=SzMY7OOJkzZMDcGNTydYvhNQN9c"></script>

	<script src="${pageContext.request.contextPath }/js/home.js"></script>
	
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "//hm.baidu.com/hm.js?7f8a3fed4e5181142e4c1f289ba3dd80";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
</body>
</html>





