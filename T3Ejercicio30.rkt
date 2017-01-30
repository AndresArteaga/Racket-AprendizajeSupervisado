#|Andrés Sebastián Arteaga Cabezas
Ejercicio 30 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)
(include "T3Ejercicio23.rkt")
(include "T3Ejercicio26.rkt")

(define (PRM C-UU ejemplos)
  (define (loop H ej)
    (if(empty? (cdr ej)) H
       (let*((cla (car(reverse(car ej))))
             (clai (car(reverse(LUUi H (reverse(cdr(reverse(car ej))))))))
             (clas (cond
                     ((and (equal? '- clai) (equal? '+ cla)) 1)
                     ((and (equal? '+ clai) (equal? '- cla)) -1)
                     (else 'null)))
             (nH (if(equal? cla clai) H
                    (let*((nVal (map (lambda (x)
                                       (+ (list-ref (cadr H) x)
                                          (* clas (traducir (list-ref (car H) x) (list-ref (car ej) x)))))
                                     (range(- (length(cadr H)) 1))))
                          (nUm (+ (car(reverse(cadr H))) clas)))
                      (append (list (car H)) (list(append nVal (list nUm))))))))
         (loop nH (cdr ej)))))
  (loop C-UU (cdr ejemplos)))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(PRM (list (car ejemplos) '(0 1 1 2 3 5 4 -30)) ejemplos)

