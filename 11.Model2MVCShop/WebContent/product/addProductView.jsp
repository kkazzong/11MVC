<%@ page contentType="text/html; charset=euc-kr" %>
<!DOCTYPE html>

<html lang="ko">
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
			
			//<!-- modal message -->
			$("#modal").dialog({
				modal : true,
				buttons : {
					확인 : function(){
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
			
			$(".btn:contains('등록')").bind("click", function(){
		
				console.log($(this).html())
				var name = $($("input:text")[0]).val();
				var detail = $("textarea").val();
				var manuDate = $($("input:text")[1]).val();
				var price = $($("input:text")[2]).val();
				
				console.log(name+":"+detail+":"+manuDate+":"+price);
				
				if(name == null || name.length<1){
					alert("상품명은 반드시 입력하여야 합니다.");
					return;
				}
				if(detail == null || detail.length<1){
					alert("상품상세정보는 반드시 입력하여야 합니다.");
					return;
				}
				if(manuDate == null || manuDate.length<1){
					alert("제조일자는 반드시 입력하셔야 합니다.");
					return;
				}
				if(price == null || price.length<1){
					alert("가격은 반드시 입력하셔야 합니다.");
					return;
				}
				
				$("form[name='detailForm']").attr("method","post").attr("action","/product/addProduct").submit();
			});
			
			$(".btn:contains('취소')").bind('click', function(){
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
				console.log("달력클릭"+$(this).html());
				popWin = window.open(show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value),
						"popWin",
						"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
			
			}); */
		});
	
	</script>
	
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
</head>

<body bgcolor="#ffffff" text="#000000">

	<!--  튤바 -->
	<jsp:include page="/layout/toolbar.jsp"/>
	
	<!-- modal message -->
	<div id="modal">Welcome ! <br> 상품등록하기 </div>
	
	<div class="container">
		
		<h2 class="bg-danger text-center">상 품 등 록</h2>
				
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control" id="prodName" name="prodName" maxLength="20" placeholder="상품명 반드시 입력" title="상품명은 20자 이하로 입력해주세요">
			    	<span id="helpBlock" class="help-block">
			    		최대 20자까지 입력할 수 있습니다
			    	</span>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상세정보</label>
				<div class="col-sm-4">
			    	<textarea rows="4" cols="50" id="prodDetail" name="prodDetail" class="form-control" maxlength="50" placeholder="상세정보" title="상세정보는 50자 이하로 입력해주세요"></textarea>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="날짜입력"/>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control" id="price" name="price" placeholder="가격입력"/>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
			    	<input	type="file" id="uploadFile" name="uploadFile" multiple="multiple"/>
			    </div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default">취소</button>
			    </div>
			</div>
			
		</form>
		
	</div>	
	
	
	
	
	
	
	<!-- <form name="detailForm" enctype="multipart/form-data"> -->
	
	<!-- <table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">상품등록</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
			</td>
		</tr>
	</table> -->
	
	<!-- <!-- modal message
	<div id="modal">Welcome ! <br> 상품등록하기 </div> -->
	
	<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				상품명 <imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">
							<input type="text" name="prodName" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20" title="상품명은 20자 이하로 입력해주세요">
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
				상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" name="prodDetail" class="ct_input_g" 
							style="width: 100px; height: 50px" maxLength="100" minLength="6"/>
				<textarea rows="4" cols="50" name="prodDetail" class="ct_input_g" maxlength="50" title="상세정보는 50자 이하로 입력해주세요"></textarea>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				제조일자 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" name="manuDate" readonly="readonly" class="ct_input_g"  
							style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
					&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15" />
											onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"
				<input name="manuDate" type="text" class="ct_input_g"/>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">
				가격 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" name="price" 	class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="10">&nbsp;원
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">상품이미지</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				 하나의 파일
				<input		type="file" name="uploadFile" class="ct_input_g" 
								style="width: 200px; height: 19px" maxLength="13"/>
				여러 파일
				<input		type="file" name="uploadFile"  multiple="multiple" class="ct_input_g" 
								style="width: 200px; height: 19px" maxLength="13"/>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</table> -->
	
	<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
						<a href="javascript:fncAddProduct();">등록</a>
						등록
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
						<a href="javascript:resetData();">취소</a>
						취소
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