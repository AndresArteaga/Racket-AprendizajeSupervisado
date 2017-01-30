#|Andrés Sebastián Arteaga Cabezas
Ejercicio 39 Tema 4: Inducción de Conceptos Competitivos|#

(define (media x n)
  (/ x n))

(define (varianza x2 m n)
  (/ (+ x2 (* n (expt m 2)) (* -2 m (* m n))) (- n 1)))

;;Ejecución
;;=========================================================
;(media 20 10)
;(varianza 40 3 10)