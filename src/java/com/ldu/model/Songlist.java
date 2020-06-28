package com.ldu.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Songlist {
    private int id;
    private String listName;
    private String cover;
    private String introdu;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "list_name")
    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    @Basic
    @Column(name = "cover")
    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    @Basic
    @Column(name = "introdu")
    public String getIntrodu() {
        return introdu;
    }

    public void setIntrodu(String introdu) {
        this.introdu = introdu;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Songlist songlist = (Songlist) o;

        if (id != songlist.id) return false;
        if (listName != null ? !listName.equals(songlist.listName) : songlist.listName != null) return false;
        if (cover != null ? !cover.equals(songlist.cover) : songlist.cover != null) return false;
        if (introdu != null ? !introdu.equals(songlist.introdu) : songlist.introdu != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (listName != null ? listName.hashCode() : 0);
        result = 31 * result + (cover != null ? cover.hashCode() : 0);
        result = 31 * result + (introdu != null ? introdu.hashCode() : 0);
        return result;
    }
}
