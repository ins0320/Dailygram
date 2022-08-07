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
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
		<section class="bg-info d-flex justify-content-center">
			<content class="bg-warning col-4">
				<div class="mt-3 ml-3 display-3 dailygram">dailygram</div>
				<h5 class="mt-3 ml-3">일상을 공유하려면 가입하세요.</h5>
				<div class="d-flex mt-5">

					<input type="text" class="form-control col-8" placeholder="사용자 이름">
					<button type="button" class="btn btn-info col-4">중복확인</button>
				</div>
				<div>
					<input type="text" class="form-control mt-5 col-8" placeholder="아이디">
					<input type="text" class="form-control mt-5 col-8" placeholder="비밀번호">
					<input type="text" class="form-control mt-5 col-8" placeholder="이메일주소">
				</div>
				<div class="d-lfex justify-content-center mt-5">
					<button type="button" class="btn btn-info btn-block">중복확인</button>
				</div>
			</content>
		</section>
		<c:import url="/WEB-INF/jsp/include/foooter.jsp" />
	
			
	
	
</body>
</html>