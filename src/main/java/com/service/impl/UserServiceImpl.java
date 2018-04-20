package com.service.impl;

import javax.xml.registry.infomodel.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserDao;
import com.entity.UserEntity;
import com.service.UserService;

import common.ThisSystemException;
import common.ThisSystemUtil;
//import static common.ThisSystemUtil.*;

@Service("UserService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao userDao;
	
	@Override
	public UserEntity checkLogin(String name, String password) throws Exception {
		//判定空
		name = ThisSystemUtil.throwIfBlank("用户名不能为空", name);
		password = ThisSystemUtil.throwIfBlank("密码不能为空", password);
		
		UserEntity ue = userDao.findUserByName(name);
		if(ue == null){
			throw new ThisSystemException("账号不存在");
		}
		if(!ue.getPassword().equals(password)){
			throw new ThisSystemException("密码错误！");
		}
		
		return ue;
	}
	
	
	/**
	 * @author 王小萌
	 * @date 2018-3-20 下午4:43:58
	 * @param user
	 * @return 注册成功返回true，注册失败返回false。
	 * @description：注册
	 */
	public boolean regist(String name,String password) {
		int n = userDao.addUser(name,password);
		if(n > 0){
			return true;
		} else {
			return false;
		}		
	}

	@Override
	public boolean isExist(String name) {
		name = ThisSystemUtil.throwIfBlank("用户名不能为空", name);
		UserEntity ue = userDao.findUserByName(name);
		if(ue != null){
			return true;
		} else{
			return false;
		}
		
		
		
	}




}
