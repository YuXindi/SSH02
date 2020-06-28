package com.ldu.service;

import com.ldu.model.User;

public interface UserService {
    boolean selectUserByNameAndPwd(String username, String password);
    User getUserInfo(String username);
    void updateInfo(String username,String phone,String email,String ins);
    void updatePwd(String username, String password);
    void updatePhoto(String username, String photo);
    void saveUser(User user);
    void updateIsartist(String username, Integer isartist);
}
