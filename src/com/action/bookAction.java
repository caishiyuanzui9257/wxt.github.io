package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TBookDAO;
import com.dao.TCatelogDAO;
import com.model.TBook;
import com.opensymphony.xwork2.ActionSupport;

public class bookAction extends ActionSupport
{
    private int bookId;
    private int catelogId;
    private String bookName;
    private String bookZuozhe;
    private String bookChubanshe;
    private String bookChubanriqi;
    private String bookIsbm;
    private String bookPrice;
    private String bookYeshu;
    
    private TBookDAO bookDAO;
    private TCatelogDAO catelogDAO;
    private String message;
	private String path;
	private String url;
	private TBook book;
	
	public String bookAdd()
	{
		TBook book=new TBook();
		book.setBookName(bookName);
		book.setBookZuozhe(bookZuozhe);
		book.setBookChubanshe(bookChubanshe);
		book.setBookChubanriqi(bookChubanriqi);
		book.setBookIsbm(bookIsbm);
		book.setBookPrice(bookPrice);
		book.setBookYeshu(bookYeshu);
		book.setBookKucun("1000");
		book.setCatelogId(catelogId);
		book.setDel("no");
		bookDAO.save(book);
		this.setMessage("操作成功");
		this.setPath("bookMana.action");
		return "succeed";
	}
	
	
	public String bookMana()
	{
		String sql="from TBook where del='no' ";
		if(catelogId!=-1 && catelogId!=0){
			sql+=" and catelogId="+catelogId;
		}
		if(bookName!=null && !"".equals(bookName)){
			sql+=" and bookName like '%"+bookName+"%'";
		}
		sql+=" order by catelogId";
		List bookList=bookDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<bookList.size();i++)
		{
			TBook book=(TBook)bookList.get(i);
			book.setCatelogName(catelogDAO.findById(book.getCatelogId()).getCatelogName());
		}
		
		List catelogList=catelogDAO.getHibernateTemplate().find("from TCatelog where catelogDel='no'");
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("catelogList", catelogList);
		request.put("bookList", bookList);
		return ActionSupport.SUCCESS;
	}
	
	public String bookDel()
	{
		TBook book=bookDAO.findById(bookId);
		book.setDel("yes");
		bookDAO.attachDirty(book);
		this.setMessage("操作成功");
		this.setPath("bookMana.action");
		return "succeed";
	}
	

	public String toUpdate()
	{
		url="/admin/book/bookUpdate.jsp";
		TBook book=bookDAO.findById(bookId);
		List catelogList=catelogDAO.getHibernateTemplate().find("from TCatelog where catelogDel='no'");
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("catelogList", catelogList);
		request.put("book", book);
		return ActionSupport.SUCCESS;
	}
	public String doUpdate()
	{
		
		book.setDel("no");
		bookDAO.attachDirty(book);
		
		this.setMessage("操作成功");
		this.setPath("bookMana.action");
		return "succeed";
	}
	
	
	public String bookAll()
	{
		String sql="from TBook where del='no' ";
		if(catelogId!=-1 && catelogId!=0){
			sql+=" and catelogId="+catelogId;
		}
		if(bookName!=null && !"".equals(bookName)){
			sql+=" and bookName like '%"+bookName+"%'";
		}
		sql+=" order by catelogId";
		List bookList=bookDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<bookList.size();i++)
		{
			TBook book=(TBook)bookList.get(i);
			book.setCatelogName(catelogDAO.findById(book.getCatelogId()).getCatelogName());
		}
		
		List catelogList=catelogDAO.getHibernateTemplate().find("from TCatelog where catelogDel='no'");
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("catelogList", catelogList);
	
		request.put("bookList", bookList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String bookSearch()
	{
		String sql="from TBook where del='no' and bookName like '%"+bookName+"%'"+" order by catelogId";
		List bookList=bookDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<bookList.size();i++)
		{
			TBook book=(TBook)bookList.get(i);
			book.setCatelogName(catelogDAO.findById(book.getCatelogId()).getCatelogName());
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("bookList", bookList);
		return ActionSupport.SUCCESS;
	}
	
	public String getBookChubanriqi()
	{
		return bookChubanriqi;
	}
	public void setBookChubanriqi(String bookChubanriqi)
	{
		this.bookChubanriqi = bookChubanriqi;
	}
	public String getBookChubanshe()
	{
		return bookChubanshe;
	}
	public void setBookChubanshe(String bookChubanshe)
	{
		this.bookChubanshe = bookChubanshe;
	}
	public TBookDAO getBookDAO()
	{
		return bookDAO;
	}
	public void setBookDAO(TBookDAO bookDAO)
	{
		this.bookDAO = bookDAO;
	}
	
	public TCatelogDAO getCatelogDAO()
	{
		return catelogDAO;
	}


	public void setCatelogDAO(TCatelogDAO catelogDAO)
	{
		this.catelogDAO = catelogDAO;
	}


	public int getBookId()
	{
		return bookId;
	}
	public void setBookId(int bookId)
	{
		this.bookId = bookId;
	}
	public String getBookIsbm()
	{
		return bookIsbm;
	}
	public void setBookIsbm(String bookIsbm)
	{
		this.bookIsbm = bookIsbm;
	}
	public String getBookName()
	{
		return bookName;
	}
	public void setBookName(String bookName)
	{
		this.bookName = bookName;
	}
	public String getBookPrice()
	{
		return bookPrice;
	}
	public void setBookPrice(String bookPrice)
	{
		this.bookPrice = bookPrice;
	}
	public String getBookYeshu()
	{
		return bookYeshu;
	}
	public void setBookYeshu(String bookYeshu)
	{
		this.bookYeshu = bookYeshu;
	}
	public String getBookZuozhe()
	{
		return bookZuozhe;
	}
	public void setBookZuozhe(String bookZuozhe)
	{
		this.bookZuozhe = bookZuozhe;
	}
	public int getCatelogId()
	{
		return catelogId;
	}
	public void setCatelogId(int catelogId)
	{
		this.catelogId = catelogId;
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


	public TBook getBook() {
		return book;
	}


	public void setBook(TBook book) {
		this.book = book;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}
	
}
