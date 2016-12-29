<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />

<% 


	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	
	boolean flag = dao.update(dto);

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
</style> 

<script type="text/javascript">

	function read(){
		var url = "read.jsp";
		url += "?id=<%=dto.getId()%>";
		
		location.href = url;
	}

</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">정보수정</DIV>

<div class="content">
	<%	if(flag){ 
			out.println("정보수정이 성공적으로 되었습니다.");
		}else{
			out.println("정보수정이 실패 되었습니다.");
		}
	%> 
</div>

  <DIV class='bottom'>
  1
   	<%	if(id != null && grade.equals("A")){ %>
    		<input type='button' value='정보확인' onclick="read()">
    	
   	<% } else{%>
   			<input type='button' value='다시시도' onclick="history.back()">
    
    <% } %>
  </DIV>

 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
