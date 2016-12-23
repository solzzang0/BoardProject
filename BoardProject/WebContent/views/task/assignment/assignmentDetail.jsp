
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>Teamphony</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/teamDetailCustomStyle.css">

<style>
a[name=aInBtn] {
	text-decoration: none;
}

a[name=aInBtn]:hover, a[name=aInBtn]:link, a[name=aInBtn]:active, a[name=aInBtn]:visited
	{
	text-decoration: none;
	color: white;
}
</style>

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/sideBarControl.js"></script>

<!-- Bootstrap -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>


<script type="text/javascript">
	var reviseInfo = function() {

		document.getElementById("teamName").readOnly = false;
		document.getElementById("cycle").readOnly = false;
		document.getElementById("endDate").readOnly = false;

		document.getElementById("selectBtnGr").hidden = true;
		document.getElementById("reviseBtnGr").hidden = false;

	}

	var getMinDate = function() {

		var date = new Date();
		var year = date.getFullYear(); // 년도
		var month = (1 + date.getMonth()); // 월
		month = month >= 10 ? month : '0' + month; // 월 두자리로 변경 작업
		var day = date.getDate(); // 일 
		day = day >= 10 ? day : '0' + day; //일 두자리로 변경 작업

		document.getElementById('endDate').min = year + '-' + month + '-' + day;// yyyy-mm-dd format 변경
	}

	window.onload = function() {

		getMinDate();
	}
</script>

<body class="w3-light-grey w3-content" style="max-width: 1600px;">



	<!-- side bar -->
	<%@ include file="/views/common/sideBar.jspf"%>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-container w3-main" style="margin-left: 300px;">

		<!-- Header -->
		<header class="w3-container">
			<a href="#"><img
				src="${pageContext.request.contextPath}/resources/images/avatar_g2.jpg"
				style="width: 65px;"
				class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
			<span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey"
				onclick="w3_open()"><i class="fa fa-bars"></i></span>
			<h1>
				<b>과제부여 상세</b>
			</h1>
			<h4>과제부여 정보를 확인하고 관리해 보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>
<!--  Start Page  -->

<input id="taskId" name="taskId" type="hidden" value="${task.taskId }">
<div style="padding: 50px"> 
	<div style="padding-left: 160px"> 
		<div style="padding-right: 300px"> 
			<div style="padding-bottom: 50px" align="right">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/assignment/searchAll.do">
					<button class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-medium">부여과제 리스트</button>
				</a>
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/submission/searchAll.do">
					<button class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-medium">제출과제 리스트</button>
				</a> 
			</td>
		</tr>
		</div>
	<table class="w3-table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
			
		<tr class="w3-hover-pale-red w3-padding w3-card-2 ">
			<th>제목</th>
				<td class="">
					${task.title } 
				</td>
		</tr>
		<tr class="w3-hover-pale-red w3-padding w3-card-2 ">
			<th>제출자</th>
				<td>
					<c:forEach items="${task.memberIdList }" var="memberId">
						${memberId }
					</c:forEach>
				</td>
		</tr>
		<tr class="w3-hover-pale-red w3-padding w3-card-2 ">
			<th>제출 기한</th>
			<td>
				${task.deadline }
			</td>
		</tr>
		<tr class="w3-hover-pale-red w3-padding w3-card-2 ">
			<th>평가 기간</th>
			<td>
				시작<br> 
				${task.evaluationPeriodStart }<br>
				종료<br> 
				${task.evaluationPeriodEnd }
			</td>
		</tr>
		<tr class="w3-hover-pale-red w3-padding w3-card-2 ">
			<th>내용</th>
				<td class="w3-animate-input">
					${task.contents }
				</td>
		</tr>
	</table>
</form>
	<br>
			<div align="right">
		<a class="w3-border" href="${pageContext.request.contextPath}/assignment/revise.do?taskId=${task.taskId }&flag=${task.flag }&loginedId=${member.memberId }" >
		<button class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-large">수정</button>
	</a>
	<a class="w3-border"  href="${pageContext.request.contextPath}/assignment/erase.do?taskId=${task.taskId }&flag=${task.flag }&loginedId=${member.memberId }">
		<button class="w3-btn w3-white w3-border w3-border-orange w3-text-orange w3-round-large">삭제</button>
	</a>
			</div>
		</div>
	</div>
</div> 
	<!-- End page content -->
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>