package com.ldu.model;

import javax.persistence.*;

@Entity
@Table(name = "song", schema = "qtmusic", catalog = "")
public class Song {
    private int no;
    private String name;
    private String lenTime;
    private String singer;
    private String album;
    private String songlistname;
    private String path;

    public Song() {
    }

    public Song(String name) {
        this.name = name;
    }

    public Song(String name, String lenTime, String singer, String album, String path) {
        this.name = name;
        this.lenTime = lenTime;
        this.singer = singer;
        this.album = album;
        this.path = path;
    }

    @Id
    @Column(name = "no")
    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "len_time")
    public String getLenTime() {
        return lenTime;
    }

    public void setLenTime(String lenTime) {
        this.lenTime = lenTime;
    }

    @Basic
    @Column(name = "singer")
    public String getSinger() {
        return singer;
    }

    public void setSinger(String singer) {
        this.singer = singer;
    }

    @Basic
    @Column(name = "album")
    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    @Basic
    @Column(name = "songlistname")
    public String getSonglistname() {
        return songlistname;
    }

    public void setSonglistname(String songlistname) {
        this.songlistname = songlistname;
    }

    @Basic
    @Column(name = "path")
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Song song = (Song) o;

        //if (no != song.no) return false;
        if (name != null ? !name.equals(song.name) : song.name != null) return false;
        /*if (lenTime != null ? !lenTime.equals(song.lenTime) : song.lenTime != null) return false;
        if (singer != null ? !singer.equals(song.singer) : song.singer != null) return false;
        if (album != null ? !album.equals(song.album) : song.album != null) return false;
        if (songlistname != null ? !songlistname.equals(song.songlistname) : song.songlistname != null)
            return false;
        if (path != null ? !path.equals(song.path) : song.path != null) return false;*/

        return true;
    }

    @Override
    public int hashCode() {
        int result = no;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (lenTime != null ? lenTime.hashCode() : 0);
        result = 31 * result + (singer != null ? singer.hashCode() : 0);
        result = 31 * result + (album != null ? album.hashCode() : 0);
        result = 31 * result + (songlistname != null ? songlistname.hashCode() : 0);
        result = 31 * result + (path != null ? path.hashCode() : 0);
        return result;
    }
}
