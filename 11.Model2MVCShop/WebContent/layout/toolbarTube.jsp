<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <meta charset="utf-8">
  <title>Snow Landing Page Theme </title>
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
  <!-- <link rel="stylesheet" href="/css/style.css"> -->
  <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900|Montserrat:400,700' rel='stylesheet' type='text/css'>
  

  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <!-- <link rel="stylesheet" href="/css/main.css"> -->

  <script src="/js/modernizr-2.7.1.js"></script>
  <style type="text/css">
  	.logo > img {
		margin-top: 6px;
		width : 40px;
		heigth : 40px;
	}
	.navbar {
		border: 0px solid rgba(0, 0, 0, 0);
	    background: #70cbce;
	    margin: auto;
	    position: fixed;
	}
	.navbar-toggle{
		border: 0px solid rgba(0, 0, 0, 0);
	}
	/* .navbar-toggle:hover{
		border: 0px solid rgba(0, 0, 0, 0);
		background-color : transparent;
	} */
	/* .dropdown:hover .dropdown-menu {
			color : white;
        	display: block;
		    /* min-width: 100%; 
		    white-space: nowrap;
		    /* position:absolute !important; */
		   /*  z-index: 100; 
		    /* background: #70cbce; 
			color: white;
    		text-decoration: none;
      } */
      h1, h2, h3, h4, h5, h6, p, .logo, .btn, .navbar-nav a, a span .form-control, .list-inline, small, #pricing {
		  font-family: 'Montserrat', sans-serif;
		}
		span, .logo, .logo:hover{
    		color: #ffffff;
    		text-decoration: none;
		}
		.logo{
			padding-top : 8px;
		}
		.nav .navbar-nav {
    		max-height: fit-content;
		}
		/* @media (min-width: 768px) {
		  ul > li > a {
		    /* (80px - line-height of 27px) / 2 = 26.5px 
		    padding-top: 26.5px;
		    padding-bottom: 26.5px;
		    line-height: 27px;
		  }
		} */
		/* .navbar-collapse.in, .navbar-collapse.collapsing {
			min-height : 100%;
		}
		.navbar-collapse.collapse.in { 
        	display: block!important;
        	min-width: 
    	}
    	.collapsing {
	        overflow: hidden!important;
	    } */
  </style>
</head>


    
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
      
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#target">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="logo" href="/index.jsp"><img src="/images/tube.png" alt="Logo">&nbsp;&nbsp;TUBE SHOP</a>
        </div>
        
        <div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	       		
	       <ul class="nav navbar-nav navbar-right">	
	            <!-- <li class="dropdown">
		            <a href="#" class="scroll dropdown-toggle"  data-toggle="dropdown" role="button" aria-expanded="false">
		           		<span>mypage</span>
		            	<span class="caret"></span>
		            </a>
		            <ul class="dropdown-menu">
			            <li><a href="#">회원정보조회</a></li>
			        </ul>
	            </li> -->
            
			
			<li class="dropdown">
			<c:if test="${sessionScope.user.role == 'admin'}">
		       <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		            <span>product</span>
		            <span class="caret"></span>
		        </a>
		        <ul class="dropdown-menu">
			            <li><a href="#">판매상품등록</a></li>
			            <li><a href="#">판매상품관리</a></li>
			            <li class="divider"></li>
		                <li><a href="#">배 송 관 리</a></li>
			    </ul>
	        </c:if>
            </li>
            
            <li class="dropdown">
	           	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	            		 <span>purchase</span>
	            		<span class="caret"></span>
	            </a>
	            <ul class="dropdown-menu">
	                         <li><a href="#">상 품 검 색</a></li>
	                         <c:if test="${sessionScope.user.role == 'user'}">
	                           <li><a href="#">구매이력조회</a></li>
	                         </c:if>
	                         <li><a href="#">최근본상품</a></li>
	                     </ul>		
            </li>
            
            <li class="dropdown">
	           	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	            		 <span><c:if test="${!empty user}">${user.userId}님</c:if></span>
	            		<span class="caret"></span>
	            </a>
	            <ul class="dropdown-menu">
	            			<c:if test="${sessionScope.user.role == 'admin'}">
	                         	<li><a href="#">회원정보조회</a></li>
	                         </c:if>
	                         <li><a href="#">마이페이지</a></li>
 							<li class="divider"></li>	                         
 							<li><a href="#">Log out</a></li>
	             </ul>		
            </li>
            <c:if test="${empty user}">
            <li><a href="#"> <span>Log in</span></a></li>
            </c:if>
          	</ul>
        </div><!--/.navbar-collapse -->
      </div>
    </div>
    
    <script type="text/javascript">
	    $(".dropdown").hover(function(){
				$(this).toggleClass("mouse-on");
			})
			
			
			
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('Log out')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= 회원정보조회 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a[href='#']:contains('회원정보조회')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  개인정보조회회 Event  처리 =============	
	 	$( "a:contains('개인정보조회')" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
		
		$(function(){
			
			$("a:contains('판매상품등록')").bind('click', function(){
				self.location = "../product/addProductView.jsp";
			});
			
			$("li > a:contains('판매상품관리')").bind('click', function(){
				self.location = "/product/listProduct?menu=manage";
			});
			
			$("a[href='#']:contains('상 품 검 색')").bind('click', function(){
				self.location = "/product/listProduct?menu=search";
			});
			
			$("a[href='#']:contains('최근본상품')").bind('click', function(){
				self.location = "../history.jsp";
			});
			
			$("a[href='#']:contains('구매이력조회')").bind('click', function(){
				self.location = "/purchase/listPurchase";
			});
			
			$("a[href='#']:contains('배 송 관 리')").bind('click', function(){
				self.location = "/purchase/listSale";
			});
			
		});
	</script>
   