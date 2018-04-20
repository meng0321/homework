/**
 * 
 */
package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AccountMapper;
import com.entity.Account;
import com.service.AccountService;
import com.util.PageUtil;

import common.ThisSystemUtil;

/**
 * @description：
 */
@Service("AccountService")
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	AccountMapper am;	
	/**
	 * @author 王小萌
	 * @date 2018-3-29 下午8:55:44
	 * @param {Account}
	 * @return 添加成功返回true，添加失败返回false。
	 * @description：添加员工
	 */
	@Override
	public boolean addEmployee(Account account) {
		int n = am.insert(account);
		if(n != 0){
			return true;
		} else {
			return false;
		}		
	}
	/**
	 * @author 王小萌
	 * @date 2018-3-29 下午9:20:05
	 * @param {name}
	 * @return 名字重复返回true，不重复返回false
	 * @description：判断员工名字是否重复
	 */
	@Override
	public boolean isExist(String name) {
		name = ThisSystemUtil.throwIfBlank("用户名不能为空", name);
		am.getAccountByName(name);
		return false;
	}
	//获取员工
	@Override
	public List<Account> getAllAccount(PageUtil page) {
		List<Account> list = am.getAllAccount(page);
		return list;
	}
	//获取员工总数量
	@Override
	public int getCountNum() {
		int count = am.getCountNum();
		return count;
	}
	@Override
	public boolean deleteByPrimaryKey(Integer id){
		int n = am.deleteByPrimaryKey(id);
		if(n != 0){
			return true;
		} else{			
			return false;
		}
		
	}


}
