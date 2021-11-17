/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ci2.ppw.utils;

/**
 *
 * @author wilderlizama
 */
public class Constants {
    
    // Menus
    public static final int MPEDIDOS = 6;
    public static final int MDELIVERY = 7;
    public static final int MMANTENIMIENTO = 8;
    public static final int MREPORTES = 9;
    public static final int MSESSION = 10;
    
    // Roles
    public static final int RSUPER_USER = 5;
    
    // Tipo estado
    public static final int TEPEDIDO = 5;
    public static final int TENVIO = 6;
    public static final int TENVIO_DETALLE = 7;
    public static final int TUSUARIO = 8;
    public static final int TCOMPROBANTE = 9;
    public static final int TPRODUCTO = 10;
    public static final int TPIZZA = 11;
    
    // Estado
    public static final int EPEDIDO_REGISTRADO = 13;
    public static final int EPEDIDO_EN_PREPARACION = 14;
    public static final int EPEDIDO_PREPARADO = 15;
    public static final int EPEDIDO_EN_CAMINO = 16;
    public static final int EPEDIDO_ENTREGADO = 17;
    public static final int EPEDIDO_NO_ENTREGADO = 18;
    
    public static final int EENVIO_EN_CURSO = 19;
    public static final int EENVIO_FINALIZADO = 20;
    public static final int EENVIO_OBSERVADO = 21;
    
    public static final int EENVIODEALLE_REGISTRADO = 22;
    public static final int EENVIODEALLE_EN_CAMINO = 23;
    public static final int EENVIODEALLE_ENTREGADO = 24;
    public static final int EENVIODEALLE_NO_ENTREGADO = 25;
    
    public static final int EUSUARIO_ACTIVO = 26;
    public static final int EUSUARIO_INACTIVO = 27;
    
    public static final int ECOMPROBANTE_PENDIENTE = 28;
    public static final int ECOMPROBANTE_FINALIZADO = 29;
    
    public static final int EPRODUCTO_ANULADO = 30;
    public static final int EPRODUCTO_DISPONIBLE = 31;
    public static final int EPRODUCTO_NO_DISPONIBLE = 32;
    
    public static final int EPIZZA_ANULADO = 33;
    public static final int EPIZZA_DISPONIBLE = 34;
    public static final int EPIZZA_NO_DISPONIBLE = 35;
}
