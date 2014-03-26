

$(function(){
    
        var prodotto_id = $("#ProdottoId").val();
        
        $.getJSON(
                "prodottiServlet?ProdottoId=" + prodotto_id
                , function(ViewModel) {
                    $("#Descrizione").val(ViewModel.Descrizione);
                    $("#Prezzo").val(ViewModel.Prezzo);
                }
        );
        
     $("#invia").on('click', function(){
        
        
        var nuovo_basket = {
            "ProdottoId": $("#ProdottoId").val(),
            "OrdineId": 1,
            "UserId": 1,
            "Quantita": $("#Quantita").val()
        };
        
        $.post(
            "basketServlet",
            JSON.stringify(nuovo_basket),
            function (result){
                window.location.href="Basket.jsp";
            }
        );
    });
});
