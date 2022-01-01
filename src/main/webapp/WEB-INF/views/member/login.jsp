<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/cover/">

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link href="/resources/css/light.css" rel="stylesheet">
<meta name="theme-color" content="#7952b3">
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
 

 
	<form action="login" method="post">
	<div class = "row">
	<h4 class="text-center" style="margin-top:25px"> The </h4>
	<h4 class="text-center">Hobby</h4>
	<h4 class="text-center">Sharing</h4>
	<h4 class="text-center">Community</h4>
	<h4 class="text-center">Login</h4>
	</div>
	<div class="container mt-4 " style="width:30%; height:310px; background-color: #f5f5f5; border-radius: 2rem;">
	<div class="row">
	<div class="row mb-3 mt-5">
		<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputId" name="m_id">
    </div>
    </div>
    <div class="row mb-3">
		<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
    <div class="col-sm-10">
		<input type="password" class="form-control" id="inputPassword" name="m_password">
    </div>
  </div>
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    	<button type="submit" class="btn btn-outline-dark">로그인</button>
	</div>
	<div id = "naver_id_login" class="text-center mt-3 mb-3">
	</div>
	</div>
	</div>


	</form>
	
<script type="text/javascript">
var naver_id_login = new naver_id_login("1HSwbBKZhUdMQRvMVtmO", "http://localhost:8081/board/main");    
// Client ID, CallBack URL 삽입
// 단 'localhost'가 포함된 CallBack URL
var state = naver_id_login.getUniqState();
        
         naver_id_login.setButton("black", 4, 40);
         naver_id_login.setDomain("http://localhost:8081/member/login");    //  URL
         naver_id_login.setState(state);
         naver_id_login.setPopup();
         naver_id_login.init_naver_id_login();
</script>	

</body>
</html>