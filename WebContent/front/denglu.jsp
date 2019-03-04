<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta charset="utf-8" />
    <meta name="description" content=e选房系统是一个通过网络购房的系统，以后拿着手机就可以轻松买房子，再也不用整天跑售楼处。 />
    <meta name="keywords" content=e选房,客户选房,选房系统，e选房系统 />
    <title>欢迎登录e选房 </title>
    <link href="/logo.ico" rel="Shortcut Icon" />
    <link href="${pageContext.request.contextPath}/css/areaCss.css?v=yfPwgLJZF-IP5pLLqcaCFPob27Q" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/cs.css?v=yfPwgLJZF-IP5pLLqcaCFPob27Q" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/areaJs.js?v=v0YCu4lH5Jw8BP3flZtbsNdRGeQ"></script>
    <script src="${pageContext.request.contextPath}/js/area1Js.js?v=l956gOWRUj1uzihdeMn2qVC9jZ0"></script>
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
                <a href="/" title="e选房" class="brand">
                    <img />
                </a>
                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                        <li><a href="/Login" class="login">登录</a></li>
                        <li><a class="login split" href="javascript:void(0)">|</a></li>
                        <li><a href="/Login/Register" class="register">注册</a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div id="page">
        <div id="main">
            <div class="container">
                <div class="afterheader"></div>
                

<div class="wrap">
    <div class="row-fluid">
        <div class="span12">
            <div class="brand">
                <img src="/Content/images/sys_title.png" />
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span12">
            <div class="pull-left">
                <h4 class="title">请登录</h4>
            </div>
            <div class="pull-right" style="padding: 8px 0 10px;">
                <a href="/Login/Register" class="register">立刻注册</a>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="login_sel">
            <ul class="login_sel clearfix">
                <li data-tag="password" class="active">
                    密码登录
                </li>
                <li data-tag="code">
                    验证码登录
                </li>
            </ul>
            <span class="tab_nav" style="left: 0px;"></span>
            <input type="hidden" id="loginType" value="pwdLogin" />
        </div>
    </div>

    <div data-view="pwdLogin">
        <form id="loginfrm" enctype="multipart/form-data" class="form-horizontal" method="post" action="/Login">



            
            

            <div class="account">
                <div class="control-group">
                    <div class="controls">
                        <input data-val="true" data-val-regex="请输入正确的手机号码" data-val-regex-pattern="^[1][3,4,5,6,7,8,9][0-9]{9}$" data-val-required="请填写手机号码" id="Telphone" name="Telphone" placeholder="请输入手机号" type="text" value="" />
                    </div>
                </div>
                <span class="field-validation-valid" data-valmsg-for="Telphone" data-valmsg-replace="true"></span>

                <div class="control-group pwd">
                    <div class="controls">
                        <input type="password" id="Password" placeholder="请输入密码" />
                        <input data-val="true" data-val-required="请填写密码" id="Encrypted_pwd" name="Encrypted_pwd" type="hidden" value="" />
                    </div>
                </div>
                <span class="field-validation-valid" data-valmsg-for="Encrypted_pwd" data-valmsg-replace="true"></span>
            </div>
            <input type="hidden" id="return_url" value="/" />
            <input type="button" value="登&nbsp;录" id="btnPwdLogin" class="btnlogin btn-block" />
            <div class="row-fluid" style="padding-top: 14px;">
                <div class="span6">
                </div>
                <div class="span6 alright">
                    <a href="/Login/Forget?c=vanke ">忘记密码?</a>
                </div>
            </div>
            <p class="field-validation-error"></p>
        <input name="__RequestVerificationToken" type="hidden" value="CfDJ8Of92WBgN0ZPuqyrUJkrytshfCL2goj1lqxPTvitvuoB5zchGDALHex-L9dS9hPP74749LtffsT8iyuRjz4w2QHefsulcwcyIXOGIpKiFIZcUXQ0YNX8ccK8UGPzHSM4GMpFr7TZ7jMteag6RSOj_M4" /></form>
    </div>
    <div data-view="codeLogin" style="display:none;">


     

<form id="createfrm" enctype="multipart/form-data" class="form-horizontal" method="post" action="/Login/CodeLogin">

    

    <div class="account">
        <div class="row-fluid">
            <div class="control-group">
                <div class="controls phone">
                    <input data-val="true" data-val-regex="请输入正确的手机号码" data-val-regex-pattern="^[1][3,4,5,6,7,8,9][0-9]{9}$" data-val-required="请填写手机号码" id="CellPhone" name="CellPhone" placeholder="请输入手机号" type="tel" value="" />
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <div class="control-group">
                    <div class="controls code">
                        <input data-val="true" data-val-required="请输入验证码" id="VerificationCode" name="VerificationCode" placeholder="请输入验证码" type="text" value="" />
                        <input type="button" id="btn_GetVerCode" class="vcode_link" value="获取验证码" placeholder="获取验证码" />
                    </div>
                </div>
            </div>
        </div>

        <input type="button" id="btnCodeLogin" class="btnlogin btn-block" value="登&nbsp;录">

        <input type="hidden" id="geetest_challenge" />
        <input type="hidden" id="geetest_validate" />
        <input type="hidden" id="geetest_seccode" />
    </div>
<input name="__RequestVerificationToken" type="hidden" value="CfDJ8Of92WBgN0ZPuqyrUJkrytshfCL2goj1lqxPTvitvuoB5zchGDALHex-L9dS9hPP74749LtffsT8iyuRjz4w2QHefsulcwcyIXOGIpKiFIZcUXQ0YNX8ccK8UGPzHSM4GMpFr7TZ7jMteag6RSOj_M4" /></form>



    </div>
</div>
            </div>
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
                            <li><a target="_blank" href="">关于我们</a></li>
                            <li><a target="_blank" href="">联系我们</a></li>
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





