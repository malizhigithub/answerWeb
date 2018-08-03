package cn.edu.lingnan.pojo;

public class Options {
    private Integer optionsno;

    private Integer questionno;

    private String content;

    private Integer status;

    public Integer getOptionsno() {
        return optionsno;
    }

    public void setOptionsno(Integer optionsno) {
        this.optionsno = optionsno;
    }

    public Integer getQuestionno() {
        return questionno;
    }

    public void setQuestionno(Integer questionno) {
        this.questionno = questionno;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}