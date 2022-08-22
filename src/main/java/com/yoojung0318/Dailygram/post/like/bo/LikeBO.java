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
	// postId 로 좋아요 개수 조회
		public int countLike(int postId) {
			return likeDAO.selectCountLike(postId);
		}
}
