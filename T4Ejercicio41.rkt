#|Andrés Sebastián Arteaga Cabezas
Ejercicio 41 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)
(include "T4Ejercicio40.rkt")

(define (NBi CNB EjSC)
  (let*((plus (assoc '+ CNB))
        (minus (car(remove plus CNB)))
        (+P (/ (cadr plus) (+ (cadr plus) (cadr minus))))
        (+P/i (probabilidades '+ CNB EjSC))
        (+Pp (* +P (let((a 1))(for-each (lambda (x) (set! a (* a x))) +P/i) a)))
        (-P (- 1 +P))
        (-P/i (probabilidades '- CNB EjSC))
        (-Pp (* -P (let((a 1))(for-each (lambda (x) (set! a (* a x))) -P/i) a))))
    (append EjSC (if(>= +Pp -Pp) (list '+) (list '-)))))

(define (match-NB CNB ejemplo)
  (equal? (car(reverse ejemplo)) (car(reverse(NBi CNB (reverse(cdr(reverse ejemplo))))))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(NBi (NB ejemplos) '(soleado 10 20 suave feliz nohay no))
;(match-NB (NB ejemplos) '(soleado 10 20 suave feliz nohay no -))