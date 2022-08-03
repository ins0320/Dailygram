package com.yoojung0318.Dailygram.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class helloworld {
	    @ResponseBody
	    @RequestMapping("/helloworld")
	    public String helloWorld() {
	        return "Hello World!!";
	    }
}
