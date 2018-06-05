
package modelo;

import java.util.ArrayList;

/**
 *
 * @author Informatica
 */
public class Postulante {
    private String rut;
    private String nombre;
    private String apellido;
    private String correo;
    private String pass;
    private Perfil miPerfil;
    private String rol;
    private String profesion;
    private String experiencia;
    private String presentacion;

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getExperiencia() {
        return experiencia;
    }

    public void setExperiencia(String experiencia) {
        this.experiencia = experiencia;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    private ArrayList<Oferta> misPostulaciones=new ArrayList();
    private ArrayList<Mensaje> misMensajes=new ArrayList();

    public Postulante() {
    }

    public Postulante(String rut, String nombre, String apellido, String correo, String pass, String rol) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.pass = pass;
        this.rol = rol;
    }
    

    public Postulante(String rut, String nombre, String apellido, String correo, String pass, String rol, Perfil miPerfil, ArrayList<Oferta> misPostulaciones, ArrayList<Mensaje> misMensajes) {
        this.rut = rut;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.pass = pass;
        this.miPerfil = miPerfil;
        this.misPostulaciones = misPostulaciones;
        this.misMensajes = misMensajes;
        this.rol = rol;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Perfil getMiPerfil() {
        return miPerfil;
    }

    public void setMiPerfil(Perfil miPerfil) {
        this.miPerfil = miPerfil;
    }

    public ArrayList<Oferta> getMisPostulaciones() {
        return misPostulaciones;
    }

    public void setMisPostulaciones(ArrayList<Oferta> misPostulaciones) {
        this.misPostulaciones = misPostulaciones;
    }

    public ArrayList<Mensaje> getMisMensajes() {
        return misMensajes;
    }

    public void setMisMensajes(ArrayList<Mensaje> misMensajes) {
        this.misMensajes = misMensajes;
    }
    
    
    
}
