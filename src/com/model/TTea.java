package com.model;

/**
 * TTea generated by MyEclipse Persistence Tools
 */

public class TTea implements java.io.Serializable
{

	// Fields

	private Integer id;

	private String loginname;

	private String loginpw;

	private String bianhao;

	private String xingming;

	private String sex;

	private String age;

	private String zhuangtai;

	private String del;

	// Constructors

	/** default constructor */
	public TTea()
	{
	}

	/** full constructor */
	public TTea(String loginname, String loginpw, String bianhao,
			String xingming, String sex, String age, String zhuangtai,
			String del)
	{
		this.loginname = loginname;
		this.loginpw = loginpw;
		this.bianhao = bianhao;
		this.xingming = xingming;
		this.sex = sex;
		this.age = age;
		this.zhuangtai = zhuangtai;
		this.del = del;
	}

	// Property accessors

	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getLoginname()
	{
		return this.loginname;
	}

	public void setLoginname(String loginname)
	{
		this.loginname = loginname;
	}

	public String getLoginpw()
	{
		return this.loginpw;
	}

	public void setLoginpw(String loginpw)
	{
		this.loginpw = loginpw;
	}

	public String getBianhao()
	{
		return this.bianhao;
	}

	public void setBianhao(String bianhao)
	{
		this.bianhao = bianhao;
	}

	public String getXingming()
	{
		return this.xingming;
	}

	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}

	public String getSex()
	{
		return this.sex;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}

	public String getAge()
	{
		return this.age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public String getZhuangtai()
	{
		return this.zhuangtai;
	}

	public void setZhuangtai(String zhuangtai)
	{
		this.zhuangtai = zhuangtai;
	}

	public String getDel()
	{
		return this.del;
	}

	public void setDel(String del)
	{
		this.del = del;
	}

}