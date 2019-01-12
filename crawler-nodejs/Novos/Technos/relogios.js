const fs = require("fs");

const cheerio = require('cheerio');

var jsonObject = [];
var fileName = "technos-relogios.json";
var stringHtml;
var colections = [
  "Steel",
  "Performance Racer",
  "Racer",
  "Golf",
  "Unissex Classic Slim",
  "Calendário Lunar",
  "Unissex Classic",
  "Unissex Slim",
  "Skymaster",
  "Legacy",
  "Ts Digiana",
  "Classic Steel",
  "Militar",
  "Executive",
  "Grandtech",
  "Ts Carbon",
  "Performance",
  "Classic Legacy",
  "Slim",
  "Riviera",
  "Classic Ceramic/Saphire",
  "Classic Automatico",
  "Essence",
  "Automatico",
  "Skydiver",
  "Carbon",
  "Ceramic",
  "Vitra",
  "Acqua",
  "Solar"
];



fs.readFile('relogios-page.html', 'utf-8', function(err, data){
  var linhas = data.split(/\r?\n/);
  linhas.forEach(function(linha){
     //console.log(linha);
     stringHtml = stringHtml + linha;
  })

  const $ = cheerio.load(stringHtml);
  var whitoutSpace;
  var wristWatchName;
  var colection;
  $(".product").each(function() {
    whitoutSpace = $(this).children('.product__group').children('.product__price').children('.product__price--installment').text();
    wristWatchName = $(this).children('h2').children('a').attr('title');
    
    colection = '';

    for(var i = 0; i < colections.length; i++){
      if(wristWatchName.indexOf(colections[i]) != -1){
        colection = colections[i];
      }
    }
    if(colection != ''){
      jsonObject.push({
        nome: wristWatchName,
        preco: $(this).children('.product__group').children('.product__price').children('.product__price--bestprice').text(),
        colecao: colection,
        marca: 'Technos',
        parcelas: whitoutSpace.replace(/\s/g, '')
      });
    }
  });

  var json = JSON.stringify(jsonObject);
  console.log(jsonObject);
  fs.createWriteStream(fileName).write(json);

})
