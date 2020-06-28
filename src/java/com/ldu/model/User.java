package com.ldu.model;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {
    private String username;
    private String password;
    private String phone;
    private String email;
    private String photo;
    private String ins;
    private Integer isartist;

    public User() {
    }

    public User(String username, String password, String phone, String email, String photo, String ins, Integer isartist) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.photo = photo;
        this.ins = ins;
        this.isartist = isartist;
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
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "photo")
    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Basic
    @Column(name = "ins")
    public String getIns() {
        return ins;
    }

    public void setIns(String ins) {
        this.ins = ins;
    }

    @Basic
    @Column(name = "isartist")
    public Integer getIsartist() {
        return isartist;
    }

    public void setIsartist(Integer isartist) {
        this.isartist = isartist;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        if (phone != null ? !phone.equals(user.phone) : user.phone != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (photo != null ? !photo.equals(user.photo) : user.photo != null) return false;
        if (ins != null ? !ins.equals(user.ins) : user.ins != null) return false;
        if (isartist != null ? !isartist.equals(user.isartist) : user.isartist != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (photo != null ? photo.hashCode() : 0);
        result = 31 * result + (ins != null ? ins.hashCode() : 0);
        result = 31 * result + (isartist != null ? isartist.hashCode() : 0);
        return result;
    }
}
