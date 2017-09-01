<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
  	<link href="/css/animate.min.css" rel="stylesheet">
  	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" /> 
	
	<!-- masonry cdn -->
	<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
	
	
	<script type="text/javascript">
	
		$(function () {
	        var $cont = $("#masonry_container").masonry({
	              itemSelector : ".item",
	              columnWidth : 110
	        }); 
	        
	        var $grid = $(".grid").masonry({
	              itemSelector : ".grid-item",
	              columnWidth : 110
	        }); 
	        
	        $grid.on("click", ".grid-item-content", function(event){
	        	console.log("click");
	        	
	        	$(event.currentTarget).parent(".grid-item").toggleClass("is-expanded");
	        	
	        	
	        	$grid.masonry();
	        	
	        })
	      
	    });

	</script>
	
	<style type="text/css">
		* { box-sizing: border-box; }

		body { font-family: sans-serif; }

		.grid {
		  max-width: 1200px;
		}

		.grid-item {
		  width: 210px;
		  height: 210px;
		  float: left;
		  padding : 10px 5px 10px 5px;
		  
		} 
	
		/* item is invisible, but used for layout */
		.grid-item,
		.grid-item-content {
		  width: 210px;
		  height: 210px;
		}
		
		/* grid-item-content is visible, and transitions size */
		.grid-item-content {
		  width: 210px;
		  height: 210px;
		  background: white;
		  border: 1px solid #70cbce;
		  /* border-color: hsla(0, 0%, 0%, 0.5); */
		  border-color : hsla(0, 8%, 40%, 0.5);
		  border-radius: 5px; 
		  -webkit-transition: width 0.4s, height 0.4s;
		   transition: width 0.4s, height 0.4s;
		}

		.grid-item:hover .grid-item-content {
		  border-color: #70cbce;
		  background: white;
		  cursor: pointer;
		}
		
		/* both item and item content change size */
		.grid-item.is-expanded,
		.grid-item.is-expanded .grid-item-content {
		  width: 310px;
		  height: 410px;
		   posotion : relative;
		}
		
		.grid-item.is-expanded {
		  z-index: 10;
		}
		
		.grid-item.is-expanded .grid-item-content {
		  background: #70cbce;
		}
		
		a > img {
			width: 200px;
	  		height: 160px;
	        /* border-radius : 10px; */
	        -webkit-transition: width 0.4s, height 0.4s;
		    transition: width 0.4s, height 0.4s;
	        padding : 3px;
	        padding-left : 10px;
		}
	    
   

		body{
            padding-top : 170px;
        }

		.container{
			padding: 10px 5px 10px 5px;
		}
		form{
			display : inline;
		}
    
/* 		div{
			border : 3px solid #D6CDB7;
			margin0top : 10px;
		} */
	</style>	
</head>
<body>
	
	<%-- <jsp:include page="/layout/toolbarTube.jsp"/> --%>
	
	<!-- <div class="container">
	
		<div class="page-header text-center">
			<h3 class="text-info">상품목록</h3>
			<small class="text-muted">판매 상품 리스트</small>
		</div>
	</div> -->
	
	<!-- <div class="container"> -->
		<%-- <div class="container">
			<div class="row">
					<form class="form-inline" name="detailForm">
						<!-- 판매상품 -->
						<div class="form-group  col-md-offset-1 col-md-1">
							<c:if test="${search.searchSoldProd == 1}">
								<p>뒤로</p>
							</c:if>
							<input type="hidden" id="searchSoldProd" name="searchSoldProd" value="${search.searchSoldProd}"/>
							<button class="btn btn-default btn-sm">품절상품</button>
						</div>
						<!-- 상품검색 -->
						<div class="form-group col-md-offset-1">
							<select name="searchCondition" class="form-control input-sm">
								<c:if test="${param.menu == 'manage'}">
								<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>상품번호</option>
								</c:if>
								<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>상품명</option>
								<option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>가격</option>
							</select>
							<input type="text" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}"  class="form-control input-sm" placeholder="검색어 입력">
							<button class="btn btn-default btn-sm">검색</button>
							<input type="hidden" id="currentPage" name="currentPage" value=""/>
					  </div>
					</form>
					<!-- 가격검색 -->
					<form class="form-inline" name="priceFrom">
						<input type="hidden" id="searchCondition" name="searchCondition" value="2">
						<div class="form-group md-offset">
							<input type="text" id="searchLowPrice" name="searchLowPrice" value="${search.searchLowPrice}"  class="form-control input-sm" placeholder="최소금액">원~
							<input type="text" id="searchHighPrice" name="searchHighPrice" value="${search.searchHighPrice}"  class="form-control input-sm" placeholder="최대금액">원
						</div>
						<div class="form-group">
							<button class="btn btn-default btn-sm">가격</button>
						</div>
					</form>
				</div>
		</div> --%>
	
	
		<div class="container">
			<div class="col-md-offset-1">
				<div class="grid">
					<c:if test="${!empty list}">
						<c:forEach var="product" items="${list}">
							<div class="grid-item">
								<div class="grid-item-content text-center">
									<a id="${product.prodNo}" href="#">
										<img alt="image" src="../images/uploadFiles/${product.fileName[0]}">
									</a>
									<p><small>${product.prodName}</small></p>
									<p class="text-primary"><small>${product.price}원</small></p>
									<p>
										<c:if test="${param.menu == 'search'}">
											 <c:if test="${empty product.proTranCode}">
												  <button class="btn btn-primary btn-sm" value="${product.prodNo}">상품보기</button>
												  <button class="btn btn-default btn-sm" value="${product.prodNo}">바로구매</button>
											  </c:if>
										</c:if>
										<c:if test="${param.menu == 'manage'}">
										  <button class="btn btn-sm" value="${product.prodNo}">상품수정</button>
										  <button class="btn btn-default btn-sm" value="${product.prodNo}">삭제하기</button>
										</c:if>
									</p>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
		        <!-- <div class="grid">
			        <div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
			  		<div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
			  		<div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
			  		<div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
		  		</div>
		  		<div class="grid">
			        <div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
			  		<div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
			  		<div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
			  		<div class="grid-item">
			    		<div class="grid-item-content"><img alt="a" src="/img/poster.png"></div>
			  		</div>
		  		</div> -->
			</div>
		</div>
	
</body>
</html>