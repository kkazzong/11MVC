<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h5 class="modal-title" id="myModalLabel">상품수정</h5>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" id="detailForm" name="detailForm" enctype="multipart/form-data">
			<input type="hidden" name="tranNo" value="${param.tranNo}"/>
			<div class="form-group has-warning">
				<label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">받는 분</label>
				<div class="col-sm-5">
			    	<input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="이름을 입력해주세요"/>
			    </div>
			</div>
			<jsp:include page="/data/addr.jsp"/>
			<div class="form-group">
				<label for="receiverPhone" class="col-sm-4 control-label">전화번호</label>
				<div class="col-sm-5">
			    	<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" placeholder="'-'를 제외한 전화번호 13자리"/>
			    </div>
			</div>
			<div class="form-group">
				<label for="receiverRequest" class="col-sm-offset-1 col-sm-3 control-label">배송 요청사항</label>
				<div class="col-sm-5">
			    	<input type="text" class="form-control" id="receiverRequest" name="receiverRequest" value="${purchase.receiverRequest}" placeholder="배송 요청 사항 입력해주세요"/>
			    	<span id="helpBlock" class="help-block">
			    		부재시 연락 가능한 연락처를 남겨주세요.
			    	</span>
			    </div>
			</div>
			<div class="form-group">
			<label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">배송 희망 날짜</label>
			<div class="col-sm-5">
			    <input	type="text" class="form-control" id="receiverDate" value="${purchase.receiverDate}" name="receiverDate"/>
			</div>
			</div>
			<div class="form-group">
			<label for="receiverDate" class="col-sm-offset-1 col-sm-3 control-label">결제 수단</label>
			<div class="col-sm-5">
			    <select name="paymentOption" class="form-control">
			    	<option value="1" ${purchase.paymentOption == 1 ? "selected" : ""}>신용카드</option>
			    	<option value="2" ${purchase.paymentOption == 2 ? "selected" : ""}>현금</option>
			    </select>
			</div>
			</div>
		</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary">수정하기</button>
	      </div>
