<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 		<h2>회원 개인 정보</h2>
 		
  	<h3>번호 : ${member.m_number} <br>
  		아이디 : ${member.m_id} <br>
        비밀번호 : ${member.m_password} <br>
        이름 : ${member.m_name} <br>
		이메일 : ${member.m_email} <br>
		전화번호 : ${member.m_phone}<br>
		성별 : ${member.m_gender} <br>
		취미 : ${member.m_hobby} <br>
		우편번호 : ${member.m_oaddress} <br>
		주소 : ${member.m_address} ${member.m_detailaddress} ${member.m_extraaddress} </h3>
		 <br>
		
		<a href="/member/memberAll">이전화면으로 돌아가기</a>
		
</body>
</html>
