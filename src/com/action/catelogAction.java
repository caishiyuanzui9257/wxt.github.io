package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TCatelogDAO;
import com.model.TCatelog;
import com.opensymphony.xwork2.ActionSupport;

public class catelogAction extends ActionSupport
{
	private int catelogId;
	private String catelogName;
	private String catelogMiaoshu;
	
	private String message;
	private String path;
	private String url;
	private TCatelogDAO catelogDAO;
	
	private TCatelog catelog;
	
	public String catelogMana()
	{
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("cateLogList", cateLogList);
		return ActionSupport.SUCCESS;
	}
	public String toUpdate()
	{
		url="/admin/catelog/catelogUpdate.jsp";
		TCatelog catelog=(TCatelog)catelogDAO.getHibernateTemplate().get(TCatelog.class	, catelogId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("catelog", catelog);
		return ActionSupport.SUCCESS;
	}
	public String doUpdate()
	{
	
		catelog.setCatelogDel("no");
		catelogDAO.attachDirty(catelog);
		this.setMessage("操作成功");
		this.setPath("catelogMana.action");
		return "succeed";
	}
	
	
	public String catelogAll()
	{
		String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("cateLogList", cateLogList);
		return ActionSupport.SUCCESS;
	}
	
	public String catelogAdd()
	{
		TCatelog catelog=new TCatelog();
		catelog.setCatelogName(catelogName);
		catelog.setCatelogMiaoshu(catelogMiaoshu);
		catelog.setCatelogDel("no");
		catelogDAO.save(catelog);
		this.setMessage("操作成功");
		this.setPath("catelogMana.action");
		return "succeed";
	}
	
	public String catelogDel()
	{
		TCatelog catelog=catelogDAO.findById(catelogId);
		catelog.setCatelogDel("yes");
		catelogDAO.attachDirty(catelog);
		this.setMessage("操作成功");
		this.setPath("catelogMana.action");
		return "succeed";
	}
	
	

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}

	public int getCatelogId()
	{
		return catelogId;
	}

	public void setCatelogId(int catelogId)
	{
		this.catelogId = catelogId;
	}

	public String getCatelogMiaoshu()
	{
		return catelogMiaoshu;
	}

	public void setCatelogMiaoshu(String catelogMiaoshu)
	{
		this.catelogMiaoshu = catelogMiaoshu;
	}

	public String getCatelogName()
	{
		return catelogName;
	}

	public void setCatelogName(String catelogName)
	{
		this.catelogName = catelogName;
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



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}
	public TCatelog getCatelog() {
		return catelog;
	}
	public void setCatelog(TCatelog catelog) {
		this.catelog = catelog;
	}

}
