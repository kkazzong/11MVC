<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ///////////////////////////// 로그인시 Forward  /////////////////////////////////////// -->
 <c:if test="${ ! empty user }">
 	<jsp:forward page="main.jsp"/>
 </c:if>
 <!-- //////////////////////////////////////////////////////////////////////////////////////////////////// -->


<!-- <!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	참조 : http://getbootstrap.com/css/  
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	 ///////////////////////// Bootstrap, jQuery CDN //////////////////////////
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	 ///////////////////////// CSS //////////////////////////
	<style></style>
   	
   	 ///////////////////////// JavaScript //////////////////////////
	<script type="text/javascript">
		
		//============= 회원원가입 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로 그 인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
	</script>	
	
</head>

<body>

	ToolBar Start /////////////////////////////////////
	<div class="navbar  navbar-default">
		
        <div class="container">
        
        	<a class="navbar-brand" href="#">Model2 MVC Shop</a>
			
			toolBar Button Start ////////////////////////
			<div class="navbar-header">
			    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </button>
			</div>
			toolBar Button End ////////////////////////
			
			<div class="collapse navbar-collapse"  id="target">
	             <ul class="nav navbar-nav navbar-right">
	                 <li><a href="#">회원가입</a></li>
	                 <li><a href="#">로 그 인</a></li>
	           	</ul>
	       </div>
   		
   		</div>
   	</div>
   	ToolBar End /////////////////////////////////////
   	
	 화면구성 div Start /////////////////////////////////////
	<div class="container">
		
		다단레이아웃  Start /////////////////////////////////////
		<div class="row">
	
			 Menu 구성 Start /////////////////////////////////////     	
			<div class="col-md-3">
		        
		       	 회원관리 목록에 제목
				<div class="panel panel-primary">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>
         			 회원관리 아이템
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">개인정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="#">판매상품등록</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
						 <li class="list-group-item">
						 	<a href="#">판매상품관리</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
		        </div>
               
               
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="#">상품검색</a></li>
						  <li class="list-group-item">
						  	<a href="#">구매이력조회</a> <i class="glyphicon glyphicon-ban-circle"></i>
						  </li>
						 <li class="list-group-item">
						 	<a href="#">최근본상품</a> <i class="glyphicon glyphicon-ban-circle"></i>
						 </li>
					</ul>
				</div>
				
			</div>
			 Menu 구성 end /////////////////////////////////////   

	 	 	 Main start /////////////////////////////////////   		
	 	 	<div class="col-md-9">
				<div class="jumbotron">
			  		<h1>Model2 MVC Shop</h1>
			  		<p>로그인 후 사용가능...</p>
			  		<p>로그인 전 검색만 가능합니다.</p>
			  		<p>회원가입 하세요.</p>
			  		
			  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">로 그 인</a>
			  		</div>
			  	
			  	</div>
	        </div>
	   	 	 Main end /////////////////////////////////////   		
	 	 	
		</div>
		다단레이아웃  end /////////////////////////////////////
		
	</div>
	 화면구성 div end /////////////////////////////////////

</body>

</html> -->
<!DOCTYPE html>
<html lang="en"><head>
  <meta charset="utf-8">
  <title>Tube Shop</title>
  <meta name="keywords" content="">
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  
  <meta property="og:title" content="">
	<meta property="og:type" content="website">
	<meta property="og:url" content="">
	<meta property="og:site_name" content="">
	<meta property="og:description" content="">

  <!-- Styles -->
  <link rel="stylesheet" href="/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/animate.css">
  <link rel="stylesheet" href="/css/owl.carousel.css">
  <link rel="stylesheet" href="/css/style.css">
  <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900|Montserrat:400,700' rel='stylesheet' type='text/css'>
  

  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/main.css">

  <script src="/js/modernizr-2.7.1.js"></script>
  <style type="text/css">
  	.logo > img {
		margin-top: 6px;
		width : 40px;
		heigth : 40px;
	}
	#main-info img {
		margin-top: 6px;
		width : 320px;
		heigth : 630px;
	}
	.navbar {
    border: 0px solid rgba(0, 0, 0, 0);
    background: #70cbce;
    margin: auto;
    min-height: 60px;
    padding-top: 8px;
    position: fixed;
    top: -60px;
    transition: top 0.4s ease 0s;
}

