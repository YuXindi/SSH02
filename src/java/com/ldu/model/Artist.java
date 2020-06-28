package com.ldu.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Artist {
    private String username;
    private String artname;
    private String company;
    private String identity;
    private String style;
    private String artins;
    private String artphoto;

    public Artist() {
    }

    public Artist(String username, String artname, String company, String identity, String style, String artins, String artphoto) {
        this.username = username;
        this.artname = artname;
        this.company = company;
        this.identity = identity;
        this.style = style;
        this.artins = artins;
        this.artphoto = artphoto;
    }

    @Id
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
    @Column(name = "company")
    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    @Basic
    @Column(name = "identity")
    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    @Basic
    @Column(name = "style")
    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    @Basic
    @Column(name = "artins")
    public String getArtins() {
        return artins;
    }

    public void setArtins(String artins) {
        this.artins = artins;
    }

    @Basic
    @Column(name = "artphoto")
    public String getArtphoto() {
        return artphoto;
    }

    public void setArtphoto(String artphoto) {
        this.artphoto = artphoto;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Artist artist = (Artist) o;

        if (username != null ? !username.equals(artist.username) : artist.username != null) return false;
        if (artname != null ? !artname.equals(artist.artname) : artist.artname != null) return false;
        if (company != null ? !company.equals(artist.company) : artist.company != null) return false;
        if (identity != null ? !identity.equals(artist.identity) : artist.identity != null) return false;
        if (style != null ? !style.equals(artist.style) : artist.style != null) return false;
        if (artins != null ? !artins.equals(artist.artins) : artist.artins != null) return false;
        if (artphoto != null ? !artphoto.equals(artist.artphoto) : artist.artphoto != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (artname != null ? artname.hashCode() : 0);
        result = 31 * result + (company != null ? company.hashCode() : 0);
        result = 31 * result + (identity != null ? identity.hashCode() : 0);
        result = 31 * result + (style != null ? style.hashCode() : 0);
        result = 31 * result + (artins != null ? artins.hashCode() : 0);
        result = 31 * result + (artphoto != null ? artphoto.hashCode() : 0);
        return result;
    }
}
