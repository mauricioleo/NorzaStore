
package Metodos;

import conexion.baseDatos;
import entidades.usuario;
import static java.lang.System.out;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;




/**
 *
 * @author Theo
 */
public class metodoLogin {
   
     
    public boolean Login(String usuario, String contraseña) {
        baseDatos bd = new baseDatos();
        usuario u = new usuario();
        bd.abrirConexion(); 
        boolean dentro = false; 

        try
            {
            StringBuilder query = new StringBuilder();
            query.append("SELECT * FROM usuario WHERE usuario='").append(usuario)
                 .append("' AND password ='").append(contraseña).append("'");
           
            ResultSet datos = bd.consultarDatos(query.toString());
            
            if(datos.next()){           
               
                dentro = true;
                u.setIdUsuario(datos.getInt("idUsuario"));
                u.setNombre(datos.getString("nombre"));
                u.setDireccion(datos.getString("direccion"));
                u.setCargo(datos.getString("cargo"));
                u.setTelefono(datos.getString("telefono"));
                u.setEmail(datos.getString("email"));
                u.setUsuario(datos.getString("usuario"));
                u.setContrasena(datos.getString("contraseña"));
            
             }
            }catch(Exception e){
                
             }
                 
             finally{
            //Cerrar Conexion
            bd.cerrarConexion();
        }
        return dentro;
     
    }

   }
   