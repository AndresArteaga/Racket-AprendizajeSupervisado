#|Andrés Sebastián Arteaga Cabezas
Ejercicio 10|#

(#%require racket)
(include "list-index.rkt")

(define (atributo nom ej)
  (let((indice (list-index nom (map (lambda (x) (car x)) (car ej)))))
    (append (cdr(list-ref (car ej) indice))
            (map (lambda (x) (list-ref x indice)) (cdr ej)))))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(atributo 'clima ejemplos)