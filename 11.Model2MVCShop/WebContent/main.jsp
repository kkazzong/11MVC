<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js" type="text/javascript"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <!-- <link href="/css/animate.min.css" rel="stylesheet"> -->
   <!-- <link rel="stylesheet" href="/css/style.css"> -->
   <!-- <link rel="stylesheet" href="/css/main.css"> -->
   <!-- <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
   <link href="/css/dropdown-tube.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <!-- <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
   <script src="/js/main.js" type="text/javascript"></script>
   <!-- masonry cdn -->
	<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
   <script type="text/javascript">
   function fncChart(){
	   
	   var data = {
			   labels: ["상품갯수", "팔린상품", "회원수", "방문자수"],
			   datasets: [{
				   label : "Tube Shop",					   
	 			     backgroundColor: [
	 					"rgba(168, 145, 253, 0.4)",
	 					"rgba(253, 166, 160, 0.4)",
	 					"rgba(253, 215, 165, 0.4)",
	 					"rgba(155, 211, 253, 0.4)"
	 			     ], 
	 			     borderColor: [
	 					"rgba(168, 145, 253, 1)",
	 					"rgba(253, 166, 160, 1)",
	 					"rgba(253, 215, 165, 1)",
	 					"rgba(155, 211, 253, 1)"          
	 			     ],
	 			     borderWidth: 1,
	 			     hoverBackgroundColor: [
	 			        "rgba(168, 145, 253, 0.8)",
	 			        "rgba(253, 166, 160, 0.8)",
	 			        "rgba(253, 215, 165, 0.8)",
	 			        "rgba(155, 211, 253, 0.8)"
	 			     ],
	 			     hoverBorderColor: [
	 			    	"rgba(168, 145, 253, 1)",
	 			    	"rgba(253, 166, 160, 1)",
	 			    	"rgba(253, 215, 165, 1)",
	 			    	"rgba(155, 211, 253, 1)"          
	 			  	],
			     	data: [65, 59, 20, 81],
			   }]
		 };

			 var options = {
			   maintainAspectRatio: false,
			   scales: {
			     yAxes: [{
			       stacked: true,
			       gridLines: {
			         display: false,
			         color: "rgba(255,99,132,0.2)"
			       }
			     }],
			     xAxes: [{
			       gridLines: {
			         display: false
			       }
			     }]
			   }
			 };

			 Chart.Line('chartLine', {
			   options: options,
			   data: data
			 });
			 
			 Chart.Bar('chartBar', {
				   options: options,
				   data: data
				});
			 
			 var myDoughnutChart = new Chart('chartDoughnut', {
				    type: 'doughnut',
				    data: data,
				    options: options
				});
			 
			 var myPieChart = new Chart('chartPie', {
				    type: 'pie',
				    data: data,
				    options: options
				});
	   
   }
   
   function getProductAjax(prodNo,elem){
		
	   $.ajax({
		  
		   url : "/product/json/getProduct/"+prodNo,
		   method : "get",
		   dataType : "json",
		   success : function(JSONData){
			   
			   console.log(JSON.stringify(JSONData));
			   
			   var htmlStr = "";
			   htmlStr += "<p>"
				  
				   var prodName = JSONData.prodName;
				   var price = JSONData.price;
				   var detail = JSONData.prodDetail;
				   var manu = JSONData.manuDate;
				   
				   htmlStr += "상품명 : ";
				   htmlStr += prodName+"<br>";
				   htmlStr += "가격 : ";
				   htmlStr += price+"<br>";
				   htmlStr += "상세정보 : ";
				   htmlStr += detail+"<br>";
				   htmlStr += "제조일자 : ";
				   htmlStr += manu;
			   htmlStr += "</p>";
			   
			   $(".grid-item-content > p").remove();
			   $($(elem),".grid-item-content").append(htmlStr);
		   }  
	   })
   }
   
   
    $(function(){
    	
    	$.ajax({
    		
    		url : "/product/json/listProduct",
    		method : "get",
    		dataType : "json",
    		success : function(JSONData){
    			
    			for(var i = 0; i < 3; i++) {
    				var fileName = JSONData.productList[i].fileName[0];
    				$($(".slide img")[i]).attr("src","/images/uploadFiles/"+fileName);
    				$($(".btn:contains('더보기')")[i]).attr("href","/product/getProduct?prodNo="+JSONData.productList[i].prodNo+"&menu=search");
    			}
    			
    			var htmlStr = '<div class="grid"><div class="col-md-offset-1">';
    			
    			for(var index = 0; index < 5; index++){
    				
    				var prodNo = JSONData.productList[index].prodNo;
    				var prodName = JSONData.productList[index].prodName;
    				var price = JSONData.productList[index].price;
    				var fileName = JSONData.productList[index].fileName[0];
    				
    				htmlStr += '<div class="grid-item">';
    				htmlStr += '<div class="grid-item-content text-center">';
    				htmlStr += '<a id="'+prodNo+'" href="#">';
    				htmlStr += '<img data-toggle="tooltip" data-placement="auto bottom" title="'+prodName+"<br>"+price+"원"+'" src="../images/uploadFiles/'+fileName+'">';
    				htmlStr += "</a></div></div>";
    				
    				
    			}
    			htmlStr += "</div></div>";
    			
    			//alert(htmlStr);
    			
    			$("#product").html(htmlStr);
    				
    			var $grid = $(".grid").masonry({
    		             itemSelector : ".grid-item",
    		             columnWidth : 110
    		     }); 
    		    
    			
    		      $grid.on("click", ".grid-item-content", function(event){
    		        
    		        event.preventDefault();
    		        //self.location = "/product/getProduct?prodNo="+$(this).children("a").attr("id")+"&menu=search"
    		        
    		        $(event.currentTarget).parent(".grid-item").toggleClass("is-expanded");
    		        
    		        $(event.currentTarget).children("p").addClass("sr-only");
    		        
    		        getProductAjax($(this).children("a").attr("id"),$(this));
    		        	
    		        $grid.masonry();
    		        	
    		      })
    		      
    		      $(function () {
  					$('[data-toggle="tooltip"]').tooltip({
  						html : true,
  						delay : {"show" : 300, "hide" : 400}
  							
  					})
				  })
    			
    		}
    		
    	})
    	
    	
    	$("#myCarousel").carousel({
    		interval : 2000
    	});
    	
    	fncChart();
    	
    })
    
  
   </script>
	<style>
	 	 body {
	         padding-top : 70px;
	     }
	     #myCarousel, .carousel-inner{
	     	height : 230px;
	     	/* margin: 0 auto; */
	     }
	      section {
	      	height:inherit;
	         padding-top : 120px;
	         margin-top : 20px;
	     }
	     iframe{
		    margin: 0 auto;
	     } 
	     .chart-container{
	     	height : 230px;
	     	width : 600px;
	     	margin: 0 auto;
	     }
	     
	     * { box-sizing: border-box; }

		body { font-family: sans-serif; }

		.grid {
		  max-width: 1200px;
		  padding-bottom : 200px;
		}

		.grid-item {
		  width: 210px;
		  height: 210px;
		  float: left;
		  padding : 10px 5px 10px 5px;
		  
		} 
	
		/* item is invisible, but used for layout */
		.grid-item,
		.grid-item-content {
		  width: 210px;
		  height: 210px;
		}
		
		/* grid-item-content is visible, and transitions size */
		.grid-item-content {
		  width: 210px;
		  height: 310px;
		  background: white;
		  border: 1px solid #70cbce;
		  /* border-color: hsla(0, 0%, 0%, 0.5); */
		  border-color : hsla(0, 8%, 40%, 0.5);
		  border-radius: 5px; 
		  -webkit-transition: width 0.4s, height 0.4s;
		   transition: width 0.4s, height 0.4s;
		}

		.grid-item:hover .grid-item-content {
		  border-color: #70cbce;
		  background: white;
		  cursor: pointer;
		}
		
		/* both item and item content change size */
		.grid-item.is-expanded,
		.grid-item.is-expanded .grid-item-content {
		  width: 310px;
		  height: 310px;
		   posotion : relative;
		}
		
		.grid-item.is-expanded {
		  z-index: 10;
		}
		
		.grid-item.is-expanded .grid-item-content {
		  background: #70cbce;
		}
		.grid-item-content > a > img {
			width: 200px;
	  		height: 180px;
	        /* border-radius : 10px; */
	        -webkit-transition: width 0.4s, height 0.4s;
		    transition: width 0.4s, height 0.4s;
		}
		.tooltip.bottom .tooltip-inner {
			color:#70cbce;
		}
	</style>
