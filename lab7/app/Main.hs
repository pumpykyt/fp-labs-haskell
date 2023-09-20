import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

-- Y-комбінатор Каррі
y :: (a -> a) -> a
y f = f (y f)

-- Функція для відображення графічного представлення
displayYCombinator :: Diagram B
displayYCombinator = diag
  where
    diag :: Diagram B
    diag = vcat [circle 1 # lw ultraThick, text "Y"]

main :: IO ()
main = mainWith displayYCombinator