package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.TestMapper;

@Service
public class TestService {

	@Autowired
	private TestMapper testMapper;
	
	public List selectTest(){
		return testMapper.selectTest();
	}
	
}
