<%@include file="templates/header.jsp" %>
        
<%@include file="templates/menu.jsp" %>
<c:if test="${rol == 'Admin'}">
<div class="row">
    <div class="col s12 m6 offset-l3">
      <div class="card">
          
        <div class="card-content">
            <h3>Enviar mensaje</h3>
            <form method="post" action="control.do">
                <div class="input-field col s12">
                    <input id="rut" type="text" class="validate" name="rut">
                    <label for="rut">RUT</label>
                </div>
                <div class="input-field col s12">
                    <input id="asunto" type="text" class="validate" name="asunto">
                    <label for="asunto">Asunto</label>
                </div>
                <div class="input-field col s12">
                    <textarea id="mensaje" name="mensaje" rows="10" class="materialize-textarea"></textarea>
                    <label for="mensaje">Mensaje</label>
                </div>
                <div>
                    <button type="submit" name="btn" value="mensaje" 
                            class="waves-effect waves-light btn right">Enviar mensaje</button>
                </div>
                <div class="row">
                    ${requestScope.msg}
                </div>
            </form>
        </div>
        
      </div>
    </div>
  </div>
</c:if>
<c:if test="${rol != 'Admin'}">
    <p>No está autorizado para estar aquí</p>
    <p>
        <a href="index.jsp">Click aquí para ser redireccionado</a>
    </p>
</c:if>


<%@include file="templates/footer.jsp" %>
