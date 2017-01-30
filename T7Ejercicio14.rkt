#|Andrés Sebastián Arteaga Cabezas
Ejercicio 11 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "T7Ejercicio13.rkt")

(define (mayor-discriminante discs ejemplos)
  (let*((a '())
        (b (map (lambda (x)
           (and (set! a (append a (list(capacidad-de-discriminacion1 x ejemplos))))
                (append (list x) (list(capacidad-de-discriminacion1 x ejemplos)))))
         discs)))
    (remove* '(null)
             (remove-duplicates
              (apply append
                     (map (lambda (x)
                            (map (lambda (y)
                                   (if(equal? (cadr y) x)
                                      (car y)
                                      'null))
                                 b))
                          (sort a >)))))))

;;Ejemplos
;;===============================================================
;(mayor-discriminante
; '((perspectiva 0 (soleado lluvioso))
;   (temperatura 1 numerico 10)
;   (temperatura 1 numerico 25)
;   (temperatura 1 numerico 30))
; '(((perspectiva (soleado lluvioso))
;    (temperatura numerico)
;    (clase (+ -)))
;   (soleado 10 -) (soleado 25 +) (lluvioso 30 -)))