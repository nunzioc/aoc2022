(def signal (slurp "day6"))

(defn windows [len ind]
  (seq [i :range-to [0 (- (length ind) len)]]
    (slice ind i (+ i len))))

(defn find-unique-seq [seq-size]
  (->> (windows seq-size signal)
       (map distinct)
       (find-index |(= seq-size (length $)))
       (+ seq-size)))

(pp (find-unique-seq 4))
(pp (find-unique-seq 14))
