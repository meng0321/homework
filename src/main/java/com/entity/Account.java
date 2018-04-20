package com.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
/**
 * @description：员工实体类，对应表account
 */
public class Account implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8649536684975841729L;
	//ID
    private Integer id;
    //账号（后期自动生成）
    private String account;
    //名字
    private String name;
    //年龄
    private Integer age;
    /*
     * 性别：
     * 1：男
     * 2：女
     * 0：保密
     */
    private Integer sex;
    //创建时间
    private Date creatime;
    //创建日期
    private Date createdate;
    //创建人，对应创建人的userid
    private Integer createuser;
    //账户金额
    private BigDecimal amount;
    //更新时间
    private Date updatetime;
    //状态--1：使用中  9：作废
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getCreatime() {
        return creatime;
    }

    public void setCreatime(Date creatime) {
        this.creatime = creatime;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Integer getCreateuser() {
        return createuser;
    }

    public void setCreateuser(Integer createuser) {
        this.createuser = createuser;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

	@Override
	public String toString() {
		return "Account [id=" + id + ", account=" + account + ", name=" + name
				+ ", age=" + age + ", sex=" + sex + ", creatime=" + creatime
				+ ", createdate=" + createdate + ", createuser=" + createuser
				+ ", amount=" + amount + ", updatetime=" + updatetime
				+ ", status=" + status + "]";
	}
    

    
}