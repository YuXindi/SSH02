package com.ldu.dao;

import com.ldu.model.Artist;
import com.ldu.model.ArtistWork;

import java.util.List;

public interface ArtistDao {
    Artist getArtistInfo(String username);
    Artist getArtistInfoByArtname(String artname);
    void saveArtist(Artist artist);
    void saveArtistWork(ArtistWork artistWork);
    List<Artist> getAllArtist();
}
