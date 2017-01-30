#|Andrés Sebastián Arteaga Cabezas
Ejercicio 40 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)
(include "T4Ejercicio38.rkt")
(include "T4Ejercicio39.rkt")

(define (norm x m v)
  (let*((pi 3.1415926535))
    (* (/ 1 (sqrt(* 2 pi v)))
       (exp(- (/ (expt (- x m) 2) (* 2 v)))))))

(define (probabilidades clase CNB EjSC)
  (let*((plus (assoc clase CNB))
        (minus (car(remove plus CNB))))
    (define (loop probs EjSin plus+ minus-)
      (if(null? EjSin) probs
         (if(number? (car EjSin))
            (let*((distancia+ (car plus+))
                  (distancia- (car minus-))
                  (+m (media (cadr distancia+) (cadr plus)))
                  (+v (varianza (caddr distancia+) +m (cadr plus)))
                  (-m (media (cadr distancia-) (cadr minus)))
                  (-v (varianza (caddr distancia-) -m (cadr minus)))
                  (n (+ (cadr plus) (cadr minus)))
                  (x (+ (cadr distancia+) (cadr distancia-)))
                  (x2 (+ (caddr distancia+) (caddr distancia-)))
                  (m (media x n))
                  (v (varianza x2 m n))
                  (Pi/c (norm (car EjSin) +m +v))
                  (Pc (/ (cadr plus) n))
                  (Pi (norm (car EjSin) m v))
                  (Pc/i (/ (* Pi/c Pc) Pi)))
              (loop (append probs (list Pc/i)) (cdr EjSin) (cdr plus+) (cdr minus-)))
            (let*((+s (cadr(assoc (car EjSin) (car plus+))))
                  (+total (let((a 0))(for-each (lambda(x)(set! a (+ a (cadr x)))) (car plus+)) a))
                  (-s (cadr(assoc (car EjSin) (car minus-))))
                  (-total (let((a 0))(for-each (lambda(x)(set! a (+ a (cadr x)))) (car minus-)) a))
                  (Pi/c (/ +s +total))
                  (Pc (/ (cadr plus) (+ (cadr plus) (cadr minus))))
                  (Pi (/ (+ +s -s) (+ +total -total)))
                  (Pc/i (/ (* Pi/c Pc) Pi)))
              (loop (append probs (list Pc/i)) (cdr EjSin) (cdr plus+) (cdr minus-))))))
    (loop '() EjSC (cddr plus) (cddr minus))))

;;Ejecución
;;===============================================================
;(include "Ejercicio8.rkt")
;(define ejemplos (leer-ejemplos "ejemplos.scm"))
;(probabilidades '+ (NB ejemplos) '(soleado 10 20 suave feliz hay no))