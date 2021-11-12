/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.ci2.ppw.model.UserInfo;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author wilderlizama
 */
public class UserInfoMapper implements RowMapper<UserInfo> {
    
    @Override
    public UserInfo mapRow(ResultSet rs, int rowNum) throws SQLException {

        String userName = rs.getString("nombre_usuario");
        String password = rs.getString("contrasenha");

        return new UserInfo(userName, password);
    }
}
