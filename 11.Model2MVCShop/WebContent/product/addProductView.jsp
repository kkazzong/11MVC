<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>��ǰ���</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css" />  
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" />  
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>   -->
<!-- <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  -->
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- <script type="text/javascript" src="../javascript/calendar.js"></script> -->

<script type="text/javascript">

	$(function(){
		
		//<!-- modal message -->
		$("div").dialog({
			modal : true,
			buttons : {
				Ȯ�� : function(){
					$(this).dialog("close");
				}
			}
		});
		
		
		//<!-- form tooltip -->
		$("[title]").tooltip({
			position : {
				my : "left top",
				at : "right+5 top-5",
				collision : "none"
			}
		});
		
		$(".ct_btn01:contains('���')").bind("click", function(){
	
			console.log($(this).html())
			var name = $($("input:text")[0]).val();
			var detail = $("textarea").val();
			var manuDate = $($("input:text")[1]).val();
			var price = $($("input:text")[2]).val();
			
			console.log(name+":"+detail+":"+manuDate+":"+price);
			
			if(name == null || name.length<1){
				alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			$("form[name='detailForm']").attr("method","post").attr("action","/product/addProduct").submit();
		});
		
		$(".ct_btn01:contains('���')").bind('click', function(){
			console.log($(this).html());
			$('form[name="detailForm"]').each(function(){
				this.reset();
			})
		});
		
		//<!-- datepicker -->
		$("input:text[name='manuDate']").datepicker().bind('change', function(){
			$(this).val($(this).datepicker("option","dateFormat","yy-mm-dd").val());
		});
		
		
		/* $("img[src='../images/ct_icon_date.gif']").bind('click', function(){
			console.log("�޷�Ŭ��"+$(this).html());
			popWin = window.open(show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value),
					"popWin",
					"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		
		}); */
	});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm" enctype="multipart/form-data">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">��ǰ���</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>
<!-- modal message -->
<div>Welcome ! <br> ��ǰ����ϱ� </div>
<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ�� <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<input type="text" name="prodName" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20" title="��ǰ���� 20�� ���Ϸ� �Է����ּ���">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			��ǰ������ <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<!-- <input type="text" name="prodDetail" class="ct_input_g" 
						style="width: 100px; height: 50px" maxLength="100" minLength="6"/> -->
			<textarea rows="4" cols="50" name="prodDetail" class="ct_input_g" maxlength="50" title="�������� 50�� ���Ϸ� �Է����ּ���"></textarea>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			�������� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<!-- <input type="text" name="manuDate" readonly="readonly" class="ct_input_g"  
						style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
				&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" />
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" -->
			<input name="manuDate" type="text" class="ct_input_g"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="price" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="10">&nbsp;��
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">��ǰ�̹���</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<!--  �ϳ��� ���� -->
			<!-- <input		type="file" name="uploadFile" class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13"/> -->
			<!-- ���� ���� -->
			<input		type="file" name="uploadFile"  multiple="multiple" class="ct_input_g" 
							style="width: 200px; height: 19px" maxLength="13"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<!-- <a href="javascript:fncAddProduct();">���</a> -->
					���
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				<td width="30"></td>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
					<!-- <a href="javascript:resetData();">���</a> -->
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

</form>
</body>
</html>