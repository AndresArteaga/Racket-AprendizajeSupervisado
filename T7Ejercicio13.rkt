#|Andrés Sebastián Arteaga Cabezas
Ejercicio 11 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "Ejercicio15.rkt")
(include "T7Ejercicio11.rkt")

(define (capacidad-de-discriminacion1 disc ejemplos)
  (let*((c (dividir-ejemplos disc (cdr ejemplos))))
    (/ (foldl + 0 (map (lambda (n-e)
                         (let*((esencia (AO ejemplos))
                               (extension (map (lambda (x)
                                                 (AOi esencia x))
                                               (map (lambda (y)
                                                      (reverse(cdr(reverse y))))
                                                    (cdr n-e)))))
                           (let((count 0))
                             (for-each (lambda (a b)
                                         (if(equal? a b)
                                            (set! count (+ count 1))
                                            'null))
                                       (cdr n-e) extension)
                             count)))
                       c))
       (length(cdr ejemplos)))))

;;Ejemplos
;;===============================================================
;(capacidad-de-discriminacion1
; '(clima 0 (soleado lluvioso))
; '(((clima (soleado lluvioso))
;    (temperatura numerico)
;    (clase (+ -)))
;   (soleado 10 -)(soleado 25 +)(lluvioso 30 -)))