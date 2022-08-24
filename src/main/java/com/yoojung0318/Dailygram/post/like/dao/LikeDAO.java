package com.yoojung0318.Dailygram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {
	
	public int insertLike(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int deleteLike(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int selectCountLike(@Param("postId") int postId);
	
//	postId 와 userId 가 모두 일치하는 행의 개수
	public int selectCountLikeByPostUserId(
			@Param("postId") int postId
			, @Param("userId") int userId);
	
	public int deleteLikeByPostId(@Param("postId") int postId);

}