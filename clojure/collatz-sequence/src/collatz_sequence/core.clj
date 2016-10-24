(ns collatz-sequence.core
  (:gen-class))

(defn- even-collatz-number
  [n]
  (/ n 2))

(defn- odd-collatz-number
  [n]
  (inc (* 3 n)))

(defn- calculate-sequence
  ([n] (calculate-sequence n 1))
  ([n sequence-length]
   (if (= 1 n)
     sequence-length
     (calculate-sequence
      (if (even? n)
        (even-collatz-number n)
        (odd-collatz-number n))
      (inc sequence-length)))))

(defn- format-element
  [element]
  [(inc(first element)) (second element)])

(defn -main
  []
  (->>
   (map calculate-sequence (range 1 1000000))
   (map-indexed vector)
   (apply max-key second)
   (format-element)))
