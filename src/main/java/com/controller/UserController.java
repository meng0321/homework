package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.UserEntity;
import com.service.UserService;
import common.ThisSystemException;


@Controller
@RequestMapping("/user")
public class UserController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	Map<String,Object> resultMap  =  new HashMap<String,Object>();
	@Autowired
	private UserService us;
	
	@RequestMapping("/toLogin")
	public String toLogin(){
		return "login";
	}
	/**
	 * @date 2018-03-27
	 * @param request
	 * @return Map
	 * @description 用户登陆
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,Object> login(HttpServletRequest request){
		
		log.info("进入登录");
		
		/**
		 * 防止多参数的情况，如果存在特别多的参数，方法参数放不下，或者直接使用实体类
		 */
		String name =  request.getParameter("name");
		String password = request.getParameter("password");
		
		try{
			long startTime = System.currentTimeMillis();
			UserEntity ue = us.checkLogin(name,password);
			HttpSession session = request.getSession();
			session.setAttribute("username", ue);
			resultMap.put("operFlag", "1000");
			log.info("登录耗时："+(System.currentTimeMillis()-startTime)+"毫秒");
		} catch (ThisSystemException e1){
			log.info("用户或密码错误",e1);
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", e1.getMessage());
		} catch (Exception e){
			log.error("登录异常",e);
			resultMap.put("operFlag", "1001");
		}
		
		log.info("登录结束");
		return resultMap;		
	}
		
	@RequestMapping("/index")
	public String toWelcome(){
		return "index";
	}
	@RequestMapping("/toRegist")
	public String toRegist(){
		return "regist";
	}
	/**
	 * @author 王小萌
	 * @date 2018-3-27 上午10:03:24
	 * @param request
	 * @return Map
	 * @description：用户注册
	 */
	@ResponseBody
	@RequestMapping("/regist")
	public Map<String,Object> regist(HttpServletRequest request){
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		try{
			boolean result = us.isExist(name);
			if(result){
				resultMap.put("operFlag", "1001");
				resultMap.put("errorMessage", "用户名已存在!");
				log.info("该账号已存在");
			} else {
				boolean n = us.regist(name,password);
				if(n){
					resultMap.put("operFlag", "1000");
					log.info("注册成功");
				} else {
					resultMap.put("errorMessage","注册异常");
				}				
			}			
		} catch (ThisSystemException e){
			log.error("注册异常");
			resultMap.put("operFlag", "1001");
			resultMap.put("errorMessage", "该用户已存在!");
			log.info("该用户已存在");
		}
		return resultMap;
		
	}
	/**
	 * @author 王小萌
	 * @date 2018-3-27 上午10:12:19
	 * @param
	 * @return 注册成功，跳转到成功页面。
	 * @description：注册成功
	 */
	@RequestMapping("/regist_success")
	public String toSuccess(){
		return "regist_success";
	}
	@RequestMapping("/account")
	public String toAccount(){
		return "account";
	}
	@RequestMapping("/todo")
	public String todolist(){
		return "todo";
	}
	@RequestMapping("/personal")
	public String topersonal(){
		return "personal";
	}
}
