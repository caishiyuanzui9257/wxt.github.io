package com.service;

import java.util.List;

import com.dao.TBookDAO;
import com.dao.TCatelogDAO;

public class catelogService
{
    private TCatelogDAO catelogDAO;
    private TBookDAO bookDAO;
    
    public List findAllCatelog()
    {
    	try
		{
			Thread.sleep(1500);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	String sql="from TCatelog where catelogDel='no'";
		List cateLogList=catelogDAO.getHibernateTemplate().find(sql);
		return cateLogList;
    }
    
    public List findAllBook()
    {
    	try
		{
			Thread.sleep(1500);
		} catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	String sql="from TBook where del='no'";
		List bookList=bookDAO.getHibernateTemplate().find(sql);
		return bookList;
    }

	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}

	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}

	public TBookDAO getBookDAO()
	{
		return bookDAO;
	}

	public void setBookDAO(TBookDAO bookDAO)
	{
		this.bookDAO = bookDAO;
	}
    
}
