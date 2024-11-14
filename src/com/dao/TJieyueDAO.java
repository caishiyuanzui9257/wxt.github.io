package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TJieyue;

/**
 * Data access object (DAO) for domain model class TJieyue.
 * 
 * @see com.model.TJieyue
 * @author MyEclipse Persistence Tools
 */

public class TJieyueDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TJieyueDAO.class);

	// property constants
	public static final String BOOK_ID = "bookId";

	public static final String DUZHELEIXING = "duzheleixing";

	public static final String DUZHE_ID = "duzheId";

	public static final String JIEYUE_SHIJIAN = "jieyueShijian";

	public static final String DAOQI_SHIJIAN = "daoqiShijian";

	public static final String GUIHUANSHIJIAN = "guihuanshijian";

	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TJieyue transientInstance)
	{
		log.debug("saving TJieyue instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TJieyue persistentInstance)
	{
		log.debug("deleting TJieyue instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TJieyue findById(java.lang.Integer id)
	{
		log.debug("getting TJieyue instance with id: " + id);
		try
		{
			TJieyue instance = (TJieyue) getHibernateTemplate().get(
					"com.model.TJieyue", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TJieyue instance)
	{
		log.debug("finding TJieyue instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TJieyue instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TJieyue as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByBookId(Object bookId)
	{
		return findByProperty(BOOK_ID, bookId);
	}

	public List findByDuzheleixing(Object duzheleixing)
	{
		return findByProperty(DUZHELEIXING, duzheleixing);
	}

	public List findByDuzheId(Object duzheId)
	{
		return findByProperty(DUZHE_ID, duzheId);
	}

	public List findByJieyueShijian(Object jieyueShijian)
	{
		return findByProperty(JIEYUE_SHIJIAN, jieyueShijian);
	}

	public List findByDaoqiShijian(Object daoqiShijian)
	{
		return findByProperty(DAOQI_SHIJIAN, daoqiShijian);
	}

	public List findByGuihuanshijian(Object guihuanshijian)
	{
		return findByProperty(GUIHUANSHIJIAN, guihuanshijian);
	}

	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TJieyue instances");
		try
		{
			String queryString = "from TJieyue";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TJieyue merge(TJieyue detachedInstance)
	{
		log.debug("merging TJieyue instance");
		try
		{
			TJieyue result = (TJieyue) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TJieyue instance)
	{
		log.debug("attaching dirty TJieyue instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TJieyue instance)
	{
		log.debug("attaching clean TJieyue instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TJieyueDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TJieyueDAO) ctx.getBean("TJieyueDAO");
	}
}