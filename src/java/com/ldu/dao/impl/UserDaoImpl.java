package com.ldu.dao.impl;
import com.ldu.dao.UserDao;
import com.ldu.model.User;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public boolean selectUserByNameAndPwd(String username, String password) {
        String hql = "from User where username=?1 and password=?2";
        boolean flag = false;
        if(sessionFactory.getCurrentSession().createQuery(hql).setParameter(1, username).setParameter(2, password).uniqueResult()!=null) {
            flag = true;
        }
        return flag;
    }

    @Override
    public User getUserInfo(String username) {
        String hql = "from User where username = ?1";
        User u1 = (User) sessionFactory.getCurrentSession().createQuery(hql).setParameter(1,username).uniqueResult();
        return u1;
    }

    @Override
    public void updateInfo(String username,String phone,String email,String ins) {
        String hql = "update User set phone=?1,email=?2,ins=?3 where username=?4";
        sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(1,phone).setParameter(2,email)
                .setParameter(3,ins).setParameter(4,username).executeUpdate();
    }

    @Override
    public void updatePwd(String username, String password) {
        String hql = "update User set password=?1 where username=?2";
        sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(1,password).setParameter(2,username).executeUpdate();
    }

    @Override
    public void updatePhoto(String username, String photo) {
        String hql = "update User set photo=?1 where username=?2";
        sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(1,photo).setParameter(2,username).executeUpdate();
    }

    @Override
    public void saveUser(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public void updateIsartist(String username, Integer isartist) {
        String hql = "update User set isartist=?1 where username=?2";
        sessionFactory.getCurrentSession().createQuery(hql)
                .setParameter(1,isartist).setParameter(2,username).executeUpdate();
    }

}
