package com.rest.service;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.OPTIONS;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import com.db.service.CommentDAOService;
import com.model.CommentVO;
import com.mysql.jdbc.StringUtils;

@Path("/CommentService")
public class CommentService {
	
	CommentDAOService dao = new CommentDAOService();
   private static final String SUCCESS_RESULT="<result>success</result>";
   private static final String FAILURE_RESULT="<result>failure</result>";

   
   @GET
   @Path("/comments/{postid}")
   @Produces(MediaType.APPLICATION_JSON)
   public List<CommentVO> getComments(@PathParam("postid") int postId){
		List<CommentVO> list = dao.getComments(1, 100);
		
		for(CommentVO c: list)
		{
			c.setDateCreated(null);
			c.setDateUpdated(null);
		}
		
		List<Date> list2 = new ArrayList<Date>();
		for(CommentVO c : list)
		{
			System.out.println(c.getDateCreated());
			list2.add(c.getDateCreated());
		}
		return list;
   }

   
   @DELETE
   @Path("/comments/{cid}")
   @Produces(MediaType.APPLICATION_XML)
   public String deleteComment(@PathParam("cid") int cid){
	
		System.out.println("deleting comment = "+cid);
		if(cid != 0){
			dao.deleteComment(cid);
		}
		return SUCCESS_RESULT;
   }
   
   
   

   
}