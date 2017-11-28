
package entidades;

import java.util.ArrayList;
import java.util.List;


public class articulo {

    public static void add(articulo a) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    private int idArticulo;
    private String imgArticulo;
    private String nombre;
    private String descripcion;
    private String marca;
    private int idCategoria;
    private double precio;
    private int stock;

    public int getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(int idArticulo) {
        this.idArticulo = idArticulo;
    }
    
    public String getImgArticulo() {
        return imgArticulo;
    }

    public void setImgArticulo(String imgArticulo) {
        this.imgArticulo = imgArticulo;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    public List<articulo> getLista(){
        List<articulo> articulos = new ArrayList();
        
        
        
        return articulos;
    }

    
    
}
