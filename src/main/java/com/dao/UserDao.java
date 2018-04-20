package com.dao;


import java.util.List;

import org.springframework.stereotype.Service;

import com.entity.Account;
import com.entity.UserEntity;

@Service
public interface UserDao {
	/**
	 * @param name
	 * @return User
	 * @description 根据用户名查询用户
	 */
	public UserEntity findUserByName(String name);
	/**
	 * @param user
	 * @return 
	 * @description 添加用户
	 */
	public int addUser(String name,String password);
	/**
	 * @param name
	 * @return 
	 * @description 
	 */
	public boolean check(String name);

	
}
