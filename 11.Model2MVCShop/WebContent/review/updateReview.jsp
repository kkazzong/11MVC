<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>  
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
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
		
		/* function fncAddPurchase() {
			
			var payment = $("option:selected").val();
			var name = $($("input:text")[0]).val();
			var phone = $($("input:text")[1]).val();
			var addr = $($("input:text")[2]).val();
			
			console.log(payment+":"+name+":"+phone+":"+addr);
			
			if(payment == null) {
				alert("���� ������ ������ �ּ���");
				return;
			}
			if(name == null || name.length < 1) {
				alert("�޴� ��� �̸��� �Է����ּ���");
				return;
			}
			if(phone == null || phone.length < 1) {
				alert("����ó�� �� �Է��ϼž� �մϴ�");
				return;
			}
			if(addr == null || addr.length < 1) {
				alert("������� �Է����ּ���");
				return;
			}
			
			var result = confirm("�����Ͻðڽ��ϱ�?");
			if(result) {
				$('form').attr("method","post")
							 .attr("action","/purchase/addPurchase")
							 .submit();
			} else {
				return;
			}
			
		} */
		function fncUpdateReview(){
			var result = confirm("����� �����Ͻðڽ��ϱ�?");
			if(result) {
				$("form").attr("method","post").attr("action","/review/updateReview").submit();
			} else {
				return;
			}
		}
		$(function(){
			
			
			$(".btn:contains('����')").bind('click', function(){
				fncUpdateReview();
			});
			
			$(".btn:contains('���')").bind('click', function(){
				
				console.log($(this).html());
				
				var result = confirm("��ǰ�� ����� ����Ͻðڽ��ϱ�?");
				
				if(result) {
					window.history.back();
				} else {
					return;
				}
			});
			
			$(".btn:contains('�� ���� �ҷ�����')").bind('click', function(){
				
				console.log($(this).html());
				console.log("receiverName : "+$("input:text[name='receiverName']").val());
				
				$("input:text[name='receiverName']").val("${user.userName}");
				$("input:text[name='receiverPhone']").val("${user.phone}");
				$("input:text[name='receiverAddr']").val("${user.addr}");
			});
			
		});
		
	</script>
	<style>
        body {
            padding-top : 70px;
        }
        .img-thumbnail{
        	width : 80px;
        	height : 80px;
        }
        /* div{
			border : 3px solid #D6CDB7;
			margin0top : 10px;
		} */
		 thead {
        	background-color : #70cbce;
        }
   	</style>
</head>

<body>

	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp"/>
	
	<div class="container">
		
		<div class="page-header text-center">
			<h3 class="text-info">��ǰ��</h3>
			<small class="text-muted">�Է��� ��ǰ�� Ȯ���ϼ���.</small>
		</div>
		
		<div class="row">
			<div class="col-md-offset-3 col-md-6">
			<table class="table">
			 	<thead>
			 		<tr>
			 			<td>��ǰ����<td>
			 			<td><td>
			 			<td>����<td>
			 		</tr>
			 	</thead>
			 	<tr>
			 		<td>
			 			<img class="img-thumbnail" src="../images/uploadFiles/${review.reviewProd.fileName[0]}"/>
			 		</td>
			 		<td>
			 			<p><strong class="primary">${review.reviewProd.prodName}</strong></p>
			 			<p><small class="text-muted">${review.reviewProd.prodDetail}</small></p>
			 			<p><small class="text-muted"><code>������</code> : ${review.reviewProd.manuDate}</small></p>
			 		</td>
			 		<td>
			 			${review.reviewProd.price}��
			 		</td>
			 	</tr>
			</table>
			</div>
		</div>
				
		
		
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
			<input type="hidden" name="reviewNo" value="${review.reviewNo}" />
			
			<div class="form-group has-warning">
				<label for="reviews" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
			    	<textarea class="form-control" rows="10" cols="30" id="reviews" name="reviews">${review.reviews}</textarea>
			    </div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-danger">����</button>
					<button type="button" class="btn btn-default">���</button>
			    </div>
			</div>
			
		</form>
	</div>
	
	
<!-- <form name="addPurchase" method="post" action="/addPurchase.do"> -->
<%-- <form name="addPurchase">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<input type="hidden" name="purchaseProd.prodNo" value="${product.prodNo}" />
<input type="hidden" name="buyer.userId" value="${user.userId }" />
<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="300" class="ct_write">
			��ǰ��ȣ 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01" width="299">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${product.prodNo }</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��������</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.manuDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.price }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${product.regDate }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�����ھ��̵� 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">${user.userId }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
			<td>
				<table border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
							�� ���� �ҷ�����
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
						</td>
						<td width="30"></td>
					</tr>
				</table>
			</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���Ź�� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">���ݱ���</option>
				<option value="2">�ſ뱸��</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������̸� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="receiverName" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�����ڿ���ó <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverPhone" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�������ּ� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/></td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="receiverAddr" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />				
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">���ſ�û����</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td class="ct_write01">
			<input		type="text" name="receiverRequest" 	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">����������</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td width="200" class="ct_write01">
			<!-- <input 	type="text" readonly="readonly" name="receiverDate" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20"/>
			<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
						onclick="show_calendar('document.addPurchase.receiverDate', document.addPurchase.receiverDate.value)"/> -->
			<input type="text" name="receiverDate" class="ct_input_g"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
</table> --%>

<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:fncAddPurchase();">����</a>
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<a href="javascript:history.go(-1)">���</a>
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form> -->

</body>
</html>