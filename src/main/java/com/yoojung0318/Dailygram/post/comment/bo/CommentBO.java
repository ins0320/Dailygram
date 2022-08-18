package com.yoojung0318.Dailygram.post.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoojung0318.Dailygram.post.comment.dao.CommentDAO;

@Service
public class CommentBO { // 전달받아서 결과 받아서 리턴함
	
@Autowired
private CommentDAO commentDAO;
	
	public int addComment(int postId,int userId, String content ) {
		return commentDAO.insertComment(postId, userId, content);
	}
	
	public List<> searchComment(int postId, int userId) {
		return commentDAO.selectComment(postId, userId);
	}
}
