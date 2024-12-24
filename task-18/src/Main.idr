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


indexMatrixByNat : {hight : Nat} ->
                   {width : Nat} ->
                   Vect hight (Vect width Integer) ->
                   (i: Nat) ->
                   (j: Nat) ->
                   Maybe Integer
indexMatrixByNat {hight = 0} _ _ _ = Nothing
indexMatrixByNat {width = 0} _ _ _ = Nothing
indexMatrixByNat {hight = n} {width = m} xss i j
  = case (i `isLT` n, j `isLT` m) of
         ((Yes _), (Yes _)) => Just $ xss |> index (natToFinLT i) |> index (natToFinLT j)
         (_, _) => Nothing


recursiveSolution : Triangle -> Integer
recursiveSolution (GivenTriangleMatrix nums) = go nums 0 0
  where
    go : {depth : Nat} ->
         {width : Nat} ->
         Vect depth (Vect width Integer) ->
         (i: Nat) ->
         (j: Nat) ->
         Integer
    go {depth} {width} xss i j
      = let Just x = indexMatrixByNat xss i j | Nothing => 0
            left = assert_total (go xss (i + 1) j)
            right = assert_total (go xss (i + 1) (j + 1))
          in x + max left right


foldingSolution : Triangle -> Integer
foldingSolution (GivenTriangleMatrix nums) = ?fold


task18 : (solution: FPSolution) -> Integer
task18 TailRecursion = ?tailRecursionSolution ?givenTriangle_0
task18 Recursion = recursiveSolution givenTriangleMatrix
task18 Folding = foldingSolution ?givenTriangle_1
task18 Mapping = ?mappingSolution ?givenTriangle_2
task18 Loops = ?loopSolution ?givenTriangle_3
task18 InfiniteList = ?infiniteListSolution ?givenTriangle_4


main : IO ()
main = do
  let solution = Recursion
      result = task18 solution
      strRes = show result
      strAns = show maxPath

  putStr strRes
  putStr (if strRes == strAns then " = " else " /= ")
  putStrLn strAns
