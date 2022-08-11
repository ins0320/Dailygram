<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
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
		<hr>
		<session class="d-flex justify-content-center " >
			<!-- timeLine -->
			<div class="col-6">
				<!-- 글 입력상자 -->
				<div class=" input-box border rounded">
					<textarea rows="3" class="form-control border-0" id="content" placeholder="내용을 입력하세요"></textarea> <!-- border-0: 테두리 굴기 -->
					<div class ="d-flex justify-content-between" >
						<input type="file" class="mt-2" id="imagePath">
						<button type="button" class="btn btn-info" id="uploadBtn">업로드</button>
					</div>	
				</div>	
				<!-- /글 입력 상자 -->
				
				<!-- 피드들 -->	
				<div class="bg-white border rounded mt-3">
					<!-- 타이틀 -->
					<div class=" d-flex justify-content-between p-2">
						<div>닉네임</div>
						<i class="bi bi-three-dots"></i> 
					</div>
					<!-- /타이들 -->
					
					<!-- 이미지 -->
					<div>
						<img class="col-12" src="https://cdn.pixabay.com/photo/2017/11/14/13/06/kitty-2948404_960_720.jpg">
					</div>
					<!-- /이미지 -->
					
					<!-- 좋아요 -->
					<div class="d-flex align-items-center  p-2">	
						<i class="bi bi-heart likeImg"></i>
						<div class="ml-3">좋아요 56개</div>
					</div>
					<!--  /좋아요 -->
					
					<!-- 게시글 -->
					<div class="d-flex align-items-center mt-3 ml-2">
						<div><b>닉네임</b></div>
						<div class="ml-3">고양이</div>
					</div>
					<!-- /게시글 -->
					
					<!-- 댓글 -->
						<div class="p-2">
							<div class="border-bottom small">댓글</div>
						</div>
					<!-- 댓글 -->		
					
					<!-- 갯들 리스트 -->
					<div class="mt-2 ml-2 rounded">
						<div> <b>닉네임</b> 고양이 너무 귀여워요</div>
						<div> <b>닉네임2</b> 릴스에서 봤어요 </div>
					</div>
					<!-- /댓글 리스트 -->
					
					<!-- 댓글 입력 -->
					<div class="d-flex justify-content-between mt-3 rounded">
						<input type="text" class="form-control col-10" placeholder="댓글을 입력하세요">
						<button type="button" class="btn btn-info col-2">게시</button>
					</div>
					<!-- /댓글 입력 -->
				
				</div>
				<!-- /피드들 -->
			</div>	
		</session>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />	
	</div>
	
	<script>
	
	$(document).ready(function(){
		$("#uploadBtn").on("click", function(){
			
			let content = $("#content").val();
			let imagePath = $("#imagePath").val();
			
			if(content == ""){
				alert("내용을 입력하세요");
				return;
			}
			
		$.ajax({
			type: "post", 
			url: "/post/create",
			data: {"content" : content, "imagePath" : imagePath},
			success:function(data){
				if(data.result == "success"){
					location.href="#";
				}else{
					alert("포스팅 실패");
				}
			},
			error:function(){
				alert("포스팅 에러");
			}
			
		});	
	});	
});
	
	</script>
</body>
</html>