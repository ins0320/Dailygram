package com.yoojung0318.Dailygram.post.model;

import java.util.List;

import com.yoojung0318.Dailygram.post.comment.model.CommentDetail;
import com.yoojung0318.Dailygram.user.model.User;

public class PostDetail {

	// User 정보
	private User user;
	// Post 정보
	private Post post;
	// 좋아요 개수
	private int likeCount;
	// 댓글 리스트
	private List<CommentDetail> commentList;
	
	
	public List<CommentDetail> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentDetail> commentList) {
		this.commentList = commentList;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
	
}
