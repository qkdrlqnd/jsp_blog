<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
 
 
 	
 
 <% 
 	String id = request.getParameter("id");
	String grade = (String)session.getAttribute("grade"); 	
 	if(id == null){
 		id = (String)session.getAttribute("id");
 	
 	}
 	MemberDTO dto = dao.read(id);
 	
 	
 
 %>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
img.img{
	
	
	width: 350px;
	height: 550px;
	
	
}

td#td1{
	
	 margin: 50px auto;
	 background-color: black;
}

</style> 

<script type="text/javascript">

	function mlist(){
		var url = "<%=root%>/admin/list.jsp";
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href= url;
	}

	function updateFile(){
		var url = "./updateForm.jsp";
		url += "?id=<%=id%>";
		url += "&oldfile=<%=dto.getFname()%>"
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;
		
		
	}
	function updatePw(){
		var url = "./updatePwForm.jsp";
		url += "?id=<%=id%>";
		url += "&passwd=<%=dto.getPasswd()%>"
		
		location.href = url;
		
		
	}
	function update(){
		var url = "./updateFo.jsp";
		url += "?id=<%=id%>";
		location.href = url;
	}
</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">상세정보</DIV>
  <TABLE>
   			<TR >
      			<TD id="td1" rowspan="11" ><a href="http://localhost:8000/jsp_member/member/storage/<%=dto.getFname()%>" ><img class="img" src="./storage/<%=dto.getFname()%>"></a></TD>
      		</tr>
    		
    		<tr>
    			<TH>아이디</TH>
      			<TD><%=dto.getId() %></TD>
      		</tr>
      		
      		<tr>
      			<TH>이름</TH>
      			<TD><%=dto.getMname() %></TD>
      		</tr>
    		
    		<tr>
      			<TH>전화번호</TH>
      			<TD><%=dto.getTel() %></TD>
      		</tr>
    		<tr>
      			<TH>우편번호</TH>
      			<TD><%=dto.getZipcode() %></TD>
      		</tr>
    		<tr>
      			<TH>주소</TH>
      			<TD><%=dto.getAddress1() %></TD>
      		</tr>
    		<tr>
      			<TH>상세주소</TH>
      			<TD><%=dto.getAddress2() %></TD>
      		</tr>
    		
    		<tr>
      			<TH>이메일</TH>
      			<TD><%=dto.getEmail() %></TD>
			</tr>
			
			<tr>
      			<TH>직업</TH>
      			<TD><%=dto.getJob()%>
      				(<%=Utility.getCodeValue(dto.getJob()) %>)
      			</TD>
			</tr>
    		
    		<tr style="width: 25%">
      			<TH>회원등급</TH>
      			<TD><%=dto.getGrade() %></TD>
      		</tr>
    		
    		<tr>	
      			<TH>등록일</TH>
      			<TD><%=dto.getMdate().substring(0,10) %></TD>
    		</TR>
 
  </TABLE>
  <DIV class='bottom'>
	<%if(id != null && grade.equals("A")){ %>
    	<input type='button' value='회원목록' onclick="mlist()">
    <%}else{ %>
    <input type='button' value='정보수정' onclick="update()">
    <input type='button' value='사진수정' onclick="updateFile()">
    
    <form action="./updatePwForm.jsp" method="post">
    	<input type="hidden" name="passwd" value="<%=dto.getPasswd()%>">
    	<input type="submit" value="패스워드변경">
    </form>
    <%} %>

  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
