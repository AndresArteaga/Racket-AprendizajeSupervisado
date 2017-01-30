#|Andrés Sebastián Arteaga Cabezas
Ejercicio 10 Tema 7: La Formación de Jerarquías de Conceptos |#

(#%require racket)
(include "T7Ejercicio7.rkt")
(include "T7Ejercicio9.rkt")

(define (JCi CJC EjSC)
  (if(empty? CJC) EjSC
     (let*((res ((eval (car CJC)) EjSC (cdr CJC))))
       (cond
         ((empty? res) EjSC)
         ((equal? '=> (car res)) (append EjSC (list (cadr res))))
         (else (JCi res EjSC))))))

;;Ejecucion
;;===============================================================
;(JCi '(adg
;       ((match-CL ((soleado) (*))) -> (adg ((match-CL ((*) (-inf.0 30))) -> (=> +))
;                                           ((match-CL ((*) ((30) +inf.0))) -> (=> -))))
;       ((match-CL ((nublado) (*))) -> (=> -))
;       ((match-CL ((lluvioso) (*))) ->(adg ((match-CL ((*) (-inf.0 10))) -> (=> -))
;                                           ((match-CL ((*) ((10) +inf.0))) => (=> +)))))
;     '(soleado 20))

;(JCi '(adc
;       (((soleado) (*)) -> (adc (((*) (-inf.0 30)) -> (=> +))
;                                (((*) ((30) +inf.0)) -> (=> -))))
;       (((nublado) (*)) -> (=> -))
;       (((lluvioso) (*)) -> (adc (((*) (-inf.0 10)) -> (=> -))
;                                 (((*) ((10) +inf.0)) -> (=> +)))))
;     '(lluvioso 50))

;(JCi '(adc
;       (((soleado) (*)) -> (adc (((*) (-inf.0 30)) -> (=> +))
;                                (((*) ((30) +inf.0)) -> (=> -))))
;       (((nublado) (*)) -> (=> -))
;       (((lluvioso) (*)) -> (adc (((*) (-inf.0 10)) -> (=> -))
;                                 (((*) ((10) +inf.0)) -> ()))))
;     '(lluvioso 50))