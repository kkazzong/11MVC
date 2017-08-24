<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.model2.mvc.service.domain.*" %>

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
	
		$(function(){
			
			$(".btn:contains('����')").bind('click', function(){
				console.log($(this).html());
				$('form').attr("method","post")
							 .attr("action","/purchase/updatePurchaseView?tranNo=${purchase.tranNo}")
							 .submit();
			});
			
			$(".btn:contains('Ȯ��')").bind('click', function(){
				console.log($(this).html());
				self.location = "/purchase/listPurchase";
			});
			
			$(".btn:contains('��ǰ �� ����')").bind('click', function(){
				console.log($(this).html());
				self.location = "/product/listProduct?menu=search";
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
		.dropdown:hover .dropdown-menu {
        	display : block;
        }
   	</style>
</head>

<body bgcolor="#ffffff" text="#000000">

	<jsp:include page="/layout/toolbar.jsp"/>
	
	<div class="container">
	
		<div class="page-header bg-danger">
			<h3 class="text-info">��������Ȯ��</h3>
			<small class="text-muted">�Է��� ���� ������ Ȯ���ϼ���.</small>
		</div>
		
		<div class="row">
			<div class="col-sm-offset-2  col-sm-6">
		<form name="updateForm">
			<table class="table">
				<tr>
					<td>���� ��ǰ</td>
					<td>
						<img class="img-thumbnail" src="../images/uploadFiles/${purchase.purchaseProd.fileName[0]}">
						${purchase.purchaseProd.prodName}
					</td>
				</tr>
				<tr>
					<td>�޴� ��</td>
					<td>${purchase.receiverName}</td>
				</tr>
				<tr>
					<td>�����</td>
					<td>${purchase.receiverAddr}</td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td>${purchase.receiverPhone}</td>
				</tr>
				<tr>
					<td>��ۿ�û����</td>
					<td>${purchase.receiverRequest}</td>
				</tr>
				<tr>
					<td>��������</td>
					<td>
						<c:if test="${purchase.paymentOption == 1}">
							�ſ�ī�� ����
						</c:if>
						<c:if test="${purchase.paymentOption == 2}">
							���� ����
						</c:if>
					</td>
				</tr>
			</table>
			</form>
			</div>
		</div>

		<div class="row">
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<a href="# "class="btn btn-danger">����</a>
					<a href="# "class="btn btn-default">Ȯ��</a>
					<a href="#" class="btn btn-primary">��ǰ �� ����</a>
				</div>
			</div>
		</div>
		
	</div>
	
<%-- <div style="width: 98%; margin-left: 10px;">

<form name="updatePurchaseForm" action="/purchase/updatePurchaseView?tranNo=${purchase.tranNo}" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� ���� Ȯ��</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="70%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;" align="center">
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="200">
			��ǰ�̸�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.purchaseProd.prodName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="200">
			�����ھ��̵�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.buyer.userId}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�������
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">
		<c:if test="${purchase.paymentOption == 1}">
			���ݰ���
		</c:if>
		<c:if test="${purchase.paymentOption == 2}">
			ī�����
		</c:if>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�������̸�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverName}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�����ڿ���ó 
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverPhone}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�������ּ�
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverAddr }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
			�����ڿ�û����
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverRequest }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
	<tr>
		<td class="ct_list_b"width="104">
		����������
		</td>
		<td bgcolor="F7CAC9" width="1"></td>
		<td align="left">${purchase.receiverDate }</td>
		<td></td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="F7CAC9"></td>
	</tr>
</table>	

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="javascript:fncUpdatePurchase();">������������</a> -->
						������������
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- <a href="/purchase/listPurchase">Ȯ��</a> -->
						Ȯ��
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						��ǰ����Ʈ
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>



</form>
</div> --%>
</body>
</html>