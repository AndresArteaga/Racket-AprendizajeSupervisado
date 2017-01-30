#|Andrés Sebastián Arteaga Cabezas
Ejercicio 6 Tema 2: Inducción de Conjunciones Lógicas|#

(#%require racket)
(include "T2Ejercicio1.rkt")

(define (test-CL>= test1 test2)
  (cond
    ((equal? '(*) test1) #t)
    ((equal? '(*) test2) #f)
    ((equal? '() test2) #t)
    ((equal? '() test1) #f)
    ((and (test-nom test1) (test-nom test2)) #t)
    ((and (test-num test1) (test-num test2)) (cond
                                               ((= 2 (length test1)) #t)
                                               (else #f)))
    ((equal? '() test2) #t)
    (else #f)))

;;Ejecución
;;====================================================
;(test-CL>= '(*) '(*))
;(test-CL>= '(lluvioso) '(soleado))
;(test-CL>= '(lluvioso) '())
;(test-CL>= '() '(soleado))
;(test-CL>= '(25 30) '(15))
;(test-CL>= '(25 30) '(10 20))
;(test-CL>= '(26) '(25 30))