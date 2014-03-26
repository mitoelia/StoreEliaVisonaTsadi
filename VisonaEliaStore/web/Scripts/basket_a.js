$(function(){
    reload();
});
    
    
function reload(){
    $.getJSON(
            'basketServlet'
            , function(result){ //manca l'identificatore perche questa funzione ha senso solo qui. Funzione anonima.
                //La chiama quando ha scaricato l'array di oggetti json.
                var tabella_prodotti = $("#basket > tbody");
                tabella_prodotti.empty();
                var sum = 0.0;
                $(result).each(function(i, item){
                    var tr_html =
                            "<tr BasketId='" + item.BasketId + "'>"
                            + "<td>" + item.Descrizione + "</td>"
                            + "<td>" + item.Prezzo + "</td>"
                            + "<td>" + item.Quantita + "</td>"
                            + "<td>" + item.Quantita * item.Prezzo + "</td>"
                            + "<td><a href='#' class='cancella btn btn-danger'>Cancella</a></td>"
                            + "</tr>";
                    tabella_prodotti.append(tr_html);
                    sum += item.Prezzo * item.Quantita;
                });
                
                $("#sum").val(sum);
                
                $(".cancella").click(function(e){
                    
                    if (confirm("Sei Sicuro?") == false) return;
                    var basket_id = $(e.target).parent().parent().attr("BasketId");
                    $.ajax({
                        url: "basketServlet?BasketId=" + basket_id
                        , type: "DELETE"
                        , success: function (result){
                            //window.location.href="Contatti.html";
                            reload();
                        }
                    });
                });
            }
                    
    );
    
}

