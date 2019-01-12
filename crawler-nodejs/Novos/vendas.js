const fs = require("fs");

const cheerio = require('cheerio');

var jsonObject = [];
var fileName = "venda.json";


for(var i=819; i<=1512; i++){
    if(i>=819 && i<=824){
        jsonObject.push({
            id: i,
            vendedor: "Montblanc"
        })
    }
    else if(i>=825 && i<=1123){
        jsonObject.push({
            id: i,
            vendedor: "Condor"
        })
    }
    else {
        jsonObject.push({
            id: i,
            vendedor: "Technos"
        })
    }
}

var json = JSON.stringify(jsonObject);
console.log(jsonObject);
fs.createWriteStream(fileName).write(json);

