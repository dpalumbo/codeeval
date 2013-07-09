package main
import (
"fmt"
"os"
"io/ioutil"
"strings"
"strconv"
"math"
"sort"
"regexp"
)

//Note: not working 100%

func main() {
  args := os.Args
  content, err := ioutil.ReadFile(args[1])
  if err != nil {
    fmt.Println(err)
  }
  lines := strings.Split(string(content), "\n")
  for i := range lines {
    if len(lines[i]) > 0 {
      customers, items := getCustomersAndItems(lines[i])
      max := maximizeCompatibility(customers, items)
      fmt.Println(strconv.FormatFloat(max, 'f', 2, 64))
    }
  }
}

func getCustomersAndItems(str string) (customers, items []string) {
  all := strings.Split(str,";")
  customers = strings.Split(all[0],",")
  items = strings.Split(all[1],",")
  return customers, items
}

func maximizeCompatibility(customers, items []string) float64 {
  diffTable := make([][]float64, len(customers))
  for i := range diffTable {
    diffTable[i] = make([]float64, len(items))
    for j := range diffTable[i] {
      temp := make([]float64, len(items))
      for k := range items {
        temp[k] = getSS(customers[i],items[j]) - getSS(customers[i],items[k])
      }
      sort.Float64s(temp)
      diffTable[i][j] = temp[0] //lol
    }
  }
  total := 0.
  for i := range items {
    temp := make([]float64, len(customers))
    for j := range customers {
      if customers[j] != "" {
        temp[j] = diffTable[j][i]
      } else {
        temp[j] = math.Inf(-1)
      }
    }
    idx := maxIndex(temp)
    total += getSS(customers[idx],items[i])
    customers[idx] = ""
  }
  return total  
}

func maxIndex(arr []float64) int {
  champ := math.Inf(-1)
  idx := 0
  for i := range arr {
    if arr[i] > champ {
      champ = arr[i]
      idx = i
    }
  }
  return idx
}

func getSS(customer, product string) float64 {
  numVowCust := numVowels(customer)
  numLetCust := numLetters(customer)
  numLetProd := numLetters(product)
  ss := 0.
  if numLetProd & 1 == 0 {
    ss = float64(numVowCust) * 1.5
  } else {
    ss = float64(numLetCust - numVowCust)
  }
  if shareFactors(numLetCust,numLetProd){
    ss *= 1.5
  }
  return ss
}

func shareFactors(a, b int) bool {
  m := int(math.Min(float64(a),float64(b)))
  for i := 2; i < m; i++ {
    if a % i == 0 && b % i == 0 {
      return true
    }
  }
  return false
}

func numLetters(str string) int {
  count := 0
  letters := regexp.MustCompile(`[A-Z]|[a-z]`)
  for i := 0; i < len(str); i++ {
    temp := make([]byte,1)
    temp[0] = str[i]
    if letters.Match(temp) {
      count++
    } 
  }
  return count
}

func numVowels(str string) int {
  count := 0
  vowels := regexp.MustCompile(`A|E|I|O|U|Y|a|e|i|o|u|y`)
  run := []rune(str)
  for i := 0; i < len(run); i++ {
    c := make([]byte,1)
    c[0] = str[i]
    if vowels.Match(c) {
      count++
    }
  }
  return count
}