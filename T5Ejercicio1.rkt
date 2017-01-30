#|Andrés Sebastián Arteaga Cabezas
Ejercicio 1 Tema 5: La Construcción de Listad de Decisión|#

(#%require racket)
(include "T2Ejercicio1.rkt")
(include "T3Ejercicio25.rkt")

(define (LDi CLD EjSC)
  (if(empty? CLD) EjSC
     (let*((concepto (car CLD))
           (func (eval (car concepto)))
           (conc (cond
                   ((equal? 'match-LUU (car concepto))
                    (list (with-handlers ((exn:fail? (lambda (v) (caadr concepto))))
                            (eval (caadr concepto)))
                          (with-handlers ((exn:fail? (lambda (v) (cadadr concepto))))
                            (eval (cadadr concepto)))))
                   (else (cadr concepto)))))
       (if(func conc EjSC)
          (append EjSC (list(car(reverse concepto))))
          (LDi (cdr CLD) EjSC)))))


;;Ejemplos
;;===============================================================
#|(include "Ejercicio8.rkt")
(define ejemplos (leer-ejemplos "ejemplos.scm"))
(LDi '((match-CL ((soleado)(30 40)(50 60)(*)) => +)
       (match-CL ((*)(*)(*)(*)) => -))
     '(soleado 30 40 si))

(LDi '((match-LUU ((car ejemplos) (0 1 1 0 0 0 0 -30)) => +)
       (match-LUU ((car ejemplos) (0 1 -1 0 0 0 0 -20)) => -))
     '(soleado 30 40 suave feliz nohay si))

(LDi '((match-LUU ((car ejemplos) (0 1 1 0 0 0 0 30)) => +)
       (match-LUU ((car ejemplos) (0 1 -1 0 0 0 0 20)) => -))
     '(soleado 10 10 suave feliz nohay si))|#