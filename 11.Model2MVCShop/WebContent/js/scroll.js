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
					console.log(JSON.stringify(JSONData.productList));
					
					if(JSONData.productList.length == 0) {
						alert("마지막입니다");
					}
					for(var i = 0; i < JSONData.productList.length; i++) {
						$("#scrollProd").removeClass();
						var fileName = JSONData.productList[i].fileName[0];
						console.log(fileName);
						var htmlStr = "<div class='col-md-offset-1 col-md-3'><div class='thumbnail'><a id='"+JSONData.productList[i].prodNo+"' href='#'><img src='../images/uploadFiles/"+fileName+"'></a>"+
											"<div class='caption text-center'><p><small>"+JSONData.productList[i].prodName+"</small></p>"+
											"<p class='text-primary'>"+JSONData.productList[i].price+"원</p>";
											
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
			
		var count = 1;
		
		//무한스크롤...................................................
			$(window).bind("scroll",function(){
				/* console.log("scrolling....");
				console.log("doc > "+$(document).height());
				console.log("win > "+$(window).height());
				console.log("cur > "+$(window).scrollTop()); */
				
				if($(window).scrollTop() >= $(document).height() - $(window).height()) {
					console.log("끝");
					count++;
					getProductList(count);					
				}
			});