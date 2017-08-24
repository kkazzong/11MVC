<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
						 .attr("action","/purchase/listPurchase")
						 .submit();
		}
	
		function fncUpdatePurchaseView(tranNo) {
			console.log("tranNo====>"+tranNo);
			console.log($("form[name='updateForm']").html());
			//form modal dialog
			var dialog = $("form[name='updateForm']").dialog({
				autoOpen : false,
				height : 500,
				width : 350,
				modal : true,
				buttons : {
					"수정하기" : function(){
						/* self.location="/purchase/updatePurchase" */
						$("form[name='updateForm']").attr("method","post").attr("action","/purchase/updatePurchase").submit();
					},
					cancel : function(){
						dialog.dialog("close");
					}
				},
				close : function(){
					//$("form[name='updateForm']").reset();
					dialog.dialog("close");
				},
				open : function(){
					console.log("opne!")
					
					$.ajax({
						
						url : "/purchase/json/getPurchase/"+tranNo,
						method : "get",
						dataType : "json",
						success : function(JSONData, status) {
							console.log(status);
							console.log(JSON.stringify(JSONData));
							
							var htmlStr = "<input type='hidden' name='tranNo' value='"+JSONData.tranNo+"'/>";
							$("form[name='updateForm']").append(htmlStr);
							$("#purchaseProd").html("<b>"+JSONData.purchaseProd.prodName)
							$("b").css("color","red")
							$("input:text[name='receiverName']").val(JSONData.receiverName);
							$("input:text[name='receiverPhone']").val(JSONData.receiverPhone);
							$("input:text[name='receiverAddr']").val(JSONData.receiverAddr);
							$("input:text[name='receiverRequest']").val(JSONData.receiverRequest);
							$("input:text[name='receiverDate']").val(JSONData.receiverDate);
							$("input:text[name='receiverDate']").datepicker().bind('change',function(){
								$(this).datepicker("option","dateFormat","yy-mm-dd").val();
							})
							
						}
						
					})
					
				}
			}); 
			dialog.dialog("open");
		}
		
		$(function(){
			
			$(".ct_list_pop:nth-child(4n+6)").css("background-color","#F7CAC9");
			
			console.log($($(".ct_list_pop td:nth-child(3)")[1]).html());
			$(".ct_list_pop td:nth-child(7)").css("color", "teal");
			
			$("form[name='updateForm']").hide()
			
			/* console.log($("form[name='updateForm']").html());
			//form modal dialog
			var dialog = $("form[name='updateForm']").dialog({
				autoOpen : false,
				height : 500,
				width : 350,
				modal : true,
				buttons : {
					"수정하기" : function(){
						dialog.dialog("submit");
					},
					cancel : function(){
						dialog.dialog("close");
					}
				},
				close : function(){
					$("form[name='updateForm']").reset();
				},
				open : function(){
					console.log("opne!")
					
					$.ajax({
						
						url : "/purchase/json/getPurchase/"+tranNo,
						method : "get",
						dataType : "json",
						success : function(JSONData, status) {
							alert(status);
							console.log(JSON.stringify(JSONData));
							//console.log($("form[name='det']"))
						}
						
					})
					
				}
			});  */
			
			/* $(".ct_list_pop td:nth-child(7)").bind('click', function(){
				
				console.log($(this).html());
				console.log("parent====>"+$(this).parent().index());
				console.log("sibling/tranNo====>"+$($($(this).siblings('td'))[2]).text().trim());
				//$(this).siblings('.tr_no').text().trim()
				self.location="/purchase/updatePurchaseView?tranNo="+$($($(this).siblings('td'))[2]).text().trim();
			}); */
			
			//배송중일때 상품 수정 불가
			//상품이름 클릭 수정
			$("span > button").bind('click', function(){
				console.log($(this).html());
				console.log("parent====>"+$(this).parent().index());
				console.log("sibling/tranNo====>"+$("input:hidden[name='tNo']",this).val());
				//$(this).siblings('.tr_no').text().trim()
				//self.location="/purchase/updatePurchaseView?tranNo="+$("input:hidden[name='tNo']",this).val();
				fncUpdatePurchaseView($(this).val());
				//dialog.dialog("open");
			});
			
			console.log($("p").html)
			
			//물건도착
			$("p").css("color","magenta");
			
			
			$("p").bind('click', function(){
				
				console.log($(this).html());
				
				console.log($("input:hidden[name='tNo']",this).val());
				
				if($(this).text().trim() != 'review') {
		 			var result = confirm("물건이 도착했습니까?");
					
					if(result) {
						//self.location="/purchase/updateTranCode?tranNo="+$("input:hidden[name='tNo']",this).val()+"&tranCode=3";
						
						$.ajax({
							
							url : "/purchase/json/updateTranCode/"+$("input:hidden[name='tNo']",this).val()+"/3",
							method : "get",
							dataType : "json",
							success : function(JSONData, status){
								console.log(status);
								console.log(JSON.stringify(JSONData));
								console.log($("#"+JSONData.tranNo).next().html().trim());
								
								$("#"+JSONData.tranNo).next().remove();
								$("#"+JSONData.tranNo).html("<a>review</a>");
							}
							
						})
						
					} else {
						return;
					}
				}
				
				$("a").bind("click", function(){
					console.log($(this).html())
					self.location = "/purchase/reviewProduct.html";
				})
				
			});
			
		});
	</script>

	<style type="text/css">
		label, input { display:block; } 
	    input.text { margin-bottom:12px; width:90%; padding: .4em; }
	    fieldset { padding:0; border:0; margin:auto;}
	    /* div{
			border : 3px solid #D6CDB7;
			margin0top : 10px;
		} */
		.img-thumbnail{
			width : 80px;
        	height : 80px;
		}
		body {
            padding-top : 70px;
        }
        td > small{font-size:65%}
        .dropdown:hover .dropdown-menu {
        	display : block;
        }
	</style>
	
	
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp"/>
	
	<!-- 수정 dialog form -->
	<div class="ui-widget">
	<form name="updateForm" title="상품수정">
		<fieldset>
			<label for="상품명">상품명</label>
			<span id="purchaseProd"></span>
			<label for="이름">이름</label>
			<input type="text" name="receiverName" class="text ui-widget-content ui-corner-all">
			<label for="연락처">연락처</label>
			<input type="text" name="receiverPhone" class="text ui-widget-content ui-corner-all">
			<label for="주소">주소</label>
			<input type="text" name="receiverAddr" class="text ui-widget-content ui-corner-all">
			<label for="요청사항">요청사항</label>
			<input type="text" name="receiverRequest" class="text ui-widget-content ui-corner-all">
			<label for="배송희망날짜">배송희망날짜</label>
			<input type="text" name="receiverDate" class="text ui-widget-content ui-corner-all">
			
			<input type="submit" value="수정하기" style="position:absolute; top:-1000px">
		</fieldset>
	</form>
	</div>
	
	<div class="container">
		
		<div class="page-header bg-danger">
			<h3 class="text-info">구매목록</h3>
			<small class="text-muted">구매한 상품</small>
		</div>
		
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-md-offset-2">
	          <table class="table table-bordered table-condensed text-center">
	            <thead>
	            	<tr class="danger">
		                <th>No / 주문날짜</th>
		                <th>상품명 / 구매정보</th>
		                <th>총 금액</th>
		                <th>배송정보</th>
		                <th>정보</th>
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
			                		<button type="button" class="btn btn-xs btn-link" value="${purchase.tranNo}">${purchase.purchaseProd.prodName}<br>
			                		<small class="text-muted primary">주문번호 | ${purchase.tranNo}</small></button>
			                	</span>
			                </td>
			                <td rowspan="2">${purchase.purchaseProd.price}원</td>
			                <td rowspan="2">
			                	<c:choose>
									<c:when test="${purchase.tranCode == 1}">
										구매완료
									</c:when>
									<c:when test="${purchase.tranCode == 2 }">
										배송중
									</c:when>
									<c:when test="${purchase.tranCode == 3 }">
										배송완료
									</c:when>
								</c:choose>
			                </td>
			                <td rowspan="2">
			                	<p id="${purchase.tranNo}">
								<c:if test="${purchase.tranCode == 2 }">
									<p><input type="hidden" name="tNo" value="${purchase.tranNo}">물건도착
								</c:if>
								<c:if test="${purchase.tranCode < 2}">
									대기
								</c:if>
								<c:if test="${purchase.tranCode > 2}">
									<a>review</a>
								</c:if>
			                </td>
	              		</tr>
	              		<tr>
	              			<td><small class="text-muted">주문날짜 : ${purchase.orderDate}</small></td>
	              		</tr>
	            </c:forEach>
	            </tbody>
	          </table>
        	</div>
		</div>
	</div>


