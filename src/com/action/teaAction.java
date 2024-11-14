package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TTeaDAO;
import com.dao.TUserDAO;
import com.model.TTea;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class teaAction extends ActionSupport
{
    private int id;
	private String loginname;
	private String loginpw;
	private String bianhao;
	private String xingming;
	private String sex;
	private String age;
	
	private String message;
	private String path;
	
	private TTeaDAO teaDAO;
	
	
	
	public String reg_tea()
	{
String sql="from TTea where loginname='"+loginname+"' and del='no'";
		
		System.out.println("\nbookCase*********************action="+sql);
		
		List userList=teaDAO.getHibernateTemplate().find(sql);
		if(userList.size()==0)
		{		
		TTea tea=new TTea();
		tea.setLoginname(loginname);
		tea.setLoginpw(loginpw);
		tea.setBianhao(bianhao);
		tea.setXingming(xingming);
		tea.setSex(sex);
		tea.setAge(age);
		tea.setZhuangtai("a");
		tea.setDel("no");
		teaDAO.save(tea);

	}
		else
		{
		
			this.setMessage("此用户名已注册请重新填写");
			this.setPath("login.jsp");	
			
	 
			return "succeed";
		}
	

		return "successAdd";
	}
	
	
	public String teaMana_daishenhe()
	{
		String sql="from TTea where zhuangtai='a' and del='no'";
		List teaList=teaDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("teaList", teaList);
		return ActionSupport.SUCCESS;
	}
	
	public String teaShenhe()
	{
		TTea tea=teaDAO.findById(id);
		tea.setZhuangtai("b");
		teaDAO.attachDirty(tea);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "审核完毕");
		return "msg";
	}
	
	public String teaMana_yishenhe()
	{
		String sql="from TTea where zhuangtai='b' and del='no'";
		List teaList=teaDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("teaList", teaList);
		return ActionSupport.SUCCESS;
	}
	
	public String teaAll()
	{
		String sql="from TTea where zhuangtai='b' and del='no'";
		List teaList=teaDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("teaList", teaList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String teaDel()
	{
		TTea tea=teaDAO.findById(id);
		tea.setDel("yes");
		teaDAO.attachDirty(tea);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "删除成功");
		return "msg";
	}
	
	public String teaDetail()
	{
		String sql="from TTea where id="+id;
		List teaList=teaDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("teaList", teaList);
		return ActionSupport.SUCCESS;
	}


	public String getAge()
	{
		return age;
	}


	public void setAge(String age)
	{
		this.age = age;
	}


	public String getBianhao()
	{
		return bianhao;
	}


	public void setBianhao(String bianhao)
	{
		this.bianhao = bianhao;
	}


	public int getId()
	{
		return id;
	}


	public void setId(int id)
	{
		this.id = id;
	}


	public String getLoginname()
	{
		return loginname;
	}


	public void setLoginname(String loginname)
	{
		this.loginname = loginname;
	}


	public String getLoginpw()
	{
		return loginpw;
	}


	public void setLoginpw(String loginpw)
	{
		this.loginpw = loginpw;
	}


	public String getMessage()
	{
		return message;
	}


	public void setMessage(String message)
	{
		this.message = message;
	}


	public String getPath()
	{
		return path;
	}


	public void setPath(String path)
	{
		this.path = path;
	}


	public String getSex()
	{
		return sex;
	}


	public void setSex(String sex)
	{
		this.sex = sex;
	}


	public TTeaDAO getTeaDAO()
	{
		return teaDAO;
	}


	public void setTeaDAO(TTeaDAO teaDAO)
	{
		this.teaDAO = teaDAO;
	}


	public String getXingming()
	{
		return xingming;
	}


	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}

}
