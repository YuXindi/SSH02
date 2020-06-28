package com.ldu.model;

import javax.persistence.*;

@Entity
@Table(name = "artist_work", schema = "qtmusic", catalog = "")
public class ArtistWork {
    private int id;
    private String username;
    private String artname;
    private String songname;

    public ArtistWork() {
    }

    public ArtistWork(String username, String artname, String songname) {
        this.username = username;
        this.artname = artname;
        this.songname = songname;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "artname")
    public String getArtname() {
        return artname;
    }

    public void setArtname(String artname) {
        this.artname = artname;
    }

    @Basic
    @Column(name = "songname")
    public String getSongname() {
        return songname;
    }

    public void setSongname(String songname) {
        this.songname = songname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ArtistWork that = (ArtistWork) o;

        if (id != that.id) return false;
        if (username != null ? !username.equals(that.username) : that.username != null) return false;
        if (artname != null ? !artname.equals(that.artname) : that.artname != null) return false;
        if (songname != null ? !songname.equals(that.songname) : that.songname != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (artname != null ? artname.hashCode() : 0);
        result = 31 * result + (songname != null ? songname.hashCode() : 0);
        return result;
    }
}
