/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import conexion.baseDatos;
import entidades.articulo;
import entidades.venta;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Theo
 */
public class metodosVenta {
    
    public static boolean metodoAgregarVenta(venta ven){
       baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO venta ")
                 .append(" ( ")
                 .append(" IdVenta, ")
                 .append(" fecha, ")
                 .append(" estado, ")
                 .append(" idVendedor, ")
                 .append(" idCliente, ")
                 .append(" idSucursal, ")
                 .append(" stock) VALUES( ")
                 .append("'").append(ven.getIdVenta()).append("' , ")
                 .append("'").append(ven.getFecha()).append("' , ")
                 .append("'").append(ven.getEstado()).append("' , ")
                 .append("'").append(ven.getIdVendedor()).append("' , ")
                 .append("'").append(ven.getIdCliente()).append("' , ")
                 .append("'").append(ven.getIdSucursal()).append("' , ")
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
    
    public boolean editarVenta(venta v){
        baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" UPDATE  articulo  ")
                    .append("SET  ")
                        .append("idVenta= '").append(v.getIdVenta()).append("',  ")
                        .append("fecha= '").append(v.getFecha()).append("',  ")
                        .append("estado= '").append(v.getEstado()).append("',  ")
                        .append("idVendedor= '").append(v.getIdVendedor()).append("',  ")
                           .append("idCliente= '").append(v.getIdCliente()).append("',  ")
                        .append("idSucursal= '").append(v.getIdSucursal()).append("',  ")
                    .append("WHERE  id  = ").append(v.getIdVenta())
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
    
     public boolean eliminarVenta(int id){
         baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" DELETE FROM articulo WHERE id = ").append(id)
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
     public List<venta> obtenerVentas(){
         baseDatos bd = new baseDatos();
        List<venta> ventas = new ArrayList();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM articulo ")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            while(datos.next()){
                venta v = new venta();
                
                v.setIdVenta(datos.getInt("idVenta"));
                v.setFecha(datos.getString("fecha"));
                v.setEstado(datos.getString("nombre"));
                v.setIdVendedor(datos.getInt("idVendedor"));
                v.setIdCliente(datos.getInt("idCliente"));
                v.setIdSucursal(datos.getInt("idSucursal"));
      
                
                ventas.add(v);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return ventas;
    }
    
    
    
    //main hardcoded
    
  
}
