var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        var answer_line="";
        for(var i=0,len=line.length;i<len;i++){
            var ch = line[i].charCodeAt(0);
            if(ch<=90 && ch>=65){
                answer_line+=String.fromCharCode(ch+32);
            }
            else if(ch<=122 && ch>=97){
                answer_line+=String.fromCharCode(ch-32);
            }
            else{
                answer_line+=line[i];
            }  
        }
        console.log(answer_line);
    }
});