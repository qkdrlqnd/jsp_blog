<%@ page contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
  String root = request.getContextPath();
%>


<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function input(f){
	if(f.name.value==""){
		alert("이름을 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.gender[0].checked==false && f.gender[1].checked==false){
		alert("성별을 체크하세요");
		f.gender[0].focus();
		return false;
	}
	if(f.phone.value==""){
		alert("전화번호를 입력하세요");
		f.phone.focus();
		return false;
	}
	if(f.zipcode.value==""){
		alert("우편번호를 입력하세요");
		f.zipcode.focus();
		return false;
	}
	if(f.address1.value==""){
		alert("주소를 입력하세요");
		f.address1.focus();
		return false;
	}
	if(f.address2.value==""){
		alert("상세주소를 입력하세요");
		f.address2.focus();
		return false;
	}
	
	
	
	var cnt = 0;
	for(var i = 0; i<f.skill.length;i++){
		if(f.skill[i].checked){
			cnt += 1;
		}
	}
	
	if(cnt==0){
		alert("보유기술을 체크하세요.");
		f.skill[0].focus();
		return false;
	}
	
	
	if(f.hobby.selectedIndex==0){
		alert("취미를 선택하세요");
		f.hobby.focus();
		return false;
	}
	
	
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


</head>
<body>
	<jsp:include page="/menu/top.jsp"/>
	<form action="createProc.jsp" method="post" 
	onsubmit="return input(this)" 
	enctype="multipart/form-data" >
	

		 <div class="title"><h2>팀정보 생성</h2></div> 
		<table >
			<tr>
				<th>이름</th>
				<td><input name="name"  style="width: 98.5%"></td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td><label for="g1">남자<input id="g1" type="radio" name="gender" value = "남"></label>
				    <label for="g2">여자<input id="g2" type="radio" name="gender" value = "여"></label></td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><input id="textWD" type="text" name="phone"> </td>
			</tr>
			
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zipcode" size="7" id="sample6_postcode" placeholder="우편번호" maxlength="4">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">					
				 </td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text" name="address1" id="sample6_address" placeholder="주소"><br>
				<input  type="text" name= "address2" id="sample6_address2" placeholder="상세주소"></td> 
			</tr>
			
			<tr>
				<th> 보유기술 </th>
				<td style="font-size: 7pt"> 
					<label for="s1"><input id="s1" type="checkbox" name="skill" value = "jsp">jsp</label>
					<label for="s2"><input id="s2" type="checkbox" name="skill" value = "java">java</label>
					<label for="s3"><input id="s3" type="checkbox" name="skill" value = "mvc">mvc</label>
					<label for="s4"><input id="s4" type="checkbox" name="skill" value = "Spring">Spring </label>
				</td>
			</tr> 
			
			<tr>
				<th>취미</th>
				<td><select name="hobby">
						<option> 취미를 선택하세요 </option>
						<option value="기술서적읽기">기술서적읽기</option>
						<option value="영화보기">영화보기</option>
						<option value="모바일게임">모바일게임</option>
						<option value="보드게임">보드게임</option>
						<option value="야구경기">야구</option>
						<option value="조기축구">조기축구</option>
					</select> </td>
			</tr>
			
			<tr>
				<th>사진</th>
				<td> <input type="file" name="filename" style="font-size: 7pt"> </td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="reset" value="다시하기">
					<input type="button" value="목록" onclick="location.href='./list.jsp'">	
				</td>
			</tr>
		</table>

	</form>
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>