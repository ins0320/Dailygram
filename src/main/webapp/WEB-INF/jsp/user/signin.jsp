<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="content d-flex justify-content-center bg-info">
			<div class="col-4 bg-success mt-5">
				<img src="https://images.pexels.com/photos/1267291/pexels-photo-1267291.jpeg">
			</div>
			<div class="col-4 mt-5 bg-warning">
				<h1 class="text-center dailygram">dailygram</h1>
				<div class="mt-5">
					<input type="text" class="form-control mt-3" id="idInput" placeholder="아이디">
					<input type="password" class="form-control mt-3" id="passwordInput" placeholder="비밀번호">
				</div>
				<button type="button" id="joinBtn" class="btn btn-info btn-block mt-3">로그인</button>
				<div class="text-center mt-3">
					<a href="/user/signup/view">회원가입</a>
				</div>
			</div>	
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function() {
			$("#joinBtn").on("click", function() {
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				
				
				if(id == "") {
					alert("아이디를 입력하세요!!");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				
				
				// 입력된 데이터를 회원 가입 api 로 가입을 진행한다. 
				$.ajax({
					type:"post",
					url:"/user/signup",
					data:{"loginId":id, "password":password, "name":name, "email":email},
					success:function(data) {
						if(data.result == "success") {
							location.href = "/user/signin/view";
						} else {
							alert("아이디/ 비밀번호를 확인하세요");
						}
						
					},
					error:function() {
						
						alert("로그인 에러!!");
					}
					
				});
				
				
				
			});
			
			
		});
	
	
	</script>
	
	

</body>
</html>