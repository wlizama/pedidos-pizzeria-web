/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JoseGaGu
 */
public class Accesso {
        
    Connection con;
    /**Conexion cn=new Conexion();**/
    Database db = new Database();
    String sql="";
    PreparedStatement pst;
    ResultSet rs;
    int r=0;
    
    public Accesso(){
    }
    
    public int validar2(String usuario, String contra){
        int nivel =0;
        try {
            Class.forName(db.getDriver());
            con=DriverManager.getConnection(db.getUrl(),db.getUser(),db.getContra());
            sql="Select 1 from usuario where nombre_usuario='"+usuario+"'and contrasenha ='"+contra+"'";
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                nivel=rs.getInt(1);
            }
            con.close();
            rs.close();
            return nivel;
        } catch (SQLException | ClassNotFoundException e) {
            return nivel;
        }
    }
}
