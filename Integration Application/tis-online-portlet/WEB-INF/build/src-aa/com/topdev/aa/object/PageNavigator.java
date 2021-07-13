/*
 * Created on 29.06.2004
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.topdev.aa.object;

import java.io.Serializable;


/**
 * @author hannesweichel
 * 
 * 30.06.2004
 */
public class PageNavigator implements Serializable
{
	private static final long	serialVersionUID	= 3258412824522010672L;
	/**aktuelle Seite*/							public int page;
	/**insgesammt Seiten..*/					public int pages;
	/**Datensaetze pro Seite*/					public int pageSize;
	/**Maximal anzuzeigende Seitenlinks*/		public int pageLimit=15;
	/**Erste Seite der Leiste*/					public int pageFrom;
	/**letzte Seite der Leiste*/				public int pageTo;
	/**erster Datensatz der aktuellen Liste*/	public int resultFrom;
	/**letzer Datensatz der aktuellen liste*/	public int resultTo;
	/**Datensaetze insgesammt*/					public int results;
	/**Selectierte ID*/							public int id;


	/**
	 * @param page Aktuell anzuzeigende Seite
	 * @param pageSize Maximale Ergebnisse pro Seite
	 * @param results Gefundene Ergebnisse
	 * @param pageLimit Maximal im Navigator anzuzeigende Seiten
	 */
	public PageNavigator(int page, int pageSize, int results, int pageLimit)
	{
		this(page, pageSize, results);
		this.pageLimit	=pageLimit;
	}
	
	/**
	 * @param page Aktuell anzuzeigende Seite
	 * @param pageSize Maximale Ergebnisse pro Seite
	 * @param results Gefundene Ergebnisse
	 */
	public PageNavigator(int page, int pageSize, int results)
	{
		this.page		=page;
		this.pageSize	=pageSize;
		this.results	=results;
		
		this.pages 		= (int)((float)  Math.ceil((double) results	/pageSize ));
		this.pageFrom 	= ((int)(float)( Math.ceil((double) page	/pageLimit) -1)*pageLimit)+1;
		
		if(pages<pageLimit)
			pageTo		= pages; 
		else pageTo		=pageFrom+pageLimit;
		
		this.resultFrom	=(page-1)*pageSize+1;
		this.resultTo	=resultFrom+pageSize-1;

		if(results!=0)
		{
			if(pageTo>pages)		pageTo		= pages;
			if(resultTo>results)	resultTo	= results;
		}
	}

	public int getPage()
	{
		return page;
	}

	public int getPageFrom()
	{
		return pageFrom;
	}

	public int getPageLimit()
	{
		return pageLimit;
	}

	public int getPages()
	{
		return pages;
	}

	public int getPageSize()
	{
		return pageSize;
	}

	public int getPageTo()
	{
		return pageTo;
	}

	public int getResultFrom()
	{
		return resultFrom;
	}

	public int getResults()
	{
		return results;
	}

	public int getResultTo()
	{
		return resultTo;
	}

	public void setPage(int i)
	{
		page = i;
	}

	public void setPageFrom(int i)
	{
		pageFrom = i;
	}

	public void setPageLimit(int i)
	{
		pageLimit = i;
	}

	public void setPages(int i)
	{
		pages = i;
	}

	public void setPageSize(int i)
	{
		pageSize = i;
	}

	public void setPageTo(int i)
	{
		pageTo = i;
	}

	public void setResultFrom(int i)
	{
		resultFrom = i;
	}

	public void setResults(int i)
	{
		results = i;
	}

	public void setResultTo(int i)
	{
		resultTo = i;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int i)
	{
		id = i;
	}

}