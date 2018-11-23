var Crawler = require("crawler");
const fs = require("fs");

var jsonObject = [];
var fileName = "ShopTime/shoptime-mais-avaliados.json";

var c1 = new Crawler({
    maxConnections : 2,
    callback : function (error, res, done) {
        if(error){
            console.log(error);
        }else{
            var host = res.options.parameter1;
            var $ = res.$;
            $("div .product-grid-item").slice(0, 45).each(function() {
                if($(this).children('.product-unavailable').length == 0){
                    var details = $(this).children().children();
                    var link = host + details.attr("href");

                    jsonObject.push({
                        link: link,
                        nome: details.children(".card-product-details").children(".card-product-name").text(),
                        preco: details.children(".card-product-details").children(".card-product-offers").children().children(".card-product-price").text(),
                        parcelas: details.children(".card-product-details").children(".card-product-offers").children().find(".card-product-installments").text(),
                        // marca: '',
                        // cor: '',
                        // alarme: '',
                        // rAgua: '',
                        qtdAvaliacao: details.children(".card-product-details").children(".card-product-rating").find(".rating-star-counter").text(),
                        notaAvaliacao: details.children(".card-product-details").children(".card-product-rating").find(".rating-star-average").text()
                    });
                }

            });

            
        }
        
        var json = JSON.stringify(jsonObject);
        console.log(jsonObject);
        fs.createWriteStream(fileName).write(json);
    }
});


c1.queue({
        uri: "https://www.shoptime.com.br/busca/relogio-masculino?=rating",
        parameter1: "https://www.shoptime.com.br"
});


