package com.controller;
/**
 * 
 * @author 王小萌
 * @date 2018-3-20 下午3:11:47
 * @param
 * @return
 * @description：回调函数
 */

public class CallBackDemo {

	public static void main(String[] args) {
		int amount = 100;
		String account = "13370178311";
		WeChatClient w = new WeChatClient();
		w.recharge0(amount, account);
	}
	
	/**
	 * @author 王小萌
	 * @date 2018-3-20
	 * @param {amount,account}
	 * @return 
	 * @description：回调函数需要执行的操作
	 */
}
interface ServerInterface{
	public void sendMessage(int amount,String account);
}

/**
 * 
 * @author 王小萌
 * @date 2018-3-20 下午3:16:53
 * @param {amount,account}
 * @return
 * @description：客户端-调用服务器端进行充值
 */
class WeChatClient implements ServerInterface{
	private int amount;
	private String account;
	@Override
	public void sendMessage(int amount, String account) {
		System.out.println("客户："+account+"充值成功，充值金额"+account);	
	}
	
	public void recharge0(int amount,String account){
		System.out.println("客户端调用服务端进行充值。。。");
		new WeChatServer().recharge(amount,account,this);
	}
	public void weChatClient(int amount,String account){
		this.account = account;
		this.amount = amount;
	}
	
}

/**
 * 
 * @author 王小萌
 * @date 2018-3-20 下午3:20:21
 * @param
 * @return
 * @description：服务端-完成客户端的调用，并且进行回调。
 */
class WeChatServer{
	@SuppressWarnings("static-access")
	public void recharge(int amount,String account,ServerInterface weChatClient){
		System.out.println("服务端开始进行充值。。。");
		try {
			Thread.currentThread().sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		System.out.println("服务端充值完成！");
		weChatClient.sendMessage(amount,account);
	}
}




