/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import conexion.baseDatos;
import entidades.articulo;
import entidades.cliente;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Theo
 */
public class metodosCliente {
        List<cliente> cliente;
    
    public static boolean metodoAgregarCliente(cliente cli){
       baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO cliente ")
                 .append(" ( ")
                 .append(" nombre, ")
                 .append(" direccion, ")
                 .append(" telefono, ")
                 .append(" email, ")
                 .append(" rfc, ")
                 .append(" descuento) VALUES( ")
                 .append("'").append(cli.getNombre()).append("' , ")
                 .append("'").append(cli.getDireccion()).append("' , ")
                 .append("'").append(cli.getTelefono()).append("' , ")
                 .append("'").append(cli.getIdCliente()).append("' , ")
                 .append("'").append(cli.getRfc()).append("' , ")
                 .append(" ").append(cli.getDescuento()).append(" ")
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
    
    public boolean editarCliente(cliente a){
        baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" UPDATE  cliente  ")
                    .append("SET  ")
                        .append("idCliente= '").append(a.getIdCliente()).append("',  ")
                        .append(" nombre  = '").append(a.getNombre()).append("',  ")
                        .append(" direccion  = '").append(a.getDireccion()).append("',  ")
                        .append(" telefono  = '").append(a.getTelefono()).append("',  ")
                        .append(" email  = ").append(a.getEmail()).append(",  ")
                        .append(" rfc  = ").append(a.getRfc()).append(",  ")
                        .append(" descuento  = ").append(a.getDescuento()).append(",  ")
                    .append("WHERE  id  = ").append(a.getIdCliente())
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
    
     public boolean eliminarCliente(int id){
         baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" DELETE FROM cliente WHERE id = ").append(id)
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
     public List<cliente> obtenerCliente(){
         baseDatos bd = new baseDatos();
        List<cliente> clientes = new ArrayList();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM cliente ")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            while(datos.next()){
                cliente a = new cliente();
                
                a.setIdCliente(datos.getInt("idCliente"));
                a.setNombre(datos.getString("nombre"));
                a.setDireccion(datos.getString("direccion"));
                a.setTelefono(datos.getString("telefono"));
                a.setEmail(datos.getString("email"));
                a.setRfc(datos.getString("rfc"));
                a.setDescuento(datos.getInt("descuento"));
                                
                clientes.add(a);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return clientes;
    }
     
  
}
