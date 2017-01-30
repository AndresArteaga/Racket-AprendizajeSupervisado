#|Andrés Sebastián Arteaga Cabezas
Ejercicio 13|#

(#%require racket)
(include "Ejercicio12.rkt")

(define (folds n eje)
  (if (= 1 n) (list eje)
      (let ((nl (separar (/ 1 n) (cdr eje))))
        (cons (append (list(car eje)) (car nl))
              (folds (- n 1) (append (list(car eje)) (cadr nl)))))))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(folds 3 ejemplos)