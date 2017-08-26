<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%-- <%@ include file="/data/data.jsp"%> --%>
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
			
			$(".btn:contains('수정')").bind('click', function(){
				console.log($(this).html());
				self.location = "/review/updateReview?reviewNo=${review.reviewNo}";
			});
			
			$(".btn:contains('확인')").bind('click', function(){
				console.log($(this).html());
				self.location = "/purchase/listPurchase";
			});
			
		});
		
	</script>
	<style>
        body {
            padding-top : 70px;
        }
        .img-thumbnail{
        	width : 80px;
        	height : 80px;
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

	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
	
		<div class="page-header bg-danger">
			<h3 class="text-info">상품평</h3>
			<small class="text-muted">입력한 구매 정보를 확인하세요.</small>
		</div>
		
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
			<table class="table">
			 	<thead>
			 		<tr class="bg-danger">
			 			<th>상품정보</th>
			 			<th></th>
			 			<th>가격</th>
			 		</tr>
			 	</thead>
			 	<tr>
			 		<td>
			 			<img class="img-thumbnail" src="../images/uploadFiles/${product.fileName[0]}"/>
			 		</td>
			 		<td>
			 			<p><strong class="primary">${review.reviewProd.prodName}</strong></p>
			 			<p><small class="text-muted">${review.reviewProd.prodDetail}</small></p>
			 			<p><small class="text-muted"><code>제조일</code> : ${review.reviewProd.manuDate}</small></p>
			 		</td>
			 		<td>
			 			${review.reviewProd.price}원
			 		</td>
			 	</tr>
			</table>
		</div>
		
		<div class="row">
			<div class="col-md-offset-5 col-md-2">
				등록자
			</div>
			<div class="col-md-offset-1 col-md-5">
				${review.reviewUser.userId}
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-offset-5 col-md-2">
				상품평
			</div>
			<div class="col-md-offset-1 col-md-5">
				${review.reviews}
			</div>
		</div>
		
		<div class="row">
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a href="# "class="btn btn-danger">수정</a>
					<a href="# "class="btn btn-default">확인</a>
				</div>
			</div>
		</div>
		</div>
	</div>
	
<%-- <div style="width: 98%; margin-left: 10px;">

<form name="updatePurchaseForm" action="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 정보 확인</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="70%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;" align="center">
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="200">
			상품이름
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.purchaseProd.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="200">
			구매자아이디
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			결제방법
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">
		<c:if test="${purchase.paymentOption == 1}">
			현금결제
		</c:if>
		<c:if test="${purchase.paymentOption == 2}">
			카드결제
		</c:if>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			구매자이름
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			구매자연락처 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverPhone}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			구매자주소
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverAddr }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			구매자요청사항
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverRequest }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
		배송희망일자
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverDate }</td>
		<td></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
</table>	

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:fncUpdatePurchase();">구매정보수정</a> -->
						구매정보수정
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="/purchase/listPurchase">확인</a> -->
						확인
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						상품리스트
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



</form>
</div> --%>
</body>
</html>