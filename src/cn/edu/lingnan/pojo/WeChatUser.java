package cn.edu.lingnan.pojo;

public class WeChatUser {
    private Integer wechatuserno;

    private String openid;

    private String nickname;

    private String sex;

    private String province;

    private String city;

    private String country;

    private String headimgurl;

    private Integer userno;
    
    @Override
	public String toString() {
		return  "openid=" + openid + "\nnickname=" + nickname
				+ "\nsex=" + sex + "\nprovince=" + province
				+ "\ncity=" + city + "\ncountry=" + country
				+ "\nheadimgurl=" + headimgurl + "\nwechatuserno=" + wechatuserno;
	}

    public Integer getWechatuserno() {
        return wechatuserno;
    }

    public void setWechatuserno(Integer wechatuserno) {
        this.wechatuserno = wechatuserno;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid == null ? null : openid.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getHeadimgurl() {
        return headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl == null ? null : headimgurl.trim();
    }

    public Integer getUserno() {
        return userno;
    }

    public void setUserno(Integer userno) {
        this.userno = userno;
    }
}