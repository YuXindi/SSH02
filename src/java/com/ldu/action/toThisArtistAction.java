package com.ldu.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.ldu.model.Artist;
import com.ldu.model.Song;
import com.ldu.service.ArtistService;
import com.ldu.service.SongService;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("toThisArtistAction")
@Scope("prototype")
public class toThisArtistAction extends ActionSupport implements SessionAware, ServletRequestAware {
	@Resource
	private ArtistService artistService;
	@Resource
	private SongService songService;

	private Artist artist = new Artist();
	private Map<String,Object> session;
	private String artname;
		
	public String execute() throws Exception {

		System.out.println(artname);
		Artist a1 = artistService.getArtistInfoByArtname(artname);
		session.put("Artname1", a1.getArtname());
		session.put("Company1", a1.getCompany());
		session.put("Identity1", a1.getIdentity());
		session.put("Style1", a1.getStyle());
		session.put("Artins1", a1.getArtins());
		session.put("Artphoto1", a1.getArtphoto());

		List<Song> listA = songService.getSongBySinger(artname);
		session.put("listA", listA);
		
		return "success";		
	}

	
	public Artist getArtist() {
		return artist;
	}
	public void setArtist(Artist artist) {
		this.artist = artist;
	}


	
	public String getArtname() {
		return artname;
	}


	public void setArtname(String artname) {
		this.artname = artname;
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
