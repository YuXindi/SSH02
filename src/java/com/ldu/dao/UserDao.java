package com.ldu.dao;

import com.ldu.model.User;

public interface UserDao {
    boolean selectUserByNameAndPwd(String username, String password);
    User getUserInfo(String username);
    void updateInfo(String username,String phone,String email,String ins);
    void updatePwd(String username, String password);
    void updatePhoto(String username, String photo);
    void saveUser(User user);
    void updateIsartist(String username, Integer isartist);
}
