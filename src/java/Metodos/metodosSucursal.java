/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import conexion.baseDatos;
import entidades.articulo;
import entidades.sucursal;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Theo
 */
public class metodosSucursal {
        List<articulo> articulos;
    
    public static boolean metodoAgregarSucursal(sucursal suc){
       baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO sucursal ")
                 .append(" ( ")
                 .append(" idSucursal, ")
                 .append(" nombre, ")
                 .append(" direccion, ")
                 .append(" stock) VALUES( ")
                 .append("'").append(suc.getIdSucursal()).append("' , ")
                 .append("'").append(suc.getNombre()).append("' , ")
                 .append("'").append(suc.getDireccion()).append("' , ")
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
    
    public boolean editarSucursal(sucursal s){
        baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" UPDATE  articulo  ")
                    .append("SET  ")
                        .append("idSucursal= '").append(s.getIdSucursal()).append("',  ")
                        .append(" nombre  = '").append(s.getNombre()).append("',  ")
                        .append(" direccion  = '").append(s.getDireccion()).append("',  ")
                        
                    .append("WHERE  id  = ").append(s.getIdSucursal())
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
    
     public boolean eliminarSucursal(int id){
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
     public List<sucursal> obtenerContactos(){
         baseDatos bd = new baseDatos();
        List<sucursal> sucursales = new ArrayList();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM articulo ")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            while(datos.next()){
                sucursal s = new sucursal();
                
                s.setIdSucursal(datos.getInt("IdSucursal"));
                s.setNombre(datos.getString("nombre"));
                s.setDireccion(datos.getString("direccion"));
                
                
                sucursales.add(s);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return sucursales;
    }
    
    
    
    //main hardcoded
    

    
}
