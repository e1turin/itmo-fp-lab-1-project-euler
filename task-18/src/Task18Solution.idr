module Task18Solution

import Data.Vect
import Triangle


%default total


export
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


export
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


export
foldingSolution : Triangle -> Integer
foldingSolution (GivenTriangleMatrix nums) = ?fold
