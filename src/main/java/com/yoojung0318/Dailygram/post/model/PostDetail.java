package com.yoojung0318.Dailygram.post.model;

import com.yoojung0318.Dailygram.user.model.User;

public class PostDetail {

	// User 정보
	private User user;
	// Post 정보
	private Post post;
	
	//좋아요 개수 정보
	private int like;
	
	//댓글 정보
	private String comment;
	
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
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
