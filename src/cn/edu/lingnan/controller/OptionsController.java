package cn.edu.lingnan.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.OptionsExample;
import cn.edu.lingnan.service.OptionsService;

@Controller
public class OptionsController extends BaseController {

	@Autowired
	private OptionsService optionsService;

	/**
	 * 可根据条件分页查询所有候选答案
	 * @return
	 * @author lizhi
	 */
	@RequestMapping("/selectOptions")
	public String selectOptions(OptionsExample options, Map<String, Object> map,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 每页显示八条数据，且当前页是参数pn
		PageHelper.startPage(pn, 8);
		List<Options> list = optionsService.selectOptionsByExample(options);
		// 对数据进行分页处理
		PageInfo pageInfo = new PageInfo(list);
		map.put("optionsListPageInfo", pageInfo);
		// 到时候前端写出网页后再修改到具体的页面
		return "admin/index";
	}
	
	/**
	 * 更新候选答案
	 * @return
	 * @author lizhi
	 */
	@RequestMapping("/updateOptions")
	public String updateOptions(Options options){
		optionsService.updateByPrimaryKey(options);
		return "admin/index";
	}
	
	

}
