package com.yoojung0318.Dailygram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yoojung0318.Dailygram.post.BO.PostBO;
import com.yoojung0318.Dailygram.post.model.Post;
import com.yoojung0318.Dailygram.post.model.PostDetail;

@Controller
public class PostController {

	@Autowired
	private PostBO postBO;
	
	//메인화면
	@GetMapping("/post/timeLine/view")
	public String timeLineView(HttpServletRequest request, Model model){
		

		//데이터 조회해서 model 객체에 값을 저장한다			
			List<PostDetail> postList = postBO.getPostList();
			model.addAttribute("postList", postList);
			
			return "post/timeLine";
		
		}
	
}
	
	
