<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.security.*"%>
<%
  Connection con = null;
  Statement stmt = null;
  ResultSet rs = null;
  try {
    String url = "jdbc:mysql://127.0.0.1:3306/";
    String db = "test";
    String user = "root";
    String password = "";
    String driver = "com.mysql.jdbc.Driver";
    Class.forName(driver);
    con = DriverManager.getConnection(url + db, user, password);
    stmt = con.createStatement();
    String sql = "select * from item order by id";
    rs = stmt.executeQuery(sql);
  } catch (Exception ex) {
    out.println(ex);
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <style>
      .card-header{
        font-size:20px;
        font-weight: bold;
      }
    </style>
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>

    <script>
      $(".button-collapse").sideNav();
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  </head>
  <body>
    <div class="navbar-fixed">
        <nav>
            <div class="nav-wrapper">
              <center>
                <h style="font-size:25px;font-weight:bold;">購物商城範例</h>
              </center>
            </div>
        </nav>
    </div>
    <div class="row">

      <%
        if (rs != null){
          while(rs.next()){
            String id = rs.getString(1);
            String name = rs.getString(2);
            String photo = rs.getString(3);
            String des = rs.getString(4).substring(0,50) + " ...";
            String price = rs.getString(5);
            String currentInStock = rs.getString(6);
            String inStock = rs.getString(7);
      %>
      <div class="col s12">
          <div class="card horizontal">
              <div class="card-image" style="padding:2vh;">
                  <img src="<%=photo%>" style="width:17vh;height:19vh;">
              </div>
              <div class="card-stacked">
                  <div class="card-content">
                      <h style="font-size:20px;font-weight:bold;"><%=name%></h>
                      <p>售價：NT$ <%=price%></p>
                      <p>庫存：<%=currentInStock%> / <%=inStock%></p>
                      <p>簡介：<%=des%></p>
                  </div>
                  <div class="card-action">
                    <a href="itemDetail.jsp?id=<%=id%>">詳細資訊</a>
                  </div>
              </div>
          </div>
      </div>
      <% }} %>
  </div>
  </body>
</html>
