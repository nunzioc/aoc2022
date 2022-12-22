(def lines
  (string/split "\n" (slurp "day5")))
# get rid of nil value at the end
(array/pop lines)

(def setup-lines (take 8 lines))
(def command-lines (drop 10 lines))

(var stacks [@[] @[] @[] @[] @[] @[] @[] @[] @[]])
(defn parse-crates [line]
  (def pat '(any (* "[" (<- (* :a (position))) "]" (any " "))))
  (loop [[pos letter] :in (partition 2 (peg/match pat line))]
    (def index (/ (- pos 2) 4))
    (array/push (stacks index) letter)))
(each line (reverse setup-lines) (parse-crates line))

(defn part-one [[move from to]]
  (repeat move (array/push (stacks (dec to)) (array/pop (stacks (dec from))))))

(defn part-two [[move from to]]
  (def from-stack (stacks (dec from)))
  (def to-stack (stacks (dec to)))
  (def neg-index (- (inc move)))
  (array/insert to-stack (length to-stack) (splice (slice from-stack neg-index)))
  (array/remove from-stack neg-index move)
  (pp from-stack))

(defn do-command [line func]
  (def command-pat '(* "move " (<- (some :d)) " from " ':d " to " ':d))
  (def nums (map scan-number (peg/match command-pat line)))
  (func nums))

(defn print-tops []
  (pp (string/join (filter (comp not nil?) (map last stacks)))))
(each line command-lines (do-command line part-one))
(print-tops)

(set stacks [@[] @[] @[] @[] @[] @[] @[] @[] @[]])
(each line (reverse setup-lines) (parse-crates line))
(each line command-lines (do-command line part-two))
(print-tops)
