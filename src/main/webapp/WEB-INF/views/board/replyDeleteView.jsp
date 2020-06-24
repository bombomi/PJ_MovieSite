<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value ='/vendor/jquery/jquery.min.js'/>"/></script>
<script type="text/javascript" src="<c:url value ='/js/jquery-3.3.1.min.js'/>"/></script>
<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[name='updateForm']");
	
	$(".cancel_btn").on("click", function(){
		window.history.back();
	})
	
})

</script>
</head>
<body>
	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>


	<form name="updateForm" role="form" method="post"
		action="<%=contextPath %>/board/replyDelete">
		<input type="hidden" name="board_id" value="${replyDelete.board_id}"
			readonly="readonly" /> <input type="hidden" id="reply_id"
			name="reply_id" value="${replyDelete.reply_id}" /> <input
			type="hidden" name="pageNum" value="${pageNum}"> <input
			type="hidden" name="number" value="${number}">
		<div>
			<p>삭제 하시겠습니까?</p>
			<button type="submit">예 삭제합니다.</button>
			<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
		</div>
	</form>

</body>
</html>