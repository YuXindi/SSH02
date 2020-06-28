package com.ldu.service;
import com.ldu.model.MyHistory;
import com.ldu.model.MyLike;
import com.ldu.model.Song;
import java.util.List;

public interface SongService {
    List<Song> getMyHistory(String username);
    List<Song> getMyLike(String username);
    void deleteMyHistory(String username, String history);
    void deleteMyLike(String username, String like);
    List<Song> getSongBySL(String songlistname);
    void insertFavoriteSong(MyLike myLike);
    Boolean isMylike(String username, String like);
    void insertRecentSong(MyHistory myHistory);
    Boolean isMyHistory(String username, String history);
    List<Song> getSongByKeyname(String keyname);
    List<Song> getSongBySinger(String singer);
    List<Song> getSongByUsername(String username);
    void saveSong(Song song);
}
