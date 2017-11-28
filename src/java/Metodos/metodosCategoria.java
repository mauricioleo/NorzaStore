/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import conexion.baseDatos;

import entidades.categoria;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Theo
 */
public class metodosCategoria {
    
    List<categoria> categoria;
    
    public static boolean metodoAgregarCategoria(categoria cat){
       baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO categoria ")
                 .append(" ( ")
                 .append(" nombre, ")
                 .append(" idCategoria, ")
                 .append(" stock) VALUES( ")
                 .append("'").append(cat.getNombre()).append("' , ")
                 .append("'").append(cat.getIdCategoria()).append("' , ")
                 .append(")");
            
                resultado = bd.ejecutarComando(query.toString());
                
        } catch (Exception e) {
            resultado = false;
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return resultado;
    //Editar Articulos
    }
    
    public boolean editarCategoria(categoria a){
        baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" UPDATE  articulo  ")
                    .append("SET  ")
                        .append("idCategoria= '").append(a.getIdCategoria()).append("',  ")
                        .append(" nombre  = '").append(a.getNombre()).append("',  ")
                        
                    .append("WHERE  id  = ").append(a.getIdCategoria())
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
    
     public boolean eliminarCategoria(int id){
         baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" DELETE FROM categoria WHERE id = ").append(id)
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
     public List<categoria> obtenerCategoria(){
         baseDatos bd = new baseDatos();
        List<categoria> categorias = new ArrayList();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM categoria ")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            while(datos.next()){
                categoria c = new categoria();
                
                c.setIdCategoria(datos.getInt("idCategoria"));
                c.setNombre(datos.getString("nombre")); 
                categorias.add(c);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return categorias;
    }
    
    
    
    //main hardcoded
    
 
} 