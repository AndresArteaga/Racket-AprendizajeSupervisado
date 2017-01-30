#|Andrés Sebastián Arteaga Cabezas
Ejercicio 3 Tema 5: La Construcción de Listad de Decisión|#

(#%require racket)
(include "T5Ejercicio2.rkt")

(define (NSC0 algoritmo PSET NSET DNF)
  (define (loop PSET NSET DNF)
    (if(empty? (cdr PSET)) DNF
       (let*((conc (algoritmo (append PSET (cdr NSET))))
             (nPSET (map (lambda (x)
                            (if(equal? #t ((eval(funcion-match algoritmo)) conc (reverse(cdr(reverse x)))))
                               x
                               (remove x (cdr PSET))))
                          (cdr PSET)))
             (nPSET (if(= (length nPSET) (length(cdr PSET))) '() nPSET)))
         (loop (cons (car PSET) nPSET) NSET (append DNF (list conc))))))
  (loop PSET NSET DNF))

(define (NSC algoritmo ejemplos)
  (let*((meta (car ejemplos))
        (ejPositivo (remove* '(null)
                             (map (lambda (x)
                                    (if(equal? '+ (car(reverse x)))
                                       x 'null))
                                  (cdr ejemplos))))
        (ejNegativo (remove* ejPositivo (cdr ejemplos))))
    (NSC0 algoritmo (cons meta ejPositivo) (cons meta ejNegativo) '())))

;;Ejemplos
;;===============================================================
#|(include "Ejercicio8.rkt")
(define ejemplos (leer-ejemplos "ejemplos3.scm"))
(NSC NB ejemplos)|#