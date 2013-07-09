var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
  if (line != "") {
    var menu = JSON.parse(line).menu;
    var total = 0;
    for (var i in menu.items) {
      if (menu.items[i] && menu.items[i].label) {
        total += menu.items[i].id;
      }
    }
    console.log(total);
  }
});