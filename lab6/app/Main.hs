import Control.Monad.Fix (mfix)

-- Функція Y-комбінатора
yCombinator :: (a -> a) -> a
yCombinator f = f (yCombinator f)

-- Обчислення факторіалу за допомогою рекурсивної функції
recursiveFactorial :: Integer -> Integer
recursiveFactorial 0 = 1
recursiveFactorial n = n * recursiveFactorial (n - 1)

-- Перетворення факторіалу в нерекурсивну функцію за допомогою Y-комбінатора
nonRecursiveFactorial :: Integer -> Integer
nonRecursiveFactorial = yCombinator $ \f n ->
  if n == 0
    then 1
    else n * f (n - 1)

main :: IO ()
main = do
  putStrLn "Recursive factorial of 5:"
  print (recursiveFactorial 5)

  putStrLn "Non-recursive factorial of 5 (using Y-combinator):"
  print (nonRecursiveFactorial 5)