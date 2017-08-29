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
		
	</script>
	<style>
        body {
            padding-top : 70px;
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
			<div class="col-md-offset-2 col-md-4"><strong>상품이미지</strong></div>
		</div>
		<div class="row">
			<div class="col-md-offset-4 col-xs-4 col-md-4">
			<c:forEach var="fileName" items="${product.fileName}">
			  <div class="thumbnail"><img src="../images/uploadFiles/${fileName}"></div>
			</c:forEach>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-8 col-md-4"><button class="btn btn-primary btn-xs" >상품평보기</button></div>
			<c:forEach var="review" items="${reviewList}">
				${review.reviewUser.userId} -- ${review.reviews}<br>
			</c:forEach>
		</div>
		
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
<%-- <form name="detailForm">

<input type="hidden" name="prodNo" value="${product.prodNo }"/> 
<input type="hidden" name="prodNo" value="<%= product.getProdNo() %>"/>

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품상세조회</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105"><%= product.getProdNo() %></td>
					<td width="105">${product.prodNo}</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%= product.getProdName() %></td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품이미지 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<img src = "<%= product.getFileName() %>"/>
			<c:forEach var="fileName" items="${product.fileName}">
				<img src = "../images/uploadFiles/${fileName}" width="300" height="300"/>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%= product.getProdDetail() %></td>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">제조일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%= product.getManuDate() %></td>
		<td class="ct_write01">${product.manuDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">가격</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%= product.getPrice() %></td>
		<td class="ct_write01">${product.price}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">등록일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01"><%= product.getRegDate() %></td>
		<td class="ct_write01">${product.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
						<a href="/addPurchaseView.do?prodNo=${product.prodNo}">구매</a>
						<a href="/purchase/addPurchase?prodNo=${product.prodNo}">구매</a>
						구매
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif"width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<c:if test="${param.menu == 'manage'}">
					<c:if test="${menu == 'manage'}">
						<!-- <a href="/listProduct.do?menu=manage">확인</a> -->
						<!-- <a href="/product/listProduct?menu=manage">확인</a> -->
						확인
					</c:if>
					<c:if test="${param.menu == 'search'}">	
					<c:if test="${menu == 'search'}">	
						<!-- <a href="javascript:history.go(-1)">이전</a> -->
						이전
					</c:if>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form> --%>

</body>
</html>
