package com.ldu.action;

import java.io.File;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.User;
import com.ldu.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("registerAction")
@Scope("prototype")
public class registerAction extends ActionSupport implements SessionAware, ServletRequestAware {
	@Resource
	private UserService userService;

	private User user = new User();
	private Map<String,Object> session;
	private File photo;
    private String photoFileName;
    private String photoContentType;
	
	public String execute() throws Exception {
		String path = ServletActionContext.getServletContext().getRealPath("/images/");
		if(photoFileName != null){
			File dest = new File(path,photoFileName);
			FileUtils.copyFile(photo, dest);
			user.setPhoto("images/" + getPhotoFileName());
		}
		User u1 = new User(user.getUsername(),user.getPassword(),user.getPhone(),user.getEmail(),user.getPhoto(),user.getIns(),0);
		userService.saveUser(u1);
		return "success";
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public String getPhotoContentType() {
		return photoContentType;
	}

	public void setPhotoContentType(String photoContentType) {
		this.photoContentType = photoContentType;
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

	@Override
	public void setServletRequest(HttpServletRequest arg0) {

		
	}

}
