#|Andrés Sebastián Arteaga Cabezas|#
;Ejercicio 4

(define (factorial a)
  (if (= a 0) 1
      (if (> a 0) (* a (factorial (- a 1)))
          (* a (factorial (+ a 1))))))

;;Ejecución
;;==========================================
;(factorial 5)