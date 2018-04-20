/**
 * 
 */
package com.util;

import java.util.List;

/**
 * @description：<分页工具类>
 */
public class PageUtil<Account> {
	//已知数据
	private int currentPage=1;	//当前页
	private int pageSize=10;	//每页显示数量-10
	private int totalRecord;//总条数
	
	//需要通过计算得出的数据
	private int totalPage;  //总页数
	private int startIndex; //开始索引
	
	//页数
	private int start;
	private int end;
	
	//将每页显示的数据装进List
	private List<Account> list;
		
	public PageUtil() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public List<Account> getList() {
		return list;
	}

	public void setList(List<Account> list) {
		this.list = list;
	}
	public PageUtil(int currentPage,int pageSize,int totalRecord){
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalRecord = totalRecord;
		//总页数
		int totalPage = totalRecord % pageSize == 0 ? totalRecord/pageSize : totalRecord/pageSize + 1;
		//开始索引
		int startIndex = (currentPage -1) * pageSize;
		this.start = 1;
		this.end = 5;
		//显示页数的算法
		//显示5页
		//如果总数小于5页，则总页数就是最后一页
		if(totalPage <= 5){
			this.end = totalPage;
		} else {
			this.start = currentPage - 2;
			this.end = currentPage + 2;
			//如果当前页是第一页或者第二页，则开始页就是第1页
			if(start < 0){
				this.start = 1;
				this.end = 5;
			}
			//如果当前页是倒数第二页或者倒数第一页，则总页数就是最后一页
			if(end > totalPage){
				this.end = totalPage;
				this.start = end-5;
			}
		}		
	}

}
