package com.service;

import java.util.List;
import java.util.Map;

import com.entity.Account;
import com.util.PageUtil;

public interface AccountService {
	/**
	 * @author 王小萌
	 * @date 2018-3-29 下午8:55:44
	 * @param {Account}
	 * @return 添加成功返回true，添加失败返回false。
	 * @description：添加员工
	 */
	public boolean addEmployee(Account account);
	/**
	 * @author 王小萌
	 * @date 2018-3-29 下午9:20:05
	 * @param {name}
	 * @return 名字重复返回true，不重复返回false
	 * @description：判断员工名字是否重复
	 */
	public boolean isExist(String name);
	//获取全部员工
	//public List<Account> getAllAccount();
	List<Account> getAllAccount(PageUtil page);
	//获取总条数
	public int getCountNum();
	/** @author 王小萌
	 * @date 2018-4-20 下午4:08:28
	 * @param
	 * @return
	 * @description：
	 */
	boolean deleteByPrimaryKey(Integer id);
	
	
}
