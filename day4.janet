(def lines
  (string/split "\n" (slurp "day4")))
# get rid of nil value at the end
(array/pop lines)

(defn get-numbers [line]
  (def numbers-str (map (partial string/split "-") (string/split "," line)))
  (map scan-number (flatten numbers-str)))

(defn part-one [line]
  (def numbers (get-numbers line))
  (def sorted-nums (sorted numbers))
  (def inner-pair (slice sorted-nums 1 3))
  (or (= (take 2 numbers) inner-pair) (= (drop 2 numbers) inner-pair)))
(pp
  (reduce (fn [acc val] (if val (inc acc) acc)) 0 (map part-one lines)))

(defn in-range [val begin end]
  (and (>= val begin) (<= val end)))

(defn part-two [line]
  (def [one-begin one-end two-begin two-end] (get-numbers line))
  (or (in-range one-begin two-begin two-end) (in-range two-begin one-begin one-end)))
(pp
  (reduce (fn [acc val] (if val (inc acc) acc)) 0 (map part-two lines)))
