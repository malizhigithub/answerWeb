package cn.edu.lingnan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.lingnan.dao.RecordsMapper;
import cn.edu.lingnan.dao.UserMapper;
import cn.edu.lingnan.pojo.Records;
import cn.edu.lingnan.pojo.RecordsExample;
import cn.edu.lingnan.pojo.User;
import cn.edu.lingnan.pojo.UserExample;
import cn.edu.lingnan.pojo.UserExample.Criteria;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private RecordsMapper recordsMapper;
	
	/**
	 * 多条件查询用户
	 * @param user
	 * @author lizhi
	 */
	public List<User> selectUserByExample(User user){
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		if(user.getUserno()!=null){
			criteria.andUsernoEqualTo(user.getUserno());
		}
		if(user.getUsername()!=null&&!user.getUsername().equals("")){
			criteria.andUsernameEqualTo(user.getUsername());
		}
		if(user.getPassword()!=null&&!user.getPassword().equals("")){
			criteria.andPasswordEqualTo(user.getPassword());
		}
		if(user.getEmail()!=null&&!user.getEmail().equals("")){
			criteria.andEmailEqualTo(user.getEmail());
		}
		if(user.getSex()!=null&&!user.getSex().equals("")){
			criteria.andSexEqualTo(user.getSex());
		}
		if(user.getStatus()!=null){
			criteria.andStatusEqualTo(user.getStatus());
		}
		return userMapper.selectByExample(example);
	}

	public void deleteUser(Integer id) {
		//1：先删除用户答题记录
		recordsMapper.deleteByPrimaryKey(id);
		//2:删除用户
		userMapper.deleteByPrimaryKey(id);
	}

	public void addUser(User user) {
		userMapper.insertSelective(user);
	}
	
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}
	
	/*
	 * 登录
	 */
	public List<User> login(User user){
		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andEmailEqualTo(user.getEmail()).andPasswordEqualTo(user.getPassword());
		return userMapper.selectByExample(userExample);
	}
	
	/*
	 * 注册
	 */
	public int register(User user) {
		return userMapper.insertSelective(user);
	}
	
	/*
	 * 根据用户id获取用户信息
	 */
	public User getUserByUserno(int userno) {
		return userMapper.selectByPrimaryKey(userno);
	}
	
	/*
	 * 用户通过验证
	 */
	public int confirmValidator(int userno) {
		//根据id获取用户对象
		User user = getUserByUserno(userno);
		//修改验证码
		user.setStatus(1);
		return userMapper.updateByPrimaryKeySelective(user);
	}
	
	/*
	 * 根据邮箱判断用户是否存在
	 */
	public User findUserByEmail(String email) {
		UserExample userExample = new UserExample();
		Criteria cri = userExample.createCriteria();
		cri.andEmailEqualTo(email);
		List<User> list = userMapper.selectByExample(userExample);
		if (list.size() > 0)
			return list.get(0);
		return null;
	}

	/**
	 * 批量根据用户id删除用户
	 * @param str_ids
	 */
	public void deleteBatch(List<Integer> ids) {
		//封装一个条件
		UserExample example = new UserExample(); 
		//条件是什么
		Criteria criteria = example.createCriteria();
		//delete from tbl_emp where emp_id in (1,2,3)
		criteria.andUsernoIn(ids);
		userMapper.deleteByExample(example);
		
	}
	
	/**
	 * @author huang
	 * @param userno 用户编号
	 * @return
	 * 根据用户编号获取用户答题记录
	 */
	public List<Records> getWebUserInfo(int userno){
		RecordsExample recordsExample = new RecordsExample();
		cn.edu.lingnan.pojo.RecordsExample.Criteria criteria = recordsExample.createCriteria();
		criteria.andUsernoEqualTo(userno);
		return recordsMapper.selectByExample(recordsExample);
	}
	
}
