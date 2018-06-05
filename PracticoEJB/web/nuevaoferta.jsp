<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>

<c:if test="${not empty rut}">
    <!-- Usuario autorizado -->
    <div class="row">
        <div class="col s6 offset-l3 white">
            <h2>Nueva Oferta</h2>
            <form method="post" action="control.do">

                <div class="input-field col s12">
                    <input id="codigo" type="text" class="validate" name="codigo">
                    <label for="codigo">Codigo</label>
                </div>
                
                <div class="input-field col s12">
                    <input id="titulo" type="text" class="validate" name="titulo">
                    <label for="titulo">Titulo</label>
                </div>
                <div class="input-field col s12">
                    <textarea id="descripcion" name="descripcion" rows="10" class="materialize-textarea"></textarea>
                    <label for="descripcion">Descripción</label>
                </div>
                <div>
                    <button type="submit" name="btn" value="crearOferta" 
                            class="waves-effect waves-light btn right">Crear oferta</button>
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