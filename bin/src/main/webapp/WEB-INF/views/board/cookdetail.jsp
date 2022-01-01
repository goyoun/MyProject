<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- JSTL(JSP Standard Tag Library) 사용  -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/neon2.css" rel="stylesheet">

<style>
h2 {
  font-family: 'Arial';
  color: #fff;
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

h3 {
  font-family: 'Arial';
  color: #fff;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 2rem;
  line-height: 0.75;
  text-shadow:
  0 0 0.125em hsl(0 0% 100% / 0.5),
  0 0 0.45em currentColor;
  box-shadow: inset 0 0 1em 0 var
  (--clr-neon), white;
}

h5 {
  font-family: 'Arial';
  color: #000;
  font-weight: bold;
  font-size: 1.25rem;
  line-height: 0.75;
}

span {
  font-family: 'Arial';
  color: #fff;
  font-weight: bold;
  font-size: 2rem;
  line-height: 0.75;
  text-shadow:
  0 0 0.125em hsl(0 0% 100% / 0.5),
  0 0 0.45em currentColor;
  box-shadow: inset 0 0 1em 0 var
  (--clr-neon), white;
}
</style>

</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<body class="bg-dark">
 
<div class="container mt-5 bg-dark" style="width:55%; height:auto; background-color: #f5f5f5; border-radius: 1rem;">
<h2> ${board.b_title} </h2>
<div class="d-flex bd-highlight mb-3">
 <div class="me-auto p-2 bd-highlight">
<span class="badge rounded-pill bg-dark fs-6">글쓴이 : ${board.b_writer}</span>
</div>
	<div aria-label="Basic mixed styles example" style="text-align: right;">
	<c:choose>
	<c:when test="${sessionScope.loginId eq board.b_writer}">
  		<button type="button" class="neon-button" onclick="location.href='/board/main'"> 메인화면 </button>
  		<button type="button" class="neon-button1" onclick="location.href='/board/pagingc?pagec=${pagec}'"> 글목록 </button>
  		<button type="button" class="neon-button2" onclick="location.href='/board/updatec?b_number=${board.b_number}&pagec=${pagec}'"> 수정 </button>
  		<button type="button" class="neon-button3" onclick="location.href='/board/deletec?b_number=${board.b_number}'"> 삭제 </button>
  	</c:when>
	
	<c:when test="${sessionScope.loginId eq 'admin'}">
	  <button type="button" class="neon-button" onclick="location.href='/board/main'"> 메인화면 </button>
 	  <button type="button" class="neon-button1" onclick="location.href='/board/pagingc?pagec=${pagec}'"> 글목록 </button>
    	<button type="button" class="neon-button3" onclick="location.href='/board/deletec?b_number=${board.b_number}'"> 삭제 </button>
  	</c:when>
  	
  	<c:otherwise>
   	<button type="button" class="neon-button" onclick="location.href='/board/main'"> 메인화면 </button>
  	<button type="button" class="neon-button1" onclick="location.href='/board/pagingc?pagec=${pagec}'"> 글목록 </button>
  	</c:otherwise>
  	</c:choose>
  	
  	</div>
	</div>
	</div>

<hr>

	 			<!-- 파일가져오기 -->
<div class="container" style="width:55%; height:auto; background-color: #f5f5f5; border-radius: 1rem;">	 			
<div class="text-center">
<br>
	<img class="rounded mx-auto d-block mt-3" alt="" src="/resources/cookimage/${board.b_filename}" width="400" height="400"> <br>   
</div>

	<!-- 내용 -->
	<div class="form-floating text-center">
  <textarea style = "height:300px; width:80%;"  readonly>${board.b_contents} </textarea>
 </div>
<br>


<div style="text-align: center;">
       <a class="btn heart">
           <img id="heart" src="/resources/like/like1.png" style="width:80px" >
       </a>
       <h5>좋아요</h5>
   </div>
   
<script>
    $(document).ready(function () {
        var heartval = ${heart};
        
        console.log(heartval);
        
        if(heartval>0) {
            $("#heart").prop("src", "/resources/like/like2.png");
            $(".heart").prop('name',heartval)
        }
        
        else {
            $("#heart").prop("src", "/resources/like/like1.png");
            $(".heart").prop('name',heartval)
        }
        $(".heart").on("click", function () {
           var that = $(".heart");
           var sendData = {'b_number' : '${board.b_number}',
            		'm_number' : '${sessionScope.loginNumber}', 'heart' : that.prop('name')};
           console.log(that)
           console.log(sendData)
           
            $.ajax({
                url :'/board/heart',
                type :'post',
                data : {'m_number': ${sessionScope.loginNumber}, 'b_number': ${board.b_number}, 'heart': ${heart}},
                datatype : 'json',
                success : function(data){
                    that.prop('name',data);
                    if(data==1) {
                        $('#heart').prop("src","/resources/like/like2.png");
                    }
                    else{
                        $('#heart').prop("src","/resources/like/like1.png");
                    } location.reload();
                }
            });
            
        });
    });
</script>
	    
<hr>
<!-- 댓글 목록 출력 -->	
<h4>댓글</h4>
	<div id="comment-list" class="card">
	<c:forEach items="${commentList}" var="c">
  <h5 class="card-header bg-secondary">${c.c_writer}</h5>
  <div class="card-body">
   ${c.c_contents}
    <div class="d-flex flex-row-reverse bd-highlight">
    <div class="p-2 bd-highlight">
    <button class="neon-button5" onclick="location.href='/comment/deletec?b_number=${board.b_number}&page=${page}&c_number=${c.c_number}'">댓글삭제</button>
    </div>
    </div>
    <hr>
    </div>
    </c:forEach>
  </div>
  <br>

	
	
<!-- 댓글작성 -->

<div class="d-flex bd-highlight">
<input id="c_writer" type="hidden" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" value="${sessionScope.loginId}" readonly>
<div class="form-floating mb-3 p-2 w-100 bd-highlight">
<textarea id="c_contents" class="form-control" id="floatingTextarea2" style="height: 100px"></textarea>
<label for="floatingTextarea2">${sessionScope.loginId}</label>
</div>
<div class="p-2">
<button id="comment-write-btn" class="mb-3 btn btn-primary text-center" style="height: 100px">등록</button>
</div>
</div>
</div>


</body>

<script>

/* 	const commentBtn = document.getElementById("comment-write-btn");
	commentBtn.addEventListener("click", function() {
		console.log("댓글등록 버튼 클릭")
	}); */
	
	/* jquery */
 	 	$("#comment-write-btn").click(function(){
		console.log("댓글등록버튼 클릭");
		const c_writer = document.getElementById('c_writer').value;
		const c_contents = document.getElementById('c_contents').value;
		console.log(c_writer, c_contents);
		const boardNumber = '${board.b_number}';
		console.log(c_writer, c_contents, boardNumber);
		$.ajax({
			type: 'post', // 전송방식 (get, post, delete, put등)
			url : '/comment/save', // 요청주소 (컨트롤러로 요청하는 주소)
			data : {
				'c_writer': c_writer,
				'c_contents': c_contents,
				'b_number': boardNumber }, 	// 전송할 데이터 (자바스크립트 객체 'm_id'파라미터: id파라미터값 추가값이있으면 ,'ㅇㅇ':ㅇㅇ,)
			dataType: 'json', 				// 요청후 리턴받을 때의 데이터 형식
			success: function(result) {		 // 요청이 성공적으로 처리됐을 때 실행할 함수
				console.log(result);
				let output = "<div id='comment-list' class='card'>";
				for(let i in result){
					output += "<h5 class='card-header'>" +result[i].c_writer+"</h5>";
					output += "<div class='card-body'>";
					output += "<p class='card-text'>"+result[i].c_contents+"</p>";
					output += "<hr>";
					output +="</div>";
	
				}
				output += "</div>";
				// id가 comment-list인 div에 출력
				document.getElementById('comment-list').innerHTML = output;

				document.getElementById('c_contents').value='';
				location.reload();
			},
			error: function() { //요청이 실패했을때 실행할 함수
				console.log('오타찾으셈')
			},
					
			});
	});
		/* ajax 문법을 이용하여 댓글 작성자, 작성내용을 comment/save 주소로 post방식으로 전송하는 코드를 작성 */
		/* CommentController도 하나 선언해서 여기서 보낸 데이터를 받는지 sysout으로 출력해봅시다.
		팁) data: {"c_writer": 작성자입력값, "c_contents" : 내용입력값}*/


</script>
</html>