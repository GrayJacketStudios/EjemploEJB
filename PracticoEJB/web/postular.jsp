<%@include file="templates/header.jsp" %>
<%@include file="templates/menu.jsp" %>
<c:if test="${not empty rut}">
    <!-- Usuario autorizado -->
    <div class="row">
        <div class="col s6 offset-l3 white">
            <h2>Postular</h2>
            <form method="post" action="control.do">
                <div class="input-field col s12">
                    <p for="codigo">C�digo: </p><p>${oferta.codigo}</p>
          
                  </div>
                <div class="input-field col s12">
                    <p>T�tulo: </p><p>${oferta.titulo}</p>
          
                  </div>
                <div class="input-field col s12">
                     <p>Descripci�n</p><p>${oferta.descripcion}</p>
         
                  </div>
                  <div class="col">
                      <button type="submit" name="btn" value="postular" 
                        class="waves-effect waves-light btn right">
                    Postular</button>
                  </div>
            </form>
        </div>
    </div>
</c:if>
<c:if test="${empty rut and empty admin}">
    <p>No est� autorizado para estar aqu�</p>
    <p>
        <a href="index.jsp">Click aqu� para ser redireccionado</a>
    </p>
</c:if>



<%@include file="templates/footer.jsp" %>