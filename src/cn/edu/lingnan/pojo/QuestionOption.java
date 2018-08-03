package cn.edu.lingnan.pojo;

import java.util.List;

/**
 * 
 * @author huang
 * 题目以及题目选项的组合
 */
public class QuestionOption {
	
	private Question question;	//题目
	private List<Options> option;		//选项
	
	public QuestionOption(Question question, List<Options> option){
		this.option = option;
		this.question = question;
	}
	
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public List<Options> getOption() {
		return option;
	}
	public void setOption(List<Options> option) {
		this.option = option;
	}
	
	
	
}
