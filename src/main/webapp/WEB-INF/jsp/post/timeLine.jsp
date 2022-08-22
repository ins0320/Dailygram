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
		<section class="d-flex justify-content-center " >
			<!-- timeLine -->
			<div class="col-6">
				<!-- 글 입력상자 -->
				<div class=" input-box border rounded">
					<textarea rows="3" class="form-control border-0" id="content" placeholder="내용을 입력하세요"></textarea> <!-- border-0: 테두리 굴기 -->
					<div class ="d-flex justify-content-between" >
						<a href="#" id="imageIcon" > <i class="bi bi-card-image"></i></a>
						<input type="file" class="d-none" id="fileInput">
						<button type="button" class="btn btn-info" id="uploadBtn">업로드</button>
					</div>	
				</div>	
				<!-- /글 입력 상자 -->
				
				<!-- 피드들 -->	
					<c:forEach var="postDetail" items="${postList}">
						<div class="bg-white border rounded mt-3">
					
						<!-- 타이틀 -->
						<div class=" d-flex justify-content-between p-2">
							<div>${postDetail.user.loginId }</div>
							
							<%--로그인한 사용자 userId가 해당 게시글의 사용자 suerId --%>
							<c:if test= "${userId eq postDetail.user.id}">
								<a href="#" data-toggle="modal" data-target="#exampleModalCenter" class="more-btn" data-post-id="${postDetail.post.id}"><i class="bi bi-three-dots-vertical"></i></a>
							</c:if>
						</div>
						<!-- /타이들 -->
						
						
						<!-- 이미지 -->
						<div>
							<img class="w-100" src="${postDetail.post.imagePath}">
						</div>
						<!-- /이미지 -->
						
						<!-- 좋아요 -->
						<div class="d-flex align-items-center  p-2">	
						<c:choose>
							<c:when test="{postDetail.like}">
								<a href="#" class="unlike-btn decoration-none"  data-post-id="${postDetail.post.id}">
									<span class="heart-size text-danger"><i class="bi bi-heart-fill"></i></span>
								</a>
							</c:when>
							<c:otherwise>	
								<a href="#" class="like-btn"  data-post-id="${postDetail.post.id}"> <i class="bi bi-heart"></i></a>
							</c:otherwise>
							</c:choose>	
							<div class="ml-2">좋아요 ${postDetail.likeCount }개</div>
							
						</div>
						<!--  /좋아요 -->
						
						<!-- 게시글 -->
						<div class="d-flex align-items-center mt-3 ml-2">
							<div><b>${postDetail.user.loginId }</b></div>
							<div class="ml-3">${postDetail.post.content }</div>
						</div>
						<!-- /게시글 -->
						
						<!-- 댓글 -->
							<div class="p-2">
								<div class="border-bottom small">댓글</div>
							</div>
						<!-- 댓글 -->		
						
						<!-- 댓들 리스트 -->
						<div class="mt-2 ml-2 rounded">
						<c:forEach var="commentDetail" items="${postDetail.commentList}">
							<div> <b>${commentDetail.user.name}</b> ${commentDetail.comment.comment}</div>
						</c:forEach>	
						</div>
						<!-- /댓글 리스트 -->
						
						<!-- 댓글 입력 -->
						<div class="d-flex justify-content-between mt-3 rounded">
							<input type="text" class="form-control col-10" placeholder="댓글을 입력하세요" id="commentInput${postDetail.post.id }">
							<button data-post-id="${postDetail.post.id }" type="button" class="btn btn-info col-2 comment-btn">게시</button>
						</div>
						<!-- /댓글 입력 -->
					
					</div>
					<!-- /피드들 -->
				</c:forEach>	
			</div>	
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />	
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	   
	      <div class="modal-body text-center">
	       <a href="#" id="deleteBtn" >삭제하기</a>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<div class=""></div>
	<script>
	
	$(document).ready(function(){
		
		$(".more-btn").on("click", function(){
			//이벤트가 발생한 버튼에서 post-id를 얻어 온다.
			let postId = $(this).data("post-id");
			
			//삭제하기 버튼에 해당 post-id를 저장한다. (data-post-id 속성에 값을 넣는다)
			//<a href="#" id="deleteBtn" data-post-id="8">삭제하기</a>
			
			$("#deleteBtn").data("post-id", postId)
		});
		
		$("#deleteBtn").on("click", function(){
			
			//postId, click된 그 이벤트 하나 가져오기
			let postId = $(this).data("post-id");
			$.ajax({
				type:"get",
				url:"/post/delete",
				data:{"postId":postId},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("삭제 실패");
					}	
					
					
				},
				error:function(){
					alert("삭제 에러");
				}
				
			})
			
		});
		
		$(".unlike-btn").on("click", function(){
			e.preventDefault();
			//data-post-id
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get",
				url:"/post/unlike",
				data:{"postId":postId},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("좋아요 취소 실패");
					}	
					
					
				},
				error:function(){
					alert("좋아요 취소 에러");
				}
				
				
			});
		});
		
		$(".comment-btn").on("click",function(){
			
			//이벤트가 일어난 버튼에서 postId를 얻어 온다.
			let postId = $(this).data("post-id")
			
			//작성한 댓글 가져오기
			//#commentInput5
			let content = $("#commentInput" + postId).val();
				
			$.ajax({
				type:"post",
				url:"/post/comment/create",
				data:{"postId":postId, "content":content},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("댓글작성 실패");
					}
				},
				error:function(){
					alert("댓글작성 에러");
				}
				
		
				
			});
			alert(content);	
			
		});
		$(".like-btn").on("click", function(e){
			e.preventDefault();
			
			//현재 클릭된 태그 객체를 얻어 와서 postId를 얻어 온다.
			//태그에 특정한 속성을 가져와 사용하고 싶을 때
			//data-
			//data-post-id="10" 
			
			let postId = $(this).data("post-id");
			
			
			$.ajax({
				type:"get",
				url:"/post/like",
				data:{"postId":postId},
				success:function(data){
					if(data.result == "success"){
						location.reload();
					}else{
						alert("좋아요 실패");
					}
				},
				error:function(){
					alert("좋아요 에러");
				}
				
			});
				
			alert(postId);
		});
		
		
		$("#imageIcon").on("click", function(e){
			//fileInput을 클릭한 효과를 만들어야 한다.
			//a태그의 자동이동 기능 상쇠
			e.preventDefault();
			$("#fileInput").click();
		});
		
		$("#uploadBtn").on("click", function(){
		
			
			let content = $("#content").val();
			let imagePath = $("#imagePath").val();
			
			if(content == ""){
				alert("내용을 입력하세요");
				return;
			}
			
			//파일 유효성 검사
			//$("#fileInput")[0].files[0]
			if($("#fileInput")[0].files.length == 0){ // file배열의 길이 확인 ( 0이면 아무것도 안들어간것)
				alert("이미지를 선택하세요");
			} 
			
			
		
			//파일을 포함한 파라미터 구성하기
			var formData = new FormData();
			formData.append("content", content);
			formData.append("file", $("#fileInput")[0].files[0]);
			
		//업로드 ajax	,사용자가 입력한 content로 api를 호출해서 데이터를 입력한다.
		$.ajax({
			type: "post", 
			url: "/post/create",
			data:formData,
			enctype:"multipart/form-data", //파일업로드 필수 옵션
			processData:false,			   //파일업로드 필수 옵션
			contentType:false,			  //파일업로드 필수 옵션
			success:function(data){
				if(data.result == "success"){
					location.reload();
				}else{
					alert("업로드 실패");
				}
			},
			error:function(){
				alert("업로드 에러");
			}
			
		});	
		
		
		
		
		//글 업로드
		
	});	
		
});
	
	</script>
</body>
</html>