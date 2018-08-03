package cn.edu.lingnan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.Records;
import cn.edu.lingnan.pojo.RecordsExample;
import cn.edu.lingnan.pojo.RecordsExample.Criteria;
import cn.edu.lingnan.service.QuestionTypeService;
import cn.edu.lingnan.service.RecordsService;

@Controller
public class RecordsController extends BaseController {

	@Autowired
	private RecordsService recordsService;
	@Autowired
	private QuestionTypeService questionTypeService;

	/**
	 * 对记录表进行分页条件查询
	 * @param recordsExample
	 * @param pn
	 * @param map
	 * @author lizhi
	 */
	@RequestMapping("/selectRecords")
	public String selectRecords(RecordsExample recordsExample, @RequestParam("pn") Integer pn,
			Map<String, Object> map) {
		// 每页显示八条数据，且当前页是参数pn
		PageHelper.startPage(pn, 8);
		List<Records> list = recordsService.selectRecordsByExample(recordsExample);
		// 对数据进行分页处理
		PageInfo pageInfo = new PageInfo(list);
		map.put("recordsListPageInfo", pageInfo);
		// 到时候前端写出网页后再修改到具体的页面
		return "/admin/index";
	}
	
	/**
	 * 根据id更新记录表（可用于冲钱用户重置记录）
	 * @param records
	 * @author lizhi
	 */
	@RequestMapping("/updateRecords")
	public String updateRecords(Records records){
		recordsService.updateRecords(records);
		return "/admin/index";
	}
	
	/**
	 * 增加记录(可用于新增用户选择答题类型时添加答题记录)
	 * @param userNo
	 * @param typeNo
	 * @author lizhi
	 */
	@RequestMapping("/addRecords")
	public String addRecords(@RequestParam("userNo") Integer userNo,@RequestParam("typeNo") Integer typeNo){
		Records records = new Records();
		records.setUserno(userNo);
		records.setTypeno(typeNo);
		recordsService.addRecords(records);
		return "/admin/index";
	}
	
	/**
	 * 删除记录
	 * @param userNo
	 * @author lizhi
	 */
	@RequestMapping("/deleteRecords")
	public String deleteRecords(@RequestParam("userNo") Integer userNo){
		recordsService.deleteRecords(userNo);
		return "/admin/index";
	}
	
	/**
	 * 微信端个人信息中显示个人答题记录
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAllRecords")
	public List<Records> getAllRecords(Integer wechatuserno){
		RecordsExample recordsExample = new RecordsExample();
		Criteria criteria = recordsExample.createCriteria();
		criteria.andWechatusernoEqualTo(wechatuserno);
		List<Records> list = new ArrayList<Records>();
		list = recordsService.selectRecordsByExample(recordsExample);
		for(int i=0;i<list.size();i++){
			list.get(i).setTypename(questionTypeService.getQuestionTypeByPrimaryKey(list.get(i).getTypeno()).getTypename());
		}
		return list;
	}
	

}