.navbar.open {
    top: 0;
}

.navbar-inverse .navbar-nav > li > a, .navbar-nav a {
    color: #ffffff;
    font-size: 14px;
    letter-spacing: 1px;
}

.navbar-inverse .navbar-nav > li > a:hover {
    color: #ffffff;
    opacity: 0.6;
}

.nav > li > a {
    position: relative;
    display: block;
    padding: 10px 10px;
}

.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
    border-color: #4ec3cd;
}

.navbar-inverse .navbar-toggle {
    border-color: transparent;
}

.logo img {
	margin-top: 6px;
}
h1, h2, h3, h4, h5, h6, p, .btn, .navbar-nav a, .form-control, .list-inline, small, #pricing {
  font-family: 'Montserrat', sans-serif;
}
.panel-footer{
	background-color: #FFE1E8;
	font-family: 'Montserrat', sans-serif;
}

  </style>
</head>

<body>

    
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="logo" href="index.jsp"><img src="/images/tube.png" alt="Logo">&nbsp;&nbsp;TUBE SHOP</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#invite">Location</a></li>
            <li><a href="#">Log in</a></li>
          </ul>
        </div><!--/.navbar-collapse -->
      </div>
    </div>
        
    <header>
      <div class="container">
        <div class="row">
          <div class="col-xs-6">
          	<!-- 화면 로고 -->
            <a class="logo" href="index.jsp"><img src="/images/tube.png" alt="Logo">&nbsp;&nbsp;TUBE SHOP</a>
          </div>
          <div class="col-xs-6 signin text-right navbar-nav">
            <a href="#invite" class="scroll">Location</a>&nbsp; &nbsp;<a href="#">Log in</a>
          </div>
        </div>
        
        <div class="row header-info">
          <div class="col-sm-10 col-sm-offset-1 text-center">
            <!-- <h1 class="wow fadeIn">A peach is </h1>
            <br /> -->
            <!-- <p class="lead wow fadeIn" data-wow-delay="0.5s">Welcome to PeachShop
            <br>You can buy anything you want. Now let's get start it</p> -->
            <!-- <br /> -->
              
            <div class="row">
              <div class="col-md-10 col-md-offset-2 col-sm-10 col-sm-offset-1">
                <div class="row">
                  <div class="col-xs-6 text-right wow fadeInUp" data-wow-delay="1s">
                    <a href="#be-the-first" class="btn btn-secondary btn-lg scroll">About Us</a>
                  </div>
                  <!-- <div class="col-xs-6 text-left wow fadeInUp" data-wow-delay="1.4s">
                    <a href="#invite" class="btn btn-primary btn-lg scroll">Request Invite</a>
                  </div> -->
                </div><!--End Button Row-->  
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </header>
    
    <div class="mouse-icon hidden-xs">
				<div class="scroll"></div>
	</div>
    
    
    <section id="main-info" class="pad-xl">
	    <div class="container">
		    <div class="row">
			    <div class="col-sm-4 wow fadeIn" data-wow-delay="0.4s">
	    			<div class="panel panel-default">
		    			<div class="panel-body">
					    	<img alt="hi" src="/images/uploadFiles/apeach.jpg">
						    <h3>App Feature One Here</h3>
						    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra orci ut est facilisis, eu elementum mi volutpat. Pellentesque ac tristique nisi.</p>
			    		</div>
	    				<div class="panel-footer">
	    					Panel footer
	    				</div>
			 		</div>
	    		</div>
	    		<div class="col-sm-4 wow fadeIn" data-wow-delay="0.4s">
	    			<div class="panel panel-default">
		    			<div class="panel-body">
					    	<img alt="hi" src="/images/uploadFiles/apeach.jpg">
						    <h3>App Feature One Here</h3>
						    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra orci ut est facilisis, eu elementum mi volutpat. Pellentesque ac tristique nisi.</p>
			    		</div>
	    				<div class="panel-footer">
	    					Panel footer
	    				</div>
			 		</div>
			 		
	    		</div>
	   		</div>
	    </div>
    </section>
    
  <!-- teastimonial -->
  <section id="tstm_sec">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="all_tstm">
					
				<div class="clnt_tstm">
					<div class="sngl_tstm">
						<i class="fa fa-quote-right"></i>
						<h3>what people say?</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur sequi accusamus voluptatum rem itaque alias deleniti nostrum aperiam fugiat voluptates debitis praesentium incidunt accusantium distinctio,</p>
						<h6>- jhon deo</h6>					
					</div>
				</div>						
				
				<div class="clnt_tstm">
					<div class="sngl_tstm">
						<i class="fa fa-quote-right"></i>
						<h3>Clien Design</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur sequi accusamus voluptatum rem itaque alias deleniti nostrum aperiam fugiat voluptates debitis praesentium incidunt accusantium distinctio,</p>
						<h6>- shura deo</h6>					
					</div>
				</div>				
				<div class="clnt_tstm">
					<div class="sngl_tstm">
						<i class="fa fa-quote-right"></i>
						<h3>Awesome Support SIMA</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur sequi accusamus voluptatum rem itaque alias deleniti nostrum aperiam fugiat voluptates debitis praesentium incidunt accusantium distinctio,</p>
						<h6>- kumara deo</h6>					
					</div>
				</div>				
				<div class="clnt_tstm">
					<div class="sngl_tstm">
						<i class="fa fa-quote-right"></i>
						<h3>Theme Feature great</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur sequi accusamus voluptatum rem itaque alias deleniti nostrum aperiam fugiat voluptates debitis praesentium incidunt accusantium distinctio,</p>
						<h6>- dhera deo</h6>					
					</div>
				</div>				
				<div class="clnt_tstm">
					<div class="sngl_tstm">
						<i class="fa fa-quote-right"></i>
						<h3>Non conflict</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur sequi accusamus voluptatum rem itaque alias deleniti nostrum aperiam fugiat voluptates debitis praesentium incidunt accusantium distinctio,</p>
						<h6>- jhon deo</h6>					
					</div>
				</div>	
					
				</div>
			</div>	
		</div>
	</div>
