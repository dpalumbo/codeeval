//works fast enough, but consumes > 20 MB
function valid(pos) {
  return (sumDigits(Math.abs(pos[0])) + sumDigits(Math.abs(pos[1]))) <= 19;
}

function sumDigits(n) {
  n = n.toString().split("");
  var sum = 0;                               
  for (var i = 0; i < n.length; i++) {  
    sum += parseInt(n[i]);      
  }
  return sum;                             
}

visited = {};
stack = [];
stack.push([0,0]);

while(stack.length > 0){
  pos = stack.pop();
  visited[pos] = true;
  newPos = [[pos[0], pos[1] + 1], [pos[0], pos[1] - 1], [pos[0] + 1, pos[1]], [pos[0] - 1, pos[1]]];
  for(var i in newPos){
  if (!visited[newPos[i]] && valid(newPos[i])) stack.push(newPos[i]);
  }
}

console.log(Object.keys(visited).length);