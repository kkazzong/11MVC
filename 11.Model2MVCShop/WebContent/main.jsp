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
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <!-- <link rel="stylesheet" href="/css/style.css"> -->
   <!-- <link rel="stylesheet" href="/css/main.css"> -->
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <script type="text/javascript">
    $(function(){
    	//$("#myCarousel").carousel('cycle');
    	
    	$.ajax({
    		
    		url : "/product/json/listProduct",
    		method : "get",
    		dataType : "json",
    		success : function(JSONData){
    			//alert(JSON.stringify(JSONData));
    			
    			for(var i = 0; i < 3; i++) {
    				var fileName = JSONData.productList[i].fileName[0];
    				//alert($($(".slide img")[i]).html());
    				$($(".slide img")[i]).attr("src","/images/uploadFiles/"+fileName);
    				$($(".btn:contains('더보기')")[i]).attr("href","/product/getProduct?prodNo="+JSONData.productList[i].prodNo+"&menu=search");
    			}
    			
    		}
    		
    	})
    	
    	$("#myCarousel").carousel({
    		interval : 2000
    	});
    	
    })
    
  
   </script>
	<style>
	 	 body {
	         padding-top : 70px;
	     }
	     #myCarousel, .carousel-inner{
	     	width : 600px;
	     	height : 230px;
	     	margin: 0 auto;
	     }
	      section {
	         padding-top : 120px;
	     }
	     iframe{
		    margin: 0 auto;
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
        <!-- <div class="item">
          <img class="slide" src="/img/carousel2.png" alt="Second slide" style="width : 600px; height : 230px;">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-default" href="#" role="button">더보기</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="slide" src="/img/carousel3.png" alt="Third slide" style="width : 600px; height : 230px;">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button"> Browse gallery <span class="badge">4</span> </a></p>
            </div>
          </div>
        </div> -->
      <!-- <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a> -->
    </div><!-- /.carousel -->
	</div>
	</section>
	
	<section id="sub-info" class="pad-xl">
		<div class="container">
			<div class="page-header text-center wow fadeIn" data-wow-delay="0.4s">
				<h3>Intro</h3>
			</div>
		</div>
		
		<div class="container">
			<div class="col-md-offset-3">
				<iframe width="560" height="315" src="https://www.youtube.com/embed/WNPg1t3zh1U" frameborder="0" allowfullscreen></iframe>
			</div>
		</div>
	</section>
	
</body>
</html>	
	