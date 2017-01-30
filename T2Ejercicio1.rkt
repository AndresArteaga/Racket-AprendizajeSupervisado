#|Andrés Sebastián Arteaga Cabezas
Ejercicio 1 Tema 2: Inducción de Conjunciones Lógicas|#

;;Si el valor booleano de val es #t, entonces retorna #t
;;caso contrario retorna #f
(define (true? val)
  (if(= 1 (length val)) (equal? #t (car val))
     (if(equal? #t (car val)) (true? (cdr val))
        #f)))

;;Indica si un test puede ser aplicado a un atributo
;;numérico o nominal
(define (test-nomOnum test)
  (or (equal? '() test)
      (equal? '(*) test)))

;;Indica si un test puede ser aplicado a un atributo nominal
(define (test-nom test)
  (or (test-nomOnum test)
      (and (symbol? (car test))
           (not (equal? +inf.0 (car test)))
           (not (equal? -inf.0 (car test))))))

;;Indica si un test puede ser aplicado a un atributo numérico
(define (test-num test)
  (or (test-nomOnum test)
      (not (test-nom test))))

;;Indica si un test y un atributo tienen el mismo tipo
;;numérico o nominal
(define (nomOnum tests atributos)
  (true? (map (lambda (test atributo)
                (or (test-nomOnum test)
                    (and (test-nom test)(symbol? atributo))
                    (and (test-num test)(number? atributo)))) tests atributos)))

;;Indica si un atributo pasa el test numérico o nominal
(define (match-nomOnum test atributo)
  (equal? '(*) test))

;;Indica si un atributo nominal cumple un test nominal
(define (match-nom test atributo)
  (or (match-nomOnum test atributo)
      (equal? (car test) atributo)))

;;Interpreta las posibles entradas en los test numéricos
(define (NTest test)
  (cond
    ((equal? '() test) test)
    ((equal? '(*) test) test)
    ((equal? '(-inf.0 +inf.0) test) '(*))
    ((equal? (length test) 1) (NTest (list (car test) (car test))))
    ((true? (map (lambda (x) (list? x)) test)) (if (<= (caar test) (caadr test))
                                                   test
                                                   '()))
    ((true? (map (lambda (x) (not(list? x))) test)) (cond
                                                      ((= (car test) (cadr test)) (list(list (car test)) (cdr test)))
                                                      ((< (car test) (cadr test)) test)
                                                      (else '())))
    ((list? (car test)) (if (< (caar test) (cadr test))
                            test
                            '()))
    ((list? (cadr test)) (if (< (car test) (caadr test))
                             test
                             '()))
    (else '())))

;;Indica si un atributo numérico cumple un test numérico
(define (match-num test atributo)
  (let ((normTest (NTest test)))
    (or (match-nomOnum normTest atributo)
        (and (if (list? (car normTest))
                 (<= (caar normTest) atributo)
                 (< (car normTest) atributo))
             (if (list? (cadr normTest))
                 (<= atributo (caadr normTest))
                 (< atributo (cadr normTest)))))))

;;Indica si un test y un atributo se satisfacen
(define (match? tests atributos)
  (true? (map (lambda (test atributo)
                (cond
                  ((test-nomOnum test) (match-nomOnum test atributo))
                  ((test-num test) (match-num test atributo))
                  ((test-nom test) (match-nom test atributo))
                  (else #f))) tests atributos)))

(define (match-CL concepto ej-sin-clase)
  (and (= (length concepto) (length ej-sin-clase))
       (nomOnum concepto ej-sin-clase)
       (match? concepto ej-sin-clase)))

;;Ejecución
;;===============================================================
;(match-CL '((soleado)(*)(10 40)(si)) '(soleado 30 40 si))
;(match-CL '((soleado)(*)(10 (40))(si)) '(soleado 30 40 si))
;(match-CL '((soleado)(*)(10 40)(si)) '(soleado 30 25 no))
;(match-CL '((soleado)(*)(10 40)(si)) '(30 soleado 25 no))