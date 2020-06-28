package com.ldu.dao;

import com.ldu.model.MySonglist;
import com.ldu.model.Songlist;

import java.util.List;

public interface SonglistDao {
    List<String> getMySonglist(String username);
    void deleteMySonglist(String username, String songlistname);
    Songlist getSonglistInfo(String songlistname);
    void insertFavoriteSL(MySonglist mySonglist);
    Boolean isMySonglist(String username, String songlistname);
    List<Songlist> getAllSonglist();
}
