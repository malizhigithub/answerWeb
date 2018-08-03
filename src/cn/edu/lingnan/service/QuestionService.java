package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.QuestionMapper;
import cn.edu.lingnan.pojo.Options;
import cn.edu.lingnan.pojo.Question;
import cn.edu.lingnan.pojo.QuestionExample;
import cn.edu.lingnan.pojo.QuestionExample.Criteria;

@Service
public class QuestionService {
	
	@Autowired
	private QuestionMapper questionMapper;

	/**
	 * 多条件查询试题
	 * @param question
	 * @author lizhi
	 */
	public List<Question> selectQuestionByExample(Question question) {
		QuestionExample example = new QuestionExample();
		Criteria criteria = example.createCriteria();
		if(question.getQuestionno()!=null){
			criteria.andQuestionnoEqualTo(question.getQuestionno());
		}
		if(question.getConstatus()!=null&&!question.getConstatus().equals("")){
			criteria.andConstatusEqualTo(question.getConstatus());
		}
		if(question.getTypeno()!=null){
			criteria.andTypenoEqualTo(question.getTypeno());
		}
		List<Question> list = questionMapper.selectByExample(example);
		return list;
	}

	public void updateByPrimaryKey(Question question) {
		questionMapper.updateByPrimaryKeySelective(question);
	}
	
	public void updateSelective(Question question){
		questionMapper.updateByPrimaryKeySelective(question);
	}
	

	public void insertQuestion(Question question) {
		questionMapper.insert(question);
	}

	public void deleteQuestion(Integer id) {
		questionMapper.deleteByPrimaryKey(id);
	}

	public Question getQuestionByKey(Integer questionno) {
		return questionMapper.selectByPrimaryKey(questionno);
	}
	
}
