(def nums
  (->>
    (slurp "day1")
    (string/split "\n")
    (map |(scan-number $))))

(def calories
    (->> nums
        (partition-by nil?)
        (filter |(number? (first $)))
        (map sum)))

# part 1
(pp (reduce max 0 calories))

# part 2
(pp (sum (take 3 (sort calories >))))
