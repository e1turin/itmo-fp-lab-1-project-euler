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


recursiveSolution : Triangle -> Integer
recursiveSolution (GivenTriangle nums) = go nums 0 0
  where
    go : {depth : Nat} ->
         {width : Nat} ->
         Vect depth (Vect width Integer) ->
         (i: Nat) ->
         (j: Nat) ->
         Integer
    go {depth = 0} _ _ _ = 0
    go {width = 0} _ _ _ = 0
    go {depth = n} {width = m} xss i j
      = case (i `isLT` n, j `isLT` m) of
            ((Yes _), (Yes _)) =>
              let x = xss |> index (natToFinLT i) |> index (natToFinLT j)
                  left = assert_total $ go xss (i + 1) j
                  right = assert_total $ go xss (i + 1) (j + 1)
                in x + (max left right)
            (_, _) => 0


task18 : (solution: FPSolution) -> Integer
task18 TailRecursion = ?tailRecursionSolution givenTriangle
task18 Recursion = recursiveSolution givenTriangle
task18 Folding = ?foldingSolution givenTriangle
task18 Mapping = ?mappingSolution givenTriangle
task18 Loops = ?loopSolution givenTriangle
task18 InfiniteList = ?infiniteListSolution givenTriangle

main : IO ()
main = do
  let solution = Recursion
      result = task18 solution
      strRes = show result
      strAns = show maxPath

  putStr strRes
  putStr (if strRes == strAns then " = " else " /= ")
  putStrLn strAns
