<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<div class="container">
		<div class="row">
			<div class="col-xs-6">
				<!-- 화면 로고 -->
				<a class="logo" href="index.jsp"><img
					src="/images/tube.png" alt="Logo">&nbsp;&nbsp;TUBE SHOP</a>
			</div>
			<div class="col-xs-6 signin text-right navbar-nav">
				<a href="#invite" class="scroll">Location</a>&nbsp; &nbsp;
				<c:if test="${!empty user}">
					<a href="#">Log out</a>
				</c:if>
				<c:if test="${empty user}">
					<a href="#">Log in</a>
				</c:if>
			</div>
		</div>
	</div>
</header>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<meta property="og:title" content="">
<meta property="og:type" content="website">
<meta property="og:url" content="">
<meta property="og:site_name" content="">
<meta property="og:description" content="">

<!-- Styles -->
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/owl.carousel.css">
<link rel="stylesheet" href="/css/style.css">
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900|Montserrat:400,700'
	rel='stylesheet' type='text/css'>


<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<style>
header {
	background: url(/images/bg.PNG) no-repeat center center;
	width: 100%;
	height: 10vh;
	background-size: cover;
}
.logo > img {
		margin-top: 6px;
		width : 40px;
		heigth : 40px;
}
</style>