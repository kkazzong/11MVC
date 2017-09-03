<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!-- <!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	���� : http://getbootstrap.com/css/   ����
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	 ///////////////////////// Bootstrap, jQuery CDN //////////////////////////
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	 ///////////////////////// CSS //////////////////////////
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     ///////////////////////// JavaScript //////////////////////////
	<script type="text/javascript">

		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
</head>

<body>

	ToolBar Start /////////////////////////////////////
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	ToolBar End /////////////////////////////////////	
	
	 ȭ�鱸�� div Start /////////////////////////////////////
	<div class="container">
		 row Start /////////////////////////////////////
		<div class="row">
		
			<div class="col-md-6">
					<img src="/images/logo-spring.png" class="img-rounded" width="100%" />
			</div>
	   	 	
	 	 	<div class="col-md-6">
	 	 	
		 	 	<br/><br/>
				
				<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">�� &nbsp;&nbsp;�� &nbsp;&nbsp;��</h1>

			        <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>
			
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	 row Start /////////////////////////////////////
  	 	
 	</div>
 	 ȭ�鱸�� div end /////////////////////////////////////

</body>

</html> -->

<!DOCTYPE html>
<html lang="en"><head>
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
  <link rel="stylesheet" href="/css/style.css">
  <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900|Montserrat:400,700' rel='stylesheet' type='text/css'>
  

  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/main.css">

	<!-- Javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/js/jquery-1.11.0.min.js"><\/script>')</script>
    <script src="/js/wow.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/main.js"></script>
    <script src="/js/modernizr-2.7.1.js"></script>
    
    <!-- īī���α��� -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	
	<script>
		
			/* //<![CDATA[
		    // ����� ���� JavaScript Ű�� ������ �ּ���.
		    Kakao.init('8865635962c202af331e7362850ce3f2');
		    // īī�� �α��� ��ư�� �����մϴ�.
		    Kakao.Auth.createLoginButton({
		      container: '#kakao-login-btn',
		      success: function(authObj) {
		        alert(JSON.stringify(authObj));
		      },
		      fail: function(err) {
		         alert(JSON.stringify(err));
		      }
		    });
		  //]]> */
	
		$( function() {
			
			$("a[href='#' ]:contains('Log in')").bind('click',function(){
				console.log("log in click");
				self.location = "/user/login";
			})
			
			$("#userId").focus();
			
			console.log("��ư"+$("button").html());
			
			$("button").bind("click" , function() {
				console.log("button click")
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				//$("form").attr("method","post").attr("action","/user/login").attr("target","_parent").submit();
				$("form").attr("method","post").attr("action","/user/login").submit();
			});
		});	
	</script>

		
  <style type="text/css">
  	.logo > img {
		margin-top: 6px;
		width : 40px;
		heigth : 40px;
	}
	header{
		background: url(/images/bg.PNG) no-repeat center center;
		width: 100%;
	   	height: 100vh;
	   overflow: hidden;
	   background-size: 100%;
	   -webkit-background-size: cover;
	   -moz-background-size: cover;
	   -o-background-size: cover;
	}
    /* div{
		border : 3px solid #D6CDB7;
		margin0top : 10px;
	} */
	form{
		margin-top : 200px;
	}
  </style>
</head>

<body>
        
    <header>
      <div class="container">
        <div class="row">
          <div class="col-xs-6">
          	<!-- ȭ�� �ΰ� -->
            <a class="logo" href="/index.jsp"><img src="/images/tube.png" alt="Logo">&nbsp;&nbsp;TUBE SHOP</a>
          </div>
          <div class="col-xs-6 signin text-right navbar-nav">
            <a href="#">Log in</a>
          </div>
        </div>
        
        <div class="row">
            <div class="row">
              <div class="col-md-offset-4 col-md-8 col-sm-offset-4 col-sm-8">
                <div class="row">
                  <div class="col-xs-6 text-right wow fadeInUp">
                    <form class="form">
                    	<div class="form-group">
                    		<label for="userId" class="sr-only col-sm-4 control-label">���̵�</label>
                    		<input type="text" class="form-control" name="userId" id="userId" placeholder="���̵� �Է�"/>
                    	</div>
                    	<div class="form-group">
                    		<label for="password" class="sr-only col-sm-4 control-label">��й�ȣ</label>
                    		<input type="password" class="form-control" name="password" id="password" placeholder="��й�ȣ �Է�" >
                    	</div>
                    	<div class="form-group">
                    		<button class="btn btn-lg btn-primary btn-block"><h5 class="black">�α���</h5></button>
    						<!-- <a id="kakao-login-btn"></a>
							<a href="http://developers.kakao.com/logout"></a> -->
                    	</div>
                    </form>
                  </div>
                </div><!--End Button Row-->  
              </div>
            </div>
            
          </div>
        </div>
    </header>
   	
    						<%-- <jsp:include page="/data/kakaoLogin.jsp"/> --%>
    <footer>
      <div class="container">
        
          
          <div class="col-sm-12 text-right">
            <p><small>Copyright &copy; 2016. All rights reserved. <br>
	            Created by <a href="http://designscrazed.org/">Designscrazed</a></small></p>
          </div>
        </div>
        
    </footer>
    
    
    
   
    </body>
</html>