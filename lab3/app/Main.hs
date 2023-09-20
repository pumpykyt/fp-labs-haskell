module Main where

import Data.IORef (newIORef, readIORef, writeIORef)

-- Функція createCounter створює лічильник і повертає функцію, яка може бути використана для збільшення лічильника.
createCounter :: IO (IO Int)
createCounter = do
  countRef <- newIORef 0  -- Створюємо IORef для збереження значення лічильника
  return $ do
    currentCount <- readIORef countRef  -- Зчитуємо поточне значення лічильника
    let newCount = currentCount + 1
    writeIORef countRef newCount  -- Збільшуємо лічильник на 1
    return newCount

main :: IO ()
main = do
  counter <- createCounter
  putStrLn "Calling the counter:"
  count1 <- counter
  putStrLn $ "Count: " ++ show count1
  count2 <- counter
  putStrLn $ "Count: " ++ show count2