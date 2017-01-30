#|Andrés Sebastián Arteaga Cabezas
Ejercicio 12|#

(#%require racket)
(include "ordenar-aleatorio.rkt")

(define (separar p ejem)
  (let*((nejem(inexact->exact(round(* p (length(cdr ejem))))))
        (lista (ordenar-aleatorio ejem)))
    (list (take lista nejem) (drop lista nejem))))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(separar 0.5 (cdr ejemplos))