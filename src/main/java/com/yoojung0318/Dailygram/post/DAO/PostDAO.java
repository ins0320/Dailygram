package com.yoojung0318.Dailygram.post.DAO;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PostDAO {

	public int insertPost(
			@Param("userid") int userid
			,@Param("content") String content
			,@Param("imagePath")String imagePath);
	
}
