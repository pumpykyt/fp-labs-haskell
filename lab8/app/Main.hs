import Diagrams.Prelude
import Diagrams.Backend.SVG

-- Define a function to create a Venn diagram for GCD calculation
gcdVennDiagram :: Int -> Int -> Diagram B
gcdVennDiagram x y =
  let circleRadius = 1.0

      -- Create two circles for the numbers x and y
      circleX = circle circleRadius # fc lightblue # translateX (-0.5)
      circleY = circle circleRadius # fc lightgreen # translateX 0.5

      -- Calculate the GCD of x and y
      gcdValue = gcd x y

      -- Create a circle for the GCD value
      gcdCircle = circle circleRadius # fc lightcoral

      -- Calculate the factors common to both numbers
      commonFactors = [n | n <- [1..gcdValue], x `mod` n == 0 && y `mod` n == 0]

      -- Create a label for the common factors
      commonFactorLabel = text (show commonFactors) # fontSizeL 0.1 # translateY (-0.2)

      -- Position the label above the GCD circle
      positionedCommonFactorLabel = commonFactorLabel # translateX (-0.25)

      -- Combine the circles and labels with explicit layering
      vennDiagram =
        positionedCommonFactorLabel `atop`
        gcdCircle `atop`
        (circleX <> circleY)

  in
    vennDiagram

main :: IO ()
main = do
  let gcdDiagram = gcdVennDiagram 9 10
  renderSVG "gcd_venn_diagram.svg" (mkWidth 400) (gcdDiagram # frame 1)
