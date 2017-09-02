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
	
	<script type="text/javascript">
		
		
		//<!-- form data serialize function -->
		jQuery.fn.serializeObject = function() {
		    var obj = null;
		    try {
		        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
		            var arr = this.serializeArray();
		            if (arr) {
		                obj = {};
		                $.each(arr, function() {
							if(this.name != 'pNo') {	                
			                   obj[this.name] = this.value;
							}
		                });
		            }//if ( arr ) {
		        }
		    } catch (e) {
		        alert(e.message);
		    } finally {
		    }
		 
		    return obj;
		};
	
		function fncGetProduct(prodNo) {
			var dialog = $("#dialog").dialog({
				autoOpen : false,
				title : "상품정보",
				width : 400,
				position: {at: "center", of: window },
				buttons : {
					<c:if test="${param.menu == 'search'}">
						"구매하기" : function(){
							purchaseProduct(prodNo);
						},
					</c:if>
					<c:if test="${param.menu == 'manage'}">
						"수정하기" : function(){
							updateProduct(prodNo);
						},
					</c:if>
					
					"닫기" : function(){
						dialog.dialog("close");
					}
				},
				close : function(){
					dialog.dialog("close");
				},
				open : function(){
					console.log("open");
					
					$.ajax({
						
						url : "/product/json/getProduct/"+prodNo,
						method : "get",
						dataType : "json",
						success : function(JSONData, status){
							
							console.log(status);
							console.log(JSON.stringify(JSONData));
							
							var htmlStr ="<table class='table'><tr><td class='danger'>상품명</td>"
												+"<td>"+JSONData.prodName+"</td></tr>"
												+"<tr><td class='danger'>상세정보</td><td>"+JSONData.prodDetail+"</td></tr>"
												+"<tr><td class='danger'>가격</td><td>"+JSONData.price+"</td></tr>"
												+"<tr><td class='danger'>제조일자</td><td>"+JSONData.manuDate+"</td></tr>"
												+"<tr><td class='danger'>이미지</td>";
												
												
							
							for(var i = 0; i < JSONData.fileName.length; i++){
								htmlStr += "<td><img class='img-thumbnail' src='../images/uploadFiles/"+JSONData.fileName[i]+"'/>";
							}
							htmlStr += "</td></table>";
							
							$("#dialog").html(htmlStr);
							
						}
						
					})
				}
			});
			dialog.dialog("open");
		}
		
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
		
		function purchaseProduct(prodNo) {
			console.log("구매버튼 : prodNo=>"+prodNo);
			self.location = "/purchase/addPurchase?prodNo="+prodNo;
		}
		
		$(function(){
			
			var count = [];
			
			$("input:hidden[name='fileCount']").each(function(index){
				count.push($(this).val());
			});
			
			/* $(".thumbnail").hover(function(){
				imgMove($(this));
			}); */
			
			//console.log(moveSpeed);
			
			//get 방식 접근 시
			var resultHtml = "전체 "+${resultPage.totalCount}+" 건수, 현재 "+${resultPage.currentPage}+"페이지";
			$("#result").html(resultHtml);
			
			//console.log($(".ct_list_pop:nth-child(4n+2)").html());
			
			//<!-- 테이블 행 색상변경 -->
			//$(".ct_list_pop:nth-child(4n+2)").css("background-color", "#F7CAC9");
			
			//<!-- 상품번호, 상품가격 검색 -->
			/* var htmlStr = '<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />';
			if($("select[name='searchCondition']").val() == null || $("select[name='searchCondition']").val() < 2) {
				var htmlStr = '<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" autocomplete="on" />';
				console.log("select 선택"+htmlStr);
				console.log(changeHtml);
				$('span').html(htmlStr);
			} else {
				var changeHtml = "<input type='text' name='searchKeyword' value='${search.searchKeyword}' class='ct_input_g' style='width:80px; height:19px' />원~"
					+'<input type="text" name="searchKeywordPrice"  value="${search.searchKeywordPrice}" class="ct_input_g" style="width:80px; height:19px" />원';
					console.log(changeHtml);
					
					$('span').html(changeHtml);
			}  */
			
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
						alert("keydown  "+event.keyCode);
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
			
			//<!-- 가격검색 눌렀을때 -->
			/* $("select[name='searchCondition']").bind('change', function(){
				console.log("select change : :  :"+$(this).html());
				$('span').html(htmlStr);
				
				$("input:text[name='searchKeyword']").val('');
				console.log("val 확인 1 : "+$("input:text[name='searchKeyword']").val());
				
				//<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:80px; height:19px" />원 ~
				//<input type="text" name="searchKeywordPrice"  value="${search.searchKeywordPrice}" class="ct_input_g" style="width:80px; height:19px" />원
				
				if($(this).val() == 2) {
					
					$("input:text[name='searchKeyword']").val('');	
					$("input:text[name='searchKeywordPrice']").val('');
					
					console.log("val 확인 2 : "+$("input:text[name='searchKeywordPrice']").val());
					
					var changeHtml = "<input type='text' name='searchKeyword' value='' class='ct_input_g' style='width:80px; height:19px' />원~"
					+"<input type='text' name='searchKeywordPrice'  value='' class='ct_input_g' style='width:80px; height:19px' />원";
					console.log(changeHtml);
					
					$('span').html(changeHtml);
					$('span input:text[name="searchKeyword"]').val("${search.searchKeyword}");
					$('span input:text[name="searchKeywordPrice"]').val("${search.searchKeywordPrice}");
				}
				
			}); */
			
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
			
			//<!-- manager 판매 완료 상품 -->
			$(".ct_btn01:contains('완판 상품 관리')").bind('click', function(){
				console.log($(this).html());
				self.location = "/purchase/listSale?menu=${param.menu}";
				//fncGetList(1);
			});
			
			//<!-- search 판매 완료 상품 -->
			$(".btn:contains('판매된 상품')").bind('click', function(){
				$("#searchSoldProd").val("1");
				fncGetList(1);
			});
		
			//<!-- 상품 상세보기-->
			/* $(".ct_list_pop td:nth-child(5), .ct_list_pop td:nth-child(3)").bind('click', function(){
				var name = $(this).text().trim();
				console.log(name);
				
				console.log($("input:hidden[name='pNo']",this).val());
				
				//self.location="/product/getProduct?prodNo="+$($($(this).siblings('td'))[0]).text().trim()+"&menu=${param.menu}";
				self.location="/product/getProduct?prodNo="+$("input:hidden[name='pNo']",this).val()+"&menu=${param.menu}";
			});  */
			
			///*
			
			//dialog
			/* var dialog = $("#dialog").dialog({
				autoOpen : false,
				title : "상품정보",
				width : 400,
				buttons : {
					"구매하기" : function(){
						self.loaction="";
					},
					"닫기" : function(){
						dialog.dialog("close");
					}
				},
				close : function(){
					dialog.dialog("close");
				},
				open : function(){
					console.log("open");
					
					$.ajax({
						
						url : "/product/json/getProduct/"+$("input:hidden[name='pNo']").val(),
						method : "get",
						dataType : "json",
						success : function(JSONData, status){
							
							console.log(status);
							console.log(JSON.stringify(JSONData));
							
							var htmlStr ="<table class='table'><tr><td class='danger'>상품명</td>"
												+"<td>"+JSONData.prodName+"</td></tr>"
												+"<tr><td class='danger'>상세정보</td><td>"+JSONData.prodDetail+"</td></tr>"
												+"<tr><td class='danger'>가격</td><td>"+JSONData.price+"</td></tr>"
												+"<tr><td class='danger'>제조일자</td><td>"+JSONData.manuDate+"</td></tr>"
												+"<tr><td class='danger'>이미지</td>";
												
												
							
							for(var i = 0; i < JSONData.fileName.length; i++){
								htmlStr += "<td><img class='img-thumbnail' src='../images/uploadFiles/"+JSONData.fileName[i]+"'/>";
							}
							htmlStr += "</td></table>";
							
							$("#dialog").html(htmlStr);
							
						}
						
					})
				}
			}) */
			
			$(".btn:contains('상품보기')").bind('click', function(){
				fncGetProduct($(this).val());
			})
			
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
			
			/* $(".btn:contains('상세보기')").bind('click', function(){
				
				
				var prodNo = $("input:hidden[name='pNo']").val();
				console.log("prodNO===>"+prodNo);
				
				//<!-- ajax 상품 보기 -->
				$.ajax({
					url : "/product/json/getProduct/"+prodNo,
					method : "get",
					dataType : "json",
					success : function(JSONData, status){
						console.log(status);
						console.log(JSON.stringify(JSONData));
						var displayStr = "<h4>상품명 : "+JSONData.prodName+"<br>"
												+"상품상세정보 : "+JSONData.prodDetail+"<br>"
												+"상품가격 : "+JSONData.prodDetail+"원<br>";
						if(JSONData.fileName != null) {
							displayStr += "상품이미지 : <br>";
							var fileName = "";
							for(var i = 0; i < JSONData.fileName.length; i++) {
								displayStr += "<img width='100px' heigth='100px' src='../images/uploadFiles/"+JSONData.fileName[i]+"'>";
							}
						}
						<c:if test="${param.menu == 'manage'}">
							displayStr += "<br><input type='button' value='수정하기' onclick='updateProduct("+prodNo+")'>";
						</c:if>
						<c:if test="${param.menu == 'search'}">
						displayStr += "<br><input type='button' value='구매하기' onclick='purchaseProduct("+prodNo+")'>";
					</c:if>
						$("h4").remove();
						$("#"+prodNo).html(displayStr);
					}
				}); */
				
				
				//var name = $(this).text().trim();
				//console.log(name);
				
				//console.log($("input:hidden[name='pNo']",this).val());
				
				//self.location="/product/getProduct?prodNo="+$($($(this).siblings('td'))[0]).text().trim()+"&menu=${param.menu}";
				//self.location="/product/getProduct?prodNo="+$("input:hidden[name='pNo']",this).val()+"&menu=${param.menu}"; 
			//*/
			
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
			
			//console.log($("a").tooltip("option","content"));
			
			
			$(".ct_list_pop td:nth-child(5)").button().bind('click', function(){
				
				console.log($(this).text().trim());
				
				console.log($("input:hidden[name='pNo']",this).val())
				
				var result = confirm("정말로 삭제하시겠습니까?");
				if(result) {
					self.location="/product/deleteProduct?prodNo="+$("input:hidden[name='pNo']",this).val();
				} else {
					return;
				}
			});
			
			$("p:contains('뒤로')").bind("click", function(){
				self.location = "/product/listProduct?menu=${param.menu}&currentPage=1";
			}); 
			
			//carousel
			$("#myCarousel").on('slide.bs.carousel', function () {
				 console.log("slide...");
			})
			
			/* $(".thumbnail > a > img").hover(function(){
				console.log("hover")				
				$(this).css("border","red");
			}) */
			
			
			
			
		});
		
		var count = 1;
		
		//무한스크롤...................................................
		$(function(){

		$(window).bind("scroll",function(){
				console.log("scrolling....");
				console.log("doc > "+$(document).height());
				console.log("win > "+$(window).height());
				console.log("cur > "+$(window).scrollTop()); 
				
				var scrollH = $(window).scrollTop();
				var docH = $(document).height() - $(window).height();
				if(scrollH  >= docH-2){

					if(count <= ${resultPage.maxPage}) {
						//alert(count);
						console.log("끝");
						count++;
						
						getProductList(count);					
						
					} else if(count > ${resultPage.maxPage}) {
						alert("마지막입니다"+count+"${resultPage.maxPage}");
					}				
				}
			});
		})	
			
			
		function getProductList(count) {
			$.ajax({
				
				url : "/product/json/listProduct",
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
					//alert(status)
					alert(JSON.stringify(JSONData.productList));
					
					if(JSONData.productList.length == 0) {
						alert("마지막입니다");
					}
					for(var i = 0; i < JSONData.productList.length; i++) {
						$("#scrollProd").removeClass();
						var fileName = JSONData.productList[i].fileName[0];
						console.log(fileName);
						var htmlStr = "<div class='col-md-offset-1 col-md-3'><div class='thumbnail'><a id='"+JSONData.productList[i].prodNo+"' href='#'><img src='../images/uploadFiles/"+fileName+"'></a>"+
											"<div class='caption text-center'><p><small>"+JSONData.productList[i].prodName+"</small></p>"+
											"<p class='text-primary'>"+JSONData.productList[i].price+"원</p>"+
											"<p>";
											
						<c:if test="${param.menu == 'search'}">
							htmlStr += "<button class='btn btn-default btn-sm' value='"+JSONData.productList[i].prodNo+"'>상품보기</button>"+
			 				 				"<button class='btn btn-danger btn-sm' value='"+JSONData.productList[i].prodNo+"'>바로구매</button>";
						</c:if>
											
						<c:if test="${param.menu == 'manage'}">
							htmlStr +="<button class='btn btn-primary btn-sm' value='"+JSONData.productList[i].prodNo+"'>상품수정</button></p>";
						</c:if>
											
						htmlStr += "</p></div></div></div></div>";
						
						$("#scrollProd").append(htmlStr);
						
						$(".btn:contains('상품보기')").bind('click', function(){
							fncGetProduct($(this).val());
						})
						
						$(".thumbnail > a").bind('click', function(){
							console.log($(this).attr('id'));
							self.location = "/product/getProduct?prodNo="+$(this).attr('id')+"&menu=${param.menu}";
						})
						
						$(".btn:contains('바로구매')").bind('click', function(){
							purchaseProduct($(this).val());
						})
						
						$(".btn:contains('상품수정')").bind('click', function(){
							updateProduct($(this).val());
						})
					}
					
				}
				
			});
		}
			
		
		
			
			
		/* $(function(){
			
			
			$("select[name='searchCondition']").bind('change', function(){
				console.log($(this).val());
				$("#searchKeyword").val("");
				if($(this).val() == 2){
					fncChangeSearch();					
				}
				
			})
		
		})
		
		function fncChangeSearch() {
			$("#searchKeyword").val("");
				
				var htmlStr = "";
				htmlStr += "~";
				htmlStr += "<input type='text' id='searchKeywordPrice' name='searchKeywordPrice' value='${search.searchKeywordPrice}' class='form-control input-sm' placeholder='최대금액'>";
				$("#searchField").append(htmlStr);
		} */
		
		$(function(){
			$(".btn:contains('가격')").bind('click',function(){
				alert("가격검색")				
				$("form[name='priceForm']").attr("method","post").attr("action","/product/listProduct").submit();
			})
		})
		
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
		.thumbnail > a > img{
			display:block;
			max-width:90%;
			height:10;	
		}
		.thumbnail:hover{
			border : 1px solid #70cbce;
		}
		
		
	</style>
