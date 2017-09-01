<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <!-- <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<!--  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
	
	<!-- 이미지롤링 -->
	<script type="text/javascript" src="../javascript/imageRolling.js"></script>
	
	<!-- masonry cdn -->
	<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
	
	<script type="text/javascript">
		
		//구매하기
		function purchaseProduct(prodNo) {
			console.log("구매버튼 : prodNo=>"+prodNo);
			self.location = "/purchase/addPurchase?prodNo="+prodNo;
		}
		
		//popover
		function getProductAjax(prodNo){
			
		   $.ajax({
			  
			   url : "/product/json/getProduct/"+prodNo,
			   method : "get",
			   dataType : "json",
			   success : function(JSONData){
				   
				   console.log(JSON.stringify(JSONData));
				   
				   var htmlStr = "";
				   
				   for(var i = 0; i < JSONData.length; i++){
					   
					   var prodName = JSONData.prodName;
					   var price = JSONData.price;
					   var detail = JSONData.detail;
					   var manu = JSONData.manuDate;
					   
					   htmlStr += "상품명 : ";
					   htmlStr += prodName+"<br>";
					   htmlStr += "가격 : ";
					   htmlStr += price+"<br>";
					   htmlStr += "상세정보 : ";
					   htmlStr += prodDetail+"<br>";
					   htmlStr += "제조일자 : ";
					   htmlStr += manu;
				   }
				   
				  $(".popover-title").text(prodName);
				  $(".popover-content").html(htmlStr);
				   
				  $(".popover").popover();
			   }
			   
		   })
	   }
		
		//modal
		function getProductAjaxModal(prodNo) {
			
			$.ajax({
				
				url : "/product/json/getProduct/"+prodNo,
				type : "get",
				dataType : "json",
				success : function(JSONData, status){
					
					console.log(JSON.stringify(JSONData.length));
					
					var htmlStr = "";
					htmlStr += '<div class="container">';
						   
					var prodName = JSONData.prodName;
					var price = JSONData.price;
					var detail = JSONData.prodDetail;
					var manu = JSONData.manuDate;
					
					htmlStr += '<table class="col-md-12 table table-condensed">';
					htmlStr += '<tr><td class="info">';
					htmlStr += "상품명</td><td>"+prodName+"</td>";
					htmlStr += '<tr><td class="info">';
					htmlStr += "가격</td><td>"+price+"원</td>";
					htmlStr += '<tr><td class="info">';
					htmlStr += "상세정보</td><td>"+detail+"</td>";
					htmlStr += '<tr><td class="info">';
					htmlStr += "제조일자</td><td>"+manu+"</td>";
					
					htmlStr += '</table></div></div>';
					htmlStr += '<div class="container"><div class="col-md-offset-1 col-md-3">';
					
					for(var i = 0; i < JSONData.fileName.length; i++){
					   htmlStr += "<img class='img-thumbnail' src='../images/uploadFiles/"+JSONData.fileName[i]+"'/>";
					}
					htmlStr += '</div></div>'
					$(".modal-body").html(htmlStr);
					
					$("table>tbody>tr>td").css("border-top","1px solid rgba(255, 255, 255, 0)");
					$(".info").addClass("text-center");
					
					$('[data-toggle="modal"]').modal({
						display : block
					});
					
				}
				
			});
		}
		
		//popover
		$(function(){
			$('[data-toggle="popover"]').popover({
				html : true,
				trigger : "hover",
				placement : "auto right"
			});
		})
		
		//modal
		$(function(){
			$(".btn:contains('상품보기')").bind("click",function(){
				var prodNo = $(this).val();
				getProductAjaxModal(prodNo);
				$(".btn:contains('구매')").bind("click",function(){
					purchaseProduct(prodNo);
				})
			})
		})
		
		/* $(function(){
			if(${param.menu} == 'manage') {
				$(".thumbnail>a>img").css("data-toggle","modal");
				$(".thumbnail>a>img").css("data-target","#myModal").bind("click", function(){
					var prodNo = $(this).parent("a").attr("id");
					getProductAjaxModal(prodNo);
				});
			}
		}) */
		
		function fncGetList(currentPage) {
			console.log("선택한 페이지 : "+currentPage);
			$("#currentPage").val(currentPage);
			
			 $("form[name='detailForm']").attr("method", "post")
														 .attr("action","/product/listProduct?menu=${param.menu}")
														 .submit();
														 
			/* console.log($("form[name='detailForm']").serialize());
			var formData = $("form[name='detailForm']").serializeObject();
			var formStr = "";
			
			console.log("formStr===>"+formData);
			
			$.ajax({
				url : "/product/json/listProduct",
				method : "post",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify(formData),
				dataType : "json",
				success : function(JSONData, status) {
					alert(status);
					console.log(JSON.stringify(JSONData));
					
					var listHtml = "전체 "+JSONData.resultPage.totalCount+" 건수, 현재 "+JSONData.resultPage.currentPage+"페이지";
					
					console.log($("#result").html());
					
					$("#result").html(listHtml);
					
					console.log($(".ct_list_pop td:nth-child(2)").length);
					
					console.log(JSONData.productList.length);
					
					$($("p")[1]).remove();
					$($("p")[3]).remove();
					
					for(var i = 0; i < JSONData.productList.length; i++) {
						// var i = JSONData.productList.length;
						//$(".ct_list_pop td:nth-child(2)").each(i, function(){
						//	console.log($(this).text())
						//}); 
						var name = JSONData.productList[i].prodName;
						var price = JSONData.productList[i].price;
						var date = JSONData.productList[i].regDate;
						//console.log("name : "+name+", price : "+price+", date : "+date);
						
						var nameHtml = "<p data-photo='${file}'><input type='hidden' name='pNo' value='${product.prodNo }''>"+name;
						
						$($(".ct_list_pop p")[i]).html(nameHtml);
						console.log("상품이름..."+$($(".ct_list_pop p")[i]).html());
						
						//$(".ct_list_pop td:nth-child(3)").text(price);
						//$(".ct_list_pop td:nth-child(4)").text(date);
					}
					
					
					
					console.log($($("p")[1]).text());
					console.log($($("p")[3]).html());
					$(".ct_list_pop td:nth-child(3)")
					
					$(".ct_list_pop td:nth-child(4)")
					
				}
			}); */
			
		}
			
		//<!-- update prod..-->
		function updateProduct(prodNo) {
			console.log("업데이트버튼 : prodNo=>"+prodNo);
			self.location = "/product/getProduct?prodNo="+prodNo+"&menu=manage";
			/* $.ajax({
				url : "/product/json/updateProduct/"+prodNo,
				method : "get",
				dataType : "json",
				success : function(JSONData, status) {
					alert(status);
					console.log(JSON.stringify(JSONData));
					
					
					console.log(elem);
					
					$("#"+prodNo).load("/product/getProduct?prodNo="+prodNo+"&menu=manage", JSON.stringify(JSONData));
					
				}
			}); */
			
		}
		
		
		
		$(function(){
			
			//get 방식 접근 시
			var resultHtml = "전체 "+${resultPage.totalCount}+" 건수, 현재 "+${resultPage.currentPage}+"페이지";
			$("#result").html(resultHtml);
			
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
			            searchCondition : $("select[name='searchCondition']").val()
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
			
			
			//<!-- 검색시 엔터 -->
			$("input:text[name='searchKeyword']").bind('keydown', function(event){
					
					if(event.keyCode == 13) {
						//alert("keydown  "+event.keyCode);
						event.preventDefault();
						$(".btn:contains('검색')").click();
					}
			});
			
			//<!-- 검색버튼 눌렀을때 -->
			$(".btn:contains('검색')").bind('click', function(){
				
				console.log("검색 searchKeyword : "+$("input:text[name='searchKeyword']").val());
				console.log("검색 searchKeywordPrice : "+$("input:text[name='searchKeywordPrice']").val());
				
				//var searchKeyword = document.detailForm.searchKeyword.value;
				var searchKeyword = $("input:text[name='searchKeyword']").val();
				
				if(searchKeyword == null || searchKeyword.length < 1) {
					alert("검색어를 입력하십시오");
					return;
				} else {
					fncGetList(1);
				}
			}); 
			
			//<!-- 이름정렬 -->
			$("select[name='sortCondition']").bind('change', function(){
				//console.log("이름 정렬"+$(this).text());
				$("select[name='sortCondition2']").val("");
				fncGetList(1);
			});
			
			//<!-- 가격정렬 -->
			$("select[name='sortCondition2']").bind('change', function(){
				$("select[name='sortCondition']").val("");
				fncGetList(1);
			});
			
			//<!-- search 판매 완료 상품 -->
			$(".btn:contains('품절상품')").bind('click', function(){
				$("#searchSoldProd").val("1");
				fncGetList(1);
			});
		
			/* $(".btn:contains('상품보기')").bind('click', function(){
				fncGetProduct($(this).val());
			}) */
			
			//상품보기 화면전환
			$(".thumbnail > a").bind('click', function(){
				console.log($(this).attr('id'));
				self.location = "/product/getProduct?prodNo="+$(this).attr('id')+"&menu='search''";
			})
			
			$(".btn:contains('바로구매')").bind('click', function(){
				purchaseProduct($(this).val());
			})
			
			$(".btn:contains('상품수정')").bind('click', function(){
				updateProduct($(this).val());
			})
			
			//<!-- 아코디언 -->
			/* console.log($($("div")[1]).html());
			$($("div")[1]).accordion({	
				header : "a",
				collapsible : true,
				event : "click",
				heightStyle : "fill"
			}); */
			
			//<!-- 탭 -->
			/* $($("div")[1]).tabs({
				collapsible : true,
				active : 1,
				event : "click"
			}); */
			
			
			
			//<!-- 이미지미리보기 file tootip -->
			$("p").tooltip({
					items : "[data-photo]",			
					content : function(){
						var path = $(this).data('photo');
						console.log("html 태그 :: <img src='../images/uploadFiles/'"+path+"'> ");
						return "<img class='prod_img' src='../images/uploadFiles/"+path+"'> ";
					}
			});
			
			$(".btn:contains('뒤로')").bind("click", function(){
				self.location = "/product/listProduct?menu=${param.menu}&currentPage=1";
			}); 
			
		});
		
		var count = 1;
		
		//무한스크롤...................................................
		 $(window).bind("scroll",function(event){
				
				if($(window).scrollTop() >= $(document).height() - $(window).height() - 1){
					
					event.preventDefault();
					if(count <= ${resultPage.maxPage}) {
						console.log("끝");
						count++;
						event.preventDefault();
						getProductList(count);					
						event.preventDefault();					
					} else if(count > ${resultPage.maxPage}) {
						event.preventDefault();
						console.log("마지막페이지");
					}
				}
		});
			
			
		function getProductList(count) {
			
			$.ajax({
				
				url : "/product/json/listProduct/${param.menu}",
				method : "post",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					currentPage : count,
					sortCondition : $("select option:selected").val(),
					searchSoldProd : $("input:hidden[name='searchSoldProd']").val()
				}),
				dataType : "json",
				success : function(JSONData, status){
					
					console.log(JSON.stringify(JSONData.productList));
					
					if(JSONData.productList.length == 0) {
						console.log("(ajax)마지막입니다");
					}
					
					var htmlStr = '';
					htmlStr += '<div class="container"><div class="row">';
					
					for(var i = 0; i < JSONData.productList.length; i++) {
						
						$("#scrollProd").removeClass();
						var fileName = JSONData.productList[i].fileName[0];
						var prodNo = $.trim(JSONData.productList[i].prodNo);
						var prodName = JSONData.productList[i].prodName;
						var prodDetail = JSONData.productList[i].prodDetail;
						var manuDate = JSONData.productList[i].manuDate;
						var price = JSONData.productList[i].price;
						var proTranCode = JSONData.productList[i].proTranCode;
						
						console.log(prodName);
						htmlStr += '<div class="col-md-3">'+
									'<div class="thumbnail" data-toggle="popover" data-original-title="'+prodName+'" data-container="body" data-content="상세정보 : '+prodDetail+'<br> 제조일자 : '+manuDate+'>';
						htmlStr += '<a id="'+prodNo+'" href="#">';
						htmlStr += '<img src="../images/uploadFiles/'+fileName+'" alt="'+prodNo+'">';
						htmlStr += '</a>';
						htmlStr += '<div class="caption text-center"><p><small>'+prodName+'</small></p>';
						htmlStr += '<p class="text-primary">'+price+'원</p>';
						htmlStr += '<p>';
						if(JSONData.menu == 'search' && proTranCode == null) {
							htmlStr += '<button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal" value="'+prodNo+'">상품보기</button>'+
			 				 				'<button class="btn btn-default btn-sm" value="'+prodNo+'">바로구매</button>';
						}
											
						if(JSONData.menu == 'manage' && proTranCode == null) {
							htmlStr +='<button class="btn btn-sm" value="'+prodNo+'">상품수정</button>';
							htmlStr +='<button class="btn btn-default btn-sm" value="'+prodNo+'">삭제하기</button>';
						}
						htmlStr += '</p></div></div></div>';
					}						
						htmlStr += '</div></div></div>';
						
						$("#scrollProd").append(htmlStr);
						
						console.log($(".thumbnail > img").attr("alt"))
						
						$(".thumbnail > img").bind('click', function(elem){
							self.location = "/product/getProduct?prodNo="+$(this).attr('alt')+"&menu=search";
						})
						
						$(".btn:contains('바로구매')").bind('click', function(){
							purchaseProduct($(this).val());
						})
						
						$(".btn:contains('상품수정')").bind('click', function(){
							updateProduct($(this).val());
						})
						
						$(".btn:contains('삭제하기')").bind('click',function(){
							console.log($(this).text().trim());
							
							var result = confirm("정말로 삭제하시겠습니까?");
							if(result) {
								self.location="/product/deleteProduct?prodNo="+$(this).val();
							} else {
								return;
							}
						})
						
						$('[data-toggle="popover"]').popover({
							html : true,
							trigger : "hover",
							placement : "auto right"
						});
						
						$(".btn:contains('상품보기')").bind("click",function(){
							var prodNo = $(this).val();
							getProductAjaxModal(prodNo);
							$(".btn:contains('구매')").bind("click",function(){
								purchaseProduct(prodNo);
							})
						})
				}
				
			});
		}
			
		//가격검색
		$(function(){
			$(".btn:contains('가격')").bind('click',function(){
				alert("가격검색")				
				$("form[name='priceForm']").attr("method","post").attr("action","/product/listProduct").submit();
			})
		})
		
		//삭제하기
		$(function(){
			$(".btn:contains('삭제하기')").bind('click',function(){
				console.log($(this).text().trim());
				
				var result = confirm("정말로 삭제하시겠습니까?");
				if(result) {
					self.location="/product/deleteProduct?prodNo="+$(this).val();
				} else {
					return;
				}
			})
		})
		
		//필터
		$(function(){
			$("select[name='sortCondition']").bind("change",function(){
				$("form[name='sortForm']").attr("action","/product/listProduct").attr("method","post").submit();				
			})
		})
		
	</script>
	<style type="text/css">
	/*  .prod_img{
			height : 110px;
			width : 110px;
		}  */
		.btn{
			background-color : #70cbce;
			border-color: #cccccc;
		}
		.btn:hover{
			background-color : #33dfe4;
		}
	   	.ui-button{
	   		background:#f06561;
	   	}
	   	body{
            padding-top : 70px;
        }
        .table-striped>tbody>tr:nth-of-type(even){
        	background-color:#F7CAC9
        }
    	/* div{
			border : 3px solid #D6CDB7;
			margin0top : 10px;
		}  */
		/* .thumbnail{
			height : 500px;
		} */
		
		/*
		.img-thumbnail{
			height : 190px;
			width : 190px;
		} */
		/* .rollingList > div{
			overflow:hidden;
			height:190px;
			width:190px;
		}
		.rollingList > div > a{
			display:block;
			
		}  
		.rollingList > div > a > img{
			width:190px;
			height:190px;
			margin-right:10px;
		} */
		.dropdown:hover .dropdown-menu {
        	display : block;
        }
        /* img {
			height : 80%;
			width : 50%;
		}  */
		/* .thumbnail > a > img{
			display:block;
			max-width:90%;
			height:10;	
		} */
		.thumbnail:hover{
			border : 1px solid #70cbce;
		}
		form{
			display : inline;
		}
		
	</style>
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<!-- <div id="dialog"></div> -->
	<!-- navbar -->
	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp"/>
	
	
	<div class="container">
		<!-- modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
			    <div class="modal-content">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h5 class="modal-title" id="myModalLabel">상품보기</h5>
				      </div>
				      <div class="modal-body">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				       <c:if test="${param.menu == 'search'}">
				        <button type="button" class="btn btn-primary">구매</button>
				       </c:if>
				       <c:if test="${param.menu == 'manage'}">
				        <button type="button" class="btn btn-primary">수정</button>
				       </c:if>
				      </div>
			    </div>
		  </div>
		</div>
		
		<!-- HEADER -->
		<div class="page-header text-center">
			<h3 class="text-info">상품목록</h3>
			<small class="text-muted">판매 상품 리스트</small>
		</div>
		
		<!-- SEARCH -->
		 <div class="container">
			<div class="row">
					<form class="form-inline" name="sortForm">
							<!-- 필터 -->
							<div class="form-group col-md-1">
							<input type="hidden" name="menu" value="${param.menu}"/>
									<select name="sortCondition" class="form-control input-sm">
										<option value="">필터</option>
										<optgroup label="상품명정렬">
											<option value="0" ${!empty search.sortCondition && search.sortCondition == '0' ? "selected" : ""}>ㄱ~ㅎ</option>
											<option value="1" ${!empty search.sortCondition && search.sortCondition == '1' ? "selected" : ""}>ㅎ~ㄱ</option>
										</optgroup>
										<optgroup label="가격정렬">
											<option value="2" ${!empty search.sortCondition && search.sortCondition == '2' ? "selected" : ""}>높은순</option>
											<option value="3" ${!empty search.sortCondition && search.sortCondition == '3' ? "selected" : ""}>낮은순</option>
										</optgroup>
									</select>
							  </div>
					</form>
					<form class="form-inline" name="detailForm">
						<!-- 판매상품 -->
						<div class="form-group  col-md-offset-1 col-md-1">
							<c:if test="${search.searchSoldProd == 1}">
								<button type="button" class="btn btn-default btn-sm">뒤로</button>
							</c:if>
							<input type="hidden" id="searchSoldProd" name="searchSoldProd" value="${search.searchSoldProd}"/>
							<button type="button" class="btn btn-default btn-sm">품절상품</button>
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
		</div>
		
		<div class="row">
			<div class="col-md-1">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-1">&nbsp;</div>
		</div>
		
    	<!-- thumbnail -->
    	<div class="container">
		<div class="row">
			<c:if test="${!empty list}">
				<c:forEach var="product" items="${list}">
					<div class="col-md-3">
						<div class="thumbnail" title="${product.prodName}" data-container="body"
						data-toggle="popover" data-content="상세정보 : ${product.prodDetail} <br> 제조일자 : ${product.manuDate}">
	
								<a id="${product.prodNo}" href="#"><img alt="http://placehold.it/200x150" src="../images/uploadFiles/${product.fileName[0]}"></a>
								<div class="caption text-center">
										<p><small>${product.prodName}</small></p>
										<p class="text-primary">${product.price}원</p>
										<p>
											<c:if test="${param.menu == 'search' && product.proTranCode == null}">
												 <c:if test="${empty product.proTranCode}">
													  <button class="btn btn-primary btn-sm" value="${product.prodNo}" data-toggle="modal" data-target="#myModal">상품보기</button>
													  <button class="btn btn-default btn-sm" value="${product.prodNo}">바로구매</button>
												  </c:if>
											</c:if>
											<c:if test="${param.menu == 'manage' && product.proTranCode == null}">
											  <button class="btn btn-sm" value="${product.prodNo}">상품수정</button>
											  <button class="btn btn-default btn-sm" value="${product.prodNo}">삭제하기</button>
											</c:if>
										</p>
								</div>
							</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<div class="col-md-offset-3 col-md-6">
					<p class="text-muted text-center">데이터가 없습니다.</p>
				</div>
			</c:if>
	
				
			</div>
		</div>
				<div id="scrollProd"></div>
		<%-- <jsp:include page="../common/pageNavigator_new.jsp"/> --%>
		
		
		<!-- 테이블 형식 -->
		<%-- <div class="row">
			<div class="col-md-offset-3 col-md-6 col-md-offset-3">
	          <table class="table table-striped table-condensed">
	            <thead>
	            	<tr class="danger">
		                <th>No</th>
		                <th>상품명</th>
		                <th>가격</th>
		                <th>등록일</th>
		                <th>변경</th>
	             	</tr>
	            </thead>
	            <tbody>
	            <c:forEach var="product" items="${list}">
	            	<c:set var="i" value="${i+1}"/>
		              	<tr class="ct_list_pop">
			                <td>${i}</td>
			                <td>
			                	<c:forEach var="files" items="${product.fileName}">
									<c:set var="file" value="${files}"/>
								</c:forEach>
								<p data-photo="${file}">
								<input type="hidden" name="pNo" value="${product.prodNo }">
			                	${product.prodName}
			                	</p>
			                </td>
			                <td>${product.price}원</td>
			                <td>${product.regDate}</td>
			                <td><input type="hidden" name="pNo" value="${product.prodNo}"/>삭제</td>
	              		</tr>
	            </c:forEach>
	            </tbody>
	          </table>
        	</div>
		</div> --%>
		
		
	</div>
	
	
</body>
</html> 