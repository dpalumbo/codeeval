#include <stdio.h>

int main(int argc, char *argv[]){  
  FILE* f = fopen(argv[1], "r");
  char line[1024];
  while (fgets(line, 1024, f)){
    if (line[0] == '\n'){
      continue;
    }
    printf("%d\n", fib(atoi(line)));
  }
  return 0;
}

int fib(int n){
  int i = 0;
  int arr[n + 1]; 
  arr[0] = 0;
  arr[1] = 1;
  for(i = 0; i < (n - 1); i++){
    arr[i + 2] = arr[i + 1] + arr[i];
  }
  return arr[n];
}