<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	
	<!-- Bootstrap Dropdown Hover CSS -->
  	<link href="/css/animate.min.css" rel="stylesheet">
  	<!-- <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
	<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
	<link href="/css/dropdown-tube.css" rel="stylesheet">   
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
		
		function updateTranCode(elem) {
				
				$.ajax({
					url : "/purchase/json/updateTranCode/"+$(elem).val()+"/2",
					method : "get",
					dataType : "json",
					success : function(JSONData, status){
						console.log(status);
						console.log(JSON.stringify(JSONData));
						$("#"+JSONData.tranNo).text("배송중");
					}
				})
		}
		
		$(function(){

			$(".btn:contains('배송하기')").bind('click', function(elem,event){
				var result = confirm("물건을 배송하시겠습니까?");
				if(result) {
					updateTranCode($(this));
					event.preventDefault();
				} else {
					return;
				}
		});
			
			$(".ct_btn01:contains('검색')").bind('click', function(){
				fncGetList(1);
			});
			
		});
		
		var count = 1;
		
		//무한스크롤
		$(window).bind("scroll",function(event){
				console.log("scrolling....");
				console.log("doc > "+$(document).height());
				console.log("win > "+$(window).height());
				console.log("cur > "+$(window).scrollTop()); 
				
				if($(window).scrollTop() >= $(document).height() - $(window).height() -1){
					
					if(count < ${resultPage.endUnitPage}) {
						event.preventDefault();
						console.log(count);
						console.log("끝");
						count++;
						console.log($(this).html());
						getPurchaseList(count);
						event.preventDefault();
						
					} else if(count >= ${resultPage.endUnitPage}) {
						event.preventDefault();
						console.log("마지막입니다");
					}
				}
		});
		
		//무한스크롤
		function getPurchaseList(count) {
		
			$.ajax({
				
				url : "/purchase/json/listSale",
				method : "post",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					currentPage : count,
					sortCondition : $("select option:selected").val()
				}),
				dataType : "json",
				success : function(JSONData, status){
					
					console.log(status);
					console.log(JSON.stringify(JSONData));

					var htmlStr ="<div class='container'><div class='row'>"
					htmlStr += "<div class='col-md-offset-2 col-md-8 col-md-offset-2'><form><table class='table table-bordered table-condensed text-center'>";
					htmlStr += "<thead><tr><td>No / 주문번호</td><td>상품명</td><td>구매정보</td><td>총 금액</td><td>현재상태</td></tr></thead><tr class='ct_list_pop'>";
					for(var i = 0; i < JSONData.length; i++) {
						
						$("#scrollProd").removeClass();
						$("#scrollProd").addClass("row");
						
						var tranNo = JSONData[i].tranNo;
						var tranCode = JSONData[i].tranCode;
						var orderDate = JSONData[i].orderDate;
						var prodNo = JSONData[i].purchaseProd.prodNo;
						var prodName = JSONData[i].purchaseProd.prodName;
						var user = JSONData[i].buyer.userId;
						var price = JSONData[i].purchaseProd.price;
						var fileName = JSONData[i].purchaseProd.fileName[0];
						
						console.log(fileName);
						
						htmlStr += "<td>"+(9 * (count - 1) + (i))+"</td>";
						htmlStr += "<td rowspan='2'><img class='img-thumbnail' src='../images/uploadFiles/"+fileName+"'>";
	                	htmlStr += "<span>";
						htmlStr += '<button type="button" class="btn btn-xs disabled" value="'+tranNo+'">'+prodName+'</button>';
						htmlStr += "</span></td>";				
						htmlStr += '<td rowspan="2">구매자 : '+user+'<br> 구매일 : '+orderDate+'</td>';
						htmlStr += '<td rowspan="2">'+price+'원</td><td rowspan="2">';
					  	htmlStr += "<p id="+tranNo+">";
					  	
						if(tranCode == '1') {
							htmlStr += '구매완료<br>';
							htmlStr += ' <button type="button" class="btn btn-xs btn-primary" value="'+tranNo+'">배송하기</button>';
						} else if (tranCode == 2) {
							htmlStr += "배송중";
						} else {
							htmlStr += "배송완료";
						}
						htmlStr += '</p></td></tr><tr><td><small class="text-muted">주문번호 : '+tranNo+'</small></td></tr>';
					}
					htmlStr += "</table></form></div></div></div>";
						
					$("#scrollProd").append(htmlStr);
					
					$(".btn:contains('배송하기')").bind('click', function(){
						var result = confirm("물건을 배송하시겠습니까?");
						if(result) {
							updateTranCode($(this));
						} else {
							return;
						}
					});
						
				}
				
			});
		}
		
		$(function(){
			
			$("select[name='searchCondition']").bind("change", function(){
				console.log("change==>"+$("option").val());
				if($("select option:selected").val() == 3) {
					$("input:text[name='searchKeyword']").attr("placeholder", "회원아이디 입력");
				} else if($("select option:selected").val() == 1) {
					$("input:text[name='searchKeyword']").attr("placeholder", "상품명 입력");
				}
				
			})
			
		})
		
		//검색
		$(function(){
			$(".btn:contains('검색')").bind('click', function(){
				$("form[name='detailForm']").attr("action","/purchase/listSale").attr("method","post").submit();
			})
		})
		
		//필터
		$(function(){
			$("select[name='sortCondition']").bind("change",function(){
				$("form[name='sortForm']").attr("action","/purchase/listSale").attr("method","post").submit();				
			})
		})
		
		$(function(){
			//<!-- autocomplete -->
			$("input:text[name='searchKeyword']").autocomplete({
				source: function( request, response ) {
			        $.ajax( {
			          url: "/product/json/listProductAuto",
			          method : "post",
			          headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
			          dataType: "json",
			          data: JSON.stringify({
			            searchKeyword : $("input:text[name='searchKeyword']").val(),
			            searchCondition : $("select[name='searchCondition']").val(),
			            searchSoldProd : 1
			          }),
			          success: function( JSONData ) {
			        		  
			        	console.log("server data===>"+JSON.stringify(JSONData));
			        	console.log("prodName===>"+JSONData[0].prodName);
			        	
			            response($.map(JSONData, function(value, key){
			            	console.log(value);
			            	console.log("key(autocomplete : value)====>"+key);
			        		return {
			        			label : value.prodName,
			        			value : value.prodName //원래는 key,, 선택시를 위해
			        		}
			        	}));
			          }
			        } );
			    }
			});
		})
		
	</script>
	<style type="text/css">
		body {
            padding-top : 70px;
        }
   		/* div{
			border : 3px solid #D6CDB7;
			margin0top : 10px;
		} */
		.img-thumbnail{
			height : 80px;
			width:80px;
		}
		/* .dropdown:hover .dropdown-menu {
        	display : block;
        } */
        thead {
        	background-color : #70cbce;
        }
        table {
        	margin-top : 20px;
        }
	</style>
</head>

<body bgcolor="#ffffff" text="#000000">

	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp"/>
	
	<div class="container">
		<div class="page-header text-center">
			<h3 class="text-info">배송목록</h3>
			<small class="text-muted">배송하기 전 확인해주세요</small>
		</div>
		<div class="row">
			<form class="form-inline" name="sortForm">
					<!-- 필터 -->
					<div class="form-group col-md-offset-1 col-md-1">
							<select name="sortCondition" class="form-control input-sm">
								<option value="">필터</option>
								<optgroup label="상품명정렬">
									<option value="0" ${!empty search.sortCondition && search.sortCondition == '0' ? "selected" : ""}>ㄱ~ㅎ</option>
									<option value="1" ${!empty search.sortCondition && search.sortCondition == '1' ? "selected" : ""}>ㅎ~ㄱ</option>
								</optgroup>
								<optgroup label="판매날짜정렬">
									<option value="2" ${!empty search.sortCondition && search.sortCondition == '2' ? "selected" : ""}>최근순</option>
									<option value="3" ${!empty search.sortCondition && search.sortCondition == '3' ? "selected" : ""}>오래된순</option>
								</optgroup>
							</select>
					  </div>
				</form>
				<form class="form-inline" name="detailForm">
					<div class="form-group col-md-offset-6 col-md-4">
							<select name="searchCondition" class="form-control input-sm">
								<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>상품명</option>
							</select>
							<input type="hidden" id="currentPage" name="currentPage" value="1"/>
							<input type="text" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}"  class="form-control input-sm" placeholder="상품명 입력" autocomplete="on">
							<button class="btn btn-default btn-sm">검색</button>
					  </div>
			</form>
		</div>
	</div>
	
	<div class="container">	
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-md-offset-2">
			<form>
	          <table class="table table-bordered table-condensed text-center">
	            <thead>
	            	<tr>
		                <td>No / 주문번호</td>
		                <td>상품명</td>
		                <td>구매정보</td>
		                <td>총 금액</td>
		                <td>현재상태</td>
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
			                		<button type="button" class="btn btn-xs disabled">${purchase.purchaseProd.prodName}</button>
			                	</span>
			                </td>
			                <td rowspan="2">구매자 : ${purchase.buyer.userId} <br> 구매일 : ${purchase.orderDate} </td>
			                <td rowspan="2">${purchase.purchaseProd.price}원</td>
			                <td rowspan="2">
			                <p id="${purchase.tranNo}">
			                	<c:choose>
									<c:when test="${purchase.tranCode == 1}">
										구매완료<br> <button type="button" class="btn btn-xs btn-primary" value="${purchase.tranNo}">배송하기</button>
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
	          </form>
        	</div>
		</div>
	</div>
	<div id="scrollProd"></div>
	
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