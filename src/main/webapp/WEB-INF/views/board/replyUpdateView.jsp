<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="<c:url value ='/vendor/jquery/jquery.min.js'/>"/></script>
<script type="text/javascript" src="<c:url value ='/js/jquery-3.3.1.min.js'/>"/></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='updateForm']");
		
		$(".cancel_btn").on("click", function(){
			window.history.back();
		})
		
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	
	<form name="updateForm" role="form" method="post" action="<%=contextPath %>/board/replyUpdate">
		<input type="hidden" name="board_id" value="${replyUpdate.board_id}" readonly="readonly"/>
		<input type="hidden" id="reply_id" name="reply_id" value="${replyUpdate.reply_id}" />
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="number" value="${number}">
		<table>
			<tbody>
				<tr>
					<td>
						<label for="content">댓글 내용</label>
						<textarea cols="80" rows="5" id = "comment_contents" name = "comment_contents">${replyUpdate.comment_contents}</textarea>
					</td>
				</tr>	
				
			</tbody>			
		</table>
		<div>
			<button type="submit" class="update_btn">저장</button>
			<button type="button" class="cancel_btn">취소</button>
		</div>
	</form>
	
</body>
</html>