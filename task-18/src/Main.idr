module Main

import Data.Vect
import Triangle
import Task18Solution


data FPSolution
  = TailRecursion
  | Recursion
  | Folding
  | Mapping
  | Loops
  | InfiniteList

task18 : (solution: FPSolution) -> Integer
task18 TailRecursion = ?tailRecursionSolution givenTriangleMatrix
task18 Recursion = recursiveSolution givenTriangleMatrix
task18 Folding = foldingSolution givenTriangleMatrix
task18 Mapping = ?mappingSolution givenTriangleMatrix
task18 Loops = ?loopSolution givenTriangleMatrix
task18 InfiniteList = ?infiniteListSolution givenTriangleMatrix


main : IO ()
main = do
  let solution = Recursion
      result = task18 solution
      strRes = show result
      strAns = show maxPath

  putStr strRes
  putStr (if strRes == strAns then " = " else " /= ")
  putStrLn strAns
