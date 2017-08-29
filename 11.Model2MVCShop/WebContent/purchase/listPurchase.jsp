<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
		/* function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$('form').attr("method","post")
						 .attr("action","/purchase/listPurchase")
						 .submit();
		} */
	
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
			$("p").css("color","#70cbce");
			
			
			$("p").bind('click', function(){
				
				console.log($(this).html());
				
				console.log($("input:hidden[name='tNo']",this).val());
				
				if($(this).text().trim() != 'review') {
					
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
								$("#"+JSONData.tranNo).html("<button type='button' class='btn btn-link btn-xs' value='"+JSONData.purchaseProd.prodNo+"'>review</button>");
								
								$(".btn:contains('review')").bind("click", function(){
									reviewProduct($(this))
								})
								
							}
							
						})
						
					} else {
						return;
					}
				}
				
				
			});
			
		});
		
		$(function(){
				$(".btn:contains('review')").bind("click", function(){
					reviewProduct($(this));
				})
		})
		
		function reviewProduct(elem) {
			alert("리뷰");
			self.location = "/review/addReview?prodNo="+$(elem).val()+"&userId=user13";
		}
		
		function getPurchase(elem) {
				console.log($(elem).html());
				fncUpdatePurchaseView($(elem).val());
		}
		
		function updateTranCode(elem) {
			
			
			if($(elem).text().trim() != 'review') {
	 			var result = confirm("물건이 도착했습니까?");
				
				if(result) {
					
					$.ajax({
						
						url : "/purchase/json/updateTranCode/"+$("input:hidden[name='tNo']",$(elem)).val()+"/3",
						method : "get",
						dataType : "json",
						success : function(JSONData, status){
							console.log(status);
							console.log(JSON.stringify(JSONData));
							console.log($("#"+JSONData.tranNo).next().html().trim());
							
							$("#"+JSONData.tranNo).next().remove();
							$("#"+JSONData.tranNo).html("<button type='button' class='btn btn-link btn-xs' value='"+JSONData.purchaseProd.prodNo+"'>review</button>");
							
							$(".btn:contains('review')").bind("click", function(){
								reviewProduct($(this));
							})
							
						}
						
					})
					
				} else {
					return;
				}
			}
		}
		
		//무한스크롤
		function getPurchaseList(count) {
		
			$.ajax({
				
				url : "/purchase/json/listPurchase/"+$("input:hidden[name='buyer.userId']").val(),
				method : "post",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					currentPage : count
				}),
				dataType : "json",
				success : function(JSONData, status){
					console.log(status);
					console.log(JSON.stringify(JSONData));

					var htmlStr = "<div class='col-md-offset-2 col-md-8 col-md-offset-2'><form><table class='table table-bordered table-condensed text-center'><tr class='ct_list_pop'>";
					for(var i = 0; i < JSONData.length; i++) {
						
						$("#scrollProd").removeClass();
						$("#scrollProd").addClass("row");
						
						var tranNo = JSONData[i].tranNo;
						var tranCode = JSONData[i].tranCode;
						var orderDate = JSONData[i].orderDate;
						var prodNo = JSONData[i].purchaseProd.prodNo;
						var prodName = JSONData[i].purchaseProd.prodName;
						var price = JSONData[i].purchaseProd.price;
						var fileName = JSONData[i].purchaseProd.fileName;
						console.log(fileName);
						
						htmlStr += "<td>"+(9 * (count - 1) + (i+1))+"</td>";
						htmlStr += "<td rowspan='2'><img class='img-thumbnail' src='../images/uploadFiles/"+fileName+"'>";
	                	htmlStr += "<span>";
											
						 if(JSONData[i].tranCode == '1'){
							htmlStr += '<button type="button" class="btn btn-xs btn-link" value="'+tranNo+'">'+prodName+'<br>'
	                						+'<small class="text-muted primary">주문번호 | '+tranNo+'</small></button>';
						} else {
							htmlStr += '&nbsp;<button type="button" class="btn btn-xs">'+prodName+'<br>'
    						+'<small class="text-muted primary">주문번호 | '+tranNo+'</small></button>';
						} 
						htmlStr += "</span></td>";				
						htmlStr += '<td rowspan="2">'+price+'원</td><td rowspan="2">';
					  	
						if(tranCode == '2') {
							htmlStr += '<p id="'+tranNo+'"></p>';
							htmlStr += '<p><input type="hidden" name="tNo" value="'+tranNo+'">물건도착</p>';
						} else if (tranCode < 2) {
							htmlStr += "대기";
						} else {
							htmlStr += '<button type="button" class="btn btn-link" value="'+prodNo+'">review</button>';
						}
						htmlStr += '</td></tr><tr><td><small class="text-muted">주문날짜 : '+orderDate+'</small></td></tr>';
					}
						htmlStr += "</table></form></div>";
						
						$("#scrollProd").append(htmlStr);
						
						$("span > button").bind('click', function(){
							getPurchase($(this));
						});
						
						$("p").bind('click', function(){
							updateTranCode($(this));
						});
						
						$(".btn:contains('review')").bind("click", function(){
							console.log("리뷰클릭");
							reviewProduct($(this));
						}) 
				}
				
			});
		}
		
		var count = 1;
		
		//무한스크롤
		$(window).bind("scroll",function(){
				console.log("scrolling....");
				console.log("doc > "+$(document).height());
				console.log("win > "+$(window).height());
				console.log("cur > "+$(window).scrollTop()); 
				
				if($(window).scrollTop() >= $(document).height() - $(window).height() - 1){
					
					if(count < ${resultPage.endUnitPage}) {
						console.log("끝");
						count++;
						console.log($(this).html());
						getPurchaseList(count);					
						
					} else if(count >= ${resultPage.endUnitPage}) {
						alert("마지막입니다");
					}
				}
		});
		
		//검색
		$(function(){
			$(".btn:contains('검색')").bind('click', function(){
				$("form[name='detailForm']").attr("action","/purchase/listPurchase").attr("method","post").submit();
			})
		})
		
		//autocomplete
		$(function(){
			
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
			            searchCondition : 1,
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
		
		<div class="page-header text-center">
			<h3 class="text-info">구매목록</h3>
		</div>
		
		<div class="row">
			<form class="form-inline" name="detailForm">
					<div class="form-group col-md-offset-9 col-md-3">
						<input type="hidden" id="searchCondition" name="searchCondition" value="1"/>
						<input type="hidden" id="currentPage" name="currentPage" value="1"/>
						<input type="text" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}"  class="form-control input-sm" placeholder="상품명 입력" autocomplete="on">
						<button class="btn btn-default btn-sm">검색</button>
					</div>
			</form>
		</div>
		
		
		<div class="row">
			<div class="col-md-offset-2 col-md-8 col-md-offset-2">
			<form class="form">
			<input type="hidden" name="buyer.userId" value="${user.userId}">
			<input type="hidden" name="currentPage" value="${search.currentPage}">
	          <table class="table table-bordered table-condensed text-center">
	            <thead>
	            	<tr>
		                <td>No / 주문날짜</td>
		                <td>상품명 / 구매정보</td>
		                <td>총 금액</td>
		                <td>정보</td>
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
			                	<c:if test="${purchase.tranCode == 1 }">
			                		<button type="button" class="btn btn-xs btn-link" value="${purchase.tranNo}">${purchase.purchaseProd.prodName}<br>
			                		<small class="text-muted primary">주문번호 | ${purchase.tranNo}</small></button>
			                	</c:if>
			                	<c:if test="${purchase.tranCode != 1 }">
			                		<button class="btn btn-xs disabled">${purchase.purchaseProd.prodName}<br>
			                		<small class="text-muted primary">주문번호 | ${purchase.tranNo}</small></button>
			                	</c:if>
			                	</span>
			                </td>
			                <td rowspan="2">${purchase.purchaseProd.price}원</td>
			                <td rowspan="2">
			                	
								<c:if test="${purchase.tranCode == 2 }">
									<p id="${purchase.tranNo}"></p>
									<p><input type="hidden" name="tNo" value="${purchase.tranNo}">물건도착</p>
								</c:if>
								<c:if test="${purchase.tranCode < 2}">
									대기
								</c:if>
								<c:if test="${purchase.tranCode > 2}">
									<button type="button" class="btn btn-link" value="${purchase.purchaseProd.prodNo}">review</button>
								</c:if>
			                </td>
	              		</tr>
	              		<tr>
	              			<td><small class="text-muted">주문날짜 : ${purchase.orderDate}</small></td>
	              		</tr>
	            </c:forEach>
	            </tbody>
	          </table>
	          </form>
	          <div id="scrollButton"></div>
        	</div>
		</div>
		
		<!-- 무한스크롤 -->
		<div id="scrollProd" class="hidden">
		</div>
		
		
	</div>

</body>
</html>