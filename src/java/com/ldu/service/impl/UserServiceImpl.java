package com.ldu.service.impl;
import com.ldu.dao.UserDao;
import com.ldu.model.User;
import com.ldu.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public boolean selectUserByNameAndPwd(String username, String password) {
        return userDao.selectUserByNameAndPwd(username, password);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public User getUserInfo(String username) {
        return userDao.getUserInfo(username);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void updateInfo(String username, String phone, String email, String ins) {
        userDao.updateInfo(username,phone,email,ins);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void updatePwd(String username, String password) {
        userDao.updatePwd(username,password);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void updatePhoto(String username, String photo) {
        userDao.updatePhoto(username,photo);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Transactional(rollbackFor = {Exception.class,RuntimeException.class})
    public void updateIsartist(String username, Integer isartist) {
        userDao.updateIsartist(username,isartist);
    }


}
