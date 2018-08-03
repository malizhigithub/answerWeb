package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.OptionsMapper;
import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.OptionsExample;
import cn.edu.lingnan.pojo.OptionsExample.Criteria;

@Service
public class OptionsService {

	@Autowired
	private OptionsMapper optionsMapper;

	/**
	 * 多条件查询
	 * @param options
	 * @return
	 */
	public List<Options> selectOptionsByExample(OptionsExample options) {
		return optionsMapper.selectByExample(options);
	}

	/**
	 * 更新
	 * @param options
	 */
	public void updateByPrimaryKey(Options options) {
		optionsMapper.updateByPrimaryKeySelective(options);
	}
	
	
	public List<Options> getQuestionOptions(Integer questionno){
		OptionsExample example = new OptionsExample();
		Criteria criteria = example.createCriteria();
		criteria.andQuestionnoEqualTo(questionno);
		return optionsMapper.selectByExample(example);
	}

	public void insert(Options options) {
		optionsMapper.insert(options);
	}
	
	
	
	
}
