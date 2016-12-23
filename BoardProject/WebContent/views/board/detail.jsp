
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

<style type="text/css">
.popup{
		position: absolute;
} 
.back{
		background-color: gray;
		opacity: 0.5;
		width: 100%;
		height: 300%;
		overflow: hidden;
		z-index: 1101;
}
.front{
		z-index: 1110;
		opacity: 1;
		border: 1px;
		margin: auto;
}
.show{
		position: relative;
		max-height: 800px;
		max-width: 1200px;
		overflow: auto;
}



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
</form>

<div class="Box-body">
	<div class="form-group">
		<label for="exampleInputEmail">Title</label>
			<input type="text" name="title" class="form-control" value="${boardVO.title }" readonly="readonly">
	</div>
	
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
			<textarea type="text" name="content" class="form-control" rows="3" readonly="readonly">
				${boardVO.content }
			</textarea>
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail">Writer</label>
			<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly">
	</div>
	
	<div class="box-footer">
		<button type="submit" class="btn btn-warning">수정</button>
		<button type="submit" class="btn btn-danger">삭제</button>
		<button type="submit" class="btn btn-primary">리스트</button>
	
	</div>

	<div class='popup back' style="display:none;"></div>
		<div id="popup_front" class='popup front' style="display:none;">
			<img id="popup_img">
		</div>



<!-- End page content -->

<script type="text/javascript">
 var result ='${message}';
 
 if (result == 'SUCCESS'){
	 alert("처리 완료")
 }
 
 
 
 $(document).ready(function(){
	 
 
	 var formObj = $("form[role='fm']");
	 
	 
	 $(".btn-warning").on("click", function(){
		 formObj.attr("action" , "${pageContext.request.contextPath}/board/modify.do");
		 formObj.attr("method" , "get");
		 formObj.submit();
	 });
	 
	 $(".btn-danger").on("click", function(){
		 formObj.attr("action" , "${pageContext.request.contextPath}/board/remove.do");
		 formObj.submit();
	 });

	 
	 $(".btn-primary").on("click", function(){
		self.location = "${pageContext.request.contextPath}/board/listAll.do";
	 });
	 
 	});
 
	var bno = ${boardVO.bno};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/board/getAttach.do/"+bno,function(list){
		$(list).each(function(){
		
			var fileInfo =getFileInfo(this);
			
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
		});
	});
</script>


<script id="templateAttach"  type="text/x-handlebars-template">
	<li data-src='{{fullName}}'>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}
			</a>
		</span>
		</div>
	</li>
</script>
</body>

</html>