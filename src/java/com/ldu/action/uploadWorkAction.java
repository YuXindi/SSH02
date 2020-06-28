package com.ldu.action;
import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import com.ldu.model.ArtistWork;
import com.ldu.model.Song;
import com.ldu.service.ArtistService;
import com.ldu.service.SongService;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("uploadWorkAction")
@Scope("prototype")
public class uploadWorkAction extends ActionSupport implements SessionAware {
	@Resource
	private SongService songService;
	@Resource
	private ArtistService artistService;

	private Song sl = new Song();
	private File uploadSong;
    private String uploadSongFileName;
    private String uploadSongContentType;

	private Map<String,Object> session;
	HttpServletRequest request = ServletActionContext.getRequest();

	public String execute() throws Exception {
		String path = ServletActionContext.getServletContext().getRealPath("/music/");
		File dest = new File(path,uploadSongFileName);
		FileUtils.copyFile(uploadSong, dest);
		sl.setPath("/music/");
		String username=(String) request.getSession(true).getAttribute("username");
		String artname=(String) request.getSession(true).getAttribute("artname");
		Song s1 = new Song(sl.getName(),sl.getLenTime(),artname,sl.getAlbum(),sl.getPath());
		songService.saveSong(s1);
		ArtistWork artistWork1 = new ArtistWork(username,artname,sl.getName());
		artistService.saveArtistWork(artistWork1);
		return "success";
	}

	public Song getSl() {
		return sl;
	}

	public void setSl(Song sl) {
		this.sl = sl;
	}

	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String,Object> session){
		this.session=session;
	}

	public File getUploadSong() {
		return uploadSong;
	}
	public void setUploadSong(File uploadSong) {
		this.uploadSong = uploadSong;
	}

	public String getUploadSongFileName() {
		return uploadSongFileName;
	}
	public void setUploadSongFileName(String uploadSongFileName) {
		this.uploadSongFileName = uploadSongFileName;
	}

	public String getUploadSongContentType() {
		return uploadSongContentType;
	}
	public void setUploadSongContentType(String uploadSongContentType) {
		this.uploadSongContentType = uploadSongContentType;
	}
	
}
