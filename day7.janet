(def lines
  (string/split "\n" (slurp "day7")))
# get rid of nil value at the end
(array/pop lines)

(def filesystem @{})
(var cwd filesystem)
# skip the first $ cd / command
(loop [line :in (slice lines 1)]
  (def name (last (string/split " " line)))
  (cond
    (string/has-prefix? "$ cd" line) (set cwd (cwd name))
    (string/has-prefix? "$ ls" line) nil
    (string/has-prefix? "dir" line) (set (cwd name) @{".." cwd})
    (set (cwd name) (scan-number (first (string/split " " line))))))

(def sizes @[])
(defn get-size [dir]
  (set (dir "..") nil)
  (def size
    (reduce
      (fn [acc val] (+ acc (if (table? val) (get-size val) val)))
      0
      dir))
  (array/push sizes size)
  size)
(get-size filesystem)
(pp (sum (filter (partial > 100000) sizes)))

(def total-size (last sizes))
(def amount-to-remove (- total-size 40000000))
(def possible-dirs (filter |(> $ amount-to-remove) sizes))
(pp (first (sorted possible-dirs)))
