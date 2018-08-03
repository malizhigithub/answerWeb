package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.AdminsMapper;
import cn.edu.lingnan.pojo.Admins;
import cn.edu.lingnan.pojo.AdminsExample;
import cn.edu.lingnan.pojo.AdminsExample.Criteria;

@Service
public class AdminsService {

	@Autowired
	private AdminsMapper adminsMapper;
	
	public List<Admins> login(Admins admins) {
		AdminsExample adminsExample = new AdminsExample();
		Criteria criteria = adminsExample.createCriteria();
		criteria.andAdminnameEqualTo(admins.getAdminname());
		criteria.andPasswordEqualTo(admins.getPassword());
		return adminsMapper.selectByExample(adminsExample);
	}

	
	public void updateSelective(Admins admins) {
		adminsMapper.updateByPrimaryKeySelective(admins);
	}
	

}
