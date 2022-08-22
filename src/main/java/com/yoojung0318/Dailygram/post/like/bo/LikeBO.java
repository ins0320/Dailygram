package com.yoojung0318.Dailygram.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoojung0318.Dailygram.post.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	LikeDAO likeDAO;
	public int addLike(int postId, int userId) {
		
		return likeDAO.insertLike(postId, userId) ;
		
	}

	public int unLike(int postId, int userId) {
		return likeDAO. deletelike(postId, userId);
	}
	
	//postId로 좋아요 개수 카운팅
	public int countLike(int postId) {
		return likeDAO.selectcountLike(postId);
	}

	//특정 사용자가 특정 게시글의 좋아요를 취소
	
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deletecountLikeByPostId(postId);
	}
}
