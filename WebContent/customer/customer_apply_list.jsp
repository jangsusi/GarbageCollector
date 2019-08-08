<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String ctxPath = request.getContextPath();
%>
<%--
	System.out.println("matching_suggestion.jsp");
	String ctxPath = request.getContextPath();
	String auth ="helper";//= null;
	String id ="gobakse5@naver.com";//= null;
	try{
//		auth = (String)session.getAttribute("auth");
//		id =  (String)session.getAttribute("id");
		if(auth==null||!auth.equals("helper")||id==null||id.equals("")){
			response.sendRedirect("loginform.jsp"); //login.jsp로 변경
		}
	}catch(Exception e){
		response.sendRedirect("loginform.jsp"); //login.jsp로 변경
	}
--%>
<%--jstl 을 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--${fn:length(rl)} 를 사용하기 위해 추가 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link rel="stylesheet" href="<%=ctxPath%>/assets/css/index.css">

	<!--jquery -->	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>당신의 쓰레기는 안녕하수깡?</title>
<link rel="struct icon" href="<%=ctxPath%>/assets/img/brsg.ico">
<style>
</style>
</head>
<body>
	<%@include file="/header.jsp"%>
	<main>



	<div class="container" style="padding: 50px 0;">
		<div class="list_header">
			<div class="col-xs-9" style="">
			<h2><font style="font-weight: bold;">신청</font>을 확인하세요!</h2>
			</div>
			<div class="col-xs-3" style="margin: 30px 0 0 0;">
				<div class="form-group">
					<!-- <label for="sel1">필터조건</label> <select class="form-control" id="sel1">-->
				<select class="form-control" >
					<option>낮은 비용순</option>
					<option>2</option>
				</select>
				</div>
			</div>
		</div>
		<div class="list_body">
			<div class="matching_filter">
				<div></div>
			</div>

			<div class="matching_lsit">

				<table class="table table-bordered text-center table-hover">
					<thead>
						<tr class="bg-success" style="font-weight: bold;">
							<th class="text-center col-xs-2">No</th>
							<th class="text-center col-xs-3">지역</th>
							<th class="text-center col-xs-3">수행 예정 시간</th>
							<th class="text-center col-xs-2">종류</th>
							<th class="text-center col-xs-2">금액</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="vo" items="${rl}">
							<!--if 마감시간 1시간 임박-->
							<tr class="deadline_red" onclick="location.href='apply_detail.do?serialNo=${vo.serialNo}'">
								<td>${vo.serialNo}</td>
								<td>${vo.customer_addr_first} ${vo.customer_addr_second}</td>
								<td>${vo.wanted_time }</td>
								<td>${vo.trash_type }</td>
								<td>${vo.price }원</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="list_footer">
			<!-- paging -->
		</div>
	</div>

  

	</main>
	<%@include file="/footer.jsp"%>
	<%@include file="/script.jsp"%>
<style>
.btn-outline-success{
	color: #5cb85c;
    border-color: #4cae4c
}
.visuallyhidden{
	display: none;
}
</style>
<script type="text/javascript">
setInterval(function(){
	  $(".blinkEle").toggleClass( 'btn-success' );
	  $(".blinkEle").toggleClass( 'btn-outline-success' );
	}, 1000);
	
	
CountDownTimer('countdown'); // 2019년 8월 8일까지
CountDownTimer('newcountdown'); // 2019년 9월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용합니다.

function CountDownTimer(id)
{

var end = new Date($('#'+id).attr('wanted_time_data'));

var _second = 1000;
var _minute = _second * 60;
var _hour = _minute * 60;
var _day = _hour * 24;
var timer;

function showRemaining() {
var now = new Date();
var distance = end - now - _hour;
if (distance < 0) {

clearInterval(timer);
document.getElementById(id).innerHTML = 'EXPIRED!';

return;
}
var days = Math.floor(distance / _day);
var hours = Math.floor((distance % _day) / _hour);
var minutes = Math.floor((distance % _hour) / _minute);
var seconds = Math.floor((distance % _minute) / _second);

if(days<1 && hours<=1){
	$('#'+id).parent().parent().css( 'color', 'red' );
}
if(days<1 && hours<1 && minutes<1 && seconds<1){
	$('#'+id).parent().parent().addClass('visuallyhidden');
}
	
document.getElementById(id).innerHTML = days + '일 ';
document.getElementById(id).innerHTML += hours + '시간 ';
document.getElementById(id).innerHTML += minutes + '분 ';
document.getElementById(id).innerHTML += seconds + '초';
}

timer = setInterval(showRemaining, 1000);
}

</script>
</body>
</html>