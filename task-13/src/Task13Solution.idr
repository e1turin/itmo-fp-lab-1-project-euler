module Task13Solution

import Numbers
import Data.List.Lazy


%default total


export
tailRecursiveSolution : Numbers -> Integer
tailRecursiveSolution (GivenNumbers nums) = go nums 0
  where
    go : LazyList Integer -> Integer -> Integer
    go [] acc = acc
    go (x :: xs) acc = go xs (acc + x)

export
recursiveSolution : Numbers -> Integer
recursiveSolution (GivenNumbers []) = 0
recursiveSolution (GivenNumbers (x :: xs)) = assert_total $ -- TODO: remove assertion somehow
  recursiveSolution (GivenNumbers xs) + x

export
foldingSolution : Numbers -> Integer
foldingSolution (GivenNumbers nums) = foldl (+) 0 nums

