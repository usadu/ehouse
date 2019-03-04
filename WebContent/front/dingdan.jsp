<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
    <%@page import="com.etc.entity.Orders" %>
    <%@page import="com.etc.service.impl.orderServiceImpl"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%
   String contextPath=request.getContextPath();
%>
<!DOCTYPE html>

<html>
<head>

    <title> 订单 | 个人中心  </title>
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="keywords" content=e选房,客户选房,选房系统，e选房系统 />
    <meta name="description" content=e选房系统是一个通过网络购房的系统，以后拿着手机就可以轻松买房子，再也不用整天跑售楼处。 />
    <link  href="/logo.ico" rel="Shortcut Icon" />
    <link href="${pageContext.request.contextPath }/css/cs.css?v=bj4vTZsmMd-mPY3_--uHwCjKrnI" rel="stylesheet" />
   <script src="${pageContext.request.contextPath}/js/js.js?v=SzMY7OOJkzZMDcGNTydYvhNQN9c"></script>
   <script src="${pageContext.request.contextPath}/js/Profile.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/css/bootstrap-page.css" rel="stylesheet" />
<style type="text/css">
	.fy{
		
	}
</style>
<script type="text/javascript">
        /*  $(function() {
				//对按钮做点击事件
				$("#order").click(function() {
					$.get("${pageContext.request.contextPath }/ordersController",{op:"query"},function(data,status){
     			//将字符串转成js对象
     			
     			//遍历数组
     			 var info="";
     			 $.each(data,function(index,str){ //orders你要遍历的数组中每一个对象
							info+='<tr><td class="alcent">'+ str.ht_name +'</td><td class="alcent">'+ str.h_id +'</td><td class="alcent">'+ str.h_area +'</td><td class="alcent">'+ str.o_price +'</td><td><a class="btn btn-danger" href="javascript:deleFunction('+str.o_id+')">删除</a></td></tr>';
     				
     			 });
     				//将返回的数据显示在指定位置
     				$("#show").html(info); 
					 });
			});
         }); */

   		$(function(){
   			
   			//首页
   			$("#firstPage").click(function(){
   				location.href="${pageContext.request.contextPath}/ordersController?op=queryByPage&pageNo=1&pageSize=5&uid=${sessionScope.u.u_id}";
   			});
   			//页码
   			$(".thisPage").click(function(){
   				location.href="${pageContext.request.contextPath}/ordersController?op=queryByPage&pageNo="+$(this).text()+"&pageSize=5&uid=${sessionScope.u.u_id}";
   			});
   			//末页
   			$("#lastPage").click(function(){
   				location.href="${pageContext.request.contextPath}/ordersController?op=queryByPage&pageNo=${requestScope.pageData.totalPage}&pageSize=5&uid=${sessionScope.u.u_id}";
   			});
   			//下一页
   	    	$("#nextPage").click(function(){
   	    		//判断超出范围
   	    		if(${requestScope.pageData.pageNo >= pageData.totalPage}){
   	    			alert("已经是最后一页");
   	    			return;
   	    		}
   	    		//发请求 去找控制器
   	    		location.href="${pageContext.request.contextPath}/ordersController?op=queryByPage&pageNo="+${requestScope.pageData.pageNo+1}+"&pageSize=5&uid=${sessionScope.u.u_id}";
   	    		
   	    	});
   	    	//上一页
   	    	$("#prePage").click(function(){
   	    		//判断超出范围
   	    		if(${requestScope.pageData.pageNo <= 1}){
   	    			alert("已经是第一页");
   	    			return;
   	    		}
   	    		//发请求 去找控制器
   	    		location.href="${pageContext.request.contextPath}/ordersController?op=queryByPage&pageNo="+${requestScope.pageData.pageNo-1}+"&pageSize=5&uid=${sessionScope.u.u_id}";
   	    		
   	    	});
   		});
         
         
  </script>
</head>
<body>
    <div class="navbar navbar-uprice navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a href="/site?site=1" title="e选房" class="brand">
                    
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
                       <!--  <div class="togglecity">
                            <a href="/site" class="city">北京 ▼</a>
                        </div> -->
                    </div>
                    <div class="">
                        <ul class="nav menubar_nav pull-right">
                            <li id="menubar_homepage"><a href="${pageContext.request.contextPath }/front/sy.jsp">首页</a></li>
                            <li id="menubar_target"><a href="${pageContext.request.contextPath }/front/housechoose.jsp">线上开盘</a></li>
                   
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
            您所在的位置：<a href="${pageContext.request.contextPath }/front/sy.jsp" >首页</a> &gt;
             <a href="${pageContext.request.contextPath }/front/datum.jsp">个人中心</a> &gt;
             消息
        </div>
         
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <div class="frame-lr-left">
            <dl class="dl-filter">
                
                <dt><span class="title">我的选房</span></dt>
                <dd>
                    <ul class="checkable">
                        <li class="selected">
                            <a id="order">订单</a>
                        </li>
                     
                    </ul>
                </dd>
                
                <dt><span class="title">账号设置</span></dt>
                <dd>
                    <ul class="checkable">
                        <li>
                            <a href="${pageContext.request.contextPath }/front/datum.jsp">基本信息</a>
                        </li>
                    </ul>
                </dd>
            </dl>
        </div>
        <div class="frame-lr-right">

            <div class="wrap">
                <div class="row-fluid" >
                    <div class="span12">
                        <table id="mtable" class="table martable table-hover" width="100%" cellpadding="0" cellspacing="0">
                           <thead class="t-header">
                                <tr>
                                    <td class="alcent">房源类型</td>
                                    <td class="alcent">编号
                                    </td>
                                    <td class="alcent">面积
                                    </td>
                                    <td class="alcent">总价
                                    </td>
                                    <!-- <td style="width: 150px" class="alcent">操作
                                    </td> -->
                                </tr>
                            </thead>
                           <tbody id="show">
                           <c:forEach items="${requestScope.pageData.data}" var="order">
                  				<tr>
                  					<td class="alcent">${order.ht_name}</td>
                  					<td class="alcent">${order.h_id}</td>
                  					<td class="alcent">${order.h_area}</td>
                  					<td class="alcent">${order.o_price}</td>
                  					<%-- <td><a class="btn btn-danger" href="javascript:deleFunction(${order.o_id})">删除</a></td> --%>
                  				</tr>
                           </c:forEach>
			               </tbody>
                        </table>
			      				<!--
			            	作者：offline
			            	时间：2018-11-07
			            	描述：分页
			            -->
			            
			     <div class="fy">
			    	一共${requestScope.pageData.totalCount}个订单 
			    	共${requestScope.pageData.totalPage}页 
			  	            每页${requestScope.pageData.pageSize}条 
			    	当前第${requestScope.pageData.pageNo}页
			    
			     <div class="col-md-12 column text-center">
						<ul class="pagination pagination-sm">
							<li>
								<a href="javascript:void(0)" id="firstPage">首页</a>
							</li>
							<li>
								<a href="javascript:void(0)" id="prePage">上一页</a>
							</li>
							
							<c:forEach begin="1" end="${requestScope.pageData.totalPage}" var="i">
							<c:if test="${i == requestScope.pageData.pageNo}">
								<li class="active">
									<a href="javascript:void(0)" class=thisPage>${i}</a>
								</li>
							</c:if>
							<c:if test="${i != requestScope.pageData.pageNo}">
								<li>
									<a href="javascript:void(0)" class=thisPage>${i}</a>
								</li>
							</c:if>
						 	</c:forEach>
							<li>
								<a href="javascript:void(0)" id="nextPage">下一页</a>
							</li>
							<li>
								<a href="javascript:void(0)" id="lastPage">末页</a>
							</li>
			
						</ul>
					</div>
                   </div>
                </div>
            </div>
        </div>
<form action="" class="form-inline" id="searchfrm" method="post">            <input type="hidden" id="Btype" name="Btype" value="0" />                             
<input name="__RequestVerificationToken" type="hidden" value="CfDJ8Of92WBgN0ZPuqyrUJkryttOw2K4GfqohCFAgXrFXqnwfeMqQVXu6ZKTL4QaMdm9GfCGDOKwC8pE7vu68wqECwRy2pWZN_83HbVlhjZyYGpkxmdYl_xBRlOvljh9uHo47vJYwSZVzwDC41RrLVCvFupchMqGTZ8o2ZOK36ozSOeLVYi6Z4tPgTQOzX8bzm7UdA" /></form>    </div>
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
    <div id="other-container">
        <ul class="messenger messenger-fixed messenger-on-top messenger-theme-tip"></ul>
        <div id="__someKindOfTrigger"></div>
    </div>
 
    <script type="text/javaScript" >
        var _hmt = _hmt || [];
        (function () {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?7f8a3fed4e5181142e4c1f289ba3dd80";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
        function deleFunction(o_id){
      	   var flag=confirm("是否确定删除订单编号为:"+o_id);
      	   if(flag){
      		   location.href="${pageContext.request.contextPath}/ordersController?op=deleteorder&o_id="+o_id+"&u_id=${sessionScope.u.u_id}";
      	   }
         }
     
    </script>
</body>
</html>

