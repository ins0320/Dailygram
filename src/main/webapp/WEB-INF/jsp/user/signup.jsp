<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<header>
			<logo><h2 class=" bg-secondary">dailygram</h2></logo>
		</header>
		<section class="bg-info d-flex justify-content-center">
			<div class="bg-warning">
				<h1 class="mt-3 display-3">dailygram</h1>
				<h5 class="mt-3">일상을 공유하려면 가입하세요.</h5>
				<div class="d-flex mt-5">
					<input type="text" class="form-control col-8" placeholder="사용자 이름">
					<button type="button" class="btn btn-info col-4 ">중복확인</button>
				</div>
				<input type="text" class="form-control mt-5" placeholder="아이디">
				<input type="text" class="form-control mt-5" placeholder="비밀번호">
				<input type="text" class="form-control mt-5" placeholder="이메일주소">
			</div>
		</section>
		<footer class="text-center bg-secondary">
			copyright  © 2022 dailygram
		</footer>	
	</div>
	
			
	
	
</body>
</html>