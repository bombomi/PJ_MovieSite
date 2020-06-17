<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%String contextPath= request.getContextPath(); %>
<% request.setCharacterEncoding("utf-8"); 
response.setCharacterEncoding("utf-8");

%>
<%
response.setContentType("text/xml;charset=UTF-8");
%>
<% response.setContentType("text/html; charset=utf-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script  type="text/javascript"src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	   $("[name='timeTableDate']").click(function(){
	        if($(this).prop('checked')){
	        	$('input[type="checkbox"][name="timeTableDate"]').prop('checked',false);
	        	$(this).prop('checked', true);

	        	var theater_id = $("[name='theater_id']").val();
	        	//체크박스에 표시한 값들을 넘김.
	        	var selectedDate;
	        	$('input[name="timeTableDate"]:checked').each(function(i){
	        		selectedDate=$(this).val();
	        	});
	        	
	        	//JSON.stringify($('form[name="codeForm"]').serializeComponent()),
	        	var allData = {};
	        	allData["selectedDate"]=selectedDate;
	        	allData["theater_id"]=theater_id;
	        	$.ajax({
	        		contentType: "application/json; charset=UTF-8",
	        	    url:"<%=contextPath%>/ajaxDateSelect",
	        	    type:'GET',
	        	    dataType:"json",
	        	    data:allData,
	        	    success:function(retVal){
						alert(retVal.ok);
	        	    },
	        	    error:function(request, status, error){
	        	        alert("에러 발생~~ \n" + status + " : " + error);

	        	    }
	        	});	
	        }else{
	            alert("체크박스 체크 해제!");
	        }
	    });
	   
	
});
function makeTheaterListHTML(list){
	var theaterHTML="";
	
    $.each(list, function( index, value ) {
    	theaterHTML+="<input type='checkbox' name='theater_id' value='";
    	console.log(value.theater_id);
    	theaterHTML+=value.theater_id;
    	theaterHTML+="'>"+value.theater_name+"&nbsp;";
     });
	return theaterHTML;
}
</script>
</head>
<body>
<input type="hidden" name="theater_id" value="${theater_id}">

<table>
	<tr>
	<td>theater_id</td>
	<td>movie_id</td>
	<td>movie_dateTime</td>
	</tr>


		<c:forEach var="movieDateList" items="${movieDateList}" varStatus="status">
		<tr>
<td><input type="checkbox" name="timeTableDate" value="${movieDateList.movie_dateTime}">${movieDateList.movie_dateTime}
</td>
	

		</tr>
		
		</c:forEach>
</table>		
<a href="<%=contextPath%>/selectSeat">좌석선택으로 이동</a>

</body>
</html>