package cn.edu.lingnan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.QuestionOption;
import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.WeChatUser;
import cn.edu.lingnan.service.AnswerService;

@Controller
public class AnswerController extends BaseController {
	
	public static final int QUESTION_NUMBER = 10;
	
	@Autowired
	private AnswerService answerService;
	
	/**
	 * @author huang
	 * 获取题目基础类型
	 */
	@ResponseBody
	@RequestMapping(value="user/getType")
	public Map<String, Object> getQuestionType() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> firstlist = answerService.findType();
		if (firstlist.size() <= 0) {
			map.put("error", "系统错误：一级菜单获取失败");
		} else {
			map.put("firstlist", firstlist);
		}
		return map;
	}
	
	/**
	 * @author huang
	 * 获取题目具体类型
	 */
	@ResponseBody
	@RequestMapping(value="user/getType/{id}")
	public Map<String, Object> getQuestionType(@PathVariable int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuestionType> secondlist = answerService.findType(id);
		if (secondlist.size() <= 0) {
			map.put("error", id);
		} else {
			//判断是否为3级菜单
			List<QuestionType> thirdList = answerService.findType(secondlist.get(0).getTypeno());
			if(thirdList.size() <= 0) 
				map.put("grade", "two");
			else 
				map.put("grade", "third");
			map.put("secondlist", secondlist);
		}
		return map;
	}
	
	/**
	 * @author huang
	 * 根据类型获取题目
	 */
	@ResponseBody
	@RequestMapping(value="user/getQuestion/{typeno}")
	public Map<String, Object> getQuestion(@PathVariable int typeno) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Question> questionList = answerService.getQuestionByType(typeno);
		List<QuestionOption> questionOptionsList = new ArrayList<QuestionOption>();
		for (Question q : questionList) {
			List<Options> optionlist = answerService.getOptionsByQuestion(q.getQuestionno());
			QuestionOption questionOption = new QuestionOption(q,optionlist);
			questionOptionsList.add(questionOption);
		}
		map.put("question",questionOptionsList);
		map.put("maxnumber", QUESTION_NUMBER);
		map.put("title", answerService.getQuestionTypeByID(typeno).getTypename());
		return map;
	}
	
	/**
	 * @author huang
	 * 用户答题更新记录
	 */
	@RequestMapping(value="user/refreshRecord/{typeno}/{status}")
	public void refreshRecord(@PathVariable int typeno, @PathVariable int status){
		User user = (User) super.session.getAttribute("user");
		WeChatUser weuser = (WeChatUser) super.session.getAttribute("weChatUser");
		if (user != null)
			answerService.answerRecord(user.getUserno(), typeno, status, 0);
		else if (weuser != null)
			answerService.answerRecord(weuser.getWechatuserno(), typeno, status, 1);
	}		
}
