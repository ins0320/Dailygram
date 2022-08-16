package com.yoojung0318.Dailygram.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yoojung0318.Dailygram.post.BO.PostBO;

@RestController
public class PostRestController {


	@Autowired 
	PostBO postBO;
	
	//피드 입력
	@PostMapping("/post/create")
	public Map<String, String> createPost (
			@RequestParam("content") String content
			,@RequestParam(value="file", required=false) MultipartFile  file// file의 타입, 필수 요소 아님을 나타냄(value="", required=false)
			,HttpServletRequest request ){
		
		HttpSession session = request.getSession();
		
		int userid = (Integer)session.getAttribute("userid");
		
		int count = postBO.addPost(userid, content,file);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
