<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<%
	String tempDir = application.getRealPath("/team/temp");
	String upDir = application.getRealPath("/team/storage");

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	int no = Integer.parseInt(upload.getParameter("no"));
	String word = UploadSave.encode(upload.getParameter("word"));
	String col = upload.getParameter("col");
	String nowPage = upload.getParameter("nowPage");
	String oldfile = upload.getParameter("oldfile");

	FileItem fileItem = upload.getFileItem("filename");
	int size = (int) fileItem.getSize();
	String filename = null;
	if (size > 0) {
		UploadSave.deleteFile(upDir,oldfile); //기존파일을 삭제
		filename = UploadSave.saveFile(fileItem, upDir);
	}

	Map map = new HashMap();
	map.put("filename", filename);
	map.put("no", no);

	boolean flag = tdao.updateFile(map);
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


	function tread(){
		var url="./read.jsp";
		url += "?no=<%=no%>";		
		url += "&col=<%=col%>";		
		url += "&word=<%=word%>";		
		url += "&nowPage=<%=nowPage%>";		
		
		location.href=url;
	}



</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">처리 결과</DIV>
	<div class="content">

		<%
			if (flag) {
				out.println("변경했습니다.");
			} else {
				out.println("변경을 실패했습니다.");
			}
		%>



	</div>


	<DIV class='bottom'>
		<input type='button' value='정보보기' onclick=tread()>
		<input type="button" value='다시하기' onclick="history.back()">

	</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
