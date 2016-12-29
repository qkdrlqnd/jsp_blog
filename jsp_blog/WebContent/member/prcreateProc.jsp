<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


<%
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String id = UploadSave.encode(upload.getParameter("id"));
	String email = upload.getParameter("email");
	
	
	String str = "";
	
	if(dao.duplicateID(id)){
		str="중복된 아이디입니다. 중복확인하세요";
	}
	else if(dao.duplicateEmail(email)){
		str="중복된 이메일주소입니다. 중복확인하세요";
	}
	else{
		
		request.setAttribute("upload", upload);
		
		%>
		
		<jsp:forward page="/member/createProc.jsp"/>
		
		
		
	<%
		return ;
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
	font-size: 20px;
}
</style>


<script>




</script>



<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>

	<!-- *********************************************** -->
	<div class="title">아이디 및 이메일 중복확인</div>

		<%=
			str
			
		%>


	
		<DIV class='bottom'>
			<input type='button' value='다시시도' onclick="history.back()">
		</DIV>
	


	<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html>
