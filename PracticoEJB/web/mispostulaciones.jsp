<%@page import="modelo.Postulante"%>
<%@page import="beans.ServicioLocal"%>
<%@page import="javax.naming.InitialContext"%>
<%@include file="templates/header.jsp" %>

<%! ServicioLocal servicio; %>
<%
  InitialContext ctx=new InitialContext();
  servicio=(ServicioLocal)ctx.lookup("java:global/PracticoEJB/Servicio!beans.ServicioLocal");
%>
<c:set var="servicio" scope="page" value="<%=servicio%>"/>
<%
  String rut=(String) request.getSession().getAttribute("rut");
  Postulante postulante=servicio.buscarPostulante(rut);
%>
<c:set var="postulante" scope="page" value="<%=postulante%>"/>

<%@include file="templates/menu.jsp" %>
<c:if test="${not empty rut or not empty admin}">
    <p>${requestScope.msg}</p>
    
    <div class="row">
        <div class="col s6 offset-s3 white">
            <h2>Mis Postulaciones</h2>
            <table class="bordered highlight">
                <tr>
                    <th>Código</th>
                    <th>Título</th>
                    <th>Descripción</th>
                </tr>
                <c:forEach items="${postulante.misPostulaciones}" var="p">
                    <tr>
                        <td>${p.codigo}</td>
                        <td>${p.titulo}</td>
                        <td>${p.descripcion}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    
</c:if>
<c:if test="${empty rut and empty admin}">
    <p>No está autorizado para estar aquí</p>
    <p>
        <a href="index.jsp">Click aquí para ser redireccionado</a>
    </p>
</c:if>

<%@include file="templates/footer.jsp" %>