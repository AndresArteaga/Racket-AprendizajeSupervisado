#|Andrés Sebastián Arteaga Cabezas
Ejercicio 23|#

(#%require (only racket include))
(include "Ejercicio11.rkt")
(include "Ejercicio12.rkt")
(include "Ejercicio16.rkt")

(define (holdout entre inter ejem comp)
  (let* ((separado (separar 0.6666 (cdr ejem)))
         (entrenar (append (list(car ejem)) (car separado)))
         (pruebas (mezclar (append (list(car ejem)) (cadr separado)) (append (list(car ejem)) comp)))
         (ejemp-sin-clase (map (lambda (x) (reverse(cdr(reverse x)))) pruebas))
         (extension (map (lambda (x) (inter (entre entrenar) x)) ejemp-sin-clase)))
    (calcPE pruebas extension)))

;;Ejecución:
;;===========================================================
;(include "Ejercicio8.rkt")
;(include "Ejercicio15.rkt")
;(include "Ejercicio18.rkt")
;(include "Ejercicio21.rkt")

;(define 25Ejemplos (leer-ejemplos "ejemplos3.scm"))
;(define nEjemp '((lluvioso 25 55 fuerte feliz hay no -)(soleado 35 10 fuerte feliz nohay si +)))
;(holdout AO AOi 25Ejemplos nEjemp)
;(holdout A1 A1i 25Ejemplos nEjemp)
;(holdout IA1 A1i 25Ejemplos nEjemp)
