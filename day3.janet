(def lines
(string/split "\n" (slurp "day3")))

# get rid of nil value at the end
(array/pop lines)

(def priority-table (table ;(interleave "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWKYZ" (range 1 53))))

(defn find-matching-char (line)
(let [half-index (/ (length line) 2)
      compartment-one (string/slice line 0 half-index)
      compartment-two (string/slice line half-index)]
  (find (fn (char) (some |(= $ char) compartment-one)) compartment-two)))

(def part-one
(->> lines
     (map find-matching-char)
     (map priority-table)
     (sum)))
(pp part-one)

(def groups (partition 3 lines))
(defn part-two (line)
(priority-table ((invert (frequencies (flatten (map distinct line)))) 3)))
(pp (sum (map part-two groups)))