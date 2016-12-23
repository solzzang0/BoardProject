<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부여 과제 상세</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.1.1.slim.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/schedule/schedule.js"></script>
<style type="text/css">
#reset, #okay {
display: none;
}
</style>
</head>
<body>
	
	<a href="${pageContext.request.contextPath}/assignment/searchAll.do">과제리스트 돌아가기</a>
	<h3>부여 과제 상세</h3>

	<br>
<form action="${pageContext.request.contextPath}/assignment/revise.do" method="post">
	<input id="taskId" name="taskId" type="hidden" value="${task.taskId }">
	<table class="table">
		<colgroup>
			<col width="150">
			<col width="*">
		</colgroup>
		<tr>
			<th>제목</th>
				<td>
					<input id="title" name="title" class="form-control" type="text" value="${task.title }" readonly>
				</td>
		</tr>
		<tr>
			<th>제출자</th>
				<td>
					<c:forEach items="${task.memberIdList }" var="memberId">
						${memberId }
					</c:forEach>
				</td>
		</tr>
		<tr>
			<th>제출 기한</th>
			<td>
				${task.deadline }
			</td>
		</tr>
		<tr>
			<th>평가 기간</th>
			<td>
				시작<br> 
				${task.evaluationPeriodStart }<br>
				종료<br> 
				${task.evaluationPeriodEnd }
			</td>
		</tr>
		<tr>
			<th>내용</th>
				<td>
					<textarea id="contents" name="contents" class="form-control" rows="7" readonly>${task.contents }</textarea>
				</td>
		</tr>
	</table>
		<br>
			<div align="center">
				<input id="reset" class="btn" type="reset" value="취소" > 
				<input id="okay" class="btn btn-success" type="submit" value="저장" >
			</div>	
</form>
	<br>
	<div align="center">
	<a href="${pageContext.request.contextPath}/assignment/revise.do?taskId=${task.taskId }&flag=${task.flag }"  class="btn btn-success">수정</a>
	<a class="btn btn-success"  href="${pageContext.request.contextPath}/assignment/erase.do?taskId=${task.taskId }&flag=${task.flag }">삭제</a>
	</div>
	
</body>
</html>
