module Triangle

import Data.Vect


public export
data Triangle : Type where
  GivenTriangleMatrix : (nums: Vect 15 (Vect 15 Integer)) -> Triangle

export
Show Triangle where
  show (GivenTriangleMatrix nums) = show nums

--- Special representation of given numbers for convenien usage of dependent types ---
matrix : Vect 15 (Vect 15 Integer)
matrix =
  [ [75,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
  , [95, 64,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
  , [17, 47, 82,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
  , [18, 35, 87, 10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
  , [20,  4, 82, 47, 65,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0]
  , [19,  1, 23, 75,  3, 34,  0,  0,  0,  0,  0,  0,  0,  0,  0]
  , [88,  2, 77, 73,  7, 63, 67,  0,  0,  0,  0,  0,  0,  0,  0]
  , [99, 65,  4, 28,  6, 16, 70, 92,  0,  0,  0,  0,  0,  0,  0]
  , [41, 41, 26, 56, 83, 40, 80, 70, 33,  0,  0,  0,  0,  0,  0]
  , [41, 48, 72, 33, 47, 32, 37, 16, 94, 29,  0,  0,  0,  0,  0]
  , [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14,  0,  0,  0,  0]
  , [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57,  0,  0,  0]
  , [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48,  0,  0]
  , [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31,  0]
  , [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]
  ]

export
givenTriangleMatrix : Triangle
givenTriangleMatrix = GivenTriangleMatrix matrix


--- More general representation of given numbers ---
piramid : List (List Integer)
piramid =
  [ [75]
  , [95, 64]
  , [17, 47, 82]
  , [18, 35, 87, 10]
  , [20,  4, 82, 47, 65]
  , [19,  1, 23, 75,  3, 34]
  , [88,  2, 77, 73,  7, 63, 67]
  , [99, 65,  4, 28,  6, 16, 70, 92]
  , [41, 41, 26, 56, 83, 40, 80, 70, 33]
  , [41, 48, 72, 33, 47, 32, 37, 16, 94, 29]
  , [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14]
  , [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57]
  , [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48]
  , [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31]
  , [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]
  ]

-- NOTE: Currently not used, it remains to find more convenient solutions in other ways.
export
givenTrianglePiramid : Triangle
givenTrianglePiramid = ?givenTrianglePiramidCtor piramid

export
maxPath : Integer
maxPath = 1074
