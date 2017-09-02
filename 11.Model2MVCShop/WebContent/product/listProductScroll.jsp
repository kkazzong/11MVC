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
	
	<!-- �̹����Ѹ� -->
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
				title : "��ǰ����",
				width : 400,
				position: {at: "center", of: window },
				buttons : {
					<c:if test="${param.menu == 'search'}">
						"�����ϱ�" : function(){
							purchaseProduct(prodNo);
						},
					</c:if>
					<c:if test="${param.menu == 'manage'}">
						"�����ϱ�" : function(){
							updateProduct(prodNo);
						},
					</c:if>
					
					"�ݱ�" : function(){
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
							
							var htmlStr ="<table class='table'><tr><td class='danger'>��ǰ��</td>"
												+"<td>"+JSONData.prodName+"</td></tr>"
												+"<tr><td class='danger'>������</td><td>"+JSONData.prodDetail+"</td></tr>"
												+"<tr><td class='danger'>����</td><td>"+JSONData.price+"</td></tr>"
												+"<tr><td class='danger'>��������</td><td>"+JSONData.manuDate+"</td></tr>"
												+"<tr><td class='danger'>�̹���</td>";
												
												
							
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
			console.log("������ ������ : "+currentPage);
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
					
					var listHtml = "��ü "+JSONData.resultPage.totalCount+" �Ǽ�, ���� "+JSONData.resultPage.currentPage+"������";
					
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
						console.log("��ǰ�̸�..."+$($(".ct_list_pop p")[i]).html());
						
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
			console.log("������Ʈ��ư : prodNo=>"+prodNo);
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
			console.log("���Ź�ư : prodNo=>"+prodNo);
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
			
			//get ��� ���� ��
			var resultHtml = "��ü "+${resultPage.totalCount}+" �Ǽ�, ���� "+${resultPage.currentPage}+"������";
			$("#result").html(resultHtml);
			
			//console.log($(".ct_list_pop:nth-child(4n+2)").html());
			
			//<!-- ���̺� �� ���󺯰� -->
			//$(".ct_list_pop:nth-child(4n+2)").css("background-color", "#F7CAC9");
			
			//<!-- ��ǰ��ȣ, ��ǰ���� �˻� -->
			/* var htmlStr = '<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" />';
			if($("select[name='searchCondition']").val() == null || $("select[name='searchCondition']").val() < 2) {
				var htmlStr = '<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:200px; height:19px" autocomplete="on" />';
				console.log("select ����"+htmlStr);
				console.log(changeHtml);
				$('span').html(htmlStr);
			} else {
				var changeHtml = "<input type='text' name='searchKeyword' value='${search.searchKeyword}' class='ct_input_g' style='width:80px; height:19px' />��~"
					+'<input type="text" name="searchKeywordPrice"  value="${search.searchKeywordPrice}" class="ct_input_g" style="width:80px; height:19px" />��';
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
			        			value : value.prodName //������ key,, ���ýø� ����
			        		}
			        	}));
			          }
			        } );
			    }
			});
			
			
			//<!-- �˻��� ���� -->
			$("input:text[name='searchKeyword']").bind('keydown', function(event){
					
					if(event.keyCode == 13) {
						alert("keydown  "+event.keyCode);
						event.preventDefault();
						$(".btn:contains('�˻�')").click();
					}
			});
			
			//<!-- �˻���ư �������� -->
			$(".btn:contains('�˻�')").bind('click', function(){
				
				console.log("�˻� searchKeyword : "+$("input:text[name='searchKeyword']").val());
				console.log("�˻� searchKeywordPrice : "+$("input:text[name='searchKeywordPrice']").val());
				
				//var searchKeyword = document.detailForm.searchKeyword.value;
				var searchKeyword = $("input:text[name='searchKeyword']").val();
				
				if(searchKeyword == null || searchKeyword.length < 1) {
					alert("�˻�� �Է��Ͻʽÿ�");
					return;
				} else {
					fncGetList(1);
				}
			}); 
			
			//<!-- ���ݰ˻� �������� -->
			/* $("select[name='searchCondition']").bind('change', function(){
				console.log("select change : :  :"+$(this).html());
				$('span').html(htmlStr);
				
				$("input:text[name='searchKeyword']").val('');
				console.log("val Ȯ�� 1 : "+$("input:text[name='searchKeyword']").val());
				
				//<input type="text" name="searchKeyword"  value="${search.searchKeyword}" class="ct_input_g" style="width:80px; height:19px" />�� ~
				//<input type="text" name="searchKeywordPrice"  value="${search.searchKeywordPrice}" class="ct_input_g" style="width:80px; height:19px" />��
				
				if($(this).val() == 2) {
					
					$("input:text[name='searchKeyword']").val('');	
					$("input:text[name='searchKeywordPrice']").val('');
					
					console.log("val Ȯ�� 2 : "+$("input:text[name='searchKeywordPrice']").val());
					
					var changeHtml = "<input type='text' name='searchKeyword' value='' class='ct_input_g' style='width:80px; height:19px' />��~"
					+"<input type='text' name='searchKeywordPrice'  value='' class='ct_input_g' style='width:80px; height:19px' />��";
					console.log(changeHtml);
					
					$('span').html(changeHtml);
					$('span input:text[name="searchKeyword"]').val("${search.searchKeyword}");
					$('span input:text[name="searchKeywordPrice"]').val("${search.searchKeywordPrice}");
				}
				
			}); */
			
			//<!-- �̸����� -->
			$("select[name='sortCondition']").bind('change', function(){
				//console.log("�̸� ����"+$(this).text());
				$("select[name='sortCondition2']").val("");
				fncGetList(1);
			});
			
			//<!-- �������� -->
			$("select[name='sortCondition2']").bind('change', function(){
				$("select[name='sortCondition']").val("");
				fncGetList(1);
			});
			
			//<!-- manager �Ǹ� �Ϸ� ��ǰ -->
			$(".ct_btn01:contains('���� ��ǰ ����')").bind('click', function(){
				console.log($(this).html());
				self.location = "/purchase/listSale?menu=${param.menu}";
				//fncGetList(1);
			});
			
			//<!-- search �Ǹ� �Ϸ� ��ǰ -->
			$(".btn:contains('�Ǹŵ� ��ǰ')").bind('click', function(){
				$("#searchSoldProd").val("1");
				fncGetList(1);
			});
		
			//<!-- ��ǰ �󼼺���-->
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
				title : "��ǰ����",
				width : 400,
				buttons : {
					"�����ϱ�" : function(){
						self.loaction="";
					},
					"�ݱ�" : function(){
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
							
							var htmlStr ="<table class='table'><tr><td class='danger'>��ǰ��</td>"
												+"<td>"+JSONData.prodName+"</td></tr>"
												+"<tr><td class='danger'>������</td><td>"+JSONData.prodDetail+"</td></tr>"
												+"<tr><td class='danger'>����</td><td>"+JSONData.price+"</td></tr>"
												+"<tr><td class='danger'>��������</td><td>"+JSONData.manuDate+"</td></tr>"
												+"<tr><td class='danger'>�̹���</td>";
												
												
							
							for(var i = 0; i < JSONData.fileName.length; i++){
								htmlStr += "<td><img class='img-thumbnail' src='../images/uploadFiles/"+JSONData.fileName[i]+"'/>";
							}
							htmlStr += "</td></table>";
							
							$("#dialog").html(htmlStr);
							
						}
						
					})
				}
			}) */
			
			$(".btn:contains('��ǰ����')").bind('click', function(){
				fncGetProduct($(this).val());
			})
			
			$(".thumbnail > a").bind('click', function(){
				console.log($(this).attr('id'));
				self.location = "/product/getProduct?prodNo="+$(this).attr('id')+"&menu='search''";
			})
			
			$(".btn:contains('�ٷα���')").bind('click', function(){
				purchaseProduct($(this).val());
			})
			
			$(".btn:contains('��ǰ����')").bind('click', function(){
				updateProduct($(this).val());
			})
			
			/* $(".btn:contains('�󼼺���')").bind('click', function(){
				
				
				var prodNo = $("input:hidden[name='pNo']").val();
				console.log("prodNO===>"+prodNo);
				
				//<!-- ajax ��ǰ ���� -->
				$.ajax({
					url : "/product/json/getProduct/"+prodNo,
					method : "get",
					dataType : "json",
					success : function(JSONData, status){
						console.log(status);
						console.log(JSON.stringify(JSONData));
						var displayStr = "<h4>��ǰ�� : "+JSONData.prodName+"<br>"
												+"��ǰ������ : "+JSONData.prodDetail+"<br>"
												+"��ǰ���� : "+JSONData.prodDetail+"��<br>";
						if(JSONData.fileName != null) {
							displayStr += "��ǰ�̹��� : <br>";
							var fileName = "";
							for(var i = 0; i < JSONData.fileName.length; i++) {
								displayStr += "<img width='100px' heigth='100px' src='../images/uploadFiles/"+JSONData.fileName[i]+"'>";
							}
						}
						<c:if test="${param.menu == 'manage'}">
							displayStr += "<br><input type='button' value='�����ϱ�' onclick='updateProduct("+prodNo+")'>";
						</c:if>
						<c:if test="${param.menu == 'search'}">
						displayStr += "<br><input type='button' value='�����ϱ�' onclick='purchaseProduct("+prodNo+")'>";
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
			
			//<!-- ���ڵ�� -->
			/* console.log($($("div")[1]).html());
			$($("div")[1]).accordion({	
				header : "a",
				collapsible : true,
				event : "click",
				heightStyle : "fill"
			}); */
			
			//<!-- �� -->
			/* $($("div")[1]).tabs({
				collapsible : true,
				active : 1,
				event : "click"
			}); */
			
			
			
			//<!-- �̹����̸����� file tootip -->
			$("p").tooltip({
					items : "[data-photo]",			
					content : function(){
						var path = $(this).data('photo');
						console.log("html �±� :: <img src='../images/uploadFiles/'"+path+"'> ");
						return "<img class='prod_img' src='../images/uploadFiles/"+path+"'> ";
					}
			});
			
			//console.log($("a").tooltip("option","content"));
			
			
			$(".ct_list_pop td:nth-child(5)").button().bind('click', function(){
				
				console.log($(this).text().trim());
				
				console.log($("input:hidden[name='pNo']",this).val())
				
				var result = confirm("������ �����Ͻðڽ��ϱ�?");
				if(result) {
					self.location="/product/deleteProduct?prodNo="+$("input:hidden[name='pNo']",this).val();
				} else {
					return;
				}
			});
			
			$("p:contains('�ڷ�')").bind("click", function(){
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
		
		//���ѽ�ũ��...................................................
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
						console.log("��");
						count++;
						
						getProductList(count);					
						
					} else if(count > ${resultPage.maxPage}) {
						alert("�������Դϴ�"+count+"${resultPage.maxPage}");
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
						alert("�������Դϴ�");
					}
					for(var i = 0; i < JSONData.productList.length; i++) {
						$("#scrollProd").removeClass();
						var fileName = JSONData.productList[i].fileName[0];
						console.log(fileName);
						var htmlStr = "<div class='col-md-offset-1 col-md-3'><div class='thumbnail'><a id='"+JSONData.productList[i].prodNo+"' href='#'><img src='../images/uploadFiles/"+fileName+"'></a>"+
											"<div class='caption text-center'><p><small>"+JSONData.productList[i].prodName+"</small></p>"+
											"<p class='text-primary'>"+JSONData.productList[i].price+"��</p>"+
											"<p>";
											
						<c:if test="${param.menu == 'search'}">
							htmlStr += "<button class='btn btn-default btn-sm' value='"+JSONData.productList[i].prodNo+"'>��ǰ����</button>"+
			 				 				"<button class='btn btn-danger btn-sm' value='"+JSONData.productList[i].prodNo+"'>�ٷα���</button>";
						</c:if>
											
						<c:if test="${param.menu == 'manage'}">
							htmlStr +="<button class='btn btn-primary btn-sm' value='"+JSONData.productList[i].prodNo+"'>��ǰ����</button></p>";
						</c:if>
											
						htmlStr += "</p></div></div></div></div>";
						
						$("#scrollProd").append(htmlStr);
						
						$(".btn:contains('��ǰ����')").bind('click', function(){
							fncGetProduct($(this).val());
						})
						
						$(".thumbnail > a").bind('click', function(){
							console.log($(this).attr('id'));
							self.location = "/product/getProduct?prodNo="+$(this).attr('id')+"&menu=${param.menu}";
						})
						
						$(".btn:contains('�ٷα���')").bind('click', function(){
							purchaseProduct($(this).val());
						})
						
						$(".btn:contains('��ǰ����')").bind('click', function(){
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
				htmlStr += "<input type='text' id='searchKeywordPrice' name='searchKeywordPrice' value='${search.searchKeywordPrice}' class='form-control input-sm' placeholder='�ִ�ݾ�'>";
				$("#searchField").append(htmlStr);
		} */
		
		$(function(){
			$(".btn:contains('����')").bind('click',function(){
				alert("���ݰ˻�")				
				$("form[name='priceForm']").attr("method","post").attr("action","/product/listProduct").submit();
			})
		})
		
		$(function(){
			$(".btn:contains('�����ϱ�')").bind('click',function(){
				console.log($(this).text().trim());
				
				var result = confirm("������ �����Ͻðڽ��ϱ�?");
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
			<h3 class="text-info">��ǰ���</h3>
			<small class="text-muted">�Ǹ� ��ǰ ����Ʈ</small>
		</div>
		
		<!-- SEARCH -->
		<div class="row">
			<form class="form-inline" name="detailForm">
					<div class="form-group col-md-2">
						<c:if test="${search.searchSoldProd == 1}">
							<p>�ڷ�</p>
						</c:if>
						<input type="hidden" id="searchSoldProd" name="searchSoldProd" value="${search.searchSoldProd}"/>
						<button class="btn btn-default btn-sm">�Ǹŵ� ��ǰ</button>
					</div>
					<div class="form-group col-md-offset-4 col-md-6">
						<select name="searchCondition" class="form-control input-sm col-md-6">
							<c:if test="${param.menu == 'manage'}">
							<option value="0" ${!empty search.searchCondition && search.searchCondition == 0 ? "selected" : ""}>��ǰ��ȣ</option>
							</c:if>
							<option value="1" ${!empty search.searchCondition && search.searchCondition == 1 ? "selected" : ""}>��ǰ��</option>
							<%-- <option value="2" ${!empty search.searchCondition && search.searchCondition == 2 ? "selected" : ""}>����</option> --%>
						</select>
						<input type="text" id="searchKeyword" name="searchKeyword" value="${search.searchKeyword}"  class="form-control input-sm" placeholder="�˻��� �Է�">
						<button class="btn btn-default btn-sm">�˻�</button>
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
					</div>
			</form>
			<form class="form-inline col-md-offset-6" name="priceFrom">
				<input type="hidden" id="searchCondition" name="searchCondition" value="2">
				<div class="form-group">
					<input type="text" id="searchLowPrice" name="searchLowPrice" value="${search.searchLowPrice}"  class="form-control input-sm" placeholder="�ּұݾ�">��~
					<input type="text" id="searchHighPrice" name="searchHighPrice" value="${search.searchHighPrice}"  class="form-control input-sm" placeholder="�ִ�ݾ�">��
				</div>
				<div class="form-group">
					<button class="btn btn-default btn-sm">����</button>
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
             				<h1>���ڽŻ�</h1>
              				<p>�̰��� ���󸮴�</p>
              				<p><a class="btn btn-lg btn-primary" href="#" role="button">�����ϱ�</a></p>
           				</div>
          			</div>
        		</div>
        		<div class="item">
          			<img class="second-slide" src="../images/uploadFiles/chanel2.jpg" alt="Second slide">
          			<div class="container">
           				<div class="carousel-caption">
              				<h1>�����</h1>
              				<p>���ο� ����� �� ���� ����������</p>
              				<p><a class="btn btn-lg btn-primary" href="#" role="button">���˾ƺ���</a></p>
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
    	
    	<!-- �̹����Ѹ� -->
		<div class="row">
			<c:if test="${!empty list}">
			<c:forEach var="product" items="${list}">
				<div class="col-md-3">
					<div class="thumbnail">
							<a id="${product.prodNo}" href="#"><img alt="http://placehold.it/200x150" src="../images/uploadFiles/${product.fileName[0]}"></a>
							<div class="caption text-center">
									<p><small>${product.prodName}</small></p>
									<p class="text-primary">${product.price}�� ��� : ${product.prodStock}</p>
									<p>
										<c:if test="${param.menu == 'search'}">
											 <c:if test="${product.proTranCode != 4}">
												  <button class="btn btn-primary btn-sm" value="${product.prodNo}">��ǰ����</button>
												  <button class="btn btn-default btn-sm" value="${product.prodNo}">�ٷα���</button>
											  </c:if>
										</c:if>
										<c:if test="${param.menu == 'manage'}">
										  <button class="btn btn-sm" value="${product.prodNo}">��ǰ����</button>
										  <button class="btn btn-default btn-sm" value="${product.prodNo}">�����ϱ�</button>
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
					<p class="text-muted text-center">�����Ͱ� �����ϴ�.</p>
				</div>
			</c:if>
	
				
		</div>
		
		
		<!--  ���������� -->
		
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
						<p class="text-primary">${product.price}��</p>
						<p><button class="btn btn-default btn-sm">�󼼺���</button>
							  <button class="btn btn-danger btn-sm">�ٷα���</button></p>
					</div>
					</div>
				</div>
			</c:forEach>
		</div> --%>
		
		<!-- ���̺� ���� -->
		<%-- <div class="row">
			<div class="col-md-offset-3 col-md-6 col-md-offset-3">
	          <table class="table table-striped table-condensed">
	            <thead>
	            	<tr class="danger">
		                <th>No</th>
		                <th>��ǰ��</th>
		                <th>����</th>
		                <th>�����</th>
		                <th>����</th>
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
			                <td>${product.price}��</td>
			                <td>${product.regDate}</td>
			                <td><input type="hidden" name="pNo" value="${product.prodNo}"/>����</td>
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