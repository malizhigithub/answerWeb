package cn.edu.lingnan.dao;

import cn.edu.lingnan.pojo.WeChatUser;
import cn.edu.lingnan.pojo.WeChatUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WeChatUserMapper {
    long countByExample(WeChatUserExample example);

    int deleteByExample(WeChatUserExample example);

    int deleteByPrimaryKey(Integer wechatuserno);

    int insert(WeChatUser record);

    int insertSelective(WeChatUser record);

    List<WeChatUser> selectByExample(WeChatUserExample example);

    WeChatUser selectByPrimaryKey(Integer wechatuserno);

    int updateByExampleSelective(@Param("record") WeChatUser record, @Param("example") WeChatUserExample example);

    int updateByExample(@Param("record") WeChatUser record, @Param("example") WeChatUserExample example);

    int updateByPrimaryKeySelective(WeChatUser record);

    int updateByPrimaryKey(WeChatUser record);
}