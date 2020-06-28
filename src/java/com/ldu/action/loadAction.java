package com.ldu.action;

import com.ldu.model.Artist;
import com.ldu.model.Songlist;
import com.ldu.service.ArtistService;
import com.ldu.service.SongService;
import com.ldu.service.SonglistService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller("loadAction")
@Scope("prototype")
public class loadAction extends ActionSupport implements SessionAware {
    @Resource
    private SonglistService songlistService;
    @Resource
    private ArtistService artistService;
    @Resource
    private SongService songService;

    private Map<String,Object> session;

    public String getAllSonglist() throws Exception {
        List<Songlist> sll = songlistService.getAllSonglist();
        session.put("allSonglist",sll);
        return "success";
    }
    public String getAllArtist() throws Exception {
        List<Artist> artistList = artistService.getAllArtist();
        session.put("allArtist",artistList);
        return "success";
    }




    public Map<String, Object> getSession() {
        return session;
    }
    public void setSession(Map<String,Object> session){
        this.session=session;
    }
}
