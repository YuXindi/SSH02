package com.ldu.action;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.Song;
import com.ldu.model.Songlist;
import com.ldu.service.SongService;
import com.ldu.service.SonglistService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("Find_Song_List")
@Scope("prototype")
public class Find_Song_List extends ActionSupport implements SessionAware{

	@Resource
	private SonglistService songlistService;
	@Resource
	private SongService songService;
	private Map<String,Object> session;

	HttpServletRequest request = ServletActionContext.getRequest();
	String slname=request.getParameter("slname");
	
	public String execute() throws Exception {
		Songlist sl = songlistService.getSonglistInfo(slname);
		String coverimg=sl.getCover()+sl.getListName()+".jpg";
		session.put("img", coverimg);
		session.put("introdu", sl.getIntrodu());
		System.out.println(slname);
			   
		List<Song> songs = songService.getSongBySL(slname);
		session.put("song_lists", songs);
		session.put("ssname",slname);
			 
		return "success";
	}
	

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
