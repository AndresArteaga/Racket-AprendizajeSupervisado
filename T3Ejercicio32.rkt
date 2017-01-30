#|Andrés Sebastián Arteaga Cabezas
Ejercicio 32 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T3Ejercicio23.rkt")
(include "T3Ejercicio24.rkt")
(include "T3Ejercicio26.rkt")

(define (LMS ejemplos)
  (define (loop deltas H C)
    (if(= 0 C) H
       (let*((eT 0))
         (for-each (lambda(x)
                     (let*((Oi (traducir (car(reverse(car ejemplos)))
                                         (car(reverse x))))
                           (Pi (traducir (car(reverse(car ejemplos)))
                                         (car(reverse(LUUi H (reverse(cdr(reverse x)))))))))
                       (set! eT (+ eT (expt (- Oi Pi) 2)))))
                   (cdr ejemplos))
         (if(< eT 1) H
            (let*((nDPfn (lambda (x)
                           (let*((P (list-ref (cadr H) x))
                                 (MA (list-ref (car H) x))
                                 (DL (list-ref deltas x))
                                 (Grad 0))
                             (for-each (lambda (c)
                                         (let*((Oi (traducir (car(reverse(car ejemplos)))
                                                             (car(reverse c))))
                                               (Pi (traducir (car(reverse(car ejemplos)))
                                                             (car(reverse(LUUi H (reverse(cdr(reverse c))))))))
                                               (d (* Pi (- 1 Pi) (- Oi Pi)))
                                               (v (traducir MA (list-ref c x))))
                                           (set! Grad (+ Grad (* d v)))))
                                       (cdr ejemplos))
                             (list (+ Grad DL) (+ P Grad DL)))))
                  (nDP (map nDPfn (range(length(cadr H))))))
              (loop (map car nDP) (append (list(car H)) (list(map cadr nDP))) (- C 1)))))))
  (loop (make-list (length(car ejemplos)) 0)
        (nuevo-conceptoUU (car ejemplos) 0.5)
        1000))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(LMS ejemplos)