package com.ldu.service.impl;
import com.ldu.dao.SonglistDao;
import com.ldu.model.MySonglist;
import com.ldu.model.Songlist;
import com.ldu.service.SonglistService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("songlistService")
public class SonglistServiceImpl implements SonglistService {
    @Resource
    private SonglistDao songlistDao;

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<String> getMySonglist(String username) {
        return songlistDao.getMySonglist(username);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void deleteMySonglist(String username, String songlistname) {
        songlistDao.deleteMySonglist(username,songlistname);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Songlist getSonglistInfo(String songlistname) {
        return songlistDao.getSonglistInfo(songlistname);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void insertFavoriteSL(MySonglist mySonglist) {
        songlistDao.insertFavoriteSL(mySonglist);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Boolean isMySonglist(String username, String songlistname) {
        return songlistDao.isMySonglist(username, songlistname);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Songlist> getAllSonglist() {
        return songlistDao.getAllSonglist();
    }
}
