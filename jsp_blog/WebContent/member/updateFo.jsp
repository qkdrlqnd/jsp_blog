<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<% 
	String id = request.getParameter("id");
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

img{
		width:500px;
		height: 700px;
}
 
</style> 

<script type="text/javascript">

function inputCheck(frm){



	if(frm.passwd.value != frm.repasswd.value ){
		alert("패스워드가 일치하지 않습니다");
		frm.passwd.value="";
		frm.repasswd.value="";
		frm.passwd.focus();
		return false;
	}
	if(frm.mname.value==""){
		alert("이름을 입력하세요");
		frm.mname.focus();
		return false;
	}
	if(frm.email.value==0){
		alert("email을 입력하세요");
		frm.email.focus();
		return false;
	}
	if(frm.job.value==0){
		alert("직업을 입력하세요");
		frm.job.focus();
		return false;
	}
	
}


	function emailCheck2(i){
		alert("이메일을 변경하려면 중복확인 버튼을 사용하세요");
		i.blur();
	}
	function emailCheck(email){
		if(email==""){
			alert("email를 입력해주세요");
			document.frm.email.focus();
		}
		else{
		var url = "email_proc.jsp";
		url += "?email=" + email;
		wr = window.open(url,"email검색","width=500,height=400");
		}
		
	}


</script>






<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 
<FORM name='frm' method='POST' action='./updatePr.jsp' onsubmit="return input(this)">
<input type="hidden" name="id" value="<%=id%>">
<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">

  <TABLE>
    <TR>
      <TD colspan = "3">
      	<img src ="./storage/<%=dto.getFname()%>" > 
      </TD>
    </TR>

    
    <TR>
      <TH> <em>이름</em>   </TH>
      <TD> <%=dto.getMname() %>  </TD>
      <TD> 고객 실명입니다. </TD>
    </TR>
    
    
    <TR>
      <TH> 전화번호  </TH>
      <TD><input type="text" name="tel" value="<%=dto.getTel() %>">  </TD>
      <TD> 변경할 전화번호를 입력하세요</TD>
    </TR>
    <TR>
      <TH> 이메일  </TH>
      <TD><input type="text" name="email" value="<%=dto.getEmail() %>" onclick="emailCheck2(this)">
      	  <input type="button" value="이메일중복확인" onclick="emailCheck()">
        </TD>
      <TD> 변경할 이메일를 입력하세요</TD>
    </TR>
    
    <TR>
      <TH> 우편주소   </TH>
      <TD> <%=dto.getMname() %>  </TD>
      <TD> 우편주소 </TD>
    </TR>
    
    
    <TR>
      <TH> 집주소  </TH>
      <TD><input type="text" name="address1" value="<%=dto.getAddress1() %>">  </TD>
      <TD> 변경할 집 주소를 입력하세요</TD>
    </TR>
    <TR>
      <TH> 집주소  </TH>
      <TD><input type="text" name="address2" value="<%=dto.getAddress2() %>">  </TD>     <TD> 변경할 상세를 입력하세요</TD>
    </TR>
    
    
    <TR>
      <TH>*직업</TH>
      <TD>
      		<select name="job">
      			<option value="0">선택하세요				</option>
      			<option value="A01">회사원				</option>
      			<option value="A02" selected>전산관련직	</option>
      			<option value="A03">연구전문직				</option>
      			<option value="A04">각종학교학생			</option>
      			<option value="A05">일반자영업				</option>
      			<option value="A06">공무원				</option>
      			<option value="A07">의료인				</option>
      			<option value="A08">법조인				</option>
      			<option value="A09">종교/언론/예술인		</option>
      			<option value="A10">기타					</option>
      		</select>
      		<script type="text/javascript">
      			document.frm.job.value = '<%=dto.getJob()%>'
      		</script>
      </TD>
      <TD>직업을 선택하세요</TD>
    </TR>
    
    
    
    
    
    
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
