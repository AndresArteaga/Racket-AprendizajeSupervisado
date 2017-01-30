#|Andrés Sebastián Arteaga Cabezas
Ejercicio 20 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T2Ejercicio1.rkt")

(define (match-TC CTC EjSC)
  (and (equal? (length EjSC) (length(cdr CTC)))
       (nomOnum (cdr CTC) EjSC)
       (<= (car CTC) (let((count 0))
                        (for-each (lambda (x) (if(equal? x #t)
                                                 (set! count (+ 1 count))
                                                 'null))
                                  (map (lambda (x y) (match? (list x) (list y)))
                                       (cdr CTC)
                                       EjSC))
                        count))))

;;Ejecución
;(match-TC '(4 (soleado)(*)(10 40)(si)) '(soleado 30 40 si))
;(match-TC '(3 (soleado)(*)(10 40)(si)) '(soleado 30 40 si))
;(match-TC '(2 (soleado)(*)(10 (40))(si)) '(soleado 30 40 si))
;(match-TC '(4 (soleado)(*)(10 40)(si)) '(soleado 30 25 no))
;(match-TC '(3 (soleado)(*)(10 40)(si)) '(30 soleado 25 no))
;(match-TC '(0 (*) (*) (*) (*) (*) (*) (*)) '(lluvioso 18 81 fuerte triste nohay no))