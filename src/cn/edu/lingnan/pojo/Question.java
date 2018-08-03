package cn.edu.lingnan.pojo;

public class Question {
    private Integer questionno;

    private String content;

    private String description;

    private Integer constatus;

    private Integer desstatus;

    private Integer typeno;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getConstatus() {
        return constatus;
    }

    public void setConstatus(Integer constatus) {
        this.constatus = constatus;
    }

    public Integer getDesstatus() {
        return desstatus;
    }

    public void setDesstatus(Integer desstatus) {
        this.desstatus = desstatus;
    }

    public Integer getTypeno() {
        return typeno;
    }

    public void setTypeno(Integer typeno) {
        this.typeno = typeno;
    }
}