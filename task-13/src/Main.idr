module Main

import Numbers
import Data.List.Lazy

task13 : Integer
task13 = sum numbers

main : IO ()
main = let 
  result = task13 in 
  putStrLn (substr 0 10 (show result))
