<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="modal" tabindex="-1" id="confirmModal" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">처리결과</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>성공적으로 처리되었습니다.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
	$(function() {
		const result = '<c:out value="${result}"></c:out>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {
			
			if (result === '' || history.state) {
				return;
			}
			
			$("#confirmModal").modal("show");
			
		}
	});
</script>