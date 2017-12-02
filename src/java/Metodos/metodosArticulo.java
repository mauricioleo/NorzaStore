/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;
import conexion.baseDatos;
import entidades.articulo;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Theo
 */
public class metodosArticulo {
    
    List<articulo> articulos;
    
    public static boolean agregarArticulo(articulo art){
       baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" INSERT INTO articulo ")
                 .append(" ( ")
                 .append(" imgArticulo, ")   
                 .append(" nombre, ")
                 .append(" descripcion, ")
                 .append(" marca, ")
                 .append(" idCategoria, ")
                 .append(" precio, ")
                 .append(" stock) VALUES( ")
                 .append("'").append(art.getImgArticulo()).append("' , ")
                 .append("'").append(art.getNombre()).append("' , ")
                 .append("'").append(art.getDescripcion()).append("' , ")
                 .append("'").append(art.getMarca()).append("' , ")
                 .append("'").append(art.getIdCategoria()).append("' , ")
                 .append("'").append(art.getPrecio()).append("' , ")
                 .append(" ").append(art.getStock()).append(" ")
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
    
    public boolean editarArticulo(articulo a){
        baseDatos bd = new baseDatos();
       boolean resultado = false;
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" UPDATE  articulo  ")
                    .append("SET  ")
                        .append("imgArticulo= '").append(a.getImgArticulo()).append("',  ")
                        .append(" nombre  = '").append(a.getNombre()).append("',  ")
                        .append(" descripcion  = '").append(a.getDescripcion()).append("',  ")
                        .append(" marca  = '").append(a.getMarca()).append("',  ")
                        .append(" idCategoria  = ").append(a.getIdCategoria()).append(",  ")
                        .append(" precio  = ").append(a.getPrecio()).append(",  ")
                        .append(" stock  = ").append(a.getStock()).append(",  ")
                    .append("WHERE  id  = ").append(a.getIdArticulo())
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
    
     public boolean eliminarArticulo(int id){
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
     public List<articulo> obtenerArticulo(){
         baseDatos bd = new baseDatos();
        List<articulo> articulo = new ArrayList();
        try {
            //Abrir Conexion 
            bd.abrirConexion(); 
            
            StringBuilder query = new StringBuilder();
            query.append(" SELECT * FROM articulo ")
                    ;
    
            ResultSet datos = bd.consultarDatos(query.toString());
            
            while(datos.next()){
                articulo a = new articulo();
                
                a.setIdArticulo(datos.getInt("idArticulo"));
                //a.setImgArticulo(datos.getString("imgArticulo"));
                a.setNombre(datos.getString("nombre"));
                a.setDescripcion(datos.getString("descripcion"));
                a.setMarca(datos.getString("marca"));
                a.setIdCategoria(datos.getInt("idCategoria"));
                a.setPrecio(datos.getInt("precio"));
                a.setStock(datos.getInt("stock"));
                
                
                articulo.add(a);
            }
                
        } catch (Exception e) {
            
        } finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        
        return articulo;
    }
    
    
    
    //main hardcoded
    
   public static void main(String args[]) {
       
       articulo art = new articulo();
       art.setDescripcion("lksjdlksajd");
       art.setIdCategoria(1);
       art.setMarca("marca");
       art.setNombre("Compu");
       art.setPrecio(10.00);  
       art.setStock(10);
       art.setImgArticulo("lksjdlksajdasdasdsadasdsad");
       
       agregarArticulo(art);
 }
   
} 
