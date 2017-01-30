#|Andrés Sebastián Arteaga Cabezas
Ejercicio 17|#
(#%require racket)
;;Ejecución
;;=========================================================
(include "Ejercicio8.rkt")
(include "Ejercicio15.rkt")
(include "Ejercicio16.rkt")

(define ejemplos2 (leer-ejemplos "ejemplos2.scm"))
(define ejemplos (leer-ejemplos "ejemplos.scm"))
(define esencia (AO ejemplos))
(define ejemplos-sin-clase2 (map (lambda (x) (reverse(cdr(reverse x)))) ejemplos2))
(define extension2 (map (lambda (x) (AOi esencia x)) ejemplos-sin-clase2))
(define precision-error (CalcPE ejemplos2 extension2))
precision-error