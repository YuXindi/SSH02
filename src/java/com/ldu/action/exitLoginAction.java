package com.ldu.action;

import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("exitLoginAction")
@Scope("prototype")
public class exitLoginAction extends ActionSupport implements SessionAware {

	private Map<String,Object> session;

	public String execute() throws Exception {
		ServletActionContext.getRequest().getSession().removeAttribute("username");
		ServletActionContext.getRequest().getSession().removeAttribute("photo");
		ServletActionContext.getRequest().getSession().removeAttribute("likeList");
		return "success";		
	}
	
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session=session;
	}
}
