
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<b>부여과제 리스트</b>
			</h1>
			<h4>부여과제 정보를 확인하고 관리해 보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>

<!--  Start Page  -->
<div style="padding: 30px">   
	<div style="padding-right: 30px">
		<div style="padding-right: 30px">
<table>
	<colgroup>
			<col width="400" align="center">
			<col width="500" align="left">
			<col width="300" align="center">
			<col width="400" align="center">
			<col width="300" align="center">
	</colgroup>
	<form class="w3-container" action="${pageContext.request.contextPath}/assignment/searchByMemberId.do" method="post">
	<tr>
		<td align="left">
			<input name="memberId" id="memberId" type="text" class="btn btn-xs btn-default" value="" placeholder="팀원 아이디를 입력 하세요"/>
		
			<button name="searchByMemberId" class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-large">검색</button>
		</td>
	</tr>
	</form>
	
</table>
	
	<table class="table table-hover table-condensed" text-align:center;>
		<colgroup>
			<col width="100" align="center">
			<col width="800" align="center">
			<col width="400" align="center">
			<col width="300" align="center">
			<col width="500" align="center">
			<col width="200" align="right">
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>제출자</th>
				<th>제출여부</th>
				<th>제출기한</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	<c:choose>
		<c:when test="${list eq null || empty list }">
			<tr>
				<h3>부여과제가 존재하지 않습니다.</h3><br><br>
			</tr>
		</c:when>
	<c:otherwise>
			<c:forEach items="${list }" var="task" varStatus="sts">
				<tr class="w3-hover-pale-red w3-padding w3-card-2 ">
					<td>${sts.count }</td>
					<td>
						<a href="${pageContext.request.contextPath}/assignment/searchByTaskId.do?taskId=${task.taskId }">${task.title }</a>
					</td>
					<td>
						<c:forEach items="${task.memberIdList }" var="memberId">
							${memberId } <br>
						</c:forEach>
					</td>
							
					<td align="center">
						<c:forEach items="${task.taskMember }" var="taskMember">
							<c:if test="${taskMember.committed eq 1 }">
								Y <br>
							</c:if>
							<c:if test="${taskMember.committed eq 0 }">
								N <br>
							</c:if>
						</c:forEach>
					</td>
					<td colspan="2">${task.deadline }</td>
					<td align="right">
						<a href="${pageContext.request.contextPath}/submission/create.do?assignmentTitle=${task.title }&assignmentId=${task.taskId }">
							<button class="w3-btn w3-white w3-border w3-border-orange w3-text-orange w3-round-large">제출</button>
						</a>
					</td>
				</tr>
				
			</c:forEach>
		</c:otherwise>
	</c:choose>
		</div>
	</div>
</div>
				<tr style="margin-top: 20px">
				<th></th>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td align="right">
					<a href="${pageContext.request.contextPath}/submission/searchAll.do">
						<button class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-medium">제출과제 리스트</button>
					</a> 
				</td>	
				<td>			
					<a href="${pageContext.request.contextPath}/assignment/create.do?loginedId=${member.memberId }">
						<button class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-medium">부여과제 등록</button>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
<!-- End page content -->

</body>

</html>