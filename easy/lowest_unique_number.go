package main
import (
"fmt"
"os"
"io/ioutil"
"strings"
"strconv"
"sort"
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
      words := strings.Split(lines[i]," ")
      nums := make([]int, len(words))
      for j := range nums {
        n, err := strconv.Atoi(words[j])
        if err != nil {
          fmt.Println(err)
        }
        nums[j] = n
      }
      fmt.Println(lowestUniqueIndex(nums))
    }
  }
}

func lowestUniqueIndex(nums []int) int {
  m := make(map[int]int)
  for i := range nums {
    _, ok := m[nums[i]]
    if ok {
      m[nums[i]]++
    } else {
      m[nums[i]] = 1
    }
  }
  singles := []int{}
  for key, value := range m {
    if value == 1 {
      singles = append(singles, key)
    }
  }  
  if len(singles) == 0 {
    return 0
  }
  sort.Ints(singles)
  min := singles[0] //convenient!
  for i := range nums {
    if nums[i] == min {
      return i + 1
    }
  }
  return 0
} 