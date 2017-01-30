#|Andrés Sebastián Arteaga Cabezas
Ejercicio 13 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)
(include "T2Ejercicio1.rkt")
(include "T2Ejercicio10.rkt")
(include "T2Ejercicio11.rkt")
(include "choose.rkt")

(define (generalizaciones-CL conCL metaD ejemp)
  (if(or(equal? '- (car(reverse ejemp)))
        (match-CL conCL (reverse(cdr(reverse ejemp)))))
     conCL
     (do ((x 0 (+ x 1)))
       ((= x (length conCL)) conCL)
       (if(equal? 'numerico (cadr(list-ref (car ejemplos) x)))
          (set! conCL
                (generalizacion-atributo-numerico conCL x ejemp))
          (set! conCL
                (if(equal? (list-ref conCL x) '())
                   (choose (list-ref ejemp x)(generalizacion-atributo-nominal conCL x metaD))
                   (generalizacion-atributo-nominal conCL x metaD)))))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(generalizaciones-CL '((luvioso)()()(fuerte)(feliz)(hay)(si)) (car ejemplos) '(soleado 10 20 fuerte feliz hay si +))
;(generalizaciones-CL '(()()()()()()()) (car ejemplos) '(soleado 10 20 fuerte triste hay si +))