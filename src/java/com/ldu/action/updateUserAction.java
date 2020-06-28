package com.ldu.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.User;
import com.ldu.service.UserService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.omg.CORBA.Request;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("updateUserAction")
@Scope("prototype")
public class updateUserAction extends ActionSupport implements SessionAware, ServletRequestAware {

	@Resource
	private UserService userService;

	private User user = new User();//模型驱动

	private Map<String,Object> session;
	private File photo;
    private String photoFileName;
    private String photoContentType;
    
    private String oldPwd;
    private String newPwd;
    private String newPwd2;
	HttpServletRequest request = ServletActionContext.getRequest();
	
	public String updateInfo() throws Exception {

		if(user.getPhone().equals("") ){
			this.addFieldError("phoneError", "手机号码不能为空！");
			return "input";
		}
		if(user.getPhone().length() != 11){
			this.addFieldError("phoneError", "请输入11位手机号！");
			return "input";
		}
		if(user.getEmail().equals("")){
			this.addFieldError("emailError", "电子邮箱不能为空！");
			return "input";
		}

		userService.updateInfo(user.getUsername(),user.getPhone(),user.getEmail(),user.getIns());

		session.put("phone", user.getPhone());
		session.put("email", user.getEmail());
		session.put("ins", user.getIns());

		this.addFieldError("updateSuccess", "修改成功!");			
		return "success";
	}
	
	public String updatePhoto() throws Exception {

		String path = ServletActionContext.getServletContext().getRealPath("/images/");
		File dest = new File(path,photoFileName);
		FileUtils.copyFile(photo, dest);
		user.setPhoto("images/" + getPhotoFileName());
		
		String username=(String) request.getSession(true).getAttribute("username");
		userService.updatePhoto(username,user.getPhoto());
		session.put("photo", user.getPhoto());
		this.addFieldError("updateSuccess", "修改成功!");			
		return "success";
	}


	public String updatePwd() throws Exception {
		String password=(String) request.getSession(true).getAttribute("password");
		String username=(String) request.getSession(true).getAttribute("username");
		
		if(oldPwd.equals("")){
			this.addFieldError("oldPwdError", "请输入登录密码！");
			return "input";
		}else{
			if(newPwd.equals("") && oldPwd.equals("")){
				this.addFieldError("newPwdError", "请输入更改后的密码！");
				return "input";
			}else{
				if(!password.equals(oldPwd) ){
					this.addFieldError("oldPwdError", "填写密码不正确！");
					return "input";
				}
				if(!newPwd.equals(newPwd2)){
					this.addFieldError("newPwd2Error", "两次输入密码不一致！");
					return "input";
				}
			}
		}			

		userService.updatePwd(username,newPwd);
		session.put("password", newPwd);
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


	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getNewPwd2() {
		return newPwd2;
	}

	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {

		
	}

}
