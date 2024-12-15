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
    go : {depth : Nat}
      -> {width : Nat}
      -> Vect depth (Vect width Integer)
      -> (i: Nat)
      -> (j: Nat)
      -> Integer
    go {depth = 0} _ _ _ = 0
    go {width = 0} _ _ _ = 0
    go {depth = n} {width = m} xss i j
      = let prfFinI = natToFin i n
            prfFinJ = natToFin j m
          in case (prfFinI, prfFinJ) of
              (Nothing, _) => 0
              (_, Nothing) => 0
              (Just fi, Just fj) =>
                let x = (index fj (index fi xss))
                    left = assert_total (go xss (i + 1) j)
                    right = assert_total (go xss (i + i) (j + 1))
                  in x + (max left right)


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
