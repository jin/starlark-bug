object Echo {

  def main(args: Array[String]): Unit = {
    // val workingVerboseDescription = args.zipWithIndex
    //   .map {
    //     case (arg, index) => s"\t$index: '$arg'"
    //   }
    //   .mkString("Arguments:\n", "\n", "")
    // println(workingVerboseDescription)

   val failingVerboseDescription = args.zipWithIndex
     .map {
       case (arg, index) => s"\t$index: '${arg.linesIterator.mkString("\\n")}'"
     }
     .mkString("Arguments:\n", "\n", "")
   println(failingVerboseDescription)
  }
}
