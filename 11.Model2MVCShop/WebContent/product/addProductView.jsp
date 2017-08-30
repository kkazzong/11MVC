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
			/* $("#modal").dialog({
				modal : true,
				buttons : {
					Ȯ�� : function(){
						$(this).dialog("close");
					}
				}
			});  */
			
			
			//<!-- form tooltip -->
			/* $("[title]").tooltip({
				position : {
					my : "left top",
					at : "right+5 top-5",
					collision : "none"
				}
			}); */
			
			$(".btn:contains('���')").bind("click", function(){
		
				console.log($(this).html())
				var name = $($("input:text")[0]).val();
				var detail = $("textarea").val();
				var manuDate = $($("input:text")[1]).val();
				var price = $($("input:text")[2]).val();
				var stock = $($("input:text[name='prodStock']")).val();
				
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
				if(stock == null || stock.length<1){
					alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
					return;
				}
				
				$("form[name='detailForm']").attr("method","post").attr("action","/product/addProduct").submit();
			});
			
			$(".btn:contains('���')").bind('click', function(){
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
		
		//<!-- Ajax File upload -->
		$(function(){
			$("input:file").bind('change',function(){
				
				var form = new FormData($("form")[0]);
				
				$.ajax({
					
					url : "/product/json/addFile",
					method : "post",
					processData: false,
                    contentType: false,
					data : form,
					enctype: "multipart/form-data",
					success : function(JSONData, status) {
						console.log(status);
						console.log(JSON.stringify(JSONData));
						
						var progressTimer;
						progressTimer = setTimeout( progress, 2500 );
						$("#preImage").text("���ε� ��..");
						function progress() {
						      //var val = progressbar.progressbar( "value" ) || 0;
						 
						      //progressbar.progressbar( "value", val + Math.floor( Math.random() * 3 ) );
						 	
								$("#preImage").html("");
							$(JSONData).each(function(index){
								var htmlStr = "<img width='80px' height='80px' src='../images/uploadFiles/"+JSONData[index]+"'/> &nbsp;";
								$("#preImage").append(htmlStr);
							})
						     
						 }
						
					}
					
				})
				
				
			})
		})
		
		
		
		
 
 
	
	</script>
	
	<style>
        body {
            padding-top : 70px;
        }
        .dropdown:hover .dropdown-menu {
        	display : block;
        }
        .thumbnail{
        	height : 200px;
        }
        #progressbar {
		    margin-top: 20px;
		  }
		 
		  .progress-label {
		    font-weight: bold;
		    text-shadow: 1px 1px 0 #fff;
		  }
		 
		  .ui-dialog-titlebar-close {
		    display: none;
		  }
   	</style>
   	
</head>

<body bgcolor="#ffffff" text="#000000">

	<!--  ƫ�� -->
	<%-- <jsp:include page="/layout/toolbar.jsp"/> --%>
	<jsp:include page="/layout/toolbarTube.jsp" />
	
	<!-- modal message -->
	<!-- <div id="modal">Welcome ! <br> ��ǰ����ϱ� </div> -->
	
	<div class="container">
		
		<div class="page-header">
			<h3 class="text-info text-center">��ǰ���</h3>
		</div>
				
		<form class="form-horizontal" name="detailForm" enctype="multipart/form-data">
			
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control" id="prodName" name="prodName" maxLength="20" placeholder="��ǰ�� �ݵ�� �Է�" title="��ǰ���� 20�� ���Ϸ� �Է����ּ���">
			    	<span id="helpBlock" class="help-block">
			    		�ִ� 20�ڱ��� �Է��� �� �ֽ��ϴ�
			    	</span>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">������</label>
				<div class="col-sm-4">
			    	<textarea rows="4" cols="50" id="prodDetail" name="prodDetail" class="form-control" maxlength="50" placeholder="������" title="�������� 50�� ���Ϸ� �Է����ּ���"></textarea>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��¥�Է�"/>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control" id="price" name="price" placeholder="�����Է�"/>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="prodStock" class="col-sm-offset-1 col-sm-3 control-label">���</label>
				<div class="col-sm-4">
			    	<input type="text" class="form-control" id="prodStock" name="prodStock" placeholder="����Է�"/>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4 thumbnail">
			    	<input	type="file" id="uploadFile" name="uploadFile" multiple="multiple"/>
			    	<div class="text-muted">�̸�����</div>
			    	<div id="preImage"></div>
			    </div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">���</button>
					<button type="button" class="btn btn-default">���</button>
			    </div>
			</div>
			
		</form>
	</div>	
	
</body>

</html>

 
