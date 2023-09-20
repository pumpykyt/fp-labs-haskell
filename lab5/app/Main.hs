module Main (main) where

import Lib
import Debug.Trace (trace)
import Data.Char (toLower)

main :: IO ()
main = do
    putStrLn "Think of a number from 0 to 99."
    guessNumber 0 99

guessNumber :: Int -> Int -> IO ()
guessNumber low high
    | low == high = putStrLn $ "Your intended number is " ++ show low ++ "!"
    | otherwise = do
        let mid = (low + high) `div` 2
        putStrLn $ "Is the intended number less than " ++ show mid ++ "? (Yes/No)"
        response <- getLine
        case map toLower response of  -- Перетворити ввід користувача в нижній регістр для порівняння без урахування регістру
            "yes" -> guessNumber low mid
            "no" -> guessNumber (mid + 1) high
            _ -> do
                putStrLn "Invalid response. Please enter Yes or No."
                guessNumber low high