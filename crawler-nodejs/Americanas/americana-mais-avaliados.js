var Crawler = require("crawler");
const fs = require("fs");

var jsonObject = [];
var fileName = "Americanas/americanas-mais-avaliados.json";

function myRequest(jsonO) {
  for(var i = 0, len = jsonO.length; i < len; i++) {
    var element = jsonO[i];
    c2.queue({
      uri: element.link,
      parameter1: element,
      parameter2: i,
    });
  }
}

var c2 = new Crawler({
  maxConnections: 2,
  callback: function(error, res, done) {
    if (error) {
      console.log(error);
    } else {
      var $ = res.$;
      var element = res.options.parameter1;
      element.notaAvaliacao = $(".summary-bar").find("span .rating-star-average").text();

      /*$("tbody tr").each(function() {
        var first = $(this)
          .find("td:first-child")
          .text();

        if (first === "Marca") {
          var last = $(this)
            .find("td:last-child")
            .text();
          element.marca = last;
        } else if (first === "Alarme") {
          var last = $(this)
            .find("td:last-child")
            .text();
          element.alarme = last;
        } else if (first === "Resistência à água") {
          var last = $(this)
            .find("td:last-child")
            .text();
          element.rAgua = last;
        } else if (first === "Cor da pulseira") {
          var last = $(this)
            .find("td:last-child")
            .text();
          element.cor = last;
        }
      });*/
    }
    if(res.options.parameter2 == jsonObject.length - 1){
      var json = JSON.stringify(jsonObject);
      console.log(jsonObject);
      fs.createWriteStream(fileName).write(json);
    }
    done();
  }
});

var c1 = new Crawler({
  maxConnections: 2,
  callback: function(error, res, done) {
    if (error) {
      console.log(error);
    } else {
      var host = res.options.parameter1;
      var $ = res.$;
      $(".card-product-url")
        .slice(0, 40)
        .each(function() {
          var link = host + $(this).attr("href");
          var details = $(this).children(".card-product-details");
          if (details.children(".card-product-info-unavailable").length == 0) {
            jsonObject.push({
              link: link,
              nome: details.children(".card-product-name").text(),
              preco: details
                .children(".card-product-offers")
                .children(".card-product-prices")
                .children(".card-product-price")
                .children(".value")
                .text(),
              parcelas: details
                .children(".card-product-offers")
                .children(".card-product-prices")
                .children(".placeholder")
                .children(".card-product-installments")
                .text(),
              // marca: "",
              // cor: "",
              // alarme: "",
              // rAgua: "",
              qtdAvaliacao: details
                .children(".card-product-rating")
                .children(".rating-star-container")
                .children("span:last-child")
                .children(".rating-star-counter")
                .text(),
              notaAvaliacao: ""
            });
          }
        });
        done();
      //console.log(jsonObject);
    }
    
    myRequest(jsonObject);

  }
});


c1.queue({
  uri:
    "https://www.americanas.com.br/busca/relogios-masculinos?ordenacao=rating",
  parameter1: "https://www.americanas.com.br"
});




