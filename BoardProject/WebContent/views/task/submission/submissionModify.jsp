
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
				<b>제출과제 수정</b>
			</h1>
			<h4>제출과제 정보를 확인하고 관리해 보세요.</h4>
			<div class="w3-section w3-bottombar "></div>
		</header>


<!--  Start Page  -->


<div style="padding: 50px">
	<div style="padding-left: 140px">
		<div style="padding-right: 230px">
<form action="${pageContext.request.contextPath}/submission/revise.do" method="post" enctype="multipart/form-data">
<table class="table">
	<colgroup>
		<col width="150">
		<col width="*">
		<col width="*">
	</colgroup>
	<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
		<th>제목</th>
		<td>
			<input id="title" name="title" class="form-control" type="text" value="" placeholder="${task.title }">
			<input id="taskId" name="taskId" type="hidden" value="${task.taskId }">
		</td>
	</tr>
	<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
		<th>내용</th>	
			<td>
				<textarea id="contents" name="contents" class="form-control" rows="7" placeholder="${task.contents }"></textarea>
			</td>
	</tr>
	<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
		<th>첨부파일</th>
		<td>
			<c:forEach items="${task.taskFileList }" var="taskFile">
				${taskFile.filePath }<br>
			</c:forEach>
			<input type="hidden" id="flag" name="flag" value="${task.flag }"  />
		</td>
	</tr>
	<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
		<th></th>
		<td>
			<h6 style="color: red">**첨부파일은 최대 3개 입니다.</h6>
		</td>
	</tr>
	<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
		<th></th>
		<td>
			<input style="width: 250px"  type="file" name="attchFile" class="form-control">
		</td>
	</tr>
	<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
		<th></th>
		<td>
			<input style="width: 250px"  type="file" name="attchFile" class="form-control">
		</td>
	</tr>
	<tr class="w3-hover-light-grey w3-padding w3-card-2 ">
		<th></th>
		<td>
			<input style="width: 250px"  type="file" name="attchFile" class="form-control">
		</td>
	</tr>
	<tr>
	<th></th>
		<td align="right">
			<input class="w3-btn w3-white w3-border w3-border-blue w3-text-blue w3-round-large" type="reset" type="reset" value="취소">
			<input class="btn w3-btn w3-white w3-border w3-border-orange w3-text-orange w3-round-large" type="submit" value="완료">
		</td>
	</tr>
</table>
</form>
		</div>
	</div>
</div>




<!-- End page content -->

</body>

</html>