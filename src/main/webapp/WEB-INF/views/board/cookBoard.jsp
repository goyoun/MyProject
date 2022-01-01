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
<link href="/resources/css/neon1.css" rel="stylesheet">
<style>

  h1 {
  font-family: 'Arial';
  color: #EBF7FF;
  text-transform: uppercase;
  font-weight: bold;
  font-size: 5rem;
  line-height: 1.00;
  text-shadow:
  0 0 0.125em hsl(0 0% 100% / 0.5),
  0 0 0.45em currentColor;
  box-shadow: inset 0 0 1em 0 var
  (--clr-neon), white;
}
}

</style>

<script>
	function logout() {
		location.href="/";
	}
</script>

<style>
table, th, tr, td {
	text-align : center;
}
</style>
</head>

<body class="bg-dark">

<div class="container mt-2 bg-dark" style="width:auto; height:auto; ">
<div class="album py-5 bg-dark" style="width:auto; height:auto; background-color: #f5f5f5;">
     <div class="container">
		<h1 class="text-center mt-2">Cook Board List</h1>
		<div class="mb-3" style="text-align: right"> 
		<button type="submit" class="neon-button" onclick="location.href='/board/cooksave'"> 글쓰기 </button>
    	<button type="submit" class="neon-button1" onclick="location.href='/board/main'"> 메인화면으로 </button>
    	</div>
		
		
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
    		<a class="navbar-brand"></a>
   <form action="/board/searchc" method="get" class="d-flex">
		<select class="me-2 neon-button2" name="searchtypec">
			<option value="b_title"> 제목 </option>
			<option value="b_writer"> 작성자 </option>
		</select>
        	<input class="form-control me-2 neon-button2" type="search" name="keywordc"placeholder="검색어.." aria-label="Search">
        	<button class="neon-button2" type="submit"> 검 색 </button>
      </form> 
  </div>
</nav>
</div>

 <br>
 

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <c:forEach items="${bListc}" var="cc">
        <div class="col">
          <div class="card shadow-sm">
            <%-- <img class="bd-placeholder-img card-img-top" alt="" src="/resources/tripimage/${c.b_filename}" width="100%" height="225" role="img" aria-label="자리 표시자: 썸네일" preserveAspectRatio="xMidYMid slice" focusable="false"> --%>
           <img class="rounded mx-auto d-block mt-3 btn" alt="" src="/resources/cookimage/${cc.b_filename}" width="400" height="400" onclick="location.href='cookdetail?b_number=${cc.b_number}&page=${pagingc.pagec}&m_number=${sessionScope.loginNumber}'">
            <div class="card-body">
            	<div class="d-flex bd-highlight mb-3">
            	<div class="me-auto p-2 bd-highlight">
              <p class="card-text"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"> </font><font style="vertical-align: inherit;"> ${cc.b_title} </font></font></p></div>
              <div class="p-2 bd-highlight">
              <img id="heart" src="/resources/like/like2.png" style="width:20px"> ${cc.b_likecount}
              <img src="/resources/like/eye.png" style="width:20px"> ${cc.b_hits}
              </div>
              	</div>
              <div class="d-flex justify-content-between align-items-center">
                <div style="border:1px solid black; border-radius: 1rem">
                  <font class="p-2" style="vertical-align: inherit;"><font style="vertical-align: inherit;">${cc.b_writer}</font></font>
                </div>
                <small class="text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${cc.b_date}</font></font></small>
              </div>
            </div>
          </div>
        </div>
              </c:forEach>
      </div>

    </div>
  
  <nav aria-label="Page navigation example">
  <ul class="pagination pagination-lg justify-content-center">
    <li class="page-item">
     <c:choose>
			<c:when test="${pagingc.pagec<=1}">
			<a class="page-link" href="#" aria-label="Previous">
			<span aria-hidden="true">&laquo;</span>
			</a>
			</c:when>
			<c:otherwise>
			<%-- 현재 페이지에서 1감소한 페이지 요청하는 링크 --%>
			<a class="page-link" href="/board/pagingc?pagec=${pagingc.pagec-1}" aria-label="Previous">
			 <span aria-hidden="true">&laquo;</span>
			</a>
			</c:otherwise>
		</c:choose>
    </li>
     <li class="page-item">
    		<c:forEach begin="${pagingc.startPagec}" end="${pagingc.endPagec}" var="i" step="1">
    		
			<c:choose>
			<%-- i값이 현재 페이지(page) 값과 같다면 i출력 --%>
				<c:when test="${i eq pagingc.pagec}">
			 <li class="page-item active" aria-current="page">	<a class="page-link" href="#">	${i}</a></li>
				</c:when>
				<c:otherwise>
		 <li class="page-item"><a class="page-link" href="pagingc?pagec=${i}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<c:choose>
			<c:when test="${paging.page>=paging.maxPage}">
			<a class="page-link" href="#" aria-label="Next">
       		<span aria-hidden="true">&raquo;</span></a>
			</c:when>
			<c:otherwise>
		 <li class="page-item"><a class="page-link" href="/board/pagingc?pagec=${pagingc.pagec+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span> </a></li>
			</c:otherwise>
		</c:choose>    
    </li>
  </ul>
</nav>
</div>

</head>
<body>



</body>
</html>