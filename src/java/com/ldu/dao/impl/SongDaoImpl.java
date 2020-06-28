package com.ldu.dao.impl;

import com.ldu.dao.SongDao;
import com.ldu.model.MyHistory;
import com.ldu.model.MyLike;
import com.ldu.model.Song;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("songDao")
public class SongDaoImpl implements SongDao {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public List<Song> getMyHistory(String username) {
        String hql = "select new Song(s.name,s.lenTime,s.singer,s.album,s.path) from MyHistory m,Song s where m.history=s.name and m.username=?1";
        List<Song> mySong = sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).list();
        return mySong;
    }
    @Override
    public List<Song> getMyLike(String username) {
        String hql = "select new Song(s.name,s.lenTime,s.singer,s.album,s.path) from MyLike m,Song s where m.song=s.name and m.username=?1";
        List<Song> myLike = sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).list();
        return myLike;
    }

    @Override
    public void deleteMyHistory(String username, String history) {
        String hql = "from MyHistory where username=?1 and history=?2";
        MyHistory myHistory = (MyHistory) sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).setParameter(2,history).uniqueResult();
        sessionFactory.getCurrentSession().delete(myHistory);
    }

    @Override
    public void deleteMyLike(String username, String like) {
        String hql = "from MyLike where username=?1 and song=?2";
        MyLike myLike = (MyLike) sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).setParameter(2,like).uniqueResult();
        sessionFactory.getCurrentSession().delete(myLike);
    }

    @Override
    public List<Song> getSongBySL(String songlistname) {
        String hql = "select new Song(s.name,s.lenTime,s.singer,s.album,s.path) from Song s where s.songlistname=?1";
        List<Song> songs = sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,songlistname).list();
        return songs;
    }

    @Override
    public void insertFavoriteSong(MyLike myLike) {
        sessionFactory.getCurrentSession().save(myLike);
    }

    @Override
    public Boolean isMylike(String username, String like) {
        String hql = "from MyLike where username=?1 and song=?2";
        boolean flag = false;
        if(sessionFactory.getCurrentSession().createQuery(hql).setParameter(1, username).setParameter(2, like).uniqueResult()!=null) {
            flag = true;
        }
        return flag;
    }

    @Override
    public void insertRecentSong(MyHistory myHistory) {
        sessionFactory.getCurrentSession().save(myHistory);
    }

    @Override
    public Boolean isMyHistory(String username, String history) {
        String hql = "from MyHistory where username=?1 and history=?2";
        boolean flag = false;
        if(sessionFactory.getCurrentSession().createQuery(hql).setParameter(1, username).setParameter(2, history).uniqueResult()!=null) {
            flag = true;
        }
        return flag;
    }

    @Override
    public List<Song> getSongByKeyname(String keyname) {
        String hql = "select new Song(s.name,s.lenTime,s.singer,s.album,s.path) from Song s where s.name like :tname";
        List<Song> songs = sessionFactory.getCurrentSession().createQuery(hql).setParameter("tname",keyname).list();
        return songs;
    }

    @Override
    public List<Song> getSongBySinger(String singer) {
        String hql = "select new Song(s.name,s.lenTime,s.singer,s.album,s.path) from Song s where s.singer=?1";
        List<Song> songs = sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,singer).list();
        return songs;
    }

    @Override
    public List<Song> getSongByUsername(String username) {
        String hql = "select new Song(s.name,s.lenTime,s.singer,s.album,s.path) from ArtistWork a, Song s where a.songname=s.name and a.username=?1";
        List<Song> songs = sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).list();
        return songs;
    }

    @Override
    public void saveSong(Song song) {
        sessionFactory.getCurrentSession().save(song);
    }


}
