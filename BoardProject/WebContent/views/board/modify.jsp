
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<form role="fm" method="post" >
	<input type="hidden" name="bno" value="${boardVO.bno }">


<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEmail">Bno</label>
			<input type="text" name="bno" class="form-control" value="${boardVO.bno}" readonly="readonly">
	</div>

	<div class="form-group">
		<label for="exampleInputEmail">Title</label>
			<input type="text" name="title" class="form-control" value="${boardVO.title }" >
	</div>
	
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
			<textarea type="text" name="content" class="form-control" rows="3">
				${boardVO.content }
			</textarea>
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail">Writer</label>
			<input type="text" name="writer" class="form-control" value="${boardVO.writer }">
	</div>
	
	<div class="box-footer">
		<button type="submit" class="btn btn-warning">CLANCEL</button>
		<button type="submit" class="btn btn-primary">SAVE</button>
	
	</div>
</div>
</form>

<!-- End page content -->

<script type="text/javascript">

 var result ='${message}';
 
 if (result == 'SUCCESS'){
	 alert("처리 완료")
 }
 
 
 
 $(document).ready(function(){
	 
 
	 var formObj = $("form[role='fm']");
	 
	 
	 $(".btn-warning").on("click", function(){
		 self.location = "${pageContext.request.contextPath}/board/listAll.do";
	 });
	 
	 
	 $(".btn-primary").on("click", function(){
		 formObj.submit();
	 });
	 
});
 
 
 
 

 
 
 


</script>
</body>

</html>