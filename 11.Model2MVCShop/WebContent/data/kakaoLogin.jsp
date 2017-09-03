<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
		<a id="kakao-login-btn"></a><br>
		<button class="btn btn-default"><a href="https://kauth.kakao.com/oauth/authorize?client_id=3226d66f575df6c87dccd47e599b3b5f&redirect_uri=http://localhost:8080/kakao/kakaologin&response_type=code">rest login</a></button><br>
		<button class="btn btn-default"><a href="#">logout</a></button><br>
		<div id="profile"></div>
<script type='text/javascript'>

	
  
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('4c581b38ff4c308971bc220233e61b89');
    // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        //alert(JSON.stringify(authObj));
        //$("#profile").html(JSON.stringify(authObj.scope));
        //사용자 정보 요청
    	  Kakao.API.request({
              url: '/v1/user/me',
              success: function(res) {
                alert(JSON.stringify(res));
                $("#profile").html(res.properties.nickname+"님 환영합니다");
              },
              fail: function(error) {
                alert(JSON.stringify(error));
              }
            });
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    
    $(function(){
    	$("a:contains('logout')").bind("click",function(){
    		Kakao.Auth.logout(function(data) {
    			alert(data);
    			if(data) {
    				$("#profile").html("logout ok")
    			}
    		})
    	})
    })
  //]]>
</script>

</body>
</html>