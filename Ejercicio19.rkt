#|Andrés Sebastián Arteaga Cabezas
Ejercicio 19|#
(#%require racket)
;;Ejecución
;;=========================================================
(include "Ejercicio8.rkt")
(include "Ejercicio15.rkt")
(include "Ejercicio16.rkt")
(include "Ejercicio18.rkt")

(define ejemplos2 (leer-ejemplos "ejemplos2.scm"))
(define ejemplos (leer-ejemplos "ejemplos.scm"))
(define esenciaO (AO ejemplos2))
(define ejemplos-sin-clase2 (map (lambda (x) (reverse(cdr(reverse x)))) ejemplos2))
(define extension2AO (map (lambda (x) (AOi esenciaO x)) ejemplos-sin-clase2))
(define precision-errorAO-AOi (CalcPE ejemplos2 extension2AO))
precision-errorAO-AOi

(define esencia1 (A1 ejemplos2))
(define extension2A1 (map (lambda (x) (A1i esencia1 x)) ejemplos-sin-clase2))
(define precision-errorA1-A1i (CalcPE ejemplos2 extension2A1))
precision-errorA1-A1i