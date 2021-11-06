/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

/**
 *
 * @author JoseGaGu
 */
public class Database {
    String url;
    String user;
    String contra;
    String driver;

    public Database() {
        this.url = "jdbc:mysql://localhost:3306/pedidos-pizzeria-web";
        this.user = "root";
        this.contra = "";
        this.driver = "com.mysql.cj.jdbc.Driver";
    }

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public String getContra() {
        return contra;
    }

    public String getDriver() {
        return driver;
    }
    
}
