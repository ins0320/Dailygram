package com.yoojung0318.Dailygram.post.BO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yoojung0318.Dailygram.common.FileManagerService;
import com.yoojung0318.Dailygram.post.DAO.PostDAO;
import com.yoojung0318.Dailygram.post.like.bo.LikeBO;
import com.yoojung0318.Dailygram.post.model.Post;
import com.yoojung0318.Dailygram.post.model.PostDetail;
import com.yoojung0318.Dailygram.user.bo.UserBO;
import com.yoojung0318.Dailygram.user.model.User;

@Service
public class PostBO {
//저장,접근경로 DAO 전달
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String content, MultipartFile file) {
		
		//파일을 저장하고, 파일 접근 경로를 DAO로 전달
		//해당 파일을 외부에서 접근할 수 있는 경로를 만들어서 dao로 전달한다.(DB에 저장하기 위해)
		String imagePath = FileManagerService.saveFile(userId, file); //외부에서 접근가능한 경로
			
		//파일 저장이 실패한 경우
		if(imagePath == null) {
			
			return -1; // restcontroller에 return 값이 -1로 전달되어, error로 처리됨
		}
		return postDAO.insertPost(userId, content, imagePath);
		
	}
	
	//userId가 일치하는 메모 리스트 조회
	public List<PostDetail> getPostList(){
		List<PostDetail> postDetailList = new ArrayList<>();		//post안에 있는 userid별로 조회
		List<Post> postList = postDAO.selectPostList();	
		
		for(Post post : postList) {
			
			int userId = post.getUserid();
			int postId = post.getId();
			//user 테이블 조회
			//userBO를 통해서 userId와 일치하는 사용자 정보 조회
			User user = userBO.getUserById(userId);
			
			//좋아요 개수를 가져와서 조회
			int like = likeBO.countLike(postId);
			
			// 게시글과 사용자 정보를 합치는 과정
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			//좋아요 개수
			postDetail.setLike(like);
			
			postDetailList.add(postDetail);
		
		}
		
		return postDetailList;
	}
}
