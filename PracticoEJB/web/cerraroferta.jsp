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
<c:if test="${rol == 'Admin'}">
<div class="row">
    <div class="col s6 offset-s3 white">
        <h2 class="center">Cerrar oferta</h2>
        <table class="bordered highlight">
            <tr>
                <th>Código</th>
                <th>Título</th>
                <th>Descripción</th>
                <th></th>
            </tr>
            <form method="post" action="control.do">
                <c:forEach items="${servicio.allOfertas}" var="p">
                    <tr>
                        <td>${p.codigo}</td>
                        <td>${p.titulo}</td>
                        <td>${p.descripcion}</td>
                        <td>
                            <c:if test="${p.estaActiva == true}">
                                <a href="cerraroferta2.jsp?codigo=${p.codigo}&titulo=${p.titulo}&descripcion=${p.descripcion}" class="btn-floating red"><img src="images/open.png"></a>
                            </c:if>
                            <c:if test="${p.estaActiva == false}">
                                <img src="images/closed.png">
                                
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </form>
        </table>
    </div>
</div>
</c:if>
<c:if test="${rol != 'Admin'}">
    <h3>No estas autorizado a estar en esta pagina.</h3>
</c:if>
<%@include file="templates/footer.jsp" %>