</section>
    
    <!-- Learn more -->
     <section id="be-the-first" class="pad-xl">
      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-sm-offset-2 text-center margin-30 wow fadeIn" data-wow-delay="0.6s">
            <h2>Tube Shop</h2><h2> Be the first</h2>
            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipis.</p>
          </div>
        </div>
        
        <div class="iphone wow fadeInUp" data-wow-delay="1s">
	        <!-- <img src="/img/iphone.png"> -->
        </div>
      </div>
    </section> 
        
    <!--Pricing-->
   <!--  <section id="pricing" class="pad-lg">
      <div class="container">
        <div class="row margin-40">
          <div class="col-sm-8 col-sm-offset-2 text-center">
            <h2 class="white">Pricing</h2>
            <p class="white">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra orci ut.</p>
          </div>
        </div>
        
        <div class="row margin-50">
          
          <div class="col-sm-4 pricing-container wow fadeInUp" data-wow-delay="1s">
            <br />
            <ul class="list-unstyled pricing-table text-center">
    					<li class="headline"><h5 class="white">Personal</h5></li>
    					<li class="price"><div class="amount">$5<small>/m</small></div></li>
    					<li class="info">2 row section for you package information. You can include all details or icons</li>
    					<li class="features first">Up To 25 Projects</li>
    					<li class="features">10GB Storage</li>
    					<li class="features">Other info</li>
    					<li class="features last btn btn-secondary btn-wide"><a href="#">Get Started</a></li>
    				</ul>
          </div>
          
          <div class="col-sm-4 pricing-container wow fadeInUp" data-wow-delay="0.4s">
            <ul class="list-unstyled pricing-table active text-center">
    					<li class="headline"><h5 class="white">Professional</h5></li>
    					<li class="price"><div class="amount">$12<small>/m</small></div></li>
    					<li class="info">2 row section for you package information. You can include all details or icons</li>
    					<li class="features first">Up To 25 Projects</li>
    					<li class="features">10GB Storage</li>
    					<li class="features">Other info</li>
    					<li class="features">Other info</li>
    					<li class="features last btn btn-secondary btn-wide"><a href="#">Get Started</a></li>
    				</ul>
          </div>
          
          <div class="col-sm-4 pricing-container wow fadeInUp" data-wow-delay="1.3s">
            <br />
            <ul class="list-unstyled pricing-table text-center">
    					<li class="headline"><h5 class="white">Business</h5></li>
    					<li class="price"><div class="amount">$24<small>/m</small></div></li>
    					<li class="info">2 row section for you package information. You can include all details or icons</li>
    					<li class="features first">Up To 25 Projects</li>
    					<li class="features">10GB Storage</li>
    					<li class="features">Other info</li>
    					<li class="features last btn btn-secondary btn-wide"><a href="#">Get Started</a></li>
    				</ul>
          </div>
          
        </div>
        
      </div>
    </section> -->
    
    
    <section id="invite" class="pad-lg light-gray-bg">
      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-sm-offset-2 text-center">
            <i class="fa fa-envelope-o margin-40"></i>
            <h2 class="black">Location</h2>
            <br />
            <p class="black">8, Gangnam-daero 53-gil, Seocho-gu, Seoul, Republic of Korea</p>
            <br />
            
            <!-- 다음지도 -->
            
            
            <div class="row">
              <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3">
                <form role="form">
                  <div class="form-group">
                    <!-- <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter Email"> -->
        				<%-- <jsp:include page="daum.jsp"/> --%>
                  </div>
                  <button class="btn btn-primary btn-lg"><a href="http://map.daum.net/link/to/비트아카데미,37.49456429671521,127.0280215767454">Way to Shop</a></button>
                </form>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>
    
    
    <section id="press" class="pad-sm">
      <div class="container">
        
        <div class="row margin-30 news-container">
          <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 wow fadeInLeft" data-wow-delay="0.8s">
            <a href="#" target="_blank">
            <img class="news-img pull-left" width="170px" height="70px" src="/img/press01.jpg" alt="Tech Crunch">
            <p class="black">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra orci ut.<br /> 
            <small><em>Tube Shop - May 17, 1993</em></small></p>
            </a>
          </div>
        </div>
        
        <div class="row margin-30 news-container">
          <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 wow fadeInLeft" data-wow-delay="1.2s">
            <a href="#" target="_blank">
            <img class="news-img pull-left" src="/img/press-02.jpg" alt="Forbes">
            <p class="black">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam viverra orci ut. <br /> 
            <small><em>Forbes - Feb 25, 2015</em></small></p>
            </a>
          </div>
        </div>
        
      </div>
    </section>
    
    
    <footer>
      <div class="container">
        
        <div class="row">
          <div class="col-sm-8 margin-20">
            <ul class="list-inline social">
              <li>Connect with us on</li>
              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#"><i class="fa fa-instagram"></i></a></li>
            </ul>
          </div>
          
          <div class="col-sm-4 text-right">
            <p><small>Copyright &copy; 2016. All rights reserved. <br>
	            Created by <a href="http://designscrazed.org/">Designscrazed</a></small></p>
          </div>
        </div>
        
      </div>
    </footer>
    
    
    <!-- Javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/js/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="/js/wow.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
	<script>
	$('.all_tstm').owlCarousel({
		items:1,
		loop:true,
		margin:10,
		nav:true,
		autoplay:true,
		smartSpeed:500,	
		navText: ["<i class='fa fa-angle-left'></i>","<i class='fa fa-angle-right'></i>"],
		responsive:{
			0:{
				items:1
			},
			600:{
				items:1
			},
			1000:{
				items:1
			}
		}
	})
	
	$("a[href='#' ]:contains('Log in')").bind('click',function(){
		console.log("log in click");
		self.location = "/user/login";
	})
	</script>
   
    </body>
</html>