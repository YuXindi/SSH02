package com.ldu.dao.impl;

import com.ldu.dao.SonglistDao;
import com.ldu.model.MySonglist;
import com.ldu.model.Songlist;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.management.Query;
import java.util.List;

@Repository("songlistDao")
public class SonglistDaoImpl implements SonglistDao {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public List<String> getMySonglist(String username) {
        String hql = "select songlistname from MySonglist where username=?1";
        List<String> mySonglist = sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).list();
        return mySonglist;
    }

    @Override
    public void deleteMySonglist(String username, String songlistname) {
        String hql = "from MySonglist where username=?1 and songlistname=?2";
        MySonglist mySonglist = (MySonglist) sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).setParameter(2,songlistname).uniqueResult();
        sessionFactory.getCurrentSession().delete(mySonglist);
    }

    @Override
    public Songlist getSonglistInfo(String songlistname) {
        String hql = "from Songlist where listName=?1";
        Songlist sl = (Songlist)sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,songlistname).uniqueResult();
        return sl;
    }

    @Override
    public void insertFavoriteSL(MySonglist mySonglist) {
        sessionFactory.getCurrentSession().save(mySonglist);
    }

    @Override
    public Boolean isMySonglist(String username, String songlistname) {
        String hql = "from MySonglist where username=?1 and songlistname=?2";
        boolean flag = false;
        if(sessionFactory.getCurrentSession().createQuery(hql).setParameter(1, username).setParameter(2, songlistname).uniqueResult()!=null) {
            flag = true;
        }
        return flag;
    }

    @Override
    public List<Songlist> getAllSonglist() {
        String hql = "from Songlist";
        List<Songlist> sl = sessionFactory.getCurrentSession().createQuery(hql).list();
        return sl;
    }
}
