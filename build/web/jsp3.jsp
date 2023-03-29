<%-- 
    Document   : jsp3
    Created on : 16 mar 2023, 13:04:14
    Author     : alumno
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.gerdoc.Datos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"><!-- comment -->
<!--        js-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <!--        navbar-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="index.html">JSP & SERVLET</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="jsp2.jsp">JSP</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ClienteList">SERVLET</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                OTROS
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item" href="jsp1.jsp">JSP1</a></li>
                <li><a class="dropdown-item" href="Negocio.java">NEGOCIO</a></li>
                
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
        <%
            String nombre = null;
            String calif = null;
            String enviar = null;
            String id = null;
            String editar = null;
            String accion = "enviar";
            String actualizar = "enviar";
            Datos datos = null;
            Integer idx = null;
            List<Datos>lista = null;
            
            session = request.getSession( true );
            if( session != null )
            {
                if( session.getAttribute("lista") == null )
                {
                    session.setAttribute("lista", new ArrayList<Datos>());
                }
                lista = (List)session.getAttribute("lista");
            }
            nombre = request.getParameter( "nombre" );
            calif = request.getParameter( "calif" );
            enviar = request.getParameter( "enviar" );
            id = request.getParameter( "id" );
            editar = request.getParameter( "editar" );
            actualizar = request.getParameter( "actualizar" );
            
            if( "Submit".equals( editar ) )
            {
                idx = Integer.parseInt( id );
                if( idx < lista.size() )
                {
                    datos = lista.get( idx );
                }
                accion = "actualizar";
            }
            
            if( "Submit".equals( enviar ) || "Submit".equals( actualizar ) )
            {
                if( "Submit".equals( enviar ) )
                {
                    datos = new Datos( );
                }
                else
                {
                    datos = lista.get( Integer.parseInt( id ) );
                }
                datos.setNombre(nombre);
                datos.setCalf( Float.parseFloat( calif ) ); 
                if( "Submit".equals( enviar ) )
                {
                    lista.add( datos );
                }
        %>
                <h1>EXITO!</h1>
                <script>
                    console.log("Exito");
                </script>
                <a href="jsp2.jsp">Ir a jsp2 </a>
        <%
            }
            if( datos == null )
            {
                datos = new Datos( );
                datos.setNombre( "" );
                datos.setCalf( 0f );

            }
            if( !"Submit".equals( enviar ) && !"Submit".equals( actualizar ) )
            {
        %>  
        <form id="form1">
            <table border="1">
                <tr>
                    <td>Nombre</td>
                    <td><input id="nombre" name="nombre" value="<%=datos.getNombre()%>" type="text"/></td>

                </tr>
                <tr>
                    <td>Calificación</td>
                    <td><input id="calif" name="calif" value="<%=datos.getCalf()%>" type="number"/>
                        <%
                            if( "Submit".equals( editar ) )
                            {
                        %>
                                <input type="hidden" name="id" id="id" value="<%=id%>" />
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr >
                    <td colspan="2">
                        <input type="submit" id="enviar" name="<%=accion%>" />
                    </td>
                </tr>
            </table>
        </form>
        <%
            }
        %>
    </body>
</html>
