<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dto" class="member.MemberDTO" />


<%
	String upDir = application.getRealPath("/member/storage");
	String tempDir = application.getRealPath("/member/temp");

	UploadSave upload = (UploadSave)request.getAttribute("upload");

	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setTel(upload.getParameter("tel"));
	dto.setEmail(upload.getParameter("email"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setJob(UploadSave.encode(upload.getParameter("job")));
	dto.setMdate(upload.getParameter("mdate"));

	//filename
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int) fileItem.getSize();
	String fname = null;
	if (size > 0) {
		fname = UploadSave.saveFile(fileItem, upDir);
	} else {
		double random = Math.random();
		int intValue=(int)(random * 3) +1;
		if(intValue == 1)
			fname = "member.jpg";
		else if(intValue == 2)
			fname = "member2.jpg";
		else
			fname = "member3.jpg";
	}

	dto.setFname(fname);

	boolean flag = dao.create(dto);
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">회원가입 처리</DIV>

	<div class="content">
		<%
			if (flag) {
				out.println("회원가입을 했습니다.");

			} else {
				out.println("회원가입을 실패 했습니다.");
			}
		%>



	</div>
	<%
		if (flag) {
	%>
	<DIV class='bottom'>
		<input type='button' value='로그인' onclick="location.href='login.jsp'"> 
		<input type='button' value='홈' onclick="location.href='../index.jsp'">
	</DIV>
	<%
		}
		else{ %>
	<DIV class='bottom'>
		<input type='button' value='다시시도' onclick="history.back()"> 
		<input type='button' value='홈' onclick="location.href='../index.jsp'">
	</DIV>
			
	<%  }%>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
