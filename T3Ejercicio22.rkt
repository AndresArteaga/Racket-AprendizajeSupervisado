#|Andrés Sebastián Arteaga Cabezas
Ejercicio 22 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T2Ejercicio14.rkt")

(define (especializaciones-TC CTC metaD ejem)
  (let*((CL (especializaciones-CL (cdr CTC) metaD ejem)))
    (remove-duplicates
     (cons(cons (+ 1 (car CTC)) (cdr CTC))
          (append-map (lambda (x)
                        (map (lambda (y) (cons x y))
                             CL))
                      (range (car CTC) (+ 1 (length (cdr CTC)))))))))

#|(define (especializaciones-TC CTC metaD ejem)
  (let*((CL (especializaciones-CL (cdr CTC) metaD ejem)))
    ;CL
    (apply append (map (lambda (x)
           (map (lambda (y) (cons x (list y)))
                (list CL)))
         (range (car CTC) (+ 1 (length (cdr CTC))))))
    ))|#

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(especializaciones-TC '(1 (*)(5 30)(*)(*)(*)(*)(*)) (car ejemplos) '(soleado 10 20 fuerte feliz hay si -))
;(especializaciones-TC '(1 (*) (10 20) (15 100) (*) (*) (hay) (*)) (car ejemplos) (cadr ejemplos))