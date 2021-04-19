<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>근태기록 체크</title>
    <link rel="stylesheet" href="/css/CommuteMain.css">
    <link rel="stylesheet" href="/fontawesome/css/fontawesome.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {
		//타이머 함수
		inClock();
		var inTimer = setInterval(inClock, 1000);
		
		$("#inCheck").on("click", function () {
			alert("출근 클릭");
			/* clearInterval(inTimer);
			document.getElementById("inCheck").disabled = true;
			$("#outCheck").removeAttr("disabled"); */
			
			// 퇴근 타이머 시작
			/* outClock();
			outTimer = setInterval(outClock, 1000); */
			
			$.ajax({
				url: "inCheck",
				method: 'post',
				data: {
					"time" : document.getElementById("timer").innerText
				}
			}).then(function (res) {
				if (res == 0) {
					alert("금일 출근기록이 이미 있습니다.");
					
				} else {
					document.getElementById("inTime").innerText = nowTime();
					alert("근무 기록 완료");
					location.href = "main";
				}
			})
		});
		
		$("#outCheck").on("click", function () {
			var isOut = confirm("퇴근하시겠습니까?");
			if (isOut) {
				alert("퇴근 클릭");
				
				$.ajax({
					url: "outCheck",
					method: 'post'
				}).then(function (res) {
					if (res == 0) {
						alert("금일 출근 기록이 없습니다.\n인사팀으로 문의해주세요");
						
					} else {
						/* clearInterval(outTimer); */
						document.getElementById("outTime").innerText = nowTime();
						alert("퇴근 기록 완료.");
						location.href = "main";
					}
				})
			}
		});
	});
		
	function inClock() {
		var date = new Date();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();
		
		if (hours < 10) hours = '0' + hours;
		if (minutes < 10) minutes = '0' + minutes;
		if (seconds < 10) seconds = '0' + seconds;
		
		document.getElementById("timer").innerText =
			hours + ':' + minutes + ':' + seconds;
	}
	
	/* function outClock() {
		var date = new Date();
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();
		
		if (hours < 10) hours = '0' + hours;
		if (minutes < 10) minutes = '0' + minutes;
		if (seconds < 10) seconds = '0' + seconds;
		
		document.getElementById("outTime").innerText =
			hours + ':' + minutes + ':' + seconds;
	} */
	
	function nowTime() {
		var d = new Date();
		var hours = d.getHours();
		var minutes = d.getMinutes();
		var seconds = d.getSeconds();
		
		if (hours < 10) hours = '0' + hours;
		if (minutes < 10) minutes = '0' + minutes;
		if (seconds < 10) seconds = '0' + seconds;
		
		var currentTime = hours + ':' + minutes + ':' + seconds;
		
		return currentTime;
	}
</script>    
</head>
<body>
   	<div class="white-bg">
		<div class="header">
			<p class="category">Commute</p>
			<h2 class="title">일일 출퇴근 관리</h2>
		</div>
	</div>
	<div class="wrap">
		<div class="content-bg">
	    	<div class="timer">
		    	<h3>현재시간</h3>
		    	<h2>─</h2>
		    	<h4 id="timer"></h4>
	    	</div>
	    	<div class="commute-btn-wrap">
		    	<button id="inCheck">
		    		<i class="fas fa-briefcase fa-2x"></i>
			    	<p class="time" id="inTime">${commute.onTime}</p>
			    	<h2>출근</h2>
		    	</button>
		   		<button id="outCheck">
		   			<i class="fas fa-home fa-2x"></i>
		   			<p class="time" id="outTime">${commute.offTime}</p>
		   			<h2>퇴근</h2>
		   		</button>
			   
		    </div>
			    
		    <div class="status">
		    	<!-- <h3>이번 달 출퇴근 현황</h3> -->
		    	<table class="content-table">
		    		<thead>
		    			<tr class="column">
		    				<th>이번 달 정상출근</th>
		    				<th>이번 달 지각</th>
		    				<th>이번 달 총 근무일</th>
		    			</tr>
		    		</thead>
		    		<tbody>
		    			<tr>
		    				<td>${commute.good}</td>
		    				<td>${commute.late}</td>
		    				<td>${commute.total}</td>
		    			</tr>
		    		</tbody>
		    	</table>
	    	</div>
	    </div>
   	</div>

</body>
</html>