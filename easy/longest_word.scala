object Main extends App {
  val source = scala.io.Source.fromFile(args(0))
  val lines = source.getLines.filter(_.length > 0)
  for (l <- lines) {
    val words = l.split(" ")
    var champ = ""
    for (w <- words) {
       if (w.length > champ.length) {
           champ = w
       } 
    }
    println(champ)
  }
}