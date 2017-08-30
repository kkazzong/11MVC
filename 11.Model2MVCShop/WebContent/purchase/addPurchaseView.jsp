<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>  
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- <meta charset="EUC-KR"> -->
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
		
		function fncAddPurchase() {
			
			var payment = $("option:selected").val();
			var name = $($("input:text[name='receiverName']")).val();
			var phone = $($("input:text[name='receiverPhone']")).val();
			var addr = $($("input:text[name='receiverAddr']")).val();
			
			console.log(payment+":"+name+":"+phone+":"+addr);
			
			if(payment == null) {
				alert("구매 수단을 선택해 주세요");
				return;
			}
			if(name == null || name.length < 1) {
				alert("받는 사람 이름을 입력해주세요");
				return;
			}
			if(phone == null || phone.length < 1) {
				alert("연락처는 꼭 입력하셔야 합니다");
				return;
			}
			if(addr == null || addr.length < 1) {
				alert("배송지를 입력해주세요");
				return;
			}
			
			var result = confirm("구매하시겠습니까?");
			if(result) {
				$('form').attr("method","post")
							 .attr("action","/purchase/addPurchase")
							 .submit();
			} else {
				return;
			}
			
		}
		
		$(function(){
			
			//<!-- datepicker -->
			$("input:text[name='receiverDate']").datepicker().bind('change', function(){
				$(this).val($(this).datepicker("option","dateFormat","yy-mm-dd").val());
			});
			
			$(".btn:contains('구매')").bind('click', function(){
				fncAddPurchase();
			});
			
			$(".btn:contains('취소')").bind('click', function(){
				
				console.log($(this).html());
				
				var result = confirm("구매를 취소하시겠습니까?");
				
				if(result) {
					window.history.back();
				} else {
					return;
				}
			});
			
			$(".btn:contains('내 정보 불러오기')").bind('click', function(){
				
				console.log($(this).html());
				console.log("receiverName : "+$("input:text[name='receiverName']").val());
				
				$("input:text[name='receiverName']").val("${user.userName}");
				$("input:text[name='receiverPhone']").val("${user.phone}");
				if($("input:text[name='receiverAddr']").val() == '') {
					$("input:text[name='receiverAddr']").val("${user.addr}");
				}
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
		.btn .btn-xs{
			background : #000;
			border : 1px solid #000;
		}
		/* .table tr:nth-child(1){
			background-color : #70cbce;
		} */
		form {
			padding-top : 20px;
		}
   	</style>
</head>

<body>

	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp"/>
	
	<div class="container">
		
		<div class="page-header">
			<h3 class="text-info text-center">상품구매</h3>
		</div>
		
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
			<table class="table">
			 		<tr>
			 			<td>상품정보</td>
			 			<td></td>
			 			<td>가격</td>
			 		</tr>
			 	<tr>
			 		<td>
			 			<img class="img-thumbnail" src="../images/uploadFiles/${product.fileName[0]}"/>
			 		</td>
			 		<td>
			 			<p><strong class="primary">${product.prodName}</strong></p>
			 			<p><small class="text-muted">${product.prodDetail}</small></p>
			 			<p><small class="text-muted"><code>제조일</code> : ${product.manuDate}</small></p>
			 		</td>
			 		<td>
			 			${product.price}원
			 		</td>
			 	</tr>
			</table>
			</div>
		</div>
				
		<div class="row">
			<div class="col-md-offset-5 col-sm-4 col-md-2">
				<button class="btn btn-default">내 정보 불러오기</button>
			</div>
		</div>
		
		
		<form class="form-horizontal" name="detailForm" id="detailForm" enctype="multipart/form-data">
			<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" />
			<input type="hidden" name="purchaseProd.prodStock" value="${product.prodStock}" />
			<input type="hidden" name="buyer.userId" value="${user.userId }" />
			
			<div class="form-group">
				<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">받는 분</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control input-sm" id="receiverName" name="receiverName" placeholder="이름을 입력해주세요"/>
			    </div>
			</div>
			
			
			<!-- <div class="form-group has-warning">
				  <input type="hidden" name="currentPage" value=""/>				
				  <input type="hidden" name="countPerPage" value="8"/>		
				  <input type="hidden" name="resultType" value="json"/> 			
				  <input type="hidden" name="confmKey" value="U01TX0FVVEgyMDE3MDgyNjE0MDUzNzI0MzI0"/>	
				  <label for="keyword" class="col-sm-offset-1 col-sm-3 control-label">배송지</label>
				  <div class="col-sm-4">
				  <input class="form-control input-sm" type="text" id="keyword" name="keyword" value="" placeholder="주소를 입력하세요"/>
				  <input type="button" class="btn btn-default btn-xs" onclick="getAddr(1)" value="주소검색"/>
				  <span id="helpBlock" class="help-block">
			    		주소입력 후 주소 검색 버튼을 눌러주세요
			    </span>
				  </div>
				  <div id="list"></div>
			</div>
			
			<div class="form-group">
					<label for="postNum" class="sr-only col-sm-offset-1 col-sm-3 control-label">배송지</label>
					<div class="col-sm-4">
					<input type="text" id="postNum" name="postNum" class="form-control input-sm" width="100px" placeholder="우편번호" readonly/>
					</div>
			</div> 
			
			<div class="form-group">
				<label for="doroAddr" class="sr-only col-sm-offset-1 col-sm-3 control-label">배송지</label>
				<div class="col-sm-4">
					<input type="text" id="doroAddr" name="receiverAddr" class="form-control input-sm" placeholder="배송지 주소" readonly/>
				</div>
			</div>  -->
			 <jsp:include page="/data/addr.jsp"/>
			
			
			<div class="form-group">
				<label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">전화번호</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control input-sm" id="receiverPhone" name="receiverPhone" placeholder="'-'를 제외한 전화번호 13자리"/>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="receiverRequest" class="col-sm-offset-1 col-sm-3 control-label">배송 요청사항</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control input-sm" id="receiverRequest" name="receiverRequest" placeholder="배송 요청 사항 입력해주세요"/>
			    	<span id="helpBlock" class="help-block">
			    		부재시 연락 가능한 연락처를 남겨주세요.
			    	</span>
			    </div>
			</div>
			
			<div class="form-group">
			<label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">구매수량</label>
			<div class="col-sm-4">
			    <select name="stock.stocks" class="form-control">
			    	<c:forEach begin="1" end="${product.prodStock}" var="i"  step="1">
				    	<option value="${i}">${i}</option>
			    	</c:forEach>
			    </select>
			</div>
			</div>
			
			<div class="form-group">
			<label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">배송 희망 날짜</label>
			<div class="col-sm-4">
			    <input	type="text" class="form-control input-sm" id="receiverDate" name="receiverDate"/>
			</div>
			</div>
			
			<div class="form-group">
			<label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">결제 수단</label>
			<div class="col-sm-4">
			    <select name="paymentOption" class="form-control">
			    	<option value="1">신용카드</option>
			    	<option value="2">현금</option>
			    </select>
			</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">구매</button>
					<button type="button" class="btn btn-default">취소</button>
			    </div>
			</div>
			
		</form>
	</div>

</body>
</html>