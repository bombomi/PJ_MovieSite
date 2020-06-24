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
	        	    	var resultMovieTimes=[];
	        	    	resultMovieTimes=retVal.movieTimeList;
	        	    	var resultHTML=makeTheaterListHTML(resultMovieTimes);
	        	        $("#result").html(resultHTML);
		        	 	   $("input[type='checkbox'][name='timetable_id']").click(function(){
		        		        if($(this).prop('checked')){
		        		        	$('input[type="checkbox"][name="timetable_id"]').prop('checked',false);
		        		        	$(this).prop('checked', true);
		        		        }});

	        	    
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
    	theaterHTML+="<input type='checkbox' name='timetable_id' value='";
    	console.log(value.timetable_id);
    	theaterHTML+=value.timetable_id;
    	theaterHTML+="'>"+value.movie_dateTime+"&nbsp;";
     });
	return theaterHTML;
}
</script>
</head>
<body>
 	<div class="head">
		<jsp:include page="../head.jsp"></jsp:include>
 	</div>

<input type="hidden" name = "user_id" value="${member.getMember_id()}">

<c:forEach var="movieDateList" items="${movieDateList}" varStatus="status">

<input type="checkbox" name="timeTableDate" value="${movieDateList.movie_dateTime}">${movieDateList.movie_dateTime}
</c:forEach>
<br>
<hr>
<form action="<%=contextPath%>/selectSeat2" method="get">
	<div id="result"></div>
	<input type="hidden" name="theater_id" value="${theater_id}">
	<input type="hidden" name="scrHall_id" value="">
	<input type="submit" value="좌석 선택">
	
</form>

</body>
</html>