<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center " >
			<div class=" col-4">
				<textarea rows="5" class="form-control mt-2" id="contentInput"></textarea>
				<div class ="d-flex justify-content-between" >
					<input type="file" class="mt-2">
					<button type="button" class="btn btn-info">업로드</button>
				</div>	
				<div class="bg-white  border rounded posting mt-3">
				
					<div class="bg-white">닉네임</div>
					<input type="text" class="form-control col-12  picture">
				<div class="d-flex align-items-center mt-3">	
					<button type="button" class="btn btn-danger col-2">하트</button>
					<div>좋아요 56개</div>
				</div>
				<div class="d-flex align-items-center mt-3">
					<div clas--"bg-white">닉네임</div>
					<input type="text" class="form-control col-9 postWrite">
				</div>
				<div class="bg-white  border rounded mt-3">
					댓글
				</div>
				<div class="d-flex justify-content-between">
					<input type="text" class="form-control col-10 commentWrite" placeholder="댓글을 입력하세요">
					<button type="button" class="btn btn-info col-2">게시</button>
				</div>
				
				</div>
			</div>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />	
	</div>
</body>
</html>