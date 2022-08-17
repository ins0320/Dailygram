package com.yoojung0318.Dailygram.post.comment;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yoojung0318.Dailygram.post.comment.bo.CommentBO;

@RestController //controller가 필요에 의해서 bo를 호출하는 것, 해당하는 주소로 접속하면 기능을 수행하도록 연결
public class CommentRestController {

	@Autowired
	private CommentBO commentBO;
	
	@PostMapping("/post/comment/create")
	public Map<String, String> createCommnet(
			@RequestParam("postId") int postId
			, @RequestParam("content") String content
			, HttpServletRequest request
			){
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = commentBO. addComment(postId, userId, content);

		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
