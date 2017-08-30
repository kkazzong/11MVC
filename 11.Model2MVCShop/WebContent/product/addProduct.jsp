<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- product data 확인 include --%>
<%-- <%@ include file="/data/data.jsp"%> --%>
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
 	
 	<!-- masonry -->
 	<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

	<script type="text/javascript">
	
		$(function(){
			
			$(".btn:contains('확인')").bind('click', function(){
				console.log($(this).html());
				$(this).attr("href", "/product/listProduct?menu=manage");
			});
			
			$(".btn:contains('추가등록')").bind('click', function(){
				console.log($(this).html());
				$(this).attr("href", "../product/addProductView.jsp");
			})
			
		});
		
		//masonry
		$(function(){
			
			$(".grid").masonry({
				
				itemSelector : ".grid-item",
				columWidth : 200
				
			});
			
		});
		
		
	</script>
	
	<style>
        body {
            padding-top : 70px;
        }
        /* div{
			border : 3px solid #D6CDB7;
			margin0top : 10px;
		} */
		.dropdown:hover .dropdown-menu {
        	display : block;
        }
        
   	</style>
	
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- navbar -->
	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp" />
	
	<div class="container">
	
		<div class="page-header text-center">
			<h3 class="text-info">상 품 등 록</h3>
			<small class="text-muted">입력한 상품 정보를 확인하세요.</small>
		</div>
	
		<div class="row">
	  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}원</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>수량</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodStock}개</div>
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
			<div class="col-md-offset-2 col-xs-4 col-md-4"><strong>상품이미지</strong></div>
		</div>
		<div class="row">
			<div class="col-md-offset-4 col-xs-2 col-md-4 col-md-4 grid">
			<c:forEach var="fileName" items="${product.fileName}">
			  <div class="grid-item thumbnail"><img src="../images/uploadFiles/${fileName}"></div>
			</c:forEach>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a href="# "class="btn btn-primary">확인</a>
					<a href="#" class="btn btn-default">추가등록</a>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>
