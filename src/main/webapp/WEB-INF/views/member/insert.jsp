<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="theme-color" content="#7952b3">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script>
//	 아이디 입력을 하는 동안에 idDuplicate() 함수를 호출하고 입력된 값을 콘솔에 출력
	function idDuplicate() {
	const id = document.getElementById('m_id').value;
	console.log(id);
	const checkResult = document.getElementById('id-dup-check')
	$.ajax({
		type: 'post', // 전송방식 (get, post, delete, put등)
		url : 'idDuplicate', // 요청주소 (컨트롤러로 요청하는 주소)
		data : {'m_id': id}, // 전송할 데이터 (자바스크립트 객체 'm_id'파라미터: id파라미터값 추가값이있으면 ,'ㅇㅇ':ㅇㅇ,)
		dataType: 'text', // 요청후 리턴받을 때의 데이터 형식
		success: function(result) { // 요청이 성공적으로 처리됐을 때 실행할 함수
			console.log('ajax 성공');
			console.log(result);
			if (result=="ok") {
				checkResult.style.color = 'green';
				checkResult.innerHTML = '멋진 아이디네요!!'
			} else {
				checkResult.style.color = 'red';
				checkResult.innerHTML = '이미 사용중인 아이디입니다.';
			}
			},
		error: function() { //요청이 실패했을때 실행할 함수
			console.log('오타찾으셈')
			},
			
	});
}
	</script>
	
	<style>
	h4 {
  font-family: 'Arial';
  color: white;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 4rem;
  line-height: 0.75;
  text-shadow:
  0 0 0.125em hsl(0 0% 100% / 0.5),
  0 0 0.45em currentColor;
  box-shadow: inset 0 0 1em 0 var
  (--clr-neon), white;
}
	</style>
	
</head>
<body class="bg-dark">

<form action="save" method="post" enctype="multipart/form-data">


	<div class = "row">
	<h4 class="text-center" style="margin-top:25px"> THE HOBBY SHARING COMMUNITY</h4>
	<h4 class="text-center"> Member Join </h4>
	</div>
	
	<!-- 아이디  -->
	<div class="container mt-2" style="width:50%; height:auto; background-color: #f5f5f5; border-radius: 2rem;">
	<div class="row">
	<div class="row mb-3 mt-3">
		<label for="inputId" class="col-sm-2 col-form-label">아 이 디</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="m_id" name="m_id" onblur="idDuplicate()">
		<span id="id-dup-check"></span>
    </div>
    </div>
    
    <!-- 비밀번호 -->
    <div class="row mb-3">
		<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
		<input type="password" class="form-control" id="inputPassword" name="m_password">
    </div>
  </div>
	
	<!-- 이름 -->
	<div class="row mb-3">
		<label for="inputName" class="col-sm-2 col-form-label"> 이 름 </label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputName" name="m_name">
    </div>
    </div>
	
	<!-- 이메일 -->
	<div class="input-group mb-3">
	<label for="inputemail" class="col-sm-2 col-form-label"> 이 메 일 </label>
  	<input type="text" class="form-control" id="inputemail" aria-label="Username" name="m_email">
	</div>
	
	<!-- phone -->
	<div class="row mb-3">
		<label for="inputPhone" class="col-sm-2 col-form-label">전화번호</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputPhone" name="m_phone">
    </div>
    </div>
    </div>
    
    <!-- gender -->
    <label for="inputgender" class="col-sm-2 col-form-label "> 성 별 </label>
  	<div class="form-check form-check-inline">
  	<input class="form-check-input" type="radio" id="flexRadioDefault1" name="m_gender" value="남자">
  	<label class="form-check-label" for="flexRadioDefault1">
    남성
 	 </label>
	</div>
	<div class="form-check form-check-inline">
  	<input class="form-check-input" type="radio" id="flexRadioDefault2" name="m_gender" value="여자" checked>
  	<label class="form-check-label" for="flexRadioDefault2">
    여성
  	</label>
	</div>
	
	<!-- hobby -->
	<div class="row mb-3 mt-3">
		<label for="hobby" class="col-sm-2 col-form-label">취 미</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="hobby" name="m_hobby">
    </div>
    </div>

    <!-- 주소 -->
<div class="row mb-3 mt-3">
<label for="sample6_postcode" class="col-sm-2 col-form-label">우편번호</label>
<div class="col-sm-10">
<input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호" name="m_oaddress">
<input type="button" onclick="sample6_execDaumPostcode()" class="mt-2" value="우편번호 찾기">
</div>
</div>

<div class="row mb-3 mt-3">
<label for="sample6_address" class="col-sm-2 col-form-label">주소</label>
<div class="col-sm-10">
<input type="text" id="sample6_address" class="form-control" placeholder="주소" name="m_address">
</div>
</div>

<div class="row mb-3 mt-3">
<label for="sample6_detailAddress" class="col-sm-2 col-form-label">상세주소</label>
<div class="col-sm-10">
<input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소" name="m_detailaddress">
</div>
</div>

<div class="row mb-3 mt-3">
<label for="sample6_extraAddress" class="col-sm-2 col-form-label">참고항목</label>
<div class="col-sm-10">
<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" name="m_extraaddress">
</div>
</div>


<!-- cdn (contents delivery network)  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
    
    
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    	<button type="submit" class="btn btn-outline-primary"> 회 원 가 입 </button>
		<a href="/" class="btn btn-outline-danger mb-3"> 취 소 </a>
	</div>
</div>	
</form>	
</body>
</html>