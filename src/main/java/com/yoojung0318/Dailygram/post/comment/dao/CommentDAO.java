package com.yoojung0318.Dailygram.post.comment.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentDAO {

	public int insertComment(
			@Param("postId") int postId
			,@Param("userid")int userId
			,@Param("content") String content);
}
