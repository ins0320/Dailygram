package com.yoojung0318.Dailygram.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yoojung0318.Dailygram.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("content") String content);
	
	public List<Comment> selectCommentListByPostId(@Param("postId") int postId);
	
	public int deleteComment(@Param("postId") int postId);
	
}
