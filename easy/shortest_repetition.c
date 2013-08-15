#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  FILE* f = fopen(argv[1], "r");
  char line[81];
  while (fgets(line, 81, f)) {
    if (line[0] == '\n'){
      continue;
    }
    printf("%d\n", smallestPeriod(line));
  }
  return 0;
}

int smallestPeriod(char str[]) {
  char c = str[0];
  int i = 1, k, l = strlen(str);;
  while (str[i] != '\0') {
    if (str[i] == c) {
      for (k = i; k < l; k++) {
        if (strncmp(str, str + i * k, i) != 0) break;
	if (k + i == l) return i;
      }
      return i;	    
    }
    i++;
  }
  return 1;
}
