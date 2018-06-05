/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import javax.ejb.Local;
import modelo.*;
import java.util.ArrayList;

/**
 *
 * @author Informatica
 */
@Local
public interface ServicioLocal {

    Oferta buscarOferta(int codigoOferta);

    Postulante buscarPostulante(String rut);

    boolean cerrarOferta(int codigo);

    
    boolean crearOferta(Oferta o);

    String enviarMensaje(String rut, Mensaje msg);

    ArrayList<Oferta> getOfertas();

    ArrayList<Postulante> getPostulantes();

    boolean iniciarSesion(String rut, String pass);

    String postular(String rut, int codigoOferta);

    String addPostulante(Postulante postulante);

    ArrayList<Oferta> getAllOfertas();

    
    
}
