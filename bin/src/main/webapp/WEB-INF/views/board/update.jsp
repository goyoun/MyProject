<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>

<body>

<form action="/board/update" method="POST" name="update_form" enctype="multipart/form-data">

<div class="container mt-5" style="width:40%; height:500px; background-color: #f5f5f5; border-radius: 3rem;">
	<div class = "row">
	<h2 class="text-center" style="margin-top:25px"> Trip Update </h2>
	</div>
	
	<input type="hidden" name="m_number" value="${board.m_number}">
	<input type="hidden" name="page" value="${page}"> <br>
	
	<div class="row mb-3 mt-3">
		<label for="inputNumber" class="col-sm-2 col-form-label">글번호</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputNumber" name="b_number" value="${board.b_number}"readonly>
    </div>
    </div>
    
	<div class="row mb-3 mt-3">
		<label for="inputId" class="col-sm-2 col-form-label">작성자</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputId" name="b_writer" value="${board.b_writer}"readonly>
    </div>
    </div>
    	
	<div class="row mb-3">
		<label for="inputName" class="col-sm-2 col-form-label">제목</label>
    <div class="col-sm-10">
		<input type="text" class="form-control" id="inputName" name="b_title" value="${board.b_title}">
    </div>
    </div>
	
	<div class="row mb-3">
	 <label for="exampleFormControlTextarea1" class="col-sm-2 col-form-label"> 내용 </label>
     <div class="col-sm-10">
		<textarea class="form-control" id="inputId" name="b_contents" > ${board.b_contents} </textarea>
    </div>
    </div>
    
    <input type="file" name="b_file" class="warning">
    
	<div class="d-grid gap-2 col-6 mx-auto mt-5">
    	<button type="submit" class="btn btn-outline-success"> 수정하기 </button>
	</div>
</div>	
	
</form>	

</body>
</html>