package com.ldu.action;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ldu.model.Artist;
import com.ldu.model.Song;
import com.ldu.model.User;
import com.ldu.service.ArtistService;
import com.ldu.service.SongService;
import com.ldu.service.SonglistService;
import com.ldu.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller("loginAction")
@Scope("prototype")
public class loginAction extends ActionSupport implements SessionAware {

	@Resource
	private UserService userService;
	@Resource
	private ArtistService artistService;
	@Resource
	private SongService songService;
	@Resource
	private SonglistService songlistService;

	private User user = new User();
	private Map<String,Object> session;

	List<Song> historyList = new ArrayList<>();
	List<String> songlistList = new ArrayList<>();
	List<Song> likeList = new ArrayList<>();
	HttpServletRequest request = ServletActionContext.getRequest();

	public String execute() throws Exception {
		if(user.getUsername().equals("")){
			this.addFieldError("usernameError", "请输入用户名！");
			return "input";
		}
		if(user.getPassword().equals("")){
			this.addFieldError("passwordError", "请输入密码！");
			return "input";
		}
		if (userService.selectUserByNameAndPwd(user.getUsername(),user.getPassword()) ) {

			User u1 = userService.getUserInfo(user.getUsername());
			session.put("username", u1.getUsername());
			session.put("password", u1.getPassword());
			session.put("photo", u1.getPhoto());
			session.put("phone", u1.getPhone());
			session.put("email", u1.getEmail());
			session.put("ins", u1.getIns());
			session.put("isartist", u1.getIsartist());
			return "success";
		} else {
			this.addFieldError("usernameError", "用户名或密码不正确！");
			return "input"; 
		}
	}

	public String getArtistInfo() throws Exception {
		String username=(String) request.getSession(true).getAttribute("username");
		Artist a1 = artistService.getArtistInfo(username);
		if (a1 != null){
			session.put("artname", a1.getArtname());
			session.put("company", a1.getCompany());
			session.put("identity", a1.getIdentity());
			session.put("style", a1.getStyle());
			session.put("artins", a1.getArtins());
			session.put("artphoto", a1.getArtphoto());
		}

		return "success";
	}
	
	public String findHistory() throws Exception {
		String username=(String) request.getSession(true).getAttribute("username");
		historyList = songService.getMyHistory(username);
		session.put("historyList", historyList);			
		return "success";
	}


	public String findSonglist() throws Exception {
		String username=(String) request.getSession(true).getAttribute("username");
		songlistList = songlistService.getMySonglist(username);
		session.put("songListList", songlistList);
		return "success";
	}

	public String findLike() throws Exception {
		String username=(String) request.getSession(true).getAttribute("username");
		System.out.println("username:"+username);

		likeList = songService.getMyLike(username);
		//System.out.println(likeList.get(0).getAlbum());
		session.put("likeList", likeList);
		return "success";
	}


	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session=session;
	}
}
