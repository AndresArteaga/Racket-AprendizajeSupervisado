#|Andrés Sebastián Arteaga Cabezas
Ejercicio 5 Tema 5: La Construcción de Listad de Decisión|#

(#%require racket)
(include "Ejercicio15.rkt")
(include "T5Ejercicio3.rkt")

(define (MSC0 algoritmo ejemplos)
  (let*((meta (append (reverse(cdr(reverse(car ejemplos)))) '((clase (+ -)))))
        (clases (cadr(car(reverse(car ejemplos)))))
        (reglas '()))
    (for-each (lambda (x)
                (let*((ejPositivo (map (lambda (x) (append (reverse(cdr(reverse x))) (list '+)))
                                       (remove* '(null)
                                                (map (lambda (y)
                                                       (if(equal? x (car(reverse y)))
                                                          y 'null))
                                                     (cdr ejemplos)))))
                      (ejNegativo (map (lambda (x) (append (reverse(cdr(reverse x))) (list '-)))
                                       (remove* (remove* '(null)
                                                         (map (lambda (y)
                                                                (if(equal? x (car(reverse y)))
                                                                   y 'null))
                                                              (cdr ejemplos))) (cdr ejemplos))))
                      (DNF (NSC0 algoritmo (cons meta ejPositivo) (cons meta ejNegativo) '())))
                  (for-each (lambda (y)
                              (set! reglas (append reglas (list(list (funcion-match algoritmo) y '=> x)))))
                            DNF)))
              clases)
    reglas))

(define (MSC algoritmo ejemplos)
  (append (MSC0 algoritmo ejemplos)
          (list(list 'match-CL (build-list (- (length(car ejemplos)) 1) (lambda (x) '(*))) '=> (AO ejemplos)))))

;;Ejemplos
;;===============================================================
#|(include "Ejercicio8.rkt")
(define ejemplos (leer-ejemplos "ejemplos3.scm"))
(MSC HGS ejemplos)|#