<%-- <div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="50">NO</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">주문번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문날짜</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">주문상품</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">주문금액</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="20" bgcolor="F7CAC9" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list}">
	<c:set var="i" value="${i+1}"/>
	<tr class="ct_list_pop">
		<td align="center">
			${i}
		</td>
		<td></td>
		<td align="center">
			<a href="/getPurchase.do?tranNo=${purchase.tranNo}">${i}</a>
			${purchase.tranNo}
		</td>
		<td></td>
		<td align="center">
			<a href="/getUser.do?userId=${purchase.buyer.userId}">${purchase.buyer.userId }</a>
			${purchase.orderDate}
		</td>
		<td></td>
		<td align="left">${purchase.buyer.userName }</td>
		<td align="center">
			<c:choose>
				<c:when test="${purchase.tranCode == 1}">
					<span>
					<input type="hidden" name="tNo" value="${purchase.tranNo }">
					${purchase.purchaseProd.prodName}
					</span>
				</c:when>
				<c:otherwise>
					${purchase.purchaseProd.prodName}
				</c:otherwise>
			</c:choose>
		</td>
		<td></td>
		<td align="center">
			${purchase.purchaseProd.price}원
		</td>
		<td></td>
		<td align="center">
			<c:choose>
				<c:when test="${purchase.tranCode == 1}">
					구매완료
				</c:when>
				<c:when test="${purchase.tranCode == 2 }">
					배송중
				</c:when>
				<c:when test="${purchase.tranCode == 3 }">
					배송완료
				</c:when>
			</c:choose>
		</td>
		<td></td>
		<td align="center">
		<p id="${purchase.tranNo}">
			<c:if test="${purchase.tranCode == 2 }">
				<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">물건도착</a>
				<p><input type="hidden" name="tNo" value="${purchase.tranNo}">물건도착
			</c:if>
			<c:if test="${purchase.tranCode < 2}">
				대기
			</c:if>
			<c:if test="${purchase.tranCode > 2}">
				<a>review</a>
			</c:if>
		</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="20" bgcolor="F7CAC9" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<c:import var="importPage" url="/common/pageNavigator.jsp"/>
		${importPage}
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 --> 
</form>

</div>
--%>
</body>
</html>