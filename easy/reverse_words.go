package main
import (
"fmt"
"os"
"io/ioutil"
"strings"
)

func main() {
  args := os.Args
  content, err := ioutil.ReadFile(args[1])
  if err != nil {
    fmt.Println("Watch out!")
  }
  lines := strings.Split(string(content), "\n")
  for j := 0; j < len(lines); j++ {
    words := strings.Split(lines[j]," ")
    l := len(words)
    for i := 0; i < l / 2; i++ {
      temp := words[i]
      words[i] = words[l - i - 1]
      words[l - i - 1] = temp
    }
   fmt.Println(strings.Join(words," "))
  }
}