<%@ page contentType="text/html; charset=euc-kr" %>
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
		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$('form').attr("method","post")
						 .attr("action","/purchase/listSale?menu=${param.menu}")
						 .submit();
		}
		
		$(function(){
			
			$(".ct_list_pop td:nth-child(5)").css("color","magenta");
			
			$("p > span").css("color","magenta");
			
			$(".btn:contains('배송하기')").bind('click', function(elem){
				
				//console.log($(this).html());
				
				//console.log($("input:hidden[name='pNo']", this).val());
				var result = confirm("물건을 배송하시겠습니까?");
				
				if(result) {
					//self.location = "/purchase/updateTranCodeByProd?prodNo="+$("input:hidden[name='pNo']", this).val()+"&tranCode=2";
					
					$.ajax({
						url : "/purchase/json/updateTranCode/"+$(this).val()+"/2",
						method : "get",
						dataType : "json",
						success : function(JSONData, status){
							console.log(status);
							console.log(JSON.stringify(JSONData));
							$("#"+JSONData.tranNo).text("배송중");
						}
					})
					
				} else {
					return;
				}
			});
			
			$(".ct_btn01:contains('검색')").bind('click', function(){
				fncGetList(1);
			});
			
		});
	</script>
	<style type="text/css">
		body {
            padding-top : 70px;
        }
   		div{
			border : 3px solid #D6CDB7;
			margin0top : 10px;
		}
		.img-thumbnail{
			height : 100px;
			width:100px;
		}
		.dropdown:hover .dropdown-menu {
        	display : block;
        }
	</style>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
		
		<div class="page-header bg-danger">
			<h3 class="text-info">배송목록</h3>
			<small class="text-muted">배송하기 전 확인해주세요</small>
		</div>
		
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-md-offset-2">
	          <table class="table table-bordered table-condensed text-center">
	            <thead>
	            	<tr class="danger">
		                <th>No / 주문번호</th>
		                <th>상품명</th>
		                <th>구매정보</th>
		                <th>총 금액</th>
		                <th>현재상태</th>
	             	</tr>
	            </thead>
	            <tbody>
	            <c:forEach var="purchase" items="${list}">
	            	<c:set var="i" value="${i+1}"/>
		              	<tr class="ct_list_pop">
			                <td>${i}</td>
			                <td rowspan="2">
			                	<img class="img-thumbnail" src="../images/uploadFiles/${purchase.purchaseProd.fileName[0]}">
			                	<span>
			                		${purchase.purchaseProd.prodName}<br>
			                	</span>
			                </td>
			                <td rowspan="2">구매자 : ${purchase.buyer.userId} </td>
			                <td rowspan="2">${purchase.purchaseProd.price}원</td>
			                <td rowspan="2">
			                <p id="${purchase.tranNo}">
			                	<c:choose>
									<c:when test="${purchase.tranCode == 1}">
										구매완료<br> <button class="btn btn-xs btn-danger" value="${purchase.tranNo}">배송하기</button>
									</c:when>
									<c:when test="${purchase.tranCode == 2 }">
										배송중
									</c:when>
									<c:when test="${purchase.tranCode == 3 }">
										배송완료
									</c:when>
								</c:choose>
			                </p>
			                </td>
	              		</tr>
	              		<tr>
	              			<td><small class="text-muted">주문번호 : ${purchase.tranNo}</small></td>
	              		</tr>
	            </c:forEach>
	            </tbody>
	          </table>
        	</div>
		</div>
	</div>
	
<%-- <div style="width:98%; margin-left:10px;">

<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">배송 관리</td>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""} >상품번호</option>
					<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>상품명</option>
					<option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>상품가격</option>
				</select>
			<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- <a href="javascript:fncGetList('1');">검색</a> -->
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">NO</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">주문번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
	<tr class="ct_list_pop">
		<c:set var="i" value="${i+1}"/>
		<td align="center">${i}</td>
		<td></td>
		<td align="center">
			${purchase.tranNo}
		</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.prodName}</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.price}</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.regDate}</td>
		<td></td>
		<td align="left">
		<p>구매완료 <span><input type="hidden" name="pNo" value="${purchase.tranNo}">▶배송하기</span> </p>
		 <p id="${purchase.tranNo}">
		 <c:choose>
			<c:when test="${purchase.tranCode == 1}">
				구매완료 <span><input type="hidden" name="pNo" value="${purchase.tranNo}">▶배송하기</span> 
			</c:when>
			<c:when test="${purchase.tranCode == 2}">
				배송중
			</c:when>
			<c:when test="${purchase.tranCode == 3}">
				배송완료
			</c:when>
		</c:choose>
		</p>
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="F7CAC9" height="1"></td>
	</tr>	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<c:import var="importPage" url="/common/pageNavigator.jsp" />
		${ importPage }
		</td>
	</tr>
</table>

</form>

</div>
 --%>
</body>
</html> 