module Main (main) where

import Lib

productOfFive :: Int -> Int -> Int -> Int -> Int -> Int
productOfFive a b c d e = a * b * c * d * e

-- Частково застосувати функцію зі значеннями за замовчуванням для перших чотирьох аргументів
partialProduct :: Int -> Int
partialProduct = \e -> productOfFive 1 2 3 4 e

-- Приклад використання:
main :: IO ()
main = do
    let result = partialProduct 5
    putStrLn $ "Partial product: " ++ show result