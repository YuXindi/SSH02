package com.ldu.service.impl;

import com.ldu.dao.SongDao;
import com.ldu.model.MyHistory;
import com.ldu.model.MyLike;
import com.ldu.model.Song;
import com.ldu.service.SongService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("songService")
public class SongServiceImpl implements SongService {
    @Resource
    private SongDao songDao;

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Song> getMyHistory(String username) {
        return songDao.getMyHistory(username);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Song> getMyLike(String username) {
        return songDao.getMyLike(username);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void deleteMyHistory(String username, String history) {
        songDao.deleteMyHistory(username, history);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void deleteMyLike(String username, String like) {
        songDao.deleteMyLike(username, like);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Song> getSongBySL(String songlistname) {
        return songDao.getSongBySL(songlistname);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void insertFavoriteSong(MyLike myLike) {
        songDao.insertFavoriteSong(myLike);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Boolean isMylike(String username, String like) {
        return songDao.isMylike(username, like);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void insertRecentSong(MyHistory myHistory) {
        songDao.insertRecentSong(myHistory);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Boolean isMyHistory(String username, String history) {
        return songDao.isMyHistory(username, history);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Song> getSongByKeyname(String keyname) {
        return songDao.getSongByKeyname(keyname);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Song> getSongBySinger(String singer) {
        return songDao.getSongBySinger(singer);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Song> getSongByUsername(String username) {
        return songDao.getSongByUsername(username);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void saveSong(Song song) {
        songDao.saveSong(song);
    }
}
