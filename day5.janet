(def lines
  (string/split "\n" (slurp "day5")))
# get rid of nil value at the end
(array/pop lines)

(def setup-lines (take 8 lines))
(def command-lines (drop 10 lines))

(def stacks [@[] @[] @[] @[] @[] @[] @[] @[] @[]])
(defn parse-crates [line]
  (def pat '(any (* "[" (<- (* :a (position))) "]" (any " "))))
  (loop [[pos letter] :in (partition 2 (peg/match pat line))]
    (def index (/ (- pos 2) 4))
    (array/push (stacks index) letter)))
(each line (reverse setup-lines) (parse-crates line))

(defn do-command [line]
  (def command-pat '(* "move " (<- (some :d)) " from " ':d " to " ':d))
  (def [move from to] (map scan-number (peg/match command-pat line)))
  (repeat move (array/push (stacks (dec to)) (array/pop (stacks (dec from)))))
  (pp stacks))

(each line command-lines (do-command line))
(pp (string/join (filter (comp not nil?) (map last stacks))))