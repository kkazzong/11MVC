<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- Bootstrap Dropdown Hover CSS -->
  	<link href="/css/animate.min.css" rel="stylesheet">
  	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	
	<script type="text/javascript">	
		$(function(){
			
			
			//$('form').attr("method","post")
			$(".btn:contains('확인')").bind('click', function(){
				console.log($(this).html());
				self.location = "/product/listProduct?menu=manage";
			});
			
			$(".btn:contains('이전')").bind('click', function(){
				console.log($(this).html());
				window.history.back();
			});
			
			$(".btn:contains('구매')").bind('click', function(){
				console.log($(this).html());
				self.location = "/purchase/addPurchase?prodNo=${product.prodNo}";
			});
			
		});
		
		//상품평 popover
		$(function(){
			
			
			
			/* $('[data-toggle="popover"]').popover({
				html : true,
				trigger : "hover",
				placement : "auto right"
			}); */
			
		})
		
	</script>
	<style>
        body {
            padding-top : 70px;
        }
      /*   img {
        	margin-top : 30px;
        } */
        .dropdown:hover .dropdown-menu {
        	display : block;
        }
   	</style>

<script type="text/javascript">

</script>
</head>

<body bgcolor="#ffffff" text="#000000">



	<!-- navbar -->
	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp"/>
	
	<div class="container">
	
		<div class="page-header text-center">
			<h3 class="text-info">상품보기</h3>
		</div>
	
		<div class="row">
	  		<div class="col-md-offset-4 col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-offset-4 col-xs-4 col-md-2"><strong>상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-offset-4 col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-offset-4 col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<%-- <div class="row">
	  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>상품이미지</strong></div>
	  		<div class="row">
	  		<c:forEach var="fileName" items="${product.fileName}">
	  		<div class="col-md-offset-4 col-xs-4 col-md-4 thumbnail">
				<img src = "../images/uploadFiles/${fileName}" width="300" height="300"/>
				<img alt="${flieName}" src="http://placehold.it/100x100">
			</div>
			</c:forEach>
			</div>
		</div> --%>
		
		<div class="row">
			<div class="col-md-offset-4 col-xs-4 col-md-4">
			<c:forEach var="fileName" items="${product.fileName}">
			  <div class="thumbnail"><img src="../images/uploadFiles/${fileName}"></div>
			</c:forEach>
			</div>
		</div>
		
		
		
		<%-- <div class="row">
			<div class="col-sm-offset-4  col-sm-2">
				<c:forEach var="review" items="${reviewList}">
					<mark>${review.reviewUser.userId}</mark> : ${review.reviews}<br>
				</c:forEach>
			</div>
			<div>
			</div>
		</div> --%>
		
		<div class="row">
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<c:if test="${empty product.proTranCode}">
					<a href="# "class="btn btn-primary">구매</a>
					</c:if>
						<a href="#" class="btn btn-default">이전</a>
					<%-- <c:if test="${param.menu == 'manage'}">
						<a href="#" class="btn btn-default">확인</a>
					</c:if> --%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
