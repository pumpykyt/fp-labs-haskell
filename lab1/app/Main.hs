module Main (main) where

import Lib

type T = Int

--сигнатура функції
task1 :: (T -> T -> T) -> [T] -> [(Int, Int)] -> [T]

task1 op arr ranges = map applyOpToRange ranges
  -- Визначення функції task1: застосовує applyOpToRange до кожного елементу в масиві ranges
  where
    applyOpToRange (start, end) = foldl1 op (drop start (take end arr))
      -- Визначення локальної функції applyOpToRange для обчислення результату операції на певному діапазоні.

main :: IO ()
-- Сигнатура головної функції main: програма починається звідси.

main = do
  let op = (+)  -- Приклад операції (можете змінити на свою)
      arr = [1, 2, 3, 4, 5]  -- Приклад масиву
      ranges = [(0, 3), (1, 4)]  -- Приклад діапазонів
      result = task1 op arr ranges
      -- Визначення змінних op, arr, ranges, та result для використання в обчисленнях.

  print result  -- Виведення результату на екран.