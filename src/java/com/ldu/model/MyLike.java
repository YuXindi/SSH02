package com.ldu.model;

import javax.persistence.*;

@Entity
@Table(name = "my_like", schema = "qtmusic", catalog = "")
public class MyLike {
    private int id;
    private String username;
    private String song;

    public MyLike() {
    }

    public MyLike(String username, String song) {
        this.username = username;
        this.song = song;
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
    @Column(name = "song")
    public String getSong() {
        return song;
    }

    public void setSong(String song) {
        this.song = song;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MyLike myLike = (MyLike) o;

        if (id != myLike.id) return false;
        if (username != null ? !username.equals(myLike.username) : myLike.username != null) return false;
        if (song != null ? !song.equals(myLike.song) : myLike.song != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (song != null ? song.hashCode() : 0);
        return result;
    }
}
