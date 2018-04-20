package com.dao;

import com.entity.Account;
import com.util.PageUtil;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
@Service
public interface AccountMapper {
	//根据ID删除员工
    int deleteByPrimaryKey(Integer id);
    /**
     * @author 王小萌
     * @date 2018-3-29 下午9:09:47
     * @param {account}
     * @return int
     * @description：添加员工
     */
    int insert(Account account);

    int insertSelective(Account record);

    Account selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);
    /**
     * @author 王小萌
     * @date 2018-3-29 下午9:24:24
     * @param {name}
     * @return Account
     * @description：根据用户名查找员工
     */
    Account getAccountByName(String name);
    
	/**
	 * @author 王小萌
	 * @date 2018-4-3 下午5:14:39
	 * @param
	 * @return 集合
	 * @description：查询所有员工
	 */
	//public List<Account> getAllAccount();
	public List<Account> getAllAccount(PageUtil page);
    
    
	//获取员工列表
	public int getCountNum();

	
}