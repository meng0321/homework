/**
 * 
 */
package com.controller;

import java.io.Console;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Account;
import com.service.AccountService;
import com.util.PageUtil;

/**
 * @description：员工
 */
@Controller
@RequestMapping("/account")
public class AccountController {
	
	Logger log = Logger.getLogger(this.getClass());
	Map<String,Object> resultMap = new HashMap<>();
	int pageSize =10;
	@Autowired
	public AccountService as;
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/17 下午10:19
	 * @Param: { }
	 * @Return: { }
	 * @Descripton: <添加员工>
	 */
	@RequestMapping("/addAccount")
	public Map<String,Object> addEmployee(HttpServletRequest request){
		Account account1 = new Account();
		String account = request.getParameter("account");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String amount = request.getParameter("amount");
		account1.setAccount(account);
		account1.setName(name);
		account1.setAge(Integer.parseInt(age));
		account1.setSex(Integer.parseInt(sex));
		BigDecimal amount1=new BigDecimal(amount);
		account1.setAmount(amount1);
		log.info(account1);
		boolean result = as.addEmployee(account1);
		try {
			if(result){
				resultMap.put("operFlag","1000");
				log.info("添加员工成功！");
			} else {
				resultMap.put("operFlag","1001");
				resultMap.put("errorMessage","添加异常，请稍后再试！");
			}
		} catch (Exception e){
			log.info("添加员工异常");
			resultMap.put("operFlag","1001");
			resultMap.put("errorMessage","添加员工异常");
		}
		return resultMap;
	}
	/**
	 * @author 王小萌
	 * @date 2018-4-20 下午4:21:05
	 * @param
	 * @return
	 * @description：根据ID删除员工
	 */
	@RequestMapping("/deleteAccount")
	public Map<String ,Object> deleteAccount(HttpServletRequest request){
		String id = request.getParameter("id");
		boolean result = as.deleteByPrimaryKey(Integer.parseInt(id));
		try {			
			if(result) {
				resultMap.put("operFlage", "1000");
				log.info("Delete employee successfully");
			} else {
				resultMap.put("operFlag", "1001");
				log.info("Deleted employee failed!");
				resultMap.put("errorMessage", "Deleted employee failed");
			}
		} catch (Exception e) {
			log.info("Delete employee exception");
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", "Delete employee exception");
		}		
		return resultMap;		
	}
	/**
	 * @Author: 王小萌
	 * @Date: 2018/4/16 下午10:15
	 * @Param: {page}
	 * @Return: { }
	 * @Descripton: <获取全部员工>
	 */
	@RequestMapping("/getAllAccount")
	public String getAllAccount(PageUtil page,Model model){
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page.getCurrentPage() - 1) * pageSize); // 起始记录
		log.info("获取account集合");
		//获取全部员工，放入集合
		page.setStartIndex((page.getCurrentPage() - 1) * pageSize);
		List<Account> accounts = as.getAllAccount(page);
		log.info(accounts);
		int total = as.getCountNum(); // 总记录数
		int totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		PageUtil page1 = new PageUtil(page.getCurrentPage(), pageSize, total);
		page1.setList(accounts);
		page1.setTotalPage(totalPage);
		page.setTotalRecord(total);
		if (accounts != null) {
			model.addAttribute("page",page1);
			return "account";
		}
		return null;		
	}
	//根据当前页获取起始下标
	public int getStartIndexByCurrentPage(int currentPage){
		int startIndex = 0;
		if(currentPage==1){
			return startIndex=0;
		}
		startIndex = (currentPage -1) * pageSize;
		return startIndex;
	}


}
