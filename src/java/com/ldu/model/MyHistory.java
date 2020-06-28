package com.ldu.model;

import javax.persistence.*;

@Entity
@Table(name = "my_history", schema = "qtmusic", catalog = "")
public class MyHistory {
    private int id;
    private String username;
    private String history;

    public MyHistory() {
    }

    public MyHistory(String username, String history) {
        this.username = username;
        this.history = history;
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
    @Column(name = "history")
    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        MyHistory myHistory = (MyHistory) o;

        if (id != myHistory.id) return false;
        if (username != null ? !username.equals(myHistory.username) : myHistory.username != null) return false;
        if (history != null ? !history.equals(myHistory.history) : myHistory.history != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (history != null ? history.hashCode() : 0);
        return result;
    }
}
