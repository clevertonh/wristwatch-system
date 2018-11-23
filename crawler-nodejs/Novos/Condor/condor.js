const fs = require("fs");

const cheerio = require('cheerio');

var jsonObject = [];
var fileName = "condor-relogios.json";
var stringHtml;


fs.readFile('condor-page.html', 'utf-8', function(err, data){
  var linhas = data.split(/\r?\n/);
  linhas.forEach(function(linha){
     //console.log(linha);
     stringHtml = stringHtml + linha;
  })

  const $ = cheerio.load(stringHtml);
  var whitoutSpace;
  $(".product").each(function() {
    whitoutSpace = $(this).children('.product__group').children('.product__price').children('.product__price--installment').text();
    jsonObject.push({
      nome: $(this).children('h2').children('a').attr('title'),
      preco: $(this).children('.product__group').children('.product__price').children('.product__price--bestprice').text(),
      colecao: '',
      marca: 'Technos',
      parcelas: whitoutSpace.replace(/\s/g, '')
    });

  });

  var json = JSON.stringify(jsonObject);
  console.log(jsonObject);
  fs.createWriteStream(fileName).write(json);

})

