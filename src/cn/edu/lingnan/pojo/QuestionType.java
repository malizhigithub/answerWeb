package cn.edu.lingnan.pojo;

import javax.validation.constraints.NotNull;

public class QuestionType {
    private Integer typeno;
    @NotNull
    private String typename;

    private Integer belongtypeno;
    @NotNull
    private String imageurl;

    public Integer getTypeno() {
        return typeno;
    }

    public void setTypeno(Integer typeno) {
        this.typeno = typeno;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    public Integer getBelongtypeno() {
        return belongtypeno;
    }

    public void setBelongtypeno(Integer belongtypeno) {
        this.belongtypeno = belongtypeno;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl == null ? null : imageurl.trim();
    }
}