
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

.fileDrop{
width: 80%;
height: 100px;
border: 1px dotted gray;
background-color: lightslategrey;
margin: auto;




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

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js">
</script>
<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
			<img alt="Attachment" src="{{imgsrc}}">
		</span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">
			{{fileName}}
		</a>
		<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
			<i class="fa fa-fw fa-remove">
			</i>
		</a>
	</div>	
	</li>
</script>


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
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
<h3>REGISTER BOARD</h3>

<div class="form-group">
	<label for="exampleInputEmail">
		FILE DROP HERE
	</label>
	
	<div class="fileDrop"></div>

</div>





<form action="${pageContext.request.contextPath}/board/register.do" method="post">
	<div class="box-body" style="padding-top: 100px">
		<div class="form-group">
			<label for="exampleInputEmail">Title</label>
				<input type="text" name="title" class="form-control" placeholder="Enter Title">
		</div>
		
		<div class="form-group">
			<label for="exampleInputPassword1">Content</label>
				<textarea class="form-control" name="content"  rows="3" placeholder="Enter...."></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail">Writer</label>
			<input type="text" name="writer" class="form-control" placeholder="enter Writer">
		</div>
		
		<div class="box-footer">
			<button  type="submit" class="btn btn-primary" value="ok">ok</button>
		</div>
	</div>

	<div class="box-footer">
		<div>
			<hr>
		</div>
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>	

</form>
<!-- End page content -->
<script type="text/javascript">

$("#registerForm").submit(function(event){
	event.preventDefaul();
	
	var that = ${this};
	var str = "";
	
	$(".uploadedList .delbtn").each(function(index){
		str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'>";
	});
	
	that.append(str);
	
	that.get(0).submit();
});


</script>
</body>

</html>