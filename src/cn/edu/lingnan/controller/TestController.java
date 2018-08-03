package cn.edu.lingnan.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.lingnan.pojo.Test;
import cn.edu.lingnan.service.TestService;

@Controller
public class TestController {

	@Autowired
	private TestService testService;
	
	@RequestMapping("/test")
	public String selectTest(Map<String,Object> map){
		List<Test> list = testService.selectTest();
		//springmvc会自动把map中的数据放到请求域中
		map.put("testList",list);
		return "test";
	}
	
}
