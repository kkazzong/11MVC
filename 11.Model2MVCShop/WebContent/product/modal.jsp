<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title" id="myModalLabel">��ǰ����</h5>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" id="detailForm" name="detailForm" enctype="multipart/form-data">
			<input type="hidden" name="tranNo" value="${param.tranNo}"/>
			<div class="form-group has-warning">
				<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�޴� ��</label>
				<div class="col-sm-5">
			    	<input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="�̸��� �Է����ּ���"/>
			    </div>
			</div>
			<jsp:include page="/data/addr.jsp"/>
			<div class="form-group">
				<label for="receiverPhone" class="col-sm-4 control-label">��ȭ��ȣ</label>
				<div class="col-sm-5">
			    	<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" placeholder="'-'�� ������ ��ȭ��ȣ 13�ڸ�"/>
			    </div>
			</div>
			<div class="form-group">
				<label for="receiverRequest" class="col-sm-offset-1 col-sm-3 control-label">��� ��û����</label>
				<div class="col-sm-5">
			    	<input type="text" class="form-control" id="receiverRequest" name="receiverRequest" value="${purchase.receiverRequest}" placeholder="��� ��û ���� �Է����ּ���"/>
			    	<span id="helpBlock" class="help-block">
			    		����� ���� ������ ����ó�� �����ּ���.
			    	</span>
			    </div>
			</div>
			<div class="form-group">
			<label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">��� ��� ��¥</label>
			<div class="col-sm-5">
			    <input	type="text" class="form-control" id="receiverDate" value="${purchase.receiverDate}" name="receiverDate"/>
			</div>
			</div>
			<div class="form-group">
			<label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">���� ����</label>
			<div class="col-sm-5">
			    <select name="paymentOption" class="form-control">
			    	<option value="1" ${purchase.paymentOption == 1 ? "selected" : ""}>�ſ�ī��</option>
			    	<option value="2" ${purchase.paymentOption == 2 ? "selected" : ""}>����</option>
			    </select>
			</div>
			</div>
		</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
	        <button type="button" class="btn btn-primary">�����ϱ�</button>
	      </div>