</head>

<body bgcolor="#ffffff" text="#000000">
	
	<div id="dialog"></div>
	<!-- navbar -->
	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp"/>
	${resultPage.maxPage}
	<div class="container">
		
		<!-- HEADER -->
		<div class="page-header text-center">
			<h3 class="text-info">상품목록</h3>
			<small class="text-muted">판매 상품 리스트</small>
		</div>
		
		<!-- SEARCH -->
		<div class="row">
			<form class="form-inline" name="detailForm">
					<div class="form-group col-md-2">
						<c:if test="${search.searchSoldProd == 1}">
							<p>뒤로</p>
						</c:if>
						<input type="hidden" id="searchSoldProd" name="searchSoldProd" value="${search.searchSoldProd}"/>
						<button class="btn btn-default btn-sm">판매된 상품</button>
					</div>
					<div class="form-group col-md-offset-4 col-md-6">
						<select name="searchCondition" class="form-control input-sm col-md-6">
							<c:if test="${param.menu == 'manage'}">
							<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>상품번호</option>
							</c:if>
							<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>상품명</option>
							<%-- <option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>가격</option> --%>
						</select>
						<input type="text" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}"  class="form-control input-sm" placeholder="검색어 입력">
						<button class="btn btn-default btn-sm">검색</button>
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
					</div>
			</form>
			<form class="form-inline col-md-offset-6" name="priceFrom">
				<input type="hidden" id="searchCondition" name="searchCondition" value="2">
				<div class="form-group">
					<input type="text" id="searchLowPrice" name="searchLowPrice" value="${search.searchLowPrice}"  class="form-control input-sm" placeholder="최소금액">원~
					<input type="text" id="searchHighPrice" name="searchHighPrice" value="${search.searchHighPrice}"  class="form-control input-sm" placeholder="최대금액">원
				</div>
				<div class="form-group">
					<button class="btn btn-default btn-sm">가격</button>
				</div>
			</form>
		</div>
		
		<div class="row">
			<div class="col-md-1">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-1">&nbsp;</div>
		</div>
		
		<!-- <!-- carousel 
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
      	Indicators
      		<ol class="carousel-indicators">
        		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        		<li data-target="#myCarousel" data-slide-to="1"></li>
        		<li data-target="#myCarousel" data-slide-to="2"></li>
      		</ol>
      		<div class="carousel-inner" role="listbox">
        		<div class="item active">
          			<img class="first-slide" src="../images/uploadFiles/chanel1.jpg" alt="First slide">
          			<div class="container">
            			<div class="carousel-caption">
             				<h1>샤넬신상</h1>
              				<p>이것이 리얼리다</p>
              				<p><a class="btn btn-lg btn-primary" href="#" role="button">구매하기</a></p>
           				</div>
          			</div>
        		</div>
        		<div class="item">
          			<img class="second-slide" src="../images/uploadFiles/chanel2.jpg" alt="Second slide">
          			<div class="container">
           				<div class="carousel-caption">
              				<h1>프라다</h1>
              				<p>새로운 프라다 백 지금 만나보세요</p>
              				<p><a class="btn btn-lg btn-primary" href="#" role="button">더알아보기</a></p>
            			</div>
          			</div>
        		</div>
        		<div class="item">
          			<img class="third-slide" src="../images/uploadFiles/chanel2.jpg" alt="Third slide">
          			<div class="container">
            			<div class="carousel-caption">
              				<h1>One more for good measure.</h1>
              				<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              				<p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            			</div>
          			</div>
        		</div>
      		</div>
      		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        		<span class="sr-only">Previous</span>
      		</a>
      		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        		<span class="sr-only">Next</span>
      		</a>
    	</div> -->
    	
    	<!-- 이미지롤링 -->
		<div class="row">
			<c:if test="${!empty list}">
			<c:forEach var="product" items="${list}">
				<div class="col-md-3">
					<div class="thumbnail">
							<a id="${product.prodNo}" href="#"><img alt="http://placehold.it/200x150" src="../images/uploadFiles/${product.fileName[0]}"></a>
							<div class="caption text-center">
									<p><small>${product.prodName}</small></p>
									<p class="text-primary">${product.price}원 재고 : ${product.prodStock}</p>
									<p>
										<c:if test="${param.menu == 'search'}">
											 <c:if test="${product.proTranCode != 4}">
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
				</div>
			</c:forEach>
					<div id="scrollProd" class="hidden">
					</div>
			</c:if>
			<c:if test="${empty list}">
				<div class="col-md-offset-3 col-md-6">
					<p class="text-muted text-center">데이터가 없습니다.</p>
				</div>
			</c:if>
	
				
		</div>
		
		
		<!--  섬네일형식 -->
		
		<%-- <div class="row">
			<c:forEach var="product" items="${list}">
				<div class="col-md-offset-1 col-md-3">
					<div class="thumbnail">
					<c:if test="${!empty product.fileName}">
						<c:forEach var="files" items="${product.fileName}">
							<c:set var="fileName" value="${files}"/>
						</c:forEach>
						<img class="img-thumbnail" alt="${product.prodName}" src="../images/uploadFiles/${fileName}">
					</c:if>
					<c:if test="${empty product.fileName}">
						<img  alt="${product.prodName}" src="http://placehold.it/100x100">
					</c:if>
					<div class="caption text-center">
						<p><small>${product.prodName}</small></p>
						<p class="text-primary">${product.price}원</p>
						<p><button class="btn btn-default btn-sm">상세보기</button>
							  <button class="btn btn-danger btn-sm">바로구매</button></p>
					</div>
					</div>
				</div>
			</c:forEach>
		</div> --%>
		
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
		
		<%-- <jsp:include page="../common/pageNavigator_new.jsp"/> --%>
		
	</div>
</body>
</html> 