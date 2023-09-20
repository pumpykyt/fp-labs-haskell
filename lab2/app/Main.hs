module Main (main) where

import Lib

-- Створюємо синонім типу для Int з новим ім'ям MyInt
type MyInt = Int

-- Створюємо синонім типу для списку з параметром типу
type MyList a = [a]

main :: IO ()
main = do
    let myList = [1, 2, 3]
    let result = lengthMyList myList
    putStrLn ("Length of test list: " ++ show result)


-- Використовуємо наші синоніми типів
myInt :: MyInt
myInt = 42

myList :: MyList Int
myList = [1, 2, 3]

-- Функція, яка приймає список MyList a і повертає його довжину
lengthMyList :: MyList a -> MyInt
lengthMyList = length