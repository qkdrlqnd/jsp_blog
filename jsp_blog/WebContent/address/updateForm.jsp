<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<jsp:setProperty property="*" name="dao"/>

<% request.setCharacterEncoding("UTF-8");%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	AddressDTO dto = adao.read(no);
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>
	*{
		text-align: center;
		font-size: 24px;
		font-family: gulim; 
	}
	table{
		margin: 0 auto;
		margin-top: 100px;
	}	
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
	}
</style>
<script type="text/javascript">

function check(frm){
	if(frm.name.value==""){
		alert("이름을 입력하세요!");
		frm.CFname.focus();
		return false;
	}	
	if(frm.phone.value==""){
		alert("전화번호를 입력하세요!");
		frm.CFphone.focus();
		return false;
	}	
	if(frm.zipcode.value==""){
		alert("우편번호를 입력하세요!");
		frm.CFzipcode.focus();
		return false;
	}
	if(frm.address1.value==""){
		alert("주소를 입력하세요!");
		frm.CFaddress1.focus();
		return false;
	}
	if(frm.address2.value==""){
		alert("상ㅔ주소를 입력하세요!");
		frm.CFaddress2.focus();
		return false;
	}
}


function alist(){
	
	var url ="./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
	
}




</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form name="frm" action="./updateProc.jsp" method="post" onsubmit="return check(this)">
		<input type="hidden" name="no" value="<%= dto.getNo()%>">
		<input type="hidden" name="col" value="<%= request.getParameter("col")%>">
		<input type="hidden" name="word" value="<%= request.getParameter("word")%>">
		<input type="hidden" name="nowPage" value="<%= request.getParameter("nowPage")%>">
			<table>
				<tr>
					<th>이름</th>
					<td><%=dto.getName()%></td>
				</tr>			
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" value="<%=dto.getPhone()%>"  placeholder="전화번호"></td>
				</tr>			
				<tr>
					<th>우편주소</th>
					<td><input style="width:60%" type="text" name="zipcode" maxlength="5" size="5" value="<%=dto.getZipcode()%>" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>			
				<tr>
					<th>주소</th>
					<td><input type="text" name="address1" value="<%=dto.getAddress1()%>" id="sample6_address" placeholder="주소"></td>
				</tr>			
				<tr>
					<th>상세주소</th>
					<td><input type="text" name="address2" value="<%=dto.getAddress1()%>" id="sample6_address2" placeholder="상세주소"></td>
				</tr>			
							
				<tr>
					<td colspan ="2"><input type="submit" value="수정">
									 <input type="reset" value="다시하기">
									 <input type="button" value="목록" onclick="alist()">	
					</td>
					
				</tr>			
			
			
			</table>
		</form>
	</div>

</body>
</html>
