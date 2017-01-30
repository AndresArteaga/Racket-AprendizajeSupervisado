#|Andrés Sebastián Arteaga Cabezas
Ejercicio 16 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "list-index.rkt")
(include "T7Ejercicio11.rkt")

(define (capacidad-de-discriminacion2 disc ejemplos)
  (let*((iClas (list-index 'clase (map car (car ejemplos))))
        (ejEnClase (dividir-ejemplos (list 'clase iClas (list-ref (car ejemplos) iClas))
                                     (cdr ejemplos)))
        (entropyS (foldl + 0 (map (lambda (x)
                                    (let((p (/ (length(cdr x)) (length(cdr ejemplos)))))
                                      (* -1 p (/ (log p) (log 2))))) ejEnClase)))
        (ejDiv (dividir-ejemplos disc (cdr ejemplos))))
    (- entropyS (foldl + 0 (map (lambda (x)
                                  (let*((ejEnClase (dividir-ejemplos (list 'clase iClas (list-ref (car ejemplos) iClas))
                                                                     (cdr x)))
                                        (entropyV (foldl + 0 (map (lambda (y)
                                                                    (let((p (/ (length(cdr y)) (length(cdr x)))))
                                                                      (* -1 p (/ (log p) (log 2))))) ejEnClase))))
                                    (* (/ (length(cdr x)) (length(cdr ejemplos))) entropyV)))
                                ejDiv)))))

;;Ejecucion
;;===============================================================
;(capacidad-de-discriminacion2
; '(clima 0 (soleado lluvioso))
; '(((clima (soleado lluvioso))
;    (temperatura numerico)
;    (clase (+ -)))
;   (lluvioso 10 -)(soleado 25 -)(lluvioso 30 +)
;   (lluvioso 10 -)(soleado 25 -)(lluvioso 30 +)
;   (soleado 10 +)(soleado 25 -)(lluvioso 30 +)
;   (soleado 10 +)(lluvioso 25 +)(lluvioso 30 +)
;   (soleado 10 +)(lluvioso 25 +)))