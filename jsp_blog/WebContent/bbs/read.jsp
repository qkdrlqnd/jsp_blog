<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	String col = request.getParameter("col");
	String word = request.getParameter("word");

	bdao.upViewcnt(bbsno);
	BbsDTO dto = bdao.read(bbsno);

	String content = dto.getContent();
	content = content.replaceAll("/n/r", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>

<script type="text/javascript">

function blist(){
	var url = "./list.jsp"
	url += "?col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
}

function update(){
// function update(bbsno){
	var url = "./updateForm.jsp"
// 	url += "?bbsno=" + bbsno;
	url += "?bbsno=<%=bbsno%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
	
}

function delet(bbsno){
// function delet(bbsno){
	var url = "./deleteForm.jsp";
	url += "?bbsno=<%=bbsno%>";
// 	url += "?bbsno=" + bbsno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	url += "&oldfile=<%=dto.getFilename()%>";
	location.href=url;
}


function readReply(bbsno){
// function readReply(bbsno){
	var url = "./replyForm.jsp"
	url += "?bbsno=<%=bbsno%>" ;
// 	url += "?bbsno=" + bbsno;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href=url;
	
}
function imgUpdate(){
	
	
	
	}
}



</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">조회</DIV>


	<TABLE style="width: 70%; padding: 20px; margin-top: 10px">
		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>

		<TR>
			<TH>내용</TH>
			<TD><%=dto.getContent()%></TD>
		</TR>

		<TR>
			<TH>성명</TH>
			<TD><%=dto.getWname()%></TD>
		</TR>

		<TR>
			<TH>조회수</TH>
			<TD><%=dto.getViewcnt()%></TD>
		</TR>

		<TR>
			<TH>등록일</TH>
			<TD><%=dto.getWdate().substring(0, 10)%></TD>
		</TR>

		<TR>
			<TH>파일명</TH>
			<TD>
				<%
					if (dto.getFilename() == null) {
						out.println("파일없음");
					} else {
				%> <%=dto.getFilename()%>(<%=dto.getFilesize()%>KB)
				<button type="button" class="btn btn-default btn-sm">
					<span class="glyphicon glyphicon-download-alt"></span> Download
				</button>
			</TD>
			<%
				}
			%>
		</TR>

	</TABLE>

	<DIV class='bottom'>
		<input type='button' value='등록'
			onclick="location.href='./createForm.jsp'"> <input
			type='button' value='목록' onclick="blist()">
		<%--     <input type='button' value='수정' onclick="javascript:update('<%=dto.getBbsno()%>')"> --%>
		<%--     <input type='button' value='삭제' onclick="javascript:delet('<%=dto.getBbsno()%>')"> --%>
		<%--     <input type='button' value='답변' onclick="javascript:readReply('<%=dto.getBbsno()%>')"> --%>
		<input type='button' value='수정' onclick="javascript:update('')">
		<input type='button' value='삭제' onclick="javascript:delet('')">
		<input type='button' value='답변' onclick="javascript:readReply('')">
		<input type='button' value='사진변경' onclick="javascript:imgUpdate('')">
	</DIV>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
