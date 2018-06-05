<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>
<c:if test="${rol == 'Admin'}">
    <!-- Usuario autorizado -->
    <div class="row">
        <div class="col s6 offset-l3 white">
            <h2 class='center'>Cerrar oferta</h2>
            <form method="post" action="control.do">
                
                
                <div class="input-field col s12">
                    <input id="codigo" type="text" class="validate" name="codigo" value='<%=request.getParameter("codigo")%>' readonly>
                    <label for="codigo">Código:</label>
                </div>
                <div class="input-field col s12">
                    <input id="titulo" type="text" class="validate" name="titulo" value='<%=request.getParameter("titulo")%>' readonly>
                    <label for="titulo">Titulo</label>
                </div>
                <div class="input-field col s12">
                    <textarea id="descripcion" name="descripcion" rows="10" class="materialize-textarea" readonly><%=request.getParameter("descripcion")%></textarea>
                    <label for="descripcion">Descripción</label>
                </div>
                <div>
                    <button type="submit" name="btn" value="cerrarOferta" 
                            class="waves-effect waves-light btn right">Cerrar oferta</button>
                </div>
                <div class="row">
                    ${requestScope.msg}
                </div>
                
            </form>
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