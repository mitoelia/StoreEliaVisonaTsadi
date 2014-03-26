$(function(){
    reload();
});
    
    
function reload(){
    $.getJSON(
            'prodottiServlet'
            , function(result){ //manca l'identificatore perche questa funzione ha senso solo qui. Funzione anonima.
                //La chiama quando ha scaricato l'array di oggetti json.
                var tabella_prodotti = $("#prodotti > tbody");
                tabella_prodotti.empty();
                $(result).each(function(i, item){
                    var tr_html =
                            "<tr ProdottoId='" + item.ProdottoId + "'>"
                            + "<td>" + item.Descrizione + "</td>"
                            + "<td><a class='btn btn-default' href='Prodotto.jsp?ProdottoId=" + item.ProdottoId + "'>Scheda Prodotto</a></td>"
                            + "</tr>";
                    tabella_prodotti.append(tr_html);
                });
            }
                    
    );
    
}

