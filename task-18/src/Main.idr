module Main

import Triangle

maxPath : (i: Integer) -> (j: Integer)
       -> (triangle: List (List Integer))
       -> Integer
maxPath i j triangle = ?maxPath_rhs

task18 : Integer
task18 = maxPath 0 0 triangle

main : IO ()
main = putStrLn (show task18)