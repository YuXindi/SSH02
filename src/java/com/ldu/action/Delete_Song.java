package com.ldu.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldu.service.SongService;
import com.ldu.service.SonglistService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("Delete_Song")
@Scope("prototype")
public class Delete_Song extends ActionSupport implements SessionAware {

	@Resource
	private SonglistService songlistService;
	@Resource
	private SongService songService;

	private Map<String,Object> session;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response;

	String username=(String) request.getSession(true).getAttribute("username");
	
	public String deletesonglist() throws Exception {
		String songlist=request.getParameter("songlist");
		songlistService.deleteMySonglist(username, songlist);
		return "success";
  }

	public String deleterecent() throws Exception {
		String recent=request.getParameter("recent");
		songService.deleteMyHistory(username,recent);
		return "success";
  }


	public String deletefavorite() throws Exception {
		 
		String favorite=request.getParameter("favorite");
		String search=request.getParameter("search");
		String zszl=request.getParameter("zszl");
		//System.out.println(zszl+"where i am?");

		songService.deleteMyLike(username, favorite);
		
		 if(zszl.equals("0")){
		 
			 return "success";
		 }else if(zszl.equals("1")){
			 
			 request.setAttribute("errorddMessage","移除收藏成功");
				
			 return "ok";
		 }else if(zszl.equals("2")){
			 
			 request.setAttribute("errorddMessage","移除收藏成功");
			 return "search";
		 }else if(zszl.equals("6")){
			 
			 request.setAttribute("errorddMessage","移除收藏成功");
			 return "yyr";
		 }if(zszl.equals("7")){
			 
			 request.setAttribute("errorddMessage","移除收藏成功");
			 return "thisYyr";
		 }
		 return "success";
		
       
  }

	
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	

}
