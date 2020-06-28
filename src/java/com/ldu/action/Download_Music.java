package com.ldu.action;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("Download_Music")
@Scope("prototype")
public class Download_Music extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	HttpServletRequest request = ServletActionContext.getRequest();
	
	private String name=(String) request.getParameter("songname");//2
	
	private String filePath=(String) request.getParameter("filePath");//1
	
	//文件名 1+2+.mp3
	private String FileName=(String) request.getParameter("FileName");
	
	private String flag=(String) request.getParameter("flag");
	
	public String execute() throws Exception{
		
		if(flag != null){
			     
				 FileName="青春不散场 毕业是没有再见的骊歌.zip";
			     String path = ServletActionContext.getServletContext().getRealPath("/music/青春不散场 毕业是没有再见的骊歌.zip");
			     inputStream = new FileInputStream(new File(path));
			     
			     return "success";
		}else{
		
		 name=name.trim();
	        String path = ServletActionContext.getServletContext().getRealPath(filePath+name+".mp3");
	        inputStream = new FileInputStream(new File(path));
	      
	        return "success";
		}
	}

    public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getFileName() {
		try {
			return URLEncoder.encode(FileName,"utf-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
			return "music.mp3";
		}
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}
	
	
}

