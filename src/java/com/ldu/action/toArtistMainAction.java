package com.ldu.action;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.Song;
import com.ldu.service.SongService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("toArtistMainAction")
@Scope("prototype")
public class toArtistMainAction extends ActionSupport implements SessionAware {
	@Resource
	private SongService songService;

	private Map<String,Object> session;
	List<Song> workList = new ArrayList<Song>();
	HttpServletRequest request = ServletActionContext.getRequest();

	public String execute() throws Exception {
		String username=(String) request.getSession(true).getAttribute("username");
		workList = songService.getSongByUsername(username);

		session.put("workList", workList);			
		return "success";
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session=session;
	}

}
