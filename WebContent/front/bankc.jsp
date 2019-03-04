<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
    <title>jquery信用卡验证插件Card - 站长素材</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css">
</head>
<body>
    <style>
        .demo-container {
            width: 350px;
            margin: 50px auto;
            display: block;
        }

        form {
            margin: 30px;
        }
        input {
            width: 200px;
            margin: 10px auto;
            display: block;
        }

    </style>
    <div class="demo-container">
        <div class="card-wrapper"></div>

        <div class="form-container active">
            <form action="">
                <input placeholder="Card number" type="text" name="number1">
                <input placeholder="Full name" type="text" name="name">
                <input placeholder="MM/YY" type="text" name="expiry">
                <input placeholder="CVC" type="text" name="cvc">
            </form>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script>
        $('.active form').card({
            container: $('.card-wrapper')
        });
    </script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. </p>
<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
</div>

</body>
</html>