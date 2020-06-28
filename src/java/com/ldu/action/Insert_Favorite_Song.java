package com.ldu.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ldu.model.MyLike;
import com.ldu.service.SongService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("Insert_Favorite_Song")
@Scope("prototype")
public class Insert_Favorite_Song extends ActionSupport implements SessionAware {
	@Resource
	private SongService songService;

	private Map<String,Object> session;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response;
	
	public void InsertList (String username,String songname) throws Exception{
		MyLike myLike = new MyLike(username,songname);
		songService.insertFavoriteSong(myLike);
	}

	public String  FindtList(String username,String songname) throws Exception{
		if(songService.isMylike(username, songname)){
			return "find";
		}else{
			return "nofind";
		}
	 }
	public String execute() throws Exception {
		
		String ssname=request.getParameter("songname");
		String zszl=request.getParameter("zszl");
		String username=(String) request.getSession(true).getAttribute("username");
		System.out.println("////"+ssname+username);
		
		if(username == null){//用户未登录
			request.setAttribute("errorlikeMsg","请先登录");
			if(zszl.equals("1")){
				return "success";
			}else if(zszl.equals("7")) {
				return "thisYyr";
			}else{
				return "search";
			}
		}
		
		if(FindtList(username,ssname)=="find")
		{
			request.setAttribute("errorlikeMsg","您已经收藏过此歌");
			
			if(zszl.equals("1")){
				return "success";
			}else{
				return "search";
			}
			 
		} else{
			InsertList(username,ssname);
			request.setAttribute("errorlikeMsg","收藏成功");
		
			if(zszl.equals("1")){
				return "success";
			}else if(zszl.equals("4")){
				return "ok";
			}else if(zszl.equals("2")){
				return "search";
			}else if(zszl.equals("7")){
				return "thisYyr";
			}else{
				return "yyr";
			}
			
		} 

  }
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	

}
