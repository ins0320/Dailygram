package com.yoojung0318.Dailygram.post.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoojung0318.Dailygram.post.DAO.PostDAO;

@Service
public class PostBO {

	@Autowired
	PostDAO postDAO;
	public int addPost(int userid, String content, String imagePath ) {
		
		return postDAO.insertPost(userid, content, imagePath);
		
	}
}
