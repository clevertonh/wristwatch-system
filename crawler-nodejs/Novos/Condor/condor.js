const fs = require("fs");

const cheerio = require('cheerio');

var jsonObject = [];
var fileName = "condor-relogios.json";
var stringHtml;
var collections = [
  "Civic",
  "Speed",
  "Casual",
  "Traqveller",
  "Anadigi",
  "Ferragens",
  "Casual Metal",
  "Casual Couro",
  "Metal E Couro",
  "Neon",
  "Xadrez",
  "Gradeados",
  "Ritmo Envolvente",
  "Militar",
  "3D Geométrico",
  "Urbano",
  "Prata",
  "Calotas",
  "Metal",
  "Couro"
];



fs.readFile('condor-page.html', 'utf-8', function(err, data){
  var linhas = data.split(/\r?\n/);
  linhas.forEach(function(linha){
     //console.log(linha);
     stringHtml = stringHtml + linha;
  })

  const $ = cheerio.load(stringHtml);
  var parcelas;
  var wristWatchName;
  var collection;
  $(".collection-link").each(function() {

    parcelas = $(this).children(".collection-content").children(".collection-main").children(".price").children(".preco-dividido").children(".txt-dividido").text();
    parcelas = parcelas + $(this).children(".collection-content").children(".collection-main").children(".price").children(".preco-dividido").children(".val-dividido").text();

    wristWatchName = $(this).children(".collection-content").children(".collection-name").children("div").text();
    
    collection = '';

    for(var i = 0; i < collections.length; i++){
      if(wristWatchName.indexOf(collections[i]) != -1){
        collection = collections[i];
      }
    }

    if(collection != ''){
      jsonObject.push({
        nome: wristWatchName,
        preco: $(this).children(".collection-content").children(".collection-main").children(".price").children(".preco-por").children(".val-por").text(),
        colecao: collection,
        marca: 'Condor',
        parcelas: parcelas.replace(/\s/g, '')
      });
    }
  });

  var json = JSON.stringify(jsonObject);
  console.log(jsonObject);
  fs.createWriteStream(fileName).write(json);

})
