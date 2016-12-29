<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="bbs.BbsDTO" />



<%
	//업로드용 변수 선언
	String upDir = "/bbs/storage";
	String tempDir = "/bbs/temp";


	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);

	
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	dto.setWname(UploadSave.encode(upload.getParameter("wname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename = null; 
			
	if(size > 0){
			filename = UploadSave.saveFile(fileItem, upDir);
	}
	
	
	
	dto.setFilename(filename);
	dto.setFilesize(size);
	
	

	boolean flag = bdao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<script type="text/javascript">
	function blist() {
		var url = "list.jsp";

		location.href = url;
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">처리결과</DIV>
	<DIV class="content">
		<%
			if (flag) {
				out.println("글이 등록되었습니다.");
			} else {
				out.println("글등록이 실패했습니다.");
			}
		%>
		<br>
		<br> <input type="button" value="확인"
			onclick="location.href='./list.jsp'">
	</DIV>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
