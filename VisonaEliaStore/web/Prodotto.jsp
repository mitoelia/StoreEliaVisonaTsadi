<%-- 
    Document   : Prodotto
    Created on : 26-mar-2014, 15.13.13
    Author     : Elia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Scheda Prodotto</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    </head>
    <body class="container">
        <h1>Scheda Prodotto</h1>
        <div class="row">
            <div class="col-xs-8">
                <form>
                    <input 
                        type="hidden" 
                        id="ProdottoId" 
                        value='<%= request.getParameter("ProdottoId") %>' 
                        />
                    <fieldset>
                        
                        <label for="Descrizione">Descrizione: </label>
                        <input type="text" id="Descrizione" readonly />
                        <label for="Prezzo">Prezzo: </label>
                        <input type="text" id="Prezzo" readonly />   
                        <label for="Quantita">Quantità: </label>
                        <input type="text" id="Quantita" />  
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-3">
                <a href="#" id="invia">Aggiungi al Basket</a>
            </div>
        </div>
        <script src='Scripts/jquery-1.10.2.js'></script>
        <script src='Scripts/Scheda_Prodotto.js'></script>
    </body>
</html>


