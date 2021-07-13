package com.topdev.aa.action;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.topdev.aa.data.SelectDataObject;
import com.topdev.aa.lib.SqlWorker;

public	final	class	ThreedotSelectAction extends StandardAction 
{
	private Log log = LogFactory.getLog(this.getClass());

	public ActionForward run(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response, HttpSession session) throws Exception 
	{
		List<SelectDataObject> list = new ArrayList<SelectDataObject>();


//		Abfrage(n)
		DataSource dataSource 		= getDataSource();
		Connection connection 		= dataSource.getConnection();
		try
		{
			CallableStatement cs;
			ResultSet rs;

//			________________________________________________________________________________________________________________ 	
//			Holen von Massnahmen

			cs = SqlWorker.prepareCs(connection,"psp_3Dot",9);
			SqlWorker.setCsString(		cs,	"@SESSION_ID",				getSessionId(session));
			cs.registerOutParameter( 		"@RC", 						Types.INTEGER);
			cs.registerOutParameter( 		"@SQL_ERROR",				Types.INTEGER);
			cs.registerOutParameter( 		"@RC_TEXT",					Types.VARCHAR);

			SqlWorker.setCsString(		cs,	"@TBSH_SHORTNAME",			request.getParameter("TBSH_SHORTNAME"));
			SqlWorker.setCsString(		cs,	"@ANWF_SHORTNAME",			request.getParameter("ANWF_SHORTNAME"));
			SqlWorker.setCsString(		cs,	"@KZ_EXISTS",				request.getParameter("KZ_EXISTS"));
			SqlWorker.setCsString(		cs,	"@MAND_ID",					request.getParameter("MAND_ID"));
			SqlWorker.setCsString(		cs,	"@VALUE",					request.getParameter("VALUE"));

			cs.execute();

			rs=cs.getResultSet();
			if(rs!=null) 
			{
				while(rs.next())
					list.add(
								new SelectDataObject
								(
									rs.getString("DECODE"),
									rs.getString("CODE")
								)
							);
				rs.close();
			}
			cs.close();
//			____________________________________________________________________________________________________________
		}
		finally
		{
			connection.close();
		}

		request.setAttribute("title", 
			this.messages.getMessage(this.locale,this.getClass().getName()+"."+request.getParameter("TBSH_SHORTNAME")));
		session.setAttribute("select_list",list);
		
		if(!empty(mapping.findForward("success")))
			return mapping.findForward("success");
		
		return mapping.findForward("threedot");
	}
}