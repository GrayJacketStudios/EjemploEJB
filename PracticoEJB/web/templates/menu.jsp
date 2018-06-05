 <nav>
    <div class="nav-wrapper orange darken-3">
        <c:if test="${empty rut}">
            <a href="#" class="brand-logo">Encuentra tu trabajo</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="iniciarsesion.jsp">Acceder</a></li>
                <li><a href="registro.jsp">Regístrate</a></li>
                <li><a href="ofertas.jsp">Ofertas</a></li>
            </ul>
        </c:if>
        <c:if test="${rol == 'User'}">
            <a href="#" class="brand-logo">Bienvenido</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="miperfil.jsp">Mi Perfil</a></li>
                <li><a href="mispostulaciones.jsp">Mis Postulaciones</a></li>
                <li><a href="ofertas.jsp">Ofertas</a></li>
                <li><a href="mismensajes.jsp">Mis Mensajes</a></li>
            
        </c:if>
        <c:if test="${rol == 'Admin'}">
            <a href="#" class="brand-logo">Administrador</a>
            <ul id="nav-mobile" class="right hide-on-med-and-down">
                <li><a href="nuevaoferta.jsp">Crear Oferta</a></li>
                <li><a href="cerraroferta.jsp">Cerrar Oferta</a></li>
                <li><a href="mensaje.jsp">Enviar Mensaje</a></li>
                <li><a href="cerraroferta.jsp">Cerrar Oferta</a></li>
                
            
        </c:if>
        <li><a href="salir.jsp">Salir</a></li>
        </ul>
    </div>
  </nav>