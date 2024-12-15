module Main

import Data.Vect
import Triangle

%default total

data FPSolution
  = TailRecursion
  | Recursion
  | Folding
  | Mapping
  | Loops
  | InfiniteList


recursionSolution : Triangle -> Integer
recursionSolution x = ?recursionSolution_rhs

task18 : (solution: FPSolution) -> Integer
task18 TailRecursion = ?tailRecursionSolution givenTriangle
task18 Recursion = recursionSolution givenTriangle
task18 Folding = ?foldingSolution givenTriangle
task18 Mapping = ?mappingSolution givenTriangle
task18 Loops = ?loopSolution givenTriangle
task18 InfiniteList = ?infiniteListSolution givenTriangle

main : IO ()
main = do
  let solution = TailRecursion
      result = task18 solution
      strRes = substr 0 10 (show result)
      strAns = ""

  putStr strRes
  putStr (if strRes == strAns then " = " else " /= ")
  putStrLn strAns
