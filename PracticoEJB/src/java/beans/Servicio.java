/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.util.ArrayList;
import javax.ejb.Singleton;
import modelo.*;

/**
 *
 * @author Informatica
 */
@Singleton
public class Servicio implements ServicioLocal {
    private ArrayList<Oferta> ofertas=new ArrayList();
    private ArrayList<Postulante> postulantes=new ArrayList();
       
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public Servicio() {
        ofertas.add(new Oferta(1,"Desarrollador Java","Desarrollador de tiempo completo",true));
        ofertas.add(new Oferta(2,"Diseñador gráfico","Experto en PhotoShop",true));
        postulantes.add(new Postulante("18622178-8","admin","admin","admin@localhost","admin","Admin",null,null,null));
        postulantes.add(new Postulante("2-2","Michael","Scott","michael@dunder-mifflin.com","2-2","User"));
    }

    @Override
    public Oferta buscarOferta(int codigoOferta) {
        for(Oferta of:ofertas){
            if(of.getCodigo()==codigoOferta){
                return of;
            }
        }
        return null;
    }

    @Override
    public Postulante buscarPostulante(String rut) {
        for(Postulante p:postulantes){
            if(p.getRut().equals(rut)){
                return p;
            }
        }
        return null;
    }

    @Override
    public boolean cerrarOferta(int codigo) {
        Oferta of=buscarOferta(codigo);
        if(of!=null && of.isEstaActiva()){
            of.setEstaActiva(false);
            return true;
        }
        return false;
    }

    @Override
    public boolean crearOferta(Oferta o) {
        Oferta tmp=buscarOferta(o.getCodigo());
        //Si la oferta no está enla lista
        if(tmp==null){
            ofertas.add(o);
            return true;
        }
        return false;
    }

    @Override
    public String enviarMensaje(String rut, Mensaje msg) {
        Postulante p=buscarPostulante(rut);
        if(p!=null){
            ArrayList<Mensaje> mensajes=p.getMisMensajes();
            mensajes.add(msg);
            p.setMisMensajes(mensajes);
            return "El mensaje fue enviado correctamente";
        }
        return "No se puede enviar el mensaje";
    }

    @Override
    public ArrayList<Oferta> getOfertas() {
        ArrayList<Oferta> tmp=new ArrayList();
        for(Oferta of:ofertas){
            if(of.isEstaActiva()){
                tmp.add(of);
            }
        }
        return tmp;
    }

    @Override
    public ArrayList<Postulante> getPostulantes() {
        
        return postulantes;
    }

    @Override
    public boolean iniciarSesion(String rut, String pass) {
        Postulante p=buscarPostulante(rut);
        if(p!=null && p.getPass().equals(pass)){
            return true;
        }
        return false;
    }

    @Override
    public String postular(String rut, int codigoOferta) {
        Postulante p=buscarPostulante(rut);
        Oferta of=buscarOferta(codigoOferta);
        if(p!=null && of!=null && of.isEstaActiva()){
            //Asociamos el postulante con la oferta
            ArrayList<Oferta> postulaciones=p.getMisPostulaciones();
            for(Oferta f: postulaciones){
                if(f == of){//postulación ya existente
                    return "Postulación ya existente.";
                }
            }
            postulaciones.add(of);
            p.setMisPostulaciones(postulaciones);
            //Asociamos la oferta con el postulante
            ArrayList<Postulante> postulantes=of.getMisPostulantes();
            postulantes.add(p);
            of.setMisPostulantes(postulantes);
            return "Postulación realizada exitosamente";
        }
        return "No se puede realizar la postulación";
    }

    @Override
    public String addPostulante(Postulante postulante) {
        String msg;
        Postulante p=buscarPostulante(postulante.getRut());
        if(p==null){
            postulantes.add(postulante);
            msg="Postulante ingresado exitosamente";
        }
        else{
            msg="El postulante ya existe";
        }
        return msg;
    }
    
    

    
    
    
    

    
    
    
    
    
    
    
}
