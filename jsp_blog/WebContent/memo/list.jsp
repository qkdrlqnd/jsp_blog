<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>


<%

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	

	
	//////페이지관련
	int nowPage = 1 ;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
	}
	int recordPerPage = 5;
	
	//////DB에서 읽어 올 시작순번과 끝순번 생성
	int sno = ((nowPage -1)  * recordPerPage +1);
	int eno = nowPage * recordPerPage;
	
	
	
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	List<MemoDTO> list = mdao.list(map);
	
	int totalRecord = mdao.total(col,word);
	
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
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 10px
}



.search{

	width: 80%;
	text-align: center;
	margin: 1px auto;
}


</style>

<script type="text/javascript">

function read(memono) {
	var url="read.jsp"
	url+= "?memono="+memono;
	url+= "&col=<%=col%>";
	url+= "&word=<%=word%>";
	location.href=url;

}



</script>

</head>

 <body>
 <jsp:include page="/menu/top.jsp"/>
	<div>메모목록</div>
	
	<div class="search">
	<form method="post" action ="./list.jsp">
		<select name="col">
					
			<option value="title" <%if(col.equals("title")) out.println("selected='selected'"); %>>제목</option>
			<option value="content" <%if(col.equals("content")) out.println("selected='selected'"); %>>내용</option>
			<option value="total">전체출력</option>
		
		</select>
		<input type="text" name="word" value="<%=word%>" >
		<input type='submit' value="검색">
		<input type='button' value='등록'	onclick="location.href='./createForm.jsp'">
	
	</form>
</div>
	
	
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="4">등록된 메모가 없습니다.</td>
		</tr>
		<%
			} else {
				for(int i =0; i<list.size(); i++) {
					MemoDTO dto = list.get(i);
					
					
		%>
		<tr>
			<td><%=dto.getMemono()%></td>

			
			<td><a href="javascript:read('<%=dto.getMemono()%>')"> <%=dto.getTitle()%></a></td> 
			<td><%=dto.getWdate()%></td>
			<td><%=dto.getViewcnt()%></td>
		</tr>
		<%
				}
			} //if-end
		%>
	</table>
	<div>
		<input type="button" value="등록"
			onclick="location.href='./memoform.jsp'">
			<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
	</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>