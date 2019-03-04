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

</head>

<body>

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
							<li><a href="${pageContext.request.contextPath}/mvc/userShow.jsp?#" class="text-white">前往管理账户信息</a></li>
							<li><a href="${pageContext.request.contextPath}/mvc/sign.jsp" class="text-white">注册新管理员</a></li>
							<li><a href="${pageContext.request.contextPath}/AdminController?op=qtLogout" class="text-white">安全退出</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-dark box-shadow">
			<div class="container d-flex justify-content-between">
				<a href="#" class="navbar-brand d-flex align-items-center"> <svg
						xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						viewBox="0 0 24 24" fill="none" stroke="currentColor"
						stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
						class="mr-2">
						<path
							d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path>
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

	<div class="album py-5 exf_bg">
		<div class="container">

			<div class="row">
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb4.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">e选房后台数据管理</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp?#" class="btn btn-sm btn-primary btn-outline-secondary">进入数据管理界面</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb14.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">e选房用户购房主界面</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp" class="btn btn-sm btn-primary btn-outline-secondary">进入购房首页界面</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb16.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">e选房用户登陆注册界面</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp" class="btn btn-sm btn-primary btn-outline-secondary">进入登陆注册界面</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb24.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">e选房用户购房界面</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp" class="btn btn-sm btn-primary btn-outline-secondary">进入用户界面</a>
								</div>
							</div>
						</div>
					</div>
				</div>
<%-- 				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb28.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp" class="btn btn-sm btn-primary btn-outline-secondary">进入管理界面</a>
								</div>
							</div>
						</div>
					</div>
				</div> --%>
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb45.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">e选房用户购房界面</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp" class="btn btn-sm btn-primary btn-outline-secondary">进入用户界面</a>
								</div>
							</div>
						</div>
					</div>
				</div>

<%-- 				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb44.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp" class="btn btn-sm btn-primary btn-outline-secondary">进入管理界面</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb47.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">This is a wider card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/userShow.jsp" class="btn btn-sm btn-primary btn-outline-secondary">进入管理界面</a>
								</div>
							</div>
						</div>
					</div>
				</div> --%>
				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/img/tb40.jpg"
							alt="Card image cap">
						<div class="card-body">
							<p class="card-text text-center">管理员账号注册登陆界面</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a href="${pageContext.request.contextPath}/mvc/sign.jsp" class="btn btn-sm btn-primary btn-outline-secondary">管理登陆注册界面</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer class="text-muted exf_foot_bg">
		<div class="container">
			<p class="float-right">
				<a class="btn btn-sm btn-primary text-muted" href="#">回顶部</a>
			</p>
			<p>e选房后台管理系统 版权所有</p>
			<p>
				私人企业股份有限公司<a class="text-muted" href="#"> 法律声明 </a> <a
					class="text-muted" href="#">网站支持</a>.
			</p>
		</div>
	</footer>
</body>
</html>
