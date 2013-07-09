package main
import (
"fmt"
"os"
"io/ioutil"
"strings"
"strconv"
)

func main(){
  args := os.Args
  content, err := ioutil.ReadFile(args[1])
  if err != nil {
    fmt.Println(err)
  }
  lines := strings.Split(string(content), "\n")
  for i := 0; i < len(lines); i++ {
    if len(lines[i]) > 0 {
      coords := convertCoords(lines[i])
      if isSquare(coords){
        fmt.Println("true")
      } else{
        fmt.Println("false")
      }
    }
  }
}

func convertCoords(str string) [][]int {
  coords := strings.Split(str," ")
  coordsArray := make([][]int, 4)
  for i := range coordsArray {
    coordsArray[i] = make([]int, 2)
  }
  for i := range coords {
    nums := strings.Split(coords[i],",")
    a, err := strconv.Atoi(strings.TrimLeft(nums[0], " ("))
    b, err := strconv.Atoi(strings.TrimRight(nums[1],"),\n"))
    coordsArray[i][0] = a
    coordsArray[i][1] = b
    if err != nil {
      fmt.Println(err)
    }
  }
  return coordsArray
} 

func distanceSquared(coord1, coord2 []int) int {
  dx := coord2[0] - coord1[0]
  dy := coord2[1] - coord1[1]
  return dx*dx + dy*dy
}

func isSquare(coords [][]int) bool {
  AB := distanceSquared(coords[0],coords[1]) 
  AC := distanceSquared(coords[0],coords[2]) 
  AD := distanceSquared(coords[0],coords[3])
  BC := distanceSquared(coords[1],coords[2]) 
  BD := distanceSquared(coords[1],coords[3]) 
  CD := distanceSquared(coords[2],coords[3]) 

  if AB == AD && AC == BD && BC == AB && BC == CD {
    return true
  } else if AC == AD && AB == CD && AC == BC && BC == BD {
    return true
  } else if AC == AB && AD == BC && AB == BD && BD == CD {
    return true
  }

  return false
}