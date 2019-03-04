<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%@page import="java.util.List"%>
    <%@page import="com.etc.entity.Orders" %>
    <%@page import="com.etc.service.impl.orderServiceImpl"%>
<%
   String contextPath=request.getContextPath();
%>
<html>
<head>
    <title> 我参与的选房 | 个人中心  </title>
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="keywords" content=e选房,客户选房,选房系统，e选房系统 />
    <meta name="description" content=e选房系统是一个通过网络购房的系统，以后拿着手机就可以轻松买房子，再也不用整天跑售楼处。 />
    <link  href="/logo.ico" rel="Shortcut Icon" />
   <link href="${pageContext.request.contextPath }/css/cs.css?v=bj4vTZsmMd-mPY3_--uHwCjKrnI" rel="stylesheet" />
 <script src="${pageContext.request.contextPath}/js/js.js?v=SzMY7OOJkzZMDcGNTydYvhNQN9c"></script>
    
   <script src="${pageContext.request.contextPath}/js/Profile.js"></script>

    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" />
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
                    <img src="https://fang-vanke-com.oss-cn-beijing.aliyuncs.com/20161101/131224814969504615.png" alt="e选房">
                </a>

                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">您好，夜凌云 <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/Profile?site=1">个人中心</a></li>
                                    <li><a href="/Follow/Target?btype=3&amp;site=1">我的关注</a></li>
                                    <li><a href="/Profile/Investing?site=1">我的投资</a></li>

                                </ul>
                            </li>
                            <li><a href="/Login/LogOff">【退出】</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="navbar menubar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a href="/?site=1" title="e选房系统" class="brand">
                    <img src="/Content/images/menubar_logo.png" alt="e选房系统" /></a>
                <div class="nav-collapse collapse">
                    <div class="pull-left">
                        <div class="togglecity">
                            <a href="/site" class="city">北京 ▼</a>
                        </div>
                    </div>
                    <div class="">
                        <ul class="nav menubar_nav pull-right">
                            <li id="menubar_homepage"><a href="/?site=1">首页</a></li>
                            <li id="menubar_target"><a href="/Bidding?site=1">线上开盘</a></li>
                            <li id="menubar_project"><a href="https://mfang.vanke.com/sale/" target="_blank">阳光购房</a></li>

                            <li id="menubar_wish"><a href="/MyWish?site=1">意向选房</a></li>
                   
                            <li id="menubar_product"><a href="/FinancialProduct?site=1">理财产品</a></li>
                            <li id="menubar_profile"><a href="/Profile?site=1">个人中心</a></li>
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
            您所在的位置：<a href="/?site=1" >首页</a> &gt;
             <a href="/Profile?site=1">个人中心</a> &gt;
            我参与的选房
        </div>
    </div>
</div>

<div class="row-fluid">
    <div class="span12">
        <div class="frame-lr-left">
            <dl class="dl-filter">
                <dt><span class="title">我的投资</span></dt>
                <dd>
                    <ul class="checkable">
                        <li>
                            <a href="/Profile/Investing?site=1">投资协议书</a>
                        </li>
                            <li>
                            <a href="/Profile/Paylog?site=1">交易记录</a>
                        </li>
                    </ul>
                </dd>
                <dt><span class="title">我的选房</span></dt>
                <dd>
                    <ul class="checkable" >
                              <li>
                    <a href="/Profile/Bill?site=1">订单</a>
                </li>
                        <li class="selected">
                            <a href="/Profile/Offerlog?site=1">我参与的</a>
                        </li>

                        <li>
                            <a href="/Profile?site=1">动态消息</a>
                        </li>
                    </ul>
                </dd>
                <dt><span class="title">我的关注</span></dt>
                <dd>
                    <ul class="checkable">
                        <li>
                            <a href="/Follow/Target?btype=3&amp;site=1">房源</a>
                        </li>
                        <li>
                            <a href="/Follow?btype=1&amp;site=1">场次</a>
                        </li>
                    </ul>
                </dd>
                <dt><span class="title">账号设置</span></dt>
                <dd>
                    <ul class="checkable">
                        <li>
                            <a href="/Profile/Account?site=1">基本信息</a>
                        </li>
                    </ul>
                </dd>
            </dl>
        </div>
        <div class="frame-lr-right">
            <div class="wrap">
                <div class="row-fluid">
                    <div class="span12">
                        <table id="mtable" class="table martable table-hover" width="100%" cellpadding="0" cellspacing="0">
                           <thead class="t-header">
                                <tr>
                                    <th class="border_lf alcent" style="width: 33px">关注
                                    </th>
                                    <th style="" class="alcent">
                                        <a href="javascript:void(0)" sortid="t.Num">编号&nbsp;<i class="icon-sort"></i></a>
                                    </th>
                                    <th style="width: 68px" class="alcent">
                                        <a href="javascript:void(0)" sortid="t.Area">面积(㎡)&nbsp;<i class="icon-sort"></i></a>
                                    </th>
                                    <th class="alcent">总价起始价
                                    </th>
                                    <th class="alcent">当前总价
                                    </th>
                                    <th class="alcent">认筹金
                                    </th>
                                    <th class="alcent">竞价阶梯
                                    </th>
                                    <th class="alcent" style="width: 33px">竞价</th>
                                    <th style="width: 73px" class="alcent ">状态
                                    </th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
<form action="/Home/Search" class="form-inline" id="searchfrm" method="post"><input name="__RequestVerificationToken" type="hidden" value="CfDJ8Of92WBgN0ZPuqyrUJkryttQqnrQIReXzA2TJutFPcdN_Ib41U-WNhNhhxP_bQBhUYRRMvCVA0xw2NcEqo0uAccRULVM4CbZ10rbFjSOUJanuc3BlI_732QHbqmLIVfaG_iTsUbEUKPCJI9B3ighNrHcXR2nnBN3O-uAVDcAn8kGK_YMeP5wB5CAYeYCiLIzsw" /></form>    </div>
</div>




            </div>
            <div class="afterbottom"></div>
        </div>
    </div>

<div id="footer">
    <div class="container columns ">
        <div class="row-fluid">
            <div class="span8">
                <div class="row-fluid">
                    <div class="span3">
                        <ul class="column">
                            <li>
                                <h2>公&nbsp;司</h2>
                            </li>
                            <li><a target="_blank" href="http://www.vanke.com/about.aspx">关于我们</a></li>
                            <li><a target="_blank" href="http://www.vanke.com/contact.aspx">联系我们</a></li>
                        </ul>
                    </div>
                    <div class="span3">
                        <ul class="column">
                            <li>
                                <h2>支&nbsp;持</h2>
                            </li>
                            <li><a target="_blank" href="/help" >帮助中心</a></li>
                        </ul>
                    </div>
                    <div class="span3">
                        <ul class="column">
                            <li>
                                <h2>更&nbsp;多</h2>
                            </li>
                            <li><a target="_blank" href="/Login/Terms">法律声明</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="span4">
                <div class="row-fluid">
                    <div class="span7">
                        <ul class="column colum-right">
                            <li><a>
                                <img src="/Content/images/bottom_logo.png" alt="e选房系统"></a></li>
                            <li>
                                <h6>e选房系统 版权所有</h6>
                                <h6>京ICP备16050553号</h6>
                            </li>
                            <li>  </li>
                        </ul>
                    </div>
                    <div class="span5 alcent ">
                            <p class="marbot5 ">
                                <img src="/Content/images/qrcode.jpg" />
                            </p>
                            <span>扫二维码关注公众号</span>
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


</html>