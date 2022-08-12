package com.yoojung0318.Dailygram.post.BO;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoojung0318.Dailygram.post.DAO.PostDAO;
import com.yoojung0318.Dailygram.post.model.Post;
import com.yoojung0318.Dailygram.post.model.PostDetail;
import com.yoojung0318.Dailygram.user.bo.UserBO;
import com.yoojung0318.Dailygram.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	public int addPost(int userid, String content) {
		
		return postDAO.insertPost(userid, content, "");
		
	}
	
	//userId가 일치하는 메모 리스트 조회
	public List<PostDetail> getPostList(){
		List<PostDetail> postDetailList = new ArrayList<>();		//post안에 있는 userid별로 조회
		List<Post> postList = postDAO.selectPostList();	
		
		for(Post post : postList) {
		int userId = post.getUserid();
		
		//user 테이블 조회
		//userBO를 통해서 userId와 일치하는 사용자 정보 조회
		User user = userBO.getUserById(userId);
		
		// 게시글과 사용자 정보를 합치는 과정
		PostDetail postDetail = new PostDetail();
		postDetail.setPost(post);
		postDetail.setUser(user);
		
		postDetailList.add(postDetail);
		
		}
		
		return postDetailList;
	}
}
