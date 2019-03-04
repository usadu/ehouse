<%@page import="com.etc.entity.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.etc.service.impl.UserServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>选房 </title>
    <meta charset="utf-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="keywords" content=e选房,客户选房,选房系统，e选房系统 />
    <meta name="description" content=e选房系统是一个通过网络购房的系统，以后拿着手机就可以轻松买房子，再也不用整天跑售楼处。 />
    <link href="/logo.ico" rel="Shortcut Icon" />
    <link href="${pageContext.request.contextPath }/css/cs.css?v=bj4vTZsmMd-mPY3_--uHwCjKrnI" rel="stylesheet" />
    
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet" />
    
          <!--   轮播图样式 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/demo.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
    <script src="${pageContext.request.contextPath}/jquery/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="//t.focus-res.cn/front-end/icon/iconfont.css">

<script type='text/javascript'>
      var _vds = _vds || [];
      window._vds = _vds;
      (function(){
        _vds.push(['setAccountId', '87a4bcbf0b1ea517']);
        (function() {
          var vds = document.createElement('script');
          vds.type='text/javascript';
          vds.async = true;
          vds.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'assets.growingio.com/vds.js';
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(vds, s);
        })();
      })();
</script>

<link href="https://t1.focus-res.cn/house-on-sale/pc/page-activity.54df83c43aad7a0cce34.css" rel="stylesheet"></head>
	
</head>
<body>
	<%-- <c:if test="${sessionScope.u==null}">
		alert("ddd");
	</c:if> --%>
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
                    <img src="${pageContext.request.contextPath }/img/menubar_logo.png" alt="e选房系统" />
                </a>
                <div class="nav-collapse collapse">
                    <div class="pull-left">
                        <!-- <div class="togglecity">
                            <a href="/site" class="city">北京 ▼</a>
                        </div> -->
                    </div>
                    <div class="">
                        <ul class="nav menubar_nav pull-right">
                            <li id="menubar_homepage"><a href="${pageContext.request.contextPath }/front/sy.jsp">首页</a></li>
                            <li id="menubar_target"><a href="${pageContext.request.contextPath }/front/housechoose.jsp">线上开盘</a></li>

                            <li id="menubar_profile"><a href="${pageContext.request.contextPath }/front/datum.jsp">个人中心</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="page">
        <div id="main">
            <div class="afterheader"></div>
            
		<div class="lunbo" id="" >
		
			<div class="carousel" data-gap="20">
				<figure>
					<img class="lb" src="${pageContext.request.contextPath }/img/1.jpg" alt="">
					<img class="lb" src="${pageContext.request.contextPath }/img/2.jpg" alt="">
					<img class="lb" src="${pageContext.request.contextPath }/img/3.jpg" alt="">
					<img class="lb" src="${pageContext.request.contextPath }/img/4.jpg" alt="">
					<img class="lb" src="${pageContext.request.contextPath }/img/5.jpg" alt="">
					<img class="lb" src="${pageContext.request.contextPath }/img/6.jpg" alt="">
					<img class="lb" src="${pageContext.request.contextPath }/img/7.jpg" alt="">
				</figure>
				<!-- <nav>
					<button class="nav prev">Prev</button>
					<button class="nav next">Next</button>
				</nav> -->
			</div>
		
		</div>
     	<!-- 导入轮播js代码 -->
		<script src="${pageContext.request.contextPath }/js/syLunbo.js"></script>



<div style="margin-top:10px;">
    <div node-type="module" class="module-header" style="margin-top:10px;">
        <!--header-->
        
        <div class="split">
            <!-- he -->
                                        
            <div class="module-activity-feature ">
                <div class="activity-feature-line ">
                    <div class="activity-feature-block cell">
                        <div class="activity-feature-icon icon-1"></div>
                        <div class="activity-feature-title">1秒极速选房</div>
                        <div class="activity-feature-subtitle">购房者1秒完成选房</div>
                        <div class="activity-feature-subtitle">用户体验极大提升</div>
                    </div>
                    <div class="activity-feature-block cell">
                        <div class="activity-feature-icon icon-2"></div>
                        <div class="activity-feature-title">1小时房源配置</div>
                        <div class="activity-feature-subtitle">开发商1小时完成房源配置</div>
                        <div class="activity-feature-subtitle">省时、省力、省心</div>
                    </div>
                    <div class="activity-feature-block cell">
                        <div class="activity-feature-icon icon-3"></div>
                        <div class="activity-feature-title">万人选房无压力</div>
                        <div class="activity-feature-subtitle">万人同时选房毫无压力</div>
                        <div class="activity-feature-subtitle">轻松应对火爆开盘</div>
                    </div>
                    <div class="activity-feature-block cell">
                        <div class="activity-feature-icon icon-4"></div>
                        <div class="activity-feature-title">百分百成功</div>
                        <div class="activity-feature-subtitle">百分百完美开盘成功率</div>
                        <div class="activity-feature-subtitle">为每一次开盘保驾护航</div>
                    </div>
                </div>
            </div>

        </div>
        <div class="split">
            <!-- zhang -->
                                        
            <div class="module-activity-past ">

                <div class="activity-step-title">
                    <div class="title">
                        <div class="main-title">过去</div>
                        <div class="subtitle">Before</div>
                    </div>
                </div>

                <div class="center">
                    <div class="defect d-1">
                        <p class="txt t-1">
                            <span>担心传统开盘，不但费心还费钱？</span>
                        </p>
                    </div>
                    <div class="defect d-2">
                        <p class="txt t-2">
                            <span>担心开盘太高调？担心房子卖的慢？<br/>担心现场混乱、有安全隐患？</span>
                        </p>
                    </div>
                    <div class="defect d-3">
                        <p class="txt t-3">
                            <span>开盘近在眼前，却来不及筹备？</span>
                        </p>
                    </div>
                </div>

            </div>

        </div>
        <div class="split">
            <!-- xz -->
                                        
            <div class="module-activity-now">
              <div class="activity-step-title" style="margin-botton:20px;">
                <div class="title">
                  <div class="main-title">现在</div>
                  <div class="subtitle">Now</div>
                </div>
              </div>

              <div class="center">
                <p class="title"  style="margin-top:-20px;"><img src="${pageContext.request.contextPath }/img/menubar_logo.png" alt="e选房" style="width:120px; margin-top:-5px;" />在线开盘系统</p>
                <p class="subtitle">您最经济、省心、快捷的解决方案！</p>
                
                <img class="bg" src="https://t1.focus-res.cn/house-on-sale/pc/img/bg.0d5b111.png"/>
                <img class="comp" src="https://t1.focus-res.cn/house-on-sale/pc/img/comp.bed6782.png"  style="position:absolute; top:130px;"/>
              </div>

            </div>

        </div>
        <div class="split">
            <!-- zhang -->
                                        
            <div class="module-activity-advantage ">
                <div class="activity-step-title">
                    <div class="title">
                        <div class="main-title">产品优势</div>
                        <div class="subtitle">Advantage</div>
                    </div>
                </div>

                <div class="content">

                    <div class="advantage">
                        <img src="https://t1.focus-res.cn/house-on-sale/pc/img/img1.335033f.png"/>
                        <div class="txt">
                            <i class="icon-1"></i>
                            <p class="txt-1" >在家选房</p>
                            <p class="txt-2" >只需一部电脑<br/>足不出户就选房</p>
                        </div>
                    </div>
                    <div class="advantage">
                        <img src="https://t1.focus-res.cn/house-on-sale/pc/img/img2.9b1eb12.png"/>
                        <div class="txt">
                            <i class="icon-2"></i>
                            <p class="txt-1" >提升转化</p>
                            <p class="txt-2" >房源抢拍模式下<br/>客户转化率极高</p>
                        </div>
                    </div>
                    <div class="advantage">
                        <img src="https://t1.focus-res.cn/house-on-sale/pc/img/img3.ea35f96.png"/>
                        <div class="txt">
                            <i class="icon-3"></i>
                            <p class="txt-1" >安全防护</p>
                            <p class="txt-2" >接入大气层防护系统<br/>银河级安全保障</p>
                        </div>
                    </div>
                    <div class="advantage">
                        <img src="https://t1.focus-res.cn/house-on-sale/pc/img/img4.ae56eb4.png"/>
                        <div class="txt">
                            <i class="icon-4"></i>
                            <p class="txt-1" >经验丰富</p>
                            <p class="txt-2" >e选房<br/>房产开盘经验加持</p>
                        </div>
                    </div>
                    <div class="advantage">
                        <img src="https://t1.focus-res.cn/house-on-sale/pc/img/img5.dd2094c.png"/>
                        <div class="txt">
                            <i class="icon-5"></i>
                            <p class="txt-1" >低调稳妥</p>
                            <p class="txt-2" >是扩大宣传还是低调开盘<br/>一切由开发商说了算</p>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div class="split">
            <!-- he -->
                                        
            <div class="module-activity-compare ">

                <div class="compare-title">
                    <div class="compare-left">
                        <!--<span class="title-icon"></span>-->
                        <span class="title-text">老式传统开盘</span>
                    </div>
                    <div class="compare-right">
                        <span class="title-text">焦点线上开盘</span>
                        <!--<span class="title-icon"></span>-->
                    </div>
                    <div class="compare-middle">
                        <span class="middle-icon">vs</span>
                    </div>
                </div>
                <div class="compare-line line1"  style="margin-botton:0px;">
                    <div class="compare-left">1个月<span class="compare-icon"></span></div>
                    <div class="compare-middle">筹备时间</div>
                    <div class="compare-right"><span class="compare-icon"></span>1小时</div>
                </div>
                <div class="compare-line line2" style="margin-top:0px;">
                    <div class="compare-left">数十万元<span class="compare-icon"></span></div>
                    <div class="compare-middle">筹备耗资</div>
                    <div class="compare-right"><span class="compare-icon"></span>不足传统费用的1/10</div>
                </div>
                <div class="compare-line line3" style="margin-top:20px;">
                    <div class="compare-left">逐份填问卷收集<span class="compare-icon"></span></div>
                    <div class="compare-middle">客户意向</div>
                    <div class="compare-right"><span class="compare-icon"></span>系统自动统计</div>
                </div>
                <div class="compare-line line4" style="margin-top:20px;">
                    <div class="compare-left">现场张贴海报、支展板<span class="compare-icon"></span></div>
                    <div class="compare-middle">房源展示</div>
                    <div class="compare-right"><span class="compare-icon"></span>系统内完整呈现</div>
                </div>
                <div class="compare-line line5" style="margin-top:20px;">
                    <div class="compare-left">现场人工签到<span class="compare-icon"></span></div>
                    <div class="compare-middle">开盘签到</div>
                    <div class="compare-right"><span class="compare-icon"></span>系统自动计数</div>
                </div>
                <div class="compare-line line6" style="margin-top:20px;">
                    <div class="compare-left">提前精心布置好的专用场地<span class="compare-icon"></span></div>
                    <div class="compare-middle">选房地点</div>
                    <div class="compare-right"><span class="compare-icon"></span>足不出户在线选房</div>
                </div>
                <div class="compare-line line7" style="margin-top:20px;">
                    <div class="compare-left">200套/小时<span class="compare-icon"></span></div>
                    <div class="compare-middle">选房速度</div>
                    <div class="compare-right"><span class="compare-icon"></span>1000套/秒</div>
                </div>
                <div class="compare-line line8" style="margin-top:20px;">
                    <div class="compare-left">控场、安保等上百人<span class="compare-icon"></span></div>
                    <div class="compare-middle">现场管理</div>
                    <div class="compare-right"><span class="compare-icon"></span>无需场控</div>
                </div>

            </div>

        </div>
        <div class="split">
            <!-- he -->
                                        
            <div class="module-activity-step ">
                <div class="activity-step-title">
                    <div class="title">
                        <div class="main-title">全流程保障</div>
                        <div class="subtitle">Process</div>
                    </div>
                </div>
                <div class="activity-step-subtitle">
                    <div class="subtitle-left">让开发商省心</div>
                    <div class="subtitle-right">让购房者放心</div>
                </div>
                <div class="activity-step-line line1">
                    <div class="step-left">
                        <div>便捷高效，开发商</div>
                        <div>1小时配置所有房源</div>
                    </div>
                    <div class="step-right">
                        <div>开发商后台添加的认筹客户</div>
                        <div>身份认证，一键选房</div>
                    </div>
                    <div class="step-middle">
                        <div class="line-left"></div>
                        <div class="circle-area"><i>筹备</br>阶段</i></div>
                        <div class="line-right"></div>
                    </div>
                </div>
                <div class="angle-area">
                    <div class="angle"></div>
                </div>
                <div class="activity-step-line line2">
                    <div class="step-left">
                        <div>可选择是否提前展示价格</div>
                        <div>其他个性化设置随意搭配</div>
                    </div>
                    <div class="step-right">
                        <div>购房者通过多重入口进入系统，</div>
                        <div>可提前查看房源</div>
                    </div>
                    <div class="step-middle">
                        <div class="line-left"></div>
                        <div class="circle-area"><i>预选</br>阶段</i></div>
                        <div class="line-right"></div>
                    </div>
                </div>
                <div class="angle-area">
                    <div class="angle"></div>
                </div>
                <div class="activity-step-line line3">
                    <div class="step-left three-line">
                        <div>大屏幕实时展示房源疯抢状况</div>
                        <div>火爆场面刺激购买</div>
                        <div>顶级安全系统，避免刷单</div>
                    </div>
                    <div class="step-right three-line">
                        <div>购房者足不出户选择心仪房源</div>
                        <div>体验流畅无卡顿，</div>
                        <div>安心选好房</div>
                    </div>
                    <div class="step-middle">
                        <div class="line-left"></div>
                        <div class="circle-area"><i>开盘</br>阶段</i></div>
                        <div class="line-right"></div>
                    </div>
                </div>
                <div class="angle-area">
                    <div class="angle"></div>
                </div>
                <div class="activity-step-line line4">
                    <div class="step-left">
                        <div>轻松导出购买成功名单</div>
                        <div>等待购房者付款</div>
                    </div>
                    <div class="step-right">
                        <div>收到买房成功短信</div>
                        <div>随时查看凭证，方便</div>
                    </div>
                    <div class="step-middle">
                        <div class="line-left"></div>
                        <div class="circle-area"><i>活动</br>结束</i></div>
                        <div class="line-right"></div>
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

    <script src="${pageContext.request.contextPath }/js/js.js?v=SzMY7OOJkzZMDcGNTydYvhNQN9c"></script>
    
 
    <link href="${pageContext.request.contextPath }/css/cs.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath }/js/HomePage.js"></script>


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
<script type="text/javascript" src="https://t1.focus-res.cn/seo-sv/header-footer/assets/footer/footer.f8928d56259c1c323326.js" defer></script>

    <script type="text/javascript">var _focus_pv_id = "focus.shengtai.all";</script>
    <script type="text/javascript" src="//t.focus-res.cn/front-end/stat.js"></script>

<script type="text/javascript" src="https://t1.focus-res.cn/house-on-sale/pc/commons.cff8335590b4224456c1.js"></script><script type="text/javascript" src="https://t1.focus-res.cn/house-on-sale/pc/bundle.e7b7fbcf674ca3749ced.js"></script><script type="text/javascript" src="https://t1.focus-res.cn/house-on-sale/pc/page-activity.54df83c43aad7a0cce34.js"></script></body>
</html>
<style>
html{
    height: 100%;
}
body{
    height: 100%;
}
</style>

</html>





