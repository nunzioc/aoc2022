(def games
  (string/split "\n" (slurp "day2")))

# get rid of nil value at the end
(array/pop games)

(def part1-score {
  "A X" 4 # my Rock ties Rock
  "B X" 1 # my Rock loses to Paper
  "C X" 7 # my Rock beats Scissors
  "A Y" 8 # my Paper beats Rock 
  "B Y" 5 # my Paper ties Paper
  "C Y" 2 # my Paper loses to Scissors
  "A Z" 3 # my Scissors loses to Rock
  "B Z" 9 # my Scissors beats Paper
  "C Z" 6 # my Scissors ties Scissors
  })

(def part2-score {
  "A X" 3 # my Scissors loses to Rock
  "B X" 1 # my Rock loses to Paper
  "C X" 2 # my Paper loses to Scissors
  "A Y" 4 # my Rock ties Rock 
  "B Y" 5 # my Paper ties Paper
  "C Y" 6 # my Scissors ties Scissors
  "A Z" 8 # my Paper beats Rock
  "B Z" 9 # my Scissors beats Paper
  "C Z" 7 # my Rock beats Scissors
  })

(pp (sum (map part1-score games)))
(pp (sum (map part2-score games)))
