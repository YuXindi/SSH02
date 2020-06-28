package com.ldu.action;
import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.Artist;
import com.ldu.model.User;
import com.ldu.service.ArtistService;
import com.ldu.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("artistRegisterAction")
@Scope("prototype")
public class artistRegisterAction extends ActionSupport implements SessionAware, ServletRequestAware {
	@Resource
	private ArtistService artistService;
	@Resource
	private UserService userService;

	private User user = new User();
	private Artist artist = new Artist();

	private Map<String,Object> session;
	private File artphoto;
    private String artphotoFileName;
    private String artphotoContentType;
	
	public String execute() throws Exception {
		/*
		if(artist.getArtname().equals("") ){
			this.addFieldError("artnameError", "艺人名不能为空！");
			return "input";
		}*/
		//System.out.println(artist.getArtname());

		String path = ServletActionContext.getServletContext().getRealPath("/images/");
		File dest = new File(path,artphotoFileName);
		FileUtils.copyFile(artphoto, dest);
		artist.setArtphoto("images/" + getArtphotoFileName());

		Artist a1 = new Artist(artist.getUsername(),artist.getArtname(),artist.getCompany(),artist.getIdentity(),artist.getStyle(),artist.getArtins(),artist.getArtphoto());
		artistService.saveArtist(a1);

		userService.updateIsartist(artist.getUsername(), 1);
		session.put("isartist", 1);

		return "success";
	}

	public File getArtphoto() {
		return artphoto;
	}

	public void setArtphoto(File artphoto) {
		this.artphoto = artphoto;
	}

	public String getArtphotoFileName() {
		return artphotoFileName;
	}

	public void setArtphotoFileName(String artphotoFileName) {
		this.artphotoFileName = artphotoFileName;
	}

	public String getArtphotoContentType() {
		return artphotoContentType;
	}

	public void setArtphotoContentType(String artphotoContentType) {
		this.artphotoContentType = artphotoContentType;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Artist getArtist() {
		return artist;
	}
	public void setArtist(Artist artist) {
		this.artist = artist;
	}


	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session=session;
	}


	@Override
	public void setServletRequest(HttpServletRequest arg0) {

		
	}

}
