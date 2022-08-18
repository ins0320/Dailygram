package com.yoojung0318.Dailygram.post.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId") int postId
			,@Param("userId")int userId
			,@Param("content") String content);
	
	public int selectComment(
			@Param("postId") int postId
			,@Param("userId") int userId);
}
