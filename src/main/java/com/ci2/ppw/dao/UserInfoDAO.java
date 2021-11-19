/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.dao;

import com.ci2.ppw.model.UserInfo;
import java.util.List;

/**
 *
 * @author wilderlizama
 */
public interface UserInfoDAO {
    public UserInfo findUserInfo(String userName);
    
    // [USER,AMIN,..]
    public List<String> getUserRoles(String userName);
}
