package cn.edu.lingnan.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.edu.lingnan.controller.AnswerController;
import cn.edu.lingnan.dao.OptionsMapper;
import cn.edu.lingnan.dao.QuestionMapper;
import cn.edu.lingnan.dao.QuestionTypeMapper;
import cn.edu.lingnan.dao.RecordsMapper;
import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.OptionsExample;
import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.QuestionExample;
import cn.edu.lingnan.pojo.QuestionType;
import cn.edu.lingnan.pojo.QuestionTypeExample;
import cn.edu.lingnan.pojo.RecordsExample;
import cn.edu.lingnan.pojo.QuestionTypeExample.Criteria;
import cn.edu.lingnan.pojo.Records;

@Service
public class AnswerService {
	
	@Autowired
	private QuestionTypeMapper qtypeMapper;
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private OptionsMapper optionMapper;
	@Autowired
	private RecordsMapper recordsMapper;
	
	/**
	 * @author huang
	 * 查询一级菜单
	 */
	public List<QuestionType> findType() {
		QuestionTypeExample example = new QuestionTypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andBelongtypenoIsNull();
		List<QuestionType> list = qtypeMapper.selectByExample(example);
		return list;
	}
	
	/**
	 * @author huang
	 * 查询二级菜单
	 */
	public List<QuestionType> findType(int typeID) {
		QuestionTypeExample example = new QuestionTypeExample();
		Criteria criteria = example.createCriteria();
		criteria.andBelongtypenoEqualTo(typeID);
		List<QuestionType> list = qtypeMapper.selectByExample(example);
		return list;
	}
	
	/**
	 * @author huang
	 * 根据题目类型返回题目
	 */
	public List<Question> getQuestionByType(int typeno) {
		QuestionExample questionExample = new QuestionExample();
		cn.edu.lingnan.pojo.QuestionExample.Criteria criteria = questionExample.createCriteria();
		criteria.andTypenoEqualTo(typeno);
		List<Question> list = questionMapper.randSelectQuestion(typeno, AnswerController.QUESTION_NUMBER);
		return list;
	}
	
	/**
	 * @author huang
	 * 根据题目获取选项
	 */
	public List<Options> getOptionsByQuestion(int questionno) {
		OptionsExample optionsExample = new OptionsExample();
		cn.edu.lingnan.pojo.OptionsExample.Criteria criteria = optionsExample.createCriteria();
		criteria.andQuestionnoEqualTo(questionno);
		
		List<Options> list = optionMapper.selectByExample(optionsExample);
		//将list的数据重新随机排列
		Collections.shuffle(list);
		return list;
	}
	
	/**
	 * @author huang
	 * 根据id获取类型名称
	 */
	public QuestionType getQuestionTypeByID(int typeno) {
		return qtypeMapper.selectByPrimaryKey(typeno);
	}
	
	/**
	 * @author huang
	 * @param userno 用户编号
	 * @param typeno 题目类型编号
	 * @param status 答题情况，1:正确, 2:错误
	 * 更新用户答题记录
	 */
	public void answerRecord(int userno, int typeno, int status, int flag) {
		//判断用户是否有该类型记录
		RecordsExample recordsExample = new RecordsExample();
		cn.edu.lingnan.pojo.RecordsExample.Criteria recordCria = recordsExample.createCriteria();
		if (flag == 0)
			recordCria.andUsernoEqualTo(userno).andTypenoEqualTo(typeno);
		else 
			recordCria.andWechatusernoEqualTo(userno).andTypenoEqualTo(typeno);
		List<Records> recordsList = recordsMapper.selectByExample(recordsExample);
		if (recordsList.size() <= 0) {
			//不存在就插入一条记录
			Records records = new Records();
			records.setTypeno(typeno);
			if(flag==0)
				records.setUserno(userno);
			else 
				records.setWechatuserno(userno);
			if (status == 1)
				records.setAcnumber(1);
			else 
				records.setErunmber(1);
			recordsMapper.insertSelective(records);
			return ;
		} else {
			//存在就更新记录
			Records rec = recordsList.get(0);
			if(status == 1)
				rec.setAcnumber(rec.getAcnumber()+1);
			else 
				rec.setErunmber(rec.getErunmber()+1);
			recordsMapper.updateByPrimaryKey(rec);
		}
	}
}
