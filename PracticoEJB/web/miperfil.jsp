<%@page import="javax.naming.InitialContext"%>
<%@page import="beans.ServicioLocal"%>
<%@include file="templates/header.jsp" %>

<%! ServicioLocal servicio; %>

<%
    InitialContext ctx=new InitialContext();
    servicio=(ServicioLocal)ctx.lookup("java:global/PracticoEJB/Servicio!beans.ServicioLocal");
 %>

 <c:set var="servicio" scope="page" value="<%=servicio%>"/>
<%@include file="templates/menu.jsp" %>
<c:if test="${not empty rut}">
<div class="row">
    <div class="col s6 offset-s3 white">
        <c:set var="perfil" value="${servicio.buscarPostulante(rut)}" />
        <h2>Mi perfil</h2>
        <h4>Nombre: ${perfil.getNombre()} ${perfil.getApellido()}</h4>
        <h6>Rut: ${rut}</h6>
        
        <form method="POST" action="control.do">
            <div class="input-field col s12">
            <input type="text" name="correo" value="${perfil.getCorreo()}" />
            <label for="correo">Correo: </label>
            </div>
            <div class="input-field col s12">
            <input type="text" name="profesion" value="${perfil.getProfesion()}" />
            <label for="profesion">Profesión </label>
            </div>
            <div class="input-field col s12">
            <input type="text" name="experiencia" value="${perfil.getExperiencia()}" />
            <label for="experiencia">Experiencia </label>
            </div>
            <div class="input-field col s12">
            <input type="text" name="presentacion" value="${perfil.getPresentacion()}" />
            <label for="presentacion">Presentacion </label>
            <br>
            </div>
            
           <div class="input-field col s12">
                <button type="submit" name="btn" value="cambiaDatos" 
                        class="waves-effect waves-light btn">
                    Guardar</button>
            </div>
            
        </form>
        <div class="row">
                ${requestScope.msg}
            </div>
    </div>
</div>
</c:if>
<c:if test="${empty rut}">
    <h4>Debes haber iniciado sesión para ver esta pagina.</h4>
    <a href="index.jsp">Click aquí para ser redireccionado</a>
    
</c:if>
         

<%@include file="templates/footer.jsp" %>