</head>

	<%-- <jsp:include page="/product/listProduct.jsp"/> --%>
<body>
	<jsp:include page="/layout/toolbarTube.jsp" />
	
	<section id="main-info" class="pad-xl">
		<div class="container">
			<div class="page-header text-center wow fadeIn" data-wow-delay="0.4s">
				<h3>Today's product</h3>
			</div>
	</div>
	
	<div class="container">
		<div class="col-md-6">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
	        <div class="item active">
	          <img class="slide" src="" alt="First slide" style="width : 600px; height : 230px;">
	          <div class="container">
	            <div class="carousel-caption">
	              <p><a class="btn btn-default" href="#" role="button">더보기<span class="badge"></span></a></p>
	            </div>
	          </div>
	        </div>
	        <div class="item">
	          <img class="slide" src="" alt="Second slide" style="width : 600px; height : 230px;">
	          <div class="container">
	            <div class="carousel-caption">
	              <p><a class="btn btn-default" href="#" role="button">더보기 <span class="badge"></span></a></p>
	            </div>
	          </div>
	          </div>
	        <div class="item">
	          <img class="slide" src="" alt="Third slide" style="width : 600px; height : 230px;">
	          <div class="container">
	            <div class="carousel-caption">
	              <p><a class="btn btn-default" href="#" role="button">더보기 <span class="badge"></span></a></p>
	            </div>
	          </div>
	         </div>
        </div>
    	</div>
	</div>
	
	<div class="col-md-1"></div>
			<div class="col-md-4">
				<video poster="/img/thumbnail.jpg" controls="controls" autoplay="autoplay" height="230px">
					<source src="http://media.w3.org/2010/05/bunny/movie.ogv"/>
				</video>
			</div>
	</div>
	
	</section>
	
	<section id="sub-info" class="pad-xl">
		<div class="container">
			<div class="page-header text-center wow fadeIn" data-wow-delay="0.4s">
				<h3>Intro</h3>
			</div>
			<div class="row">
				<div class="md-offset-1 md-col-4">
					<div class="chart-container">
		    			<canvas id="chartBar"></canvas>
					</div>
				</div>
				<div class="row">
				<div class="md-offset-1 md-col-4">
					<div class="chart-container">
		    			<canvas id="chartPie"></canvas>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
	<section id="sub-info" class="pad-xl">
		<div class="container">
			<div class="page-header text-center wow fadeIn" data-wow-delay="0.4s">
				<h3>Preview</h3>
			</div>
			<div id="product"></div>
		</div>
	</section>
	
	<!-- pop over -->
	<div class="popover" role="tooltip">
		<div class="arrow"></div>
		<h3 class="popover-title"></h3>
		<div class="popover-content"></div>
	</div>
	
</body>
</html>	
	