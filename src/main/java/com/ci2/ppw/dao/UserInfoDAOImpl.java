/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.mapper.UserInfoMapper;
import com.ci2.ppw.model.UserInfo;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author wilderlizama
 */
@Service
@Transactional
public class UserInfoDAOImpl extends JdbcDaoSupport implements UserInfoDAO {
    @Autowired
    public UserInfoDAOImpl(DataSource dataSource) {
        this.setDataSource(dataSource);
    }

    @Override
    public UserInfo findUserInfo(String userName) {
        String sql = "select u.nombre_usuario, u.contrasenha from usuario u "
                   + "where u.nombre_usuario = ?";

        Object[] params = new Object[]{userName};
        UserInfoMapper mapper = new UserInfoMapper();
        try {
            UserInfo userInfo = this.getJdbcTemplate().queryForObject(sql, params, mapper);
            return userInfo;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public List<String> getUserRoles(String userName) {
        String sql = "select r.nombre "
                   + "from roles r join usuario u on r.IdRol = u.IdRol "
                   + "where u.nombre_usuario = ?";

        Object[] params = new Object[]{userName};

        List<String> roles = this.getJdbcTemplate().queryForList(sql, params, String.class);

        return roles;
    }
}
