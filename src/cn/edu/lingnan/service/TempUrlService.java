package cn.edu.lingnan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.TempUrlMapper;
import cn.edu.lingnan.pojo.TempUrl;

@Service
public class TempUrlService {
	
	@Autowired
	private TempUrlMapper tempUrlMapper;
	
	public void addTempUrl(TempUrl tempUrl){
		tempUrlMapper.insertSelective(tempUrl);
	}
	
}
