<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="h-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title> The Hobby Sharing Community </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/cover/">

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<link href="/resources/css/light.css" rel="stylesheet">
<meta name="theme-color" content="#7952b3">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      :root{
      --clr-neon: hsl(350 0% 100%);
      --clr-bg: hsl(323 21% 16%);
      --clr-neon1: hsl(119 91% 54%);
      --clr-bg1: hsl(323 21% 16%);
      }
      *,
      *::before,
      *::after{
      box-sizing: border-box;
      }
      
      .neon-button {
      	font-size: 2rem;
      	display: inline-block;
      	cursor: pointer;
      	text-decoration: none;
      	color: white;
      	border: currentColor 0.125em solid;
      	padding: 0.25em 1em;
      	border-radius: 0.25em;
      	text-shadow: 
      	0 0 0.125em hsl(0 0% 100% / 0.5),
      	0 0 0.45em currentColor;
      	box-shadow: inset 0 0 1em 0 var
      	(--clr-neon), white;
      	position: relative;
      	
      	transition: background-color 100ms linaer;
      	}
      .neon-button::before{
      pointer-events: none;
      content: "";
      position: absolute;
      background: white;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      tranform: perspective(1em) rotateX(40deg) sacle(1, 0.35);
      filter: blur(1.5em);
      opacity: 0.7;
      }
      .neon-button:hover {
      	background: var(--clr-neon);
      	color: var(--clr-bg);
      	text-shadow: none;
      }
      
      .neon-button::after {
      	content: '';
      	position: absolute;
      	top:0;
      	bottom: 0;
      	left: 0;
      	right: 0;
      	box-shadow: 0 0 2em 0.5em var(--clr-neon);
      	opacity: 0;
      	transition: opacity 100ms linear;
      }
      
      .neon-button:hover::after{
      opacity: 1;
      }
      h1 {
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
      
      
      
      
    </style>

    
    <!-- Custom styles for this template -->
    <link href="/resources/css/cover.css" rel="stylesheet">
    
    
  </head>
  <body class="d-flex h-100 text-center text-white bg-dark">
    
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="mb-auto">
    <div>
      <h1 class="float-md-start mb-0">The Hobby Sharing Community</h1>
      <nav class="nav nav-masthead justify-content-center float-md-end">
        <a class="nav-link active" href="/member/login" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인</a>
        <a class="nav-link active" href="/member/insert"> 회원가입</a>
      </nav>
    </div>
  </header>

  <main class="px-3">
  
    <h2>
    <span> COVID-19.. COVID-19..</span>
    <span class="light2"> 코로나에 지친 여러분 </span> 
    </h2>
    <p class="lead"> 여러분들의 취미를 공유하며 새로운 활력을 얻어보아요!</p>
    
    <p class="lead">
      <a href="/member/insert" class="neon-button">GO!</a>
    </p>
  </main>

  <footer class="mt-auto text-white-50">
    <p>The Hobby Sharing Community <a href="https://github.com/goyoun/MyProject" class="text-white">GitHub</a>, by <a href="https://www.instagram.com/ggoyoun91/" class="text-white">YounSungKo</a>.</p>
  </footer>
</div>


    
  

</body></html>