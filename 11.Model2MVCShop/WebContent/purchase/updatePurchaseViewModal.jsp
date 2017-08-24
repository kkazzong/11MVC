<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ���� ���� ȭ��</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
<!-- <script type="text/javascript" src="../javascript/calendar.js">
</script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function fncUpdatePurchase() {
		
		var name = $($("input:text")[0]).val();
		var phone = $($("input:text")[1]).val();
		var addr = $($("input:text")[2]).val();
		
		console.log(name+":"+phone+":"+addr);
		
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
						 .attr("action","/purchase/updatePurchase")
						 .submit();
		} else {
			return;
		}
	}
	
	
	$(function(){
		
		var dialog = $("form[name='updateForm']").dialog({
			autoOpen : false,
			height : 500,
			width : 350,
			modal : true,
			buttons : {
				"�����ϱ�" : function(){
					dialog.dialog("submit");
				},
				cancel : function(){
					dialog.dialog("close");
				}
			},
			close : function(){
				$("form[name='updateForm']").reset();
			},
			open : function(){
				console.log("opne!")
			}
		});
		
	})
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<!-- ���� dialog form -->
<div class="ui-widget">
<form name="updateForm">
	<fieldset>
		<label for="��ǰ��">��ǰ��</label>
		${purchase.purchaseProd.prodName}
		<label for="�̸�">�̸�</label>
		<input type="text" name="receiverName" value="${purchase.receiverName}" class="text ui-widget-content ui-corner-all">
		<label for="����ó">����ó</label>
		<input type="text" name="receiverName" value="${purchase.receiverPhone}" class="text ui-widget-content ui-corner-all">
		<label for="�ּ�">�ּ�</label>
		<input type="text" name="receiverName" value="${purchase.receiverAddr}" class="text ui-widget-content ui-corner-all">
		<label for="��û����">��û����</label>
		<input type="text" name="receiverName" value="${purchase.receiverRequest}" class="text ui-widget-content ui-corner-all">
		<label for="��������¥">��������¥</label>
		<input type="text" name="receiverName" value="${purchase.receiverDate}" class="text ui-widget-content ui-corner-all">
		
		<input type="submit" value="�����ϱ�" style="position:absolute; top:-1000px">
	</fieldset>
</form>
</div>

</body>
</html>