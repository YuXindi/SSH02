package com.ldu.dao.impl;

import com.ldu.dao.ArtistDao;
import com.ldu.model.Artist;
import com.ldu.model.ArtistWork;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("artistDao")
public class ArtistDaoImpl implements ArtistDao {

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public Artist getArtistInfo(String username) {
        String hql = "from Artist where username = ?1";
        Artist u1 = (Artist) sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).uniqueResult();
        return u1;
    }

    @Override
    public Artist getArtistInfoByArtname(String artname) {
        String hql = "from Artist where artname = ?1";
        Artist u1 = (Artist) sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,artname).uniqueResult();
        return u1;
    }

    @Override
    public void saveArtist(Artist artist) {
        sessionFactory.getCurrentSession().save(artist);
    }

    @Override
    public void saveArtistWork(ArtistWork artistWork) {
        sessionFactory.getCurrentSession().save(artistWork);
    }

    @Override
    public List<Artist> getAllArtist() {
        String hql = "from Artist";
        List<Artist> artistList = sessionFactory.getCurrentSession().createQuery(hql).list();
        return artistList;
    }
}
