<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<%
	
	int no = Integer.parseInt(request.getParameter("no"));

	TeamDTO dto = tdao.read(no);
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

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: 60%;
	margin: auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, tr {
	padding: 10px;
}

#ftd {
	text-align: center;
}

img{
	width: 200px;
	height: 200px;
}

</style>
<script>

	function tlist(){
		var url = "./list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		location.href = url;
	}
	
	function imgUpdate(){
		var url = "./updateFileForm.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		url += "&no=<%=request.getParameter("no")%>";
		url += "&oldfile=<%=dto.getFilename()%>";
		
		
		
		location.href=url;
		
	}
	
	

</script>
</head>
<body>

	<div>

		<table>

			<tr>
				<td  colspan="2" id="ftd">
				<img src='./storage/<%=dto.getFilename()%>'>
				</td>
			</tr>

			<tr>
				<th>이름</th>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=dto.getPhone()%></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><%=dto.getAddress1()%><br> <%=dto.getAddress2()%><br>
					<%=dto.getZipcode()%></td>
			</tr>

			<tr>
				<th>보유기술</th>
				<td><%=dto.getSkillstr()%>
			</tr>

			<tr>
				<th>취미</th>
				<td><%=dto.getHobby()%></td>
			</tr>

		</table>

		<div>
			<input type="button" value="생성" 	onclick="location.href='./createForm.jsp'"> 
			<input type="button" value="목록"  	onclick="tlist()">
			<input type="button" value="사진변경"  	onclick="imgUpdate()">

		</div>




	</div>









</body>
</html>
