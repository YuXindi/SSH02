package com.ldu.service.impl;

import com.ldu.dao.ArtistDao;
import com.ldu.model.Artist;
import com.ldu.model.ArtistWork;
import com.ldu.service.ArtistService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service("artistService")
public class ArtistServiceImpl implements ArtistService {
    @Resource
    private ArtistDao artistDao;

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Artist getArtistInfo(String username) {
        return artistDao.getArtistInfo(username);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public Artist getArtistInfoByArtname(String artname) {
        return artistDao.getArtistInfoByArtname(artname);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void saveArtist(Artist artist) {
        artistDao.saveArtist(artist);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void saveArtistWork(ArtistWork artistWork) {
        artistDao.saveArtistWork(artistWork);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public List<Artist> getAllArtist() {
        return artistDao.getAllArtist();
    }
}
