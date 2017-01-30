#|Andrés Sebastián Arteaga Cabezas
Ejercicio 11 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)
(include "T2Ejercicio1.rkt")

(define (generalizacion-atributo-numerico conCL indAtri ejemp)
  (let((test (list-ref conCL indAtri))
       (atributo (list-ref ejemp indAtri)))
    (if(equal? '+ (car(reverse ejemp)))
       (if(equal? test '())
          (list-set conCL indAtri (list atributo))
          (let*((te (NTest test))
                (gen
                 (cond
                   ((equal? te '()) (list atributo))
                   ((equal? te '(*)) te)
                   ((list? (car te)) (if(<= (caar te) atributo)
                                        (NTest (list (list atributo) (cadr te)))
                                        'null))
                   ((list? (cadr te)) (if(<= (caadr te) atributo)
                                         (NTest (list (car te) (list atributo)))
                                         'null))
                   (else test))))
            (list-set conCL indAtri gen)))
       conCL)))

;;Ejecución
;;;===================================================================================
;(generalizacion-atributo-numerico '((soleado)()(20)(si)) 1 '(soleado 25 40 si +))
;(generalizacion-atributo-numerico '((soleado)()(20)(si)) 1 '(soleado 25 40 si -))
;(generalizacion-atributo-numerico '((soleado)(15 30)(20)(si)) 1 '(soleado 25 40 si +))