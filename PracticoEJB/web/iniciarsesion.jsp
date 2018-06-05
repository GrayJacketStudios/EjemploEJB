<%@include file="templates/header.jsp" %>
        
<%@include file="templates/menu.jsp" %>
<div class="row">
    <div class="col s12 m3 offset-l3">
      <div class="card">
        <div class="card-image">
          <img src="images/programar2.jpg">
          <span class="card-title">Ingresar</span>
        </div>
        <div class="card-content">
            <form method="post" action="control.do">
                <div class="input-field col s12">
                    <input id="rut" type="text" class="validate" name="rut">
                    <label for="rut">RUT</label>
                </div>
                <div class="input-field col s12">
                    <input id="password" type="password" class="validate" name="clave">
                    <label for="password">Clave</label>
                </div>
                <div>
                    <button type="submit" name="btn" value="ingresar" 
                            class="waves-effect waves-light btn right">Ingresar</button>
                </div>
                <div class="row">
                    ${requestScope.msg}
                </div>
            </form>
        </div>
        
      </div>
    </div>
  </div>

<%@include file="templates/footer.jsp" %>
