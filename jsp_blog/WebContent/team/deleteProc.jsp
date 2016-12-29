<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	String oldfile = request.getParameter("oldfile");
	boolean flag = tdao.delete(no);
	
	if(flag){
		String upDir = application.getRealPath("/team/storage");
		UploadSave.deleteFile(upDir,oldfile); //기존파일을 삭제
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

div{
	text-align : center;
	margin-top : 20px;
	margin-botton : 20px;
}

</style>

<script type="text/javascript">

	function tlist(){
		var url ="./list.jsp";
		url +="?col=<%=request.getParameter("col")%>"
		url +="&word=<%=request.getParameter("word")%>"
		location.href=url;
	}

</script>

</head>
<body>
	<div>

		<%
			if (flag) {
				out.println("삭제되었습니다.");
			} else {
				out.println("삭제가 실패하였습니다.");
			}
		%>
		<br><br>
		<input type="button" value="목록" onclick="tlist()">
	</div>
</body>
</html>


