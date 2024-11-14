
package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TBookDAO;
import com.dao.TJieyueDAO;
import com.dao.TTeaDAO;
import com.dao.TUserDAO;
import com.model.TBook;
import com.model.TJieyue;
import com.model.TTea;
import com.model.TUser;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class jieyueAction extends ActionSupport
{
	private int id;
	private int bookId;
	private String duzheleixing;
	private int duzheId;
	private String jieyueShijian;
	private String daoqiShijian;


	private TUserDAO userDAO;
	private TBookDAO bookDAO;
	private TTeaDAO teaDAO;
	private TJieyueDAO jieyueDAO;

	private String message;
	private String path;
	private String url;
	private TJieyue jieyue;
	private String bookName;

	public String jieyueAdd()
	{
		TJieyue jieyue=new TJieyue();

		jieyue.setBook(bookDAO.findById(bookId));
		jieyue.setDuzheleixing(duzheleixing);
		jieyue.setDuzheId(duzheId);
		jieyue.setJieyueShijian(jieyueShijian);
		jieyue.setDaoqiShijian(daoqiShijian);
		jieyue.setGuihuanshijian("");
		jieyue.setDel("no");

		jieyueDAO.save(jieyue);
		this.setMessage("操作成功");
		this.setPath("jieyueMana.action");
		return "succeed";
	}

	public String jieyueMana()
	{
		String sql="from TJieyue j where j.del='no'";

		if(bookName!=null && !"".equals(bookName)){
			sql+=" and j.book.bookName like '%"+bookName+"%'";
		}

		List jieyueList=jieyueDAO.getHibernateTemplate().find(sql);
//    	for(int i=0;i<jieyueList.size();i++ )
//    	{
//    		TJieyue jieyue=(TJieyue)jieyueList.get(i);
//
//    		jieyue.setBook(bookDAO.findById(jieyue.getBookId()));
//
//    	}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jieyueList", jieyueList);
		return ActionSupport.SUCCESS;
	}

	public String jieyueDel()
	{
		TJieyue jieyue=jieyueDAO.findById(id);
		jieyue.setDel("yes");
		jieyueDAO.attachDirty(jieyue);
		this.setMessage("操作成功");
		this.setPath("jieyueMana.action");
		return "succeed";
	}


	public String jieyueGuihuan()
	{
		TJieyue jieyue=jieyueDAO.findById(id);
		jieyue.setGuihuanshijian(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		jieyueDAO.attachDirty(jieyue);
		this.setMessage("操作成功");
		this.setPath("jieyueMana.action");
		return "succeed";
	}


	public String jieyue_mana_tea()
	{
		Map session=ActionContext.getContext().getSession();
		TTea tea=(TTea)session.get("tea");

		String sql="from TJieyue where del='no' and duzheleixing='tea' and duzheId=?";
		Object[] c={tea.getId()};
		List jieyueList=jieyueDAO.getHibernateTemplate().find(sql,c);
//    	for(int i=0;i<jieyueList.size();i++ )
//    	{
//    		TJieyue jieyue=(TJieyue)jieyueList.get(i);
//
//    		jieyue.setBook(bookDAO.findById(jieyue.getBookId()));
//
//    	}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jieyueList", jieyueList);
		return ActionSupport.SUCCESS;
	}

	public String jieyue_mana_user()
	{
		Map session=ActionContext.getContext().getSession();
		TUser user=(TUser)session.get("user");

		String sql="from TJieyue where del='no' and duzheleixing='user' and duzheId=?";
		Object[] c={user.getId()};
		List jieyueList=jieyueDAO.getHibernateTemplate().find(sql,c);
//    	for(int i=0;i<jieyueList.size();i++ )
//    	{
//    		TJieyue jieyue=(TJieyue)jieyueList.get(i);
//
//    		jieyue.setBook(bookDAO.findById(jieyue.getBookId()));
//
//    	}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("jieyueList", jieyueList);
		return ActionSupport.SUCCESS;
	}


	public TBookDAO getBookDAO()
	{
		return bookDAO;
	}


	public void setBookDAO(TBookDAO bookDAO)
	{
		this.bookDAO = bookDAO;
	}


	public int getBookId()
	{
		return bookId;
	}


	public void setBookId(int bookId)
	{
		this.bookId = bookId;
	}


	public String getDaoqiShijian()
	{
		return daoqiShijian;
	}


	public void setDaoqiShijian(String daoqiShijian)
	{
		this.daoqiShijian = daoqiShijian;
	}


	public int getDuzheId()
	{
		return duzheId;
	}


	public void setDuzheId(int duzheId)
	{
		this.duzheId = duzheId;
	}


	public String getDuzheleixing()
	{
		return duzheleixing;
	}


	public void setDuzheleixing(String duzheleixing)
	{
		this.duzheleixing = duzheleixing;
	}


	public int getId()
	{
		return id;
	}


	public void setId(int id)
	{
		this.id = id;
	}


	public TJieyueDAO getJieyueDAO()
	{
		return jieyueDAO;
	}


	public void setJieyueDAO(TJieyueDAO jieyueDAO)
	{
		this.jieyueDAO = jieyueDAO;
	}


	public String getJieyueShijian()
	{
		return jieyueShijian;
	}


	public void setJieyueShijian(String jieyueShijian)
	{
		this.jieyueShijian = jieyueShijian;
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


	public TTeaDAO getTeaDAO()
	{
		return teaDAO;
	}


	public void setTeaDAO(TTeaDAO teaDAO)
	{
		this.teaDAO = teaDAO;
	}


	public TUserDAO getUserDAO()
	{
		return userDAO;
	}


	public void setUserDAO(TUserDAO userDAO)
	{
		this.userDAO = userDAO;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public TJieyue getJieyue() {
		return jieyue;
	}

	public void setJieyue(TJieyue jieyue) {
		this.jieyue = jieyue;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}




}
