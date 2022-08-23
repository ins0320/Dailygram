package com.yoojung0318.Dailygram.post.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	public int insertLike(
			@Param("postId") int postId
			,@Param("userId") int userId);
	
	public int deletelike(	
			@Param("postId") int postId
			,@Param("userId") int userId);
	
	public int selectcountLike(
			@Param("postId") int postId);
	
	public int deletecountLikeByPostId(
			@Param("postId") int postId);
}
