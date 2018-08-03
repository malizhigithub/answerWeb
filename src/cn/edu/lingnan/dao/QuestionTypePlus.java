package cn.edu.lingnan.dao;

import cn.edu.lingnan.pojo.QuestionType;

public class QuestionTypePlus {

	private QuestionType questionType;
	//第几级目录
	private Integer status;
	//记录页码数
	private Integer pn;

	public QuestionType getQuestionType() {
		return questionType;
	}

	public void setQuestionType(QuestionType questionType) {
		this.questionType = questionType;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPn() {
		return pn;
	}

	public void setPn(Integer pn) {
		this.pn = pn;
	}

}
