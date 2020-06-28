package com.ldu.action;
import java.util.ArrayList;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.MyHistory;
import com.ldu.model.Song;
import com.ldu.service.SongService;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("Insert_Recent_Song")
@Scope("prototype")
public class Insert_Recent_Song extends ActionSupport implements SessionAware {
	@Resource
	private SongService songService;

	Song song_list = new  Song();
	private Map<String,Object> session;
	HttpServletRequest request = ServletActionContext.getRequest();
	 
	public void InsertList (String username,String songname) throws Exception{
		MyHistory myHistory = new MyHistory(username, songname);
		songService.insertRecentSong(myHistory);
	 }

	public void DeleteList (String username,String songname) throws Exception{
		songService.deleteMyHistory(username, songname);
	 }

	public String  SelectList(String username,String songname) throws Exception{
		if(songService.isMyHistory(username, songname)){
			return "find";
		}else{
			return "nofind";
		}
		 
	 }
	public String execute() throws Exception {
		
		String flag=request.getParameter("flag");
		String username=(String) request.getSession().getAttribute("username");  
		
		if(username == null){
			String songname=(String) request.getParameter("songname");
			String filePath=(String) request.getParameter("filePath");//1
			System.out.println("songname"+songname+"filePath"+filePath);
			session.put("musicplay1", songname);
			session.put("musicplay2", filePath);
			return "success";
		}
			
		if(flag != null)
		{
			ArrayList<Song> song_lists=new ArrayList<Song>();
			song_lists=(ArrayList) request.getSession().getAttribute("song_lists");  

			for(Song sl:song_lists){
				 String songname=sl.getName();
				// System.out.println(songname);
				 if(SelectList(username,songname)== "find"){
						//System.out.println("查找成功");
						DeleteList(username,songname);
						//System.out.println("删除完成");
						InsertList(username,songname);
						//System.out.println("插入完成");
					}
					else{
						//System.out.println("没有此歌");
						InsertList(username,songname);
						//System.out.println("插入此歌");
					}
				      
			}
			
			return "ok";
		}
		String songname=(String) request.getParameter("songname");
		String filePath=(String) request.getParameter("filePath");//1
		System.out.println("songname"+songname+"filePath"+filePath);
		session.put("musicplay1", songname);
		session.put("musicplay2", filePath);
		
		if(SelectList(username,songname)== "find"){
			//System.out.println("查找成功");
			DeleteList(username,songname);
			//System.out.println("删除完成");
			InsertList(username,songname);
			//System.out.println("插入完成");
		}
		else{
			//System.out.println("没有此歌");
			InsertList(username,songname);
			//System.out.println("插入此歌");
		}
		
		return "success";
		
		
  }
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Song getSong_list() {
		return song_list;
	}
	public void setSong_list(Song song_list) {
		this.song_list = song_list;
	}
	
	
	

}
