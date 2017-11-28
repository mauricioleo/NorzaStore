/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import conexion.baseDatos;
import entidades.articulo;
import entidades.detalleventa;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Theo
 */
public class metodosDetalleVenta {
    
    public static boolean metodoAgregarDetalleVenta(detalleventa det){
       baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO detalleventa ")
                 .append(" ( ")
                 .append(" idDetalle, ")
                 .append(" cantidad, ")
                 .append(" precio, ")
                 .append(" idVenta, ")
                 .append(" idProducto, ")
                 .append(" stock) VALUES( ")
                 .append("'").append(det.getIdDetalle()).append("' , ")
                 .append("'").append(det.getCantidad()).append("' , ")
                 .append("'").append(det.getPrecio()).append("' , ")
                 .append("'").append(det.getIdVenta()).append("' , ")
                 .append("'").append(det.getIdProducto()).append("' , ")
                 .append(")")
                    ;
            
                resultado = bd.ejecutarComando(query.toString());
                
        } catch (Exception e) {
            resultado = false;
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return resultado;
}
    //Editar Articulos
    
    public boolean editarDetalleVenta(detalleventa a){
        baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" UPDATE  detalleVenta  ")
                    .append("SET  ")
                        .append("idDetalle= '").append(a.getIdDetalle()).append("',  ")
                        .append(" cantidad  = '").append(a.getCantidad()).append("',  ")
                        .append(" precio  = '").append(a.getPrecio()).append("',  ")
                        .append(" idVenta  = '").append(a.getIdVenta()).append("',  ")
                        .append(" idProducto = ").append(a.getIdProducto()).append(",  ")
                        
                    .append("WHERE  id  = ").append(a.getIdDetalle())
                    ;
          
                resultado = bd.ejecutarComando(query.toString());
                
        } catch (Exception e) {
            resultado = false;
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return resultado;
    }
    
    //Eliminar articulo
    
     public boolean eliminarDetalleVenta(int id){
         baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" DELETE FROM detalleVenta WHERE id = ").append(id)
                    ;
    
                resultado = bd.ejecutarComando(query.toString());
                
        } catch (Exception e) {
            resultado = false;
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
                
        return resultado;
    }
    
    //Obtener articulos
     public List<detalleventa> obtenerDetalleVenta(){
         baseDatos bd = new baseDatos();
        List<detalleventa> detalleventa = new ArrayList();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM detalleVenta ")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            while(datos.next()){
                detalleventa a = new detalleventa();
                
                a.setIdDetalle(datos.getInt("idDetalle"));
                a.setCantidad(datos.getInt("cantidad"));
                a.setPrecio(datos.getDouble("precio"));
                a.setIdVenta(datos.getInt("idVenta"));
                a.setIdProducto(datos.getInt("idProducto"));
                
                
                detalleventa.add(a);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return detalleventa;
    }
    
    
    
  
 }
