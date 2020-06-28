package com.ldu.model;

import javax.persistence.*;

@Entity
@Table(name = "my_songlist", schema = "qtmusic", catalog = "")
public class MySonglist {
    private int id;
    private String username;
    private String songlistname;

    public MySonglist() {
    }

    public MySonglist(String username, String songlistname) {
        this.username = username;
        this.songlistname = songlistname;
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
    @Column(name = "songlistname")
    public String getSonglistname() {
        return songlistname;
    }

    public void setSonglistname(String songlistname) {
        this.songlistname = songlistname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MySonglist that = (MySonglist) o;

        if (id != that.id) return false;
        if (username != null ? !username.equals(that.username) : that.username != null) return false;
        if (songlistname != null ? !songlistname.equals(that.songlistname) : that.songlistname != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (songlistname != null ? songlistname.hashCode() : 0);
        return result;
    }
}
