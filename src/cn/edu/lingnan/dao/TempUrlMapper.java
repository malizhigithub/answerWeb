package cn.edu.lingnan.dao;

import cn.edu.lingnan.pojo.TempUrl;
import cn.edu.lingnan.pojo.TempUrlExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TempUrlMapper {
    long countByExample(TempUrlExample example);

    int deleteByExample(TempUrlExample example);

    int deleteByPrimaryKey(Integer tempurlid);

    int insert(TempUrl record);

    int insertSelective(TempUrl record);

    List<TempUrl> selectByExample(TempUrlExample example);

    TempUrl selectByPrimaryKey(Integer tempurlid);

    int updateByExampleSelective(@Param("record") TempUrl record, @Param("example") TempUrlExample example);

    int updateByExample(@Param("record") TempUrl record, @Param("example") TempUrlExample example);

    int updateByPrimaryKeySelective(TempUrl record);

    int updateByPrimaryKey(TempUrl record);
}