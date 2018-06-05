/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import beans.ServicioLocal;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/**
 *
 * @author Informatica
 */
@WebServlet(name = "ControladorServlet", urlPatterns = {"/control.do"})
public class ControladorServlet extends HttpServlet {

    @EJB
    private ServicioLocal servicio;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String btn=request.getParameter("btn");
            switch(btn){
                case "ingresar":
                    iniciarSesion(request,response);
                    break;
                case "registro":
                    registrar(request,response);
                    break;
                case "postular":
                    ingresarPostulacion(request,response);
                    break;
                    
                case "cambiaDatos":
                    guardaPerfil(request, response);
                    break;
                    
                case "mensaje":
                    enviaMensaje(request, response);
                default:
                    //Es un botón de una oferta
                    int codigo=0;
                    try{
                        codigo=Integer.parseInt(btn);
                        postular(request,response,codigo);
                    }catch(NumberFormatException e){
                        
                    }
            }
        }
    protected void ingresarPostulacion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Oferta oferta=(Oferta)request.getSession().getAttribute("oferta");
        String rut=(String)request.getSession().getAttribute("rut");
        String msg=servicio.postular(rut, oferta.getCodigo());
        request.setAttribute("msg",msg);
        request.getRequestDispatcher("mispostulaciones.jsp").forward(request,response);
        
    }
    protected void postular(HttpServletRequest request, HttpServletResponse response, int codigo)
            throws ServletException, IOException {
        Oferta oferta=servicio.buscarOferta(codigo);
        request.getSession().setAttribute("oferta",oferta);
        request.getRequestDispatcher("postular.jsp").forward(request,response);
        
    }
    protected void registrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rut=request.getParameter("rut");
        String nombre=request.getParameter("nombre");
        String apellido=request.getParameter("apellido");
        String correo=request.getParameter("correo");
        String clave=request.getParameter("clave");
        String clave2=request.getParameter("clave2");
        String errores="";
        if(rut.equals("")){
            errores+="Debe ingresar el RUT<br/>";
        }
        if(nombre.equals("")){
            errores+="Debe ingresar el nombre<br/>";
        }
        if(!clave.equals(clave2)){
            errores+="Las claves no coinciden<br/>";
        }
        if(errores.equals("")){
            //No hay errores
            Postulante postulante=new Postulante(rut,nombre,apellido,correo,clave, "User");
            String msg=servicio.addPostulante(postulante);
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("iniciarsesion.jsp").forward(request,response);
        }
        else{
            //Hay errores
            request.setAttribute("msg",errores);
            request.getRequestDispatcher("registro.jsp").forward(request,response);
        }
    }
    
    protected void guardaPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String rut=(String)request.getSession().getAttribute("rut");
            String correo=request.getParameter("correo");
            String profesion = request.getParameter("profesion");
            String experiencia = request.getParameter("experiencia");
            String presentacion = request.getParameter("presentacion");
            Postulante p = servicio.buscarPostulante(rut);
            try{
                p.setCorreo(correo);
                p.setProfesion(profesion);
                p.setExperiencia(experiencia);
                p.setPresentacion(presentacion);
            }catch(Exception e){
                request.setAttribute("msg","Error al guardar perfil: "+e);
            }
            
            request.setAttribute("msg","Perfil guardado");
            request.getRequestDispatcher("miperfil.jsp").forward(request,response);
            
    }
    
    
    protected void enviaMensaje(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String rut=request.getParameter("rut");
            String asunto = request.getParameter("asunto");
            String mensaje = request.getParameter("mensaje");
            String msg = "";
            
            Mensaje men = new Mensaje(asunto, mensaje);
            
            msg = servicio.enviarMensaje(rut, men);
            
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("mensaje.jsp").forward(request,response);
            
    }
    
    
    protected void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rut=request.getParameter("rut");
        String clave=request.getParameter("clave");
        String msg="";
        if(rut.isEmpty() || clave.isEmpty()){
            msg+="El RUT y clave son obligatorios<br/>";
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("iniciarsesion.jsp").forward(request,response);
        }
        else{
            if(servicio.iniciarSesion(rut,clave)){
                //Puede iniciar sesión
                request.getSession().setAttribute("rol",servicio.buscarPostulante(rut).getRol());
                request.getSession().setAttribute("rut",rut);
                
                response.sendRedirect("ofertas.jsp");
            }
            else{
                //NO puede iniciar sesión
                msg+="Usuario y/o clave incorrectos<br/>";
                request.setAttribute("msg",msg);
                request.getRequestDispatcher("iniciarsesion.jsp").forward(request,response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
