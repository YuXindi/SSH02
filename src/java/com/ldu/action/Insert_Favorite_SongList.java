package com.ldu.action;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.MySonglist;
import com.ldu.service.SonglistService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;

@Controller("Insert_Favorite_SongList")
@Scope("prototype")
public class Insert_Favorite_SongList extends ActionSupport implements SessionAware {
	@Resource
	private SonglistService songlistService;

	private Map<String,Object> session;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response;
	
	public void InsertList (String username,String songname) throws Exception{
		MySonglist mySonglist = new MySonglist(username, songname);
		songlistService.insertFavoriteSL(mySonglist);
	}
	public String  FindtList(String username,String songname) throws Exception{
		if(songlistService.isMySonglist(username, songname)){
			return "find";
		}else{
			return "nofind";
		}
	 }
	public String execute() throws Exception {
		String ssname=(String) request.getSession(true).getAttribute("ssname");
		String username=(String) request.getSession(true).getAttribute("username");
		if(username == null){//用户未登录
			request.setAttribute("errorMessage","请先登录");
			return "success";
		}
		if(FindtList(username,ssname)=="find")
		{
			request.setAttribute("errorMessage","您已经收藏过此歌单了");
			return "success";
		}
		else{
			InsertList (username,ssname);
			request.setAttribute("errorMessage","收藏成功");
			return "success";
		}
  }
	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	

}
