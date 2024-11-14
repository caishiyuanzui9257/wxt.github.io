package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TUserDAO;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport
{
    private int id;
	private String loginname;
	private String loginpw;
	private String xuehao;
	private String xingming;
	private String xueyuan;
	private String zhuanye;
	private String tel;
	private String email;
	
	private String message;
	private String path;
	
	private TUserDAO userDAO;
	
	
	
	public String reg_user()
	{

		String sql="from TUser where loginname='"+loginname+"' and del='no'";
		
		System.out.println("\nbookCase*********************action="+sql);
		
		List userList=userDAO.getHibernateTemplate().find(sql);
		if(userList.size()==0)
		{	
			
			System.out.println("ggggggggggggggg");
		TUser user=new TUser();
		user.setLoginname(loginname);
		user.setLoginpw(loginpw);
		user.setXuehao(xuehao);
		user.setXingming(xingming);
		user.setXueyuan(xueyuan);
		user.setZhuanye(zhuanye);
		user.setTel(tel);
		user.setEmail(email);
		user.setZhuangtai("a");
		user.setDel("no");
		userDAO.save(user);
		}
		else
		{
		
			this.setMessage("此用户名已注册请重新填写");
			this.setPath("login.jsp");	
			
	 
			return "succeed";
		}
	

		return "successAdd";
	}
	
	
	public String userMana_daishenhe()
	{
		String sql="from TUser where zhuangtai='a' and del='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	public String userShenhe()
	{
		TUser user=userDAO.findById(id);
		user.setZhuangtai("b");
		userDAO.attachDirty(user);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "操作成功");
		return "msg";
	}
	
	public String userMana_yishenhe()
	{
		String sql="from TUser where zhuangtai='b' and del='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	public String userAll()
	{
		String sql="from TUser where zhuangtai='b' and del='no'";
		List userList=userDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String userDel()
	{
		TUser user=userDAO.findById(id);
		user.setDel("yes");
		userDAO.attachDirty(user);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "删除成功");
		return "msg";
	}
	
	public String userDetail()
	{
		String sql="from TUser where id="+id;
		List userList=userDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("userList", userList);
		return ActionSupport.SUCCESS;
	}


	public String getEmail()
	{
		return email;
	}


	public void setEmail(String email)
	{
		this.email = email;
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


	public String getTel()
	{
		return tel;
	}


	public void setTel(String tel)
	{
		this.tel = tel;
	}


	public TUserDAO getUserDAO()
	{
		return userDAO;
	}


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}


	public String getXingming()
	{
		return xingming;
	}


	public void setXingming(String xingming)
	{
		this.xingming = xingming;
	}


	public String getXuehao()
	{
		return xuehao;
	}


	public void setXuehao(String xuehao)
	{
		this.xuehao = xuehao;
	}


	public String getXueyuan()
	{
		return xueyuan;
	}


	public void setXueyuan(String xueyuan)
	{
		this.xueyuan = xueyuan;
	}


	public String getZhuanye()
	{
		return zhuanye;
	}


	public void setZhuanye(String zhuanye)
	{
		this.zhuanye = zhuanye;
	}

}
