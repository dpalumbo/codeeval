package main
import (
"fmt"
"os"
"io/ioutil"
"strings"
"strconv"
)

func main() {
  args := os.Args
  content, err := ioutil.ReadFile(args[1])
  if err != nil {
    fmt.Println(err)
  }
  lines := strings.Split(string(content), "\n")
  for i := range lines {
    if len(lines[i]) > 0 {
      n, err := strconv.Atoi(lines[i])
      if err != nil {
        fmt.Println(err)
      }
      fmt.Println(waysToClimb(n))
    }
  }
}

func waysToClimb(remaining int) int {
  if remaining < 1 {
    return 0
  }
  if remaining == 1 {
    return 1 
  }
  if remaining == 2 {
    return 2
  }
  return waysToClimb(remaining - 1) + waysToClimb(remaining - 2)
}