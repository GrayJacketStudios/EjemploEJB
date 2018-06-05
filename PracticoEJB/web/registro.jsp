<%@include file="templates/header.jsp" %>
        
<%@include file="templates/menu.jsp" %>
        
   <div class="row">
    <div class="col s6 offset-l3 white">
        <form method="post" action="control.do">
            <div class="input-field col s12">
          <input name="rut" placeholder="RUT" id="rut" type="text" class="validate">
          <label for="rut">RUT</label>
            </div>
            <div class="input-field col s12">
          <input name="nombre" placeholder="Nombre" id="nombre" type="text" class="validate">
          <label for="nombre">Nombre</label>
            </div>
            <div class="input-field col s12">
          <input name="apellido" placeholder="Apellido" id="apellido" type="text" class="validate">
          <label for="apellido">Apellido</label>
            </div>
            <div class="input-field col s12">
          <input name="correo" placeholder="Correo" id="correo" type="text" class="validate">
          <label for="correo">Correo</label>
            </div>
            <div class="input-field col s12">
          <input name="clave" placeholder="Clave" id="clave" type="password" class="validate">
          <label for="clave">Clave</label>
            </div>
            <div class="input-field col s12">
          <input name="clave2" placeholder="Confirme Clave" id="clave2" type="password" class="validate">
          <label for="clave2">Confirme Clave</label>
            </div>
            <div class="row">
                <button type="submit" name="btn" value="registro" 
                        class="waves-effect waves-light btn right">
                    Registrar</button>
            </div>
            <div class="row">
                ${requestScope.msg}
            </div>
        </form>
    </div>
  </div>
        
<%@include file="templates/footer.jsp" %>

