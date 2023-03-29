<%-- 
    Document   : jsp1
    Created on : 9 mar 2023, 13:10:58
    Author     : alumno
--%>

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
        
        <h1>Hello World!</h1>
        <h2><%=request.getParameter("numero") == null? "Sin dato" : request.getParameter("numero") %></h2>
        <%
            
            int x = (int)((Math.random() * 100 ));
            if( x < 50 )
            {
        %>
                <h1>Es menor a 50</h1>
        <%
            }
            else
            {
        %>
                <h1>Es mayor o igual a 50</h1>
        <%
            }
        %>
        <h1>El valor es <%=x%></h1>
        
    </body>
</html>
