var Crawler = require("crawler");
const fs = require("fs");

var jsonObject = [];
var fileName = "americanas-exemplo.json";

var c1 = new Crawler({
  maxConnections: 2,
  callback: function(error, res, done) {
    if (error) {
      console.log(error);
    } else {
      var $ = res.$;
      $(".card-product-url")
        .slice(0, 5)
        .each(function() {
          var details = $(this).children(".card-product-details");
          if (details.children(".card-product-info-unavailable").length == 0) {
            jsonObject.push({
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
                .text()
            });
          }
        });
        done();
    }
    
    var json = JSON.stringify(jsonObject);
    fs.createWriteStream(fileName).write(json);

  }
});

c1.queue({
  uri:
    "https://www.americanas.com.br/busca/relogio-masculino?ordenacao=rating"
});




