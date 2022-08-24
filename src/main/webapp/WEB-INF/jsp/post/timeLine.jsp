<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marondalgram</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="content d-flex justify-content-center">
			<!--  timeline -->
			<div class="timeline col-5">
				<!--  입력 상자 -->
				<div class="input-box border rounded">
					<textarea class="form-control border-0" rows="3" id="contentInput"></textarea>
					
					<div class="d-flex mt-2 justify-content-between">
						<a href="#" id="imageIcon"> <i class="bi bi-image"></i> </a> 
						<input type="file" id="fileInput" class="d-none">
						<button type="button" class="btn btn-success" id="uploadBtn">업로드</button>
					</div>
				</div>
				<!-- /입력 상자 -->
				
				<!-- 피드들 -->
				<div class="mt-4">
					<c:forEach var="postDetail" items="${postList }">
					<!-- 피드 -->
					<div class="border rounded mt-3">
						<!-- 타이틀 -->
						<div class="d-flex justify-content-between p-2">
							<div>${postDetail.user.loginId }</div>
							<div>
								<%-- 로그인한 사용자 userId 가 해당 게시글의 사용자 userId 가 일치하는 경우에 해당 버튼 노출 --%>
								<c:if test="${userId eq postDetail.user.id }">
							 <%-- 삭제 버튼 --%>
								<a href="#"  data-toggle="modal" data-target="#moreModal" class="more-btn" data-post-id="${postDetail.post.id }">
									<i class="bi bi-three-dots"></i>
								</a>
								</c:if>
							</div>
						</div>						
						<!-- /타이틀 -->
						
						<div>
							<img class="w-100" src="${postDetail.post.imagePath }">
						</div>
						
						<!-- 좋아요 -->
						<div class="p-2">
						<c:choose>
							<c:when test="${postDetail.like }">
								<a href="#" class="unlike-btn decoration-none" data-post-id="${postDetail.post.id }">
									<span class="heart-size text-danger"><i class="bi bi-heart-fill"></i> </span>
								</a>
							</c:when>
							<c:otherwise>
								<a href="#" class="like-btn decoration-none" data-post-id="${postDetail.post.id }">
									<span class="heart-size"><i class="bi bi-heart"></i> </span>
								</a>
							</c:otherwise>
						
						</c:choose>
							좋아요 ${postDetail.likeCount }개
							
						</div>
						<!-- /좋아요 -->
						
						<!--  게시글  -->
						<div class="p-2">
							<b>${postDetail.user.loginId }</b> ${postDetail.post.content }
						</div>
						<!-- /게시글  -->
						
						<!-- 댓글 -->
						<div class="p-2">
							<div class="mb-2 border-bottom small">댓글</div>
							<!--  댓글 리스트 -->
							<div class="mt-2">
								<c:forEach var="commentDetail" items="${postDetail.commentList }">
								<div><b>${commentDetail.user.loginId }</b> ${commentDetail.comment.content } </div>
								</c:forEach>
							</div>
							<!-- /댓글 리스트 -->
							
							<!-- 댓글 입력 -->
							<div class="d-flex mt-2 border-top">
								<input type="text" class="form-control border-0" id="commentInput${postDetail.post.id }">
								<button data-post-id="${postDetail.post.id }" type="button" class="btn btn-success ml-2 comment-btn">게시</button>
							</div>
							<!-- /댓글 입력 -->
						</div>
						<!-- /댓글 -->
					</div>
					<!-- /피드 -->
					</c:forEach>
				
				
				</div>
				<!-- /피드들 -->
			</div>
			<!--  /timeline -->
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
		
		<!-- Modal -->
		<div class="modal fade" id="moreModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      
		      <div class="modal-body text-center">
		        <a href="#" id="deleteBtn">삭제하기</a>
		      </div>
		      
		    </div>
		  </div>
		</div>
	
	</div>
	
	
	<script>
	$(document).ready(function() {
		
		$(".more-btn").on("click", function() {
			
			// 이벤트가 발생한 버튼에서 post-id를 얻어 온다. 
			let postId = $(this).data("post-id");
						
			// 삭제하기 버튼에 해당 post-id를 저장한다. (data-post-id 속성에 값을 넣는다)
			// <a href="#" id="deleteBtn" data-post-id="8">삭제하기</a>
			$("#deleteBtn").data("post-id", postId);
			
			
		});
		
		
		$("#deleteBtn").on("click", function() {
			
			// postId
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get",
				url:"/post/delete",
				data:{"postId":postId},
				success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("삭제 실패");
					}
				},
				error:function() {
					alert("삭제 에러");
				}
				
			})
			
		});
		
		$(".comment-btn").on("click", function() {
			
			// 이벤트가 일어난 버튼에서 postId를 얻어 온다.
			let postId = $(this).data("post-id");
			// 작성한 댓글 가져오기 
			// #commentInput5
			let content = $("#commentInput" + postId).val();
			
			$.ajax({
				type:"post",
				url:"/post/comment/create",
				data:{"postId":postId, "content":content},
				success:function(data){
					if(data.result == "success") {
						location.reload();
					} else {
						alert("댓글 작성 실패");
					}
					
				},
				error:function() {
					alert("댓글 작성 에러");
				}
				
			});
			
		});
		
		
		$(".unlike-btn").on("click", function(e) {
			e.preventDefault();
			// data-post-id
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get",
				url:"/post/unlike",
				data:{"postId":postId},
				success:function(data) {
					
					if(data.result == "success") {
						location.reload();
					} else {
						alert("좋아요 취소 실패");
					}
				},
				error:function() {
					
					alert("좋아요 취소 에러");
				}
				
			});
			
		});
		
		
		$(".like-btn").on("click", function(e) {
			e.preventDefault();
			
			// 현재 클릭된 태그 객체를 얻어 와서 postId를 얻어 온다
			// data-post-id="10"
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get",
				url:"/post/like",
				data:{"postId":postId},
				success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("좋아요 실패");
					}
					
				},
				error:function() {
					alert("좋아요 에러!");
				}
			});
			
		});
		
		$("#imageIcon").on("click", function(e) {
			// fileInput을 클릭한 효과를 만들어야 한다.
			e.preventDefault();
			$("#fileInput").click();
		});
		
		$("#uploadBtn").on("click", function() {
			
			let content = $("#contentInput").val().trim();
			
			if(content == "") {
				alert("내용을 입력하세요");
				return ;
			}
			
			// 파일 선택 유효성 검사 
			// $("#fileInput")[0].files[0]
			if($("#fileInput")[0].files.length == 0) {
				alert("이미지를 선택하세요!!");
				return ;
			}
			
			var formData = new FormData();
			formData.append("content", content);
			formData.append("file", $("#fileInput")[0].files[0]);
			
			// 사용자가 입력한 content 로 api를 호출해서 데이터를 입력한다. 
			$.ajax({
				type:"post",
				url:"/post/create",
				data:formData,
				enctype:"multipart/form-data",
				processData:false,
				contentType:false,
				success:function(data) {
					if(data.result == "success") {
						location.reload();
					} else {
						alert("업로드 실패!!");
					}
					
				},
				error:function() {
					alert("업로드 에러!");
				}
			});
		});
		
		
	});
	
	
	</script>

</body>
</html>