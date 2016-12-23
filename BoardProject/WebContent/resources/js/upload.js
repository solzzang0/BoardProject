function checkImageType(fileName){
	
	var pattern = /jp|gif|png|jpeg/i;
	
	return fileName.match(pattern);
}

function getFileInfo(fullName) {
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	if (checkImageType(fileName)) {
		
		imgsrc = "/displayFile.do?fileName=" + fulllName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12);
		var end = fullName.substr(14);
		
		getLink = "/displayFile.do?fileName=" + front + end;
	}else {
		imgsrc = "/resources/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/displayFile.do?fileName=" + fullName;
	}
	
	fileName = fileLink.substr(fileLink.indexOf("_") + 1);
	
	return {fileName:fileName
			, imgsrc:imgsrc
			, getLink:getLink
			, fullName:fullName}
	
}