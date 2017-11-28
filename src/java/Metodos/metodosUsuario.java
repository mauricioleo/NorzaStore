/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import conexion.baseDatos;
import entidades.articulo;
import entidades.usuario;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Theo
 */
public class metodosUsuario {
        List<usuario> usuario;
    
     public static boolean metodoAgregarUsuario(usuario usu){
       baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO usuario ")
                 .append(" ( ")
                 .append(" idUsuario, ")
                 .append(" nombre, ")
                 .append(" direccion, ")
                 .append(" cargo, ")
                 .append(" telefono, ")
                 .append(" email, ")
                 .append(" stock) VALUES( ")
                 .append("'").append(usu.getIdUsuario()).append("' , ")
                 .append("'").append(usu.getNombre()).append("' , ")
                 .append("'").append(usu.getDireccion()).append("' , ")
                 .append("'").append(usu.getCargo()).append("' , ")
                 .append("'").append(usu.getTelefono()).append("' , ")
                 .append("'").append(usu.getEmail()).append("' , ")
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
    
    public boolean editarUsuario(usuario a){
        baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" UPDATE  usuario  ")
                    .append("SET  ")
                        .append("iUsuario= '").append(a.getIdUsuario()).append("',  ")
                        .append(" nombre  = '").append(a.getNombre()).append("',  ")
                        .append(" direccion  = '").append(a.getDireccion()).append("',  ")
                        .append(" cargo  = '").append(a.getCargo()).append("',  ")
                        .append(" telefono  = ").append(a.getTelefono()).append(",  ")
                        .append(" email  = ").append(a.getEmail()).append(",  ")
                        .append("WHERE  id  = ").append(a.getIdUsuario())
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
    
     public boolean eliminarUsuario(int id){
         baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" DELETE FROM usuario WHERE id = ").append(id)
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
     public List<usuario> obtenerUsuario(){
         baseDatos bd = new baseDatos();
        List<usuario> usuarios = new ArrayList();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM usuario ")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            while(datos.next()){
                usuario a = new usuario();
                
                a.setIdUsuario(datos.getInt("idUsuario"));
                a.setNombre(datos.getString("nombre"));
                a.setDireccion(datos.getString("direccion"));
                a.setCargo(datos.getString("cargo"));
                a.setTelefono(datos.getString("telefono"));
                a.setEmail(datos.getString("email"));
                                
                usuarios.add(a);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return usuarios;
    }
    
    public usuario obtenerUsuario(String nombre){
        baseDatos bd = new baseDatos();
        usuario a = new usuario();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM contactos WHERE usuario.nombre LIKE '% ")
                    .append(nombre).append("%'")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            if(datos.next()){           
                
                a.setIdUsuario(datos.getInt("idUsuario"));
                a.setNombre(datos.getString("nombre"));
                a.setDireccion(datos.getString("direccion"));
                a.setCargo(datos.getString("cargo"));
                a.setTelefono(datos.getString("telefono"));
                a.setEmail(datos.getString("email"));
                                
                usuario.add(a);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return a;
    }
    
    
    //main hardcoded
    
  
 }

