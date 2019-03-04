<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="keywords" content="e选房,客户选房,选房系统，e选房系统" />
        <meta name="description" content="e选房系统是一个通过网络购房的系统，以后拿着手机就可以轻松买房子，再也不用整天跑售楼处。" />
        <title>e选房</title>
        
   <script src="${pageContext.request.contextPath }/js/js.js"></script>
        <script src="https://img1.cache.netease.com/cnews/js/ntes_jslib_1.x.js" type="text/javascript"></script>
        <link rel="stylesheet" href="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/css/common_css.css">
<script src="https://img1.cache.netease.com/f2e/libs/jquery.js" type="text/javascript"></script>

        <link rel="stylesheet" href="http://img1.cache.netease.com/f2e/home/zhuangxiu_backend/common/css/yunyan_enroll.1237512.css">
<link rel="stylesheet" href="http://img2.cache.netease.com/f2e/house/house_lib/live/libs/kalendae.css">
<link rel="stylesheet" type="text/css" href="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/css/map.css">
<link rel="stylesheet" type="text/css" href="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/css/calculator.css">
<link rel="stylesheet" href="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/css/index.css">
<link rel="stylesheet" type="text/css" href="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/css/map_and_calculator.css">
<script src="http://house.163.com/special/000787P5/lpk_head_city.js?86543"  type="text/javascript"></script>


        
             
 <link href="${pageContext.request.contextPath }/css/css.css?v=bj4vTZsmMd-mPY3_--uHwCjKrnI"
	rel="stylesheet" />                          
    </head>
    <script type="text/javascript">
            //刷过来的数据
            var LPK_INIT_DATA = {
                city: "gz"
            }
            var Calculator = {
                pointX:
                                113.15549053747571,//longitude经度
                                 pointY:
                                    23.467535410764302,//latitude纬度
                BD_URL: '/gz/search/fuzzy.html',
                houseTypeUrl: '/gz/loan!getProductLoanInfo.action',
                maxYear: 30,
                maxPersonalLoan: 0,
                maxCounpleLoan: 0,
                firstPrice: 3.0,
                secondPrice: 5.0,
                fundFirstPrice:2.0,
                fundSecondPrice:2.0
            };
       </script>
    <script type="text/javascript">
    $(function(){
    	
    $("#zf").click(function(){
    	
  		Date d = new Date();
  		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  		String now = df.format(d);
  		$("#now").text(now);
  		
  		if($("#uname").val()==null || $("#uphone").val()==null){
  			alert("请先登陆");
  		}else{
  			if($("#uidcard").val()==null){
  				alert("请先进行身份认证");
  			}else{
  				if($("#ubankcard").val()==null){
  					alert("请绑定银行卡，再进行选房");
  				}
  			}
  		}
    	
    });
    
    	
    });
    </script>
    <body>
    
 
        <!-- 固顶 fixTop -->

        
        <!--首页用的顶部-->
	<div class="navbar navbar-uprice navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<c:choose>
                      <c:when test="${sessionScope.u==null}">
	                       <div class="nav-collapse collapse">
		                    <ul class="nav pull-right">
		                            <li class="dropdown">
		                                <a href="{pageContext.request.contextPath }/front/login.jsp">请登录</a>
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
	                                    <li><a href="{pageContext.request.contextPath }/front/datum.jsp">基本信息</a></li>
	
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
				<img  src="${pageContext.request.contextPath}/img/logo.jpg" alt="e选房系统" />
				</a>
			</div>
		</div>
</div>

        <!-- 首页 概览-->
	<div class="bigWidth">
		<!--模块4焦点图部分 begin-->
		<div id="areaphoto" class="model head-slide" style="height:200px;">


		</div>
		<!--模块4焦点图部分 end-->
		<!--模块5 信息概述部分 begin-->
		<div class="model lpInfo-sum" style="margin-botton:20px;">
		<h2>选房结算</h2>
			<form id="payFrom" action="" method="post" >
          		<table border="0" cellspacing="" cellpadding="" align="center">
          			<%-- <tr>
          				<td  width="30px">订单号：</td>
          				<td><span id="">${requestScope.h.h_name}</span></td>
          			</tr> --%>
          			<tr>
          				<td>选房时间：</td>
          				<td ><span id="now"></span></td>
          			</tr>
          			<tr>
          				<td >地址：</td>
          				<td><span id="">${requestScope.h.ht_name}</span></td>
          			</tr>
          			<tr>
          				<td>户型：</td>
          				<td ><span id=""></span></td>
          			</tr>
          			<tr>
          				<td  width="130px">建筑面积：</td>
          				<td><span id="">${requestScope.h.h_unitprice}元/㎡</span></td>
          			</tr>
          			<tr>
          				<td>客户：</td>
          				<td ><span id="uname">${sessionScope.u.u_name}</span></td>
          			</tr>
          			<tr>
          				<td>手机号码：</td>
          				<td ><span id="uphone">${sessionScope.u.u_phone}</span></td>
          			</tr>
          			<tr>
          				<td>证件号：</td>
          				<td ><span id="uidcard">${sessionScope.u.u_idcard}</span></td>
          			</tr>
          			<tr>
          				<td>银行卡号：</td>
          				<td ><span id="ubankcard">${sessionScope.u.u_bankcard}</span></td>
          			</tr>
          			<tr>
          				<td>付款方式：</td>
          				<td >
	          				<select name="fk">
	          					<option value="qk">全款</option>
	          					<option value="sf20">首付20%</option>
	          					<option value="sf30">首付30%</option>
	          					<option value="sf40">首付40%</option>
	          				</select>
          				</td>
          			</tr>
          			<tr>
          				<td>应付金额：</td>
          				<td ><span id=""></span></td>
          			</tr>
          			<tr>
          				<td colspan="2" align="center"><input type="button" id="zf" class="btn" value="确认支付"/></td>
          			</tr>
          		</table>
          	</form>
          	<div style="float:right; margin:auto;">
          		<img alt="" src="${pageContext.request.contextPath}/img/bidding.png">
          	</div>
			
		</div>
		<!--模块5 信息概述部分 end-->
	</div>

        <!--模块16—房贷计算器 begin-->
        <div class="mcalculator model" style="height: 518px;" style=" margin-top:20px;">
          <h3 class="h2-tit">房贷计算器</h3>
            <!--商业贷款-->
<div class="box1200 calculator-con clearBoth">
    <!-- <h2>贷款计算器</h2> -->
    <!--<form>-->
    <div class="form-outer">
        <div class="list-infor clearfix">
            <div class="list-name">计算方式</div>
            <div class="list-con count-way clearBoth">
               
                <div class="choice area clearBoth calArea">
                    <div class="radio-outer">
                        <input type="radio" value="2" name="countWay" id="area"/>
                    </div>
                    <label for="area">按面积</label>
                </div>
                <div class="choice limit clearBoth calLimit">
                    <div class="radio-outer">
                        <input type="radio" value="3" name="countWay" id="limit"/>
                    </div>
                    <label for="limit">按贷款额度</label>
                </div>
            </div>
        </div>
   
        <div class="list-infor choice-house clearBoth">
            <div class="list-name">选择户型</div>
            <div class="list-con back-color">
                <select></select>
                <span class="triangle"></span>
            </div>
        </div>
        <div class="list-infor total-price clearBoth">
            <div class="list-name">估算总价</div>
            <div class="list-con">
                <p class="price"><span>68</span>万</p>
                <input type="hidden" value="680000" name="">
            </div>
        </div>
        <div class="house-tip">
            <p>该楼盘暂无户型信息或户型估价</p>
            <p>请选择<a class="J_area" data-typeId="1">面积计算</a>或<a class="J_num" data-typeId="2">按贷款额度计算</a></p>
        </div>
        <div class="list-infor area-price clearBoth">
            <div class="list-name">每平单价</div>
            <div class="list-con back-color">
                <input class="ipt-text areaForPrice" type="text" name="" placeholder="请输入">
                <span class="unit">元/㎡</span>
            </div>
        </div>
        <div class="list-infor area-count clearBoth">
            <div class="list-name">面积</div>
            <div class="list-con back-color">
                <input class="ipt-text areaForArea" type="text" name="" placeholder="请输入">
                <span class="unit">㎡</span>
            </div>
        </div>
        <div class="list-infor total-loan clearBoth">
            <div class="list-name">贷款总额</div>
            <div class="list-con back-color">
                <input class="ipt-text totalLoanPrice" type="text" name="" placeholder="请输入">
                <span class="unit">万元</span>
            </div>
        </div>
        <div class="list-infor buy-type clearfix">
            <div class="list-name">购房性质</div>
            <div class="list-con property clearBoth">
            
                <div class="choice percent clearBoth">
                    <div class="percent-title">首付比例</div>
                    <div class="percent-value clearBoth">
                        <input type="text" name="" value="30" class="firstPay">
                        <span>%</span>
                    </div>
                    <span class="percent-line"></span>
                </div>
            </div>
        </div>
        <div class="list-infor years clearBoth">
            <div class="list-name">贷款年限</div>
            <div class="list-con back-color loanTimeSelect">
                <select>
                    <option value="240" selected="selected">20年（240）期</option>
                </select>
                <span class="triangle"></span>
            </div>
        </div>
        <div class="list-infor rate clearBoth">
            <div class="list-name">利率</div>
            <div class="list-con back-color loanRateSelect">
                <select>
                    <option value="4.9" selected="selected">最新商业贷款基准利率4.9%</option>
                    <option value="3.25">最新公积金贷款基准利率3.25%</option>
                </select>
                <span class="triangle"></span>
            </div>
        </div>
        <div class="count-btn">
            <div class="count-go">马上计算</div>
            <div class="resetting">重置</div>
        </div>
    </div>
    <!--</form>-->
    <div class="vertical-line"></div>
    <div class="charts-tip">
        <img src="http://nos.netease.com/fps-pro/frontends/lpk_pc/v1/images/page.png">
    </div>
    <div class="charts-outer">
        <div id="sdChart" style="width:600px;height:300px;margin:0 auto;"></div>
        <div class="first-loan">
            <div class="title">每月还贷</div>
            <div class="price"><span></span>元</div>
        </div>
        <a href="#" target="_blank">
            <div class="watch-other-way">查看其它贷款组合方式结果</div>
        </a>
        <div class="chart-tip">
            <p>以上计算结果仅供参考</p>
            <p>1.此结果为等额本息的计算结果；</p>
            <p>2.均以最新基准利率计算，5年以上公积金3.25%，商业4.9%；</p>
        </div>
    </div>
    <div class="mask-tip-outer">
        <div class="error-tip"></div>
    </div>
</div>
        </div>
        <!--模块16—房贷计算器 end-->

     



   



<script src="http://nos.netease.com/fps-pro/frontends/libs/jquery/jquery.cookie-1.4.1.js"></script>
<script src="http://img1.cache.netease.com/f2e/house/resold/components/qrcode.1125509.min.js"></script>
<!-- <script src="http://img1.cache.netease.com/cnews/js/ntes_jslib_1.x.js" type="text/javascript"></script> -->
<script type="text/javascript" src="http://img3.cache.netease.com/common/share/yixin/b02/yixin.min.js"></script>
<script src="http://img1.cache.netease.com/f2e/house/index2016/js/house-slider.1.0.1034528.min.js"  type="text/javascript"></script>
<script src="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/js/common.js" type="text/javascript"></script>


        <script src="http://static.ws.126.net/f2e/home/zhuangxiu_backend/common/js/yunyan_common_enroll.js?2111"></script>
<script type="text/javascript" src="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/js/echarts.min.js"></script>
<script type="text/javascript" src="http://img2.cache.netease.com/f2e/house/house_lib/live/libs/kalendae.standalone.js"></script>
<script src="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/js/netease_service.js" type="text/javascript"></script>
<script src="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/js/citylpk_slide.js" type="text/javascript"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=d58L5kdvOvtabbGx6odBhmu0wMQ2qRG6"></script>
<script type="text/javascript" src="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/js/calculator_inc.js"></script>
<script src="http://nos.netease.com/fps-pro/temp/18eef6213794b323dc031fbb216226b1/jqueryXdominRequest.js"  type="text/javascript"></script>
<script src="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/js/index.js"  type="text/javascript"></script>
<script src="//nos.netease.com/fps-pro/frontends/lpk_pc/v78/js/head_city_common.js"  type="text/javascript"></script>
<script type='text/javascript'>
(function(w, d, s, n) {
var f = d.getElementsByTagName(s)[0],k = d.createElement(s); k.async = true;
k.src = '//static.ws.126.net/utf8/3g/analytics/data1/'+n+'.js';
f.parentNode.insertBefore(k, f);
})(window, document, 'script','NTM-9X2F9177-1');
</script>

        <!--HubbleAnalysis-->
        <script type="text/javascript">
            (function(document,datracker,root){function loadJsSDK(){var script,first_script;script=document.createElement("script");script.type="text/javascript";script.async=true;script.src="https://hubble-js-bucket.nosdn.127.net/DATracker.globals.1.6.7.js";first_script=document.getElementsByTagName("script")[0];first_script.parentNode.insertBefore(script,first_script)}if(!datracker["__SV"]){var win=window;var gen_fn,functions,i,lib_name="DATracker";window[lib_name]=datracker;datracker["_i"]=[];datracker["init"]=function(token,config,name){var target=datracker;if(typeof(name)!=="undefined"){target=datracker[name]=[]}else{name=lib_name}target["people"]=target["people"]||[];target["abtest"]=target["abtest"]||[];target["toString"]=function(no_stub){var str=lib_name;if(name!==lib_name){str+="."+name}if(!no_stub){str+=" (stub)"}return str};target["people"]["toString"]=function(){return target.toString(1)+".people (stub)"};function _set_and_defer(target,fn){var split=fn.split(".");if(split.length==2){target=target[split[0]];fn=split[1]}target[fn]=function(){target.push([fn].concat(Array.prototype.slice.call(arguments,0)))}}functions="track_heatmap register_attributes register_attributes_once clear_attributes unregister_attributes current_attributes single_pageview disable time_event get_appStatus track set_userId track_pageview track_links track_forms register register_once alias unregister identify login logout signup name_tag set_config reset people.set people.set_once people.set_realname people.set_country people.set_province people.set_city people.set_age people.set_gender people.increment people.append people.union people.track_charge people.clear_charges people.delete_user people.set_populationWithAccount  people.set_location people.set_birthday people.set_region people.set_account abtest.get_variation abtest.async_get_variable".split(" ");for(i=0;i<functions.length;i++){_set_and_defer(target,functions[i])}datracker["_i"].push([token,config,name])};datracker["__SV"]=1.6;loadJsSDK()}})(document,window["DATracker"]||[],window);
            // 初始化
            DATracker.init('MA-A924-182E1997E62F', {truncateLength: 255,persistence: "localStorage",cross_subdomain_cookie: false,heatmap:{isTrackLink: true}});
            DATracker.track('PCHouseDetailIndex');
        </script>
    </body>

</html>
    