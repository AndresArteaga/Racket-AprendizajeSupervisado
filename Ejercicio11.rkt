#|Andrés Sebastián Arteaga Cabezas
Ejercicio 11|#

(#%require racket)
(include "ordenar-aleatorio.rkt")

(define (mezclar ejem1 ejem2)
  (cons (car ejem1)
        (ordenar-aleatorio (append (cdr ejem1) (cdr ejem2)))))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ej1 (leer-ejemplos "ejemplos.scm"))
;(define ej2 (leer-ejemplos "ejemplos2.scm"))
;(mezclar ej1 ej2)