<%-- 
    Document   : Basket
    Created on : 26-mar-2014, 16.28.52
    Author     : Elia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Basket</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        <h1>Oggetti contenuti nel Basket:</h1>
        <p />
        <br />
      <div class="container">
      <div class="row">
        
        <div class="col-xs-6">
                <table class="table" id="basket">
                    <thead>
                        <th>Descrizione Prodotto</th>
                        <th>Prezzo Unitario</th>
                        <th>Quantità</th>
                        <th>Prezzo Totale</th>
                        <th>DELETE</th>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            <label for="sum">Somma Prezzi: </label>
            <input type="text" id="sum" readonly />
        </div>
      </div>
    </div>
  
  <script src='Scripts/jquery-1.10.2.js'></script>
  <script src='Scripts/basket_a.js'></script>

    </body>
</html>
