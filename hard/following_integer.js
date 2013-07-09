var fs  = require("fs");
function permutate(array, callback) { //permutate function from http://stackoverflow.com/questions/9960908/permutations-in-javascript
    function p(array, index, callback) {
      function swap(a, i1, i2) {
        var t = a[i1];
        a[i1] = a[i2];
        a[i2] = t;
      }

      if (index == array.length - 1) {
        callback(array);
        return 1;
      } else {
        var count = p(array, index + 1, callback);
        for (var i = index + 1; i < array.length; i++) {
          swap(array, i, index);
          count += p(array, index + 1, callback);
          swap(array, i, index);
        }
        return count;
      }
    }
    if (!array || array.length == 0) {
      return 0;
    }
    return p(array, 0, callback);
  }

function getUnique(arr){ // from http://stackoverflow.com/questions/1960473/unique-values-in-an-array
   var u = {}, a = [];
   for(var i = 0, l = arr.length; i < l; ++i){
      if(u.hasOwnProperty(arr[i])) {
         continue;
      }
      a.push(arr[i]);
      u[arr[i]] = 1;
   }
   return a;
}

fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
    if (line != "") {
        var nums = [];
        for(var i=0;i<line.length;i++){
            if(line[i]!="0") nums.push(line[i]);
        }
        for(var i=0,len=nums.length;i<line.length+1-len;i++){
            nums.push("0");
        }
        var result = [];
        permutate(nums, function (a) {
          result.push(a.slice(0));
        });
        var pattern = [];
        for(var i in result){
            pattern.push(parseInt(result[i].join(""),10));   
        }
        pattern = getUnique(pattern.sort(function(a,b){return a-b}));
        var answer_line = pattern[pattern.indexOf(parseInt(line))+1];
        console.log(answer_line.toString());
    }
});