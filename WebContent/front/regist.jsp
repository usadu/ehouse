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
    <title>注册 - e选房 </title>
    <link href="/logo.ico" rel="Shortcut Icon" />
    <link href="${pageContext.request.contextPath}/css/areaCss.css?v=yfPwgLJZF-IP5pLLqcaCFPob27Q" rel="stylesheet" />
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
                <form action="/Login/Register" class="form-inline registerpage" enctype="multipart/form-data" id="registerfrm" method="post">    <div class="row-fluid">
        <div class="span12">
            <div class="brand">
                <img src="/Content/images/sys_title_s.png" />
                <img src="/Content/images/sys_register.png" />
            </div>
        </div>
    </div>
    <div class="box">
        <div class="wrap">
            <div class="row-fluid">
                <div class="span12">
                    <h1 class="register_title">注册E选房会员</h1>
                </div>
            </div>
            <div class="account">
                <div class="row-fluid">
                    <div class="control-group">
                        <div class="controls">
                            <input data-val="true" data-val-required="请输入姓名!" id="UserName" name="UserName" placeholder="请输入本人姓名" type="text" value="" />
                        </div>
                    </div>
                    <span class="field-validation-valid" data-valmsg-for="UserName" data-valmsg-replace="true"></span>
                    <input id="ProjectId" name="ProjectId" type="hidden" value="" />
                </div>
                <div class="row-fluid">
                    <div class="control-group">
                        <div class="controls phone">
                            <input data-val="true" data-val-regex="请输入正确的手机号码" data-val-regex-pattern="^[1][3,4,5,6,7,8,9][0-9]{9}$" data-val-required="请填写手机号码" id="Mobile" name="Mobile" placeholder="请输入手机号码" type="text" value="" />

                        </div>
                    </div>
                    <span class="field-validation-valid" data-valmsg-for="Mobile" data-valmsg-replace="true"></span>
                </div>
                <div class="row-fluid">
                    <div class="control-group">
                        <div class="controls email">
                            <input data-val="true" data-val-required="The VerificationCode field is required." id="VerificationCode" name="VerificationCode" placeholder="请输入短信验证码" type="text" value="" />
                            <input type="button" id="btn_GetVerCode_Register" class="vcode_link" value="获取验证码" placeholder="获取验证码" />
                            <input type="hidden" id="loginType" value="register" />
                        </div>
                    </div>
                </div>


                <div class="row-fluid">
                    <div class="control-group">
                        <div class="controls password">
                            <input type="password" id="Password" placeholder="6-20个大小写英文字母、符号或数字" />
                            <input data-val="true" data-val-length="密码最少输入6位." data-val-length-max="100" data-val-length-min="6" data-val-required="登入密码不能为空!" id="Encrypted_pwd" name="Encrypted_pwd" type="hidden" value="" />
                        </div>
                    </div>

                    <span class="field-validation-valid" data-valmsg-for="Encrypted_pwd" data-valmsg-replace="true"></span>
                </div>

                <div class="row-fluid">
                    <div class="control-group">
                        <div class="controls password">
                            <input type="password" id="ConfirmPassword" placeholder="请再次输入密码" />
                        </div>
                    </div>

                </div>
            </div>
            <input type="button" value="提交注册" id="btn_register" class="btnlogin btn-block" />
            <p class=""></p>
        </div>


    </div>                                           
<input name="__RequestVerificationToken" type="hidden" value="CfDJ8Of92WBgN0ZPuqyrUJkrytsAK7eAqWlk4tyI0RkW8LTOq4sw9CEiQuNQdjPlKzjSwDz0K6E0sotz-xl4gbsJitDEUdlFXKDBhWJmhGgzxfZTYJKxA4dnOBgIEBN7xibrYC0jFWt2vpF-5pxB-mCWuao1qlR0KjLBaZrvYUg7AXzlaJVZT1CrSaY2-H--Z2pM9A" /></form>
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
    
    <style type="text/css">
        body {
            background: #f8f6f2;
        }
    </style>

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





