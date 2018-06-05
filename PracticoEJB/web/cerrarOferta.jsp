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
<div class="row">
    <div class="col s6 offset-s3 white">
        <h2>Empleos Disponibles</h2>
        <table class="bordered highlight">
            <tr>
                <th>Código</th>
                <th>Título</th>
                <th>Descripción</th>
                <th></th>
            </tr>
            <form method="post" action="control.do">
                <c:forEach items="${servicio.ofertas}" var="p">
                    <tr>
                        <td>${p.codigo}</td>
                        <td>${p.titulo}</td>
                        <td>${p.descripcion}</td>
                        <td>
                            <button type="submit" name="btn" 
                                    class="waves-effect waves-light btn" 
                                    value="${p.codigo}">Postular</button>
                        </td>
                    </tr>
                </c:forEach>
            </form>
        </table>
    </div>
</div>

<%@include file="templates/footer.jsp" %>
