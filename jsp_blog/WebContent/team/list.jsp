<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")){
		word = "";
	}
	
	
	int nowPage = 1;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 5;
	
	int sno = ((nowPage -1) * recordPerPage )+1;
	int eno = nowPage * recordPerPage;
	
	
	
	

	Map map = new HashMap();
	map.put("col", col);
	map.put("word",word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<TeamDTO> list = tdao.list(map);
	Iterator<TeamDTO> iter = list.iterator();
	
	int totalRecord = tdao.total(col, word);

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
	margin: 1px auto;
}


.search{
	
	width:80%;
	text-align: center;
	
	
}

.img{
	width: 200px;
	height: 200px;
}


</style>
<script type="text/javascript">

function update(no){
	var url ="updateForm.jsp";
	url += "?no="+no;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
}

function del(no,oldfile){
	if(confirm("정말삭제하시겠습니까?")){
		var url ="deleteProc.jsp";
		url += "?no="+no;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&oldfile="+oldfile;
		location.href=url;
	} 
}

function read(no){
	var url = "read.jsp";
	url += "?no="+no;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
	
}


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<form method="post" action="./list.jsp">
	<div class="title"> 팀목록 </div>
		
	<div class="search">	
	<select name="col">
		<option value="name" <%if(col.equals("name")) out.println("selected='selected'"); %>>이름</option>
		<option value="phone" <%if(col.equals("phone")) out.println("selected='selected'"); %>>전화번호</option>
		<option value="skill" <%if(col.equals("skill")) out.println("selected='selected'"); %>>보유기술</option>
		<option value="total" <%if(col.equals("total")) out.println("selected='selected'"); %>>전체목록</option>
	</select>
	
	<input type="text" name="word" value="<%=word%>">
	<input type="submit" value="검색" >
		
	</div>
	</form>
	
	
	<div class="content">
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>보유기술</th>
				<th>사진</th>
				<th> 수정삭제 </th>
			</tr>

			<%
				if (list.size() == 0) {
			%>
			<tr>
				<td colspan="6">등록된 팀정보가 없습니다.</td>
			</tr>
			<%
				} else {
					while(iter.hasNext()) {
						TeamDTO dto = iter.next();
			%>
			<tr>
				<td><%=dto.getNo()%></td>
				<td><a href="javascript:read('<%=dto.getNo()%>')" ><%=dto.getName()%></a></td>
				<td><%=dto.getPhone()%></td>
				<td><%=dto.getSkillstr()%></td>
				
				<td><img class="img" src= './storage/<%=dto.getFilename()%>'></td>
		
				<td> <a href="javascript:update('<%=dto.getNo()%>')">수정</a>/
					 <a href="javascript:del('<%=dto.getNo()%>','<%=dto.getFilename()%>')">삭제</a>
				</td>
			</tr>
			<%
				} 
			}
			%>
		</table>
	

		<br><br>
		<input type = "button" value="등록" onclick ="location.href='./createForm.jsp'">
		<br><br><br>
		<%= Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>		
	</div>


<jsp:include page = "/menu/bottom.jsp" />

</body>
</html>





