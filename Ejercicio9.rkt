#|Andrés Sebastián Arteaga Cabezas
Ejercicio 9|#

(#%require racket)

(define (añadir-ejemplo ejem1 ejem2)
  (cons (car ejem1) (append (cdr ejem1) (list ejem2))))

(define (guardar nombre datos)
  (let((al (open-output-file nombre #:mode 'text #:exists 'truncate)))
  (write datos al)
  (close-output-port al)))

;;Ejecución
;;=========================================================
;(include "Ejercicio8.rkt")
;(define eje1 (leer-ejemplos "ejemplos.scm"))
;(define eje2 '(lluvioso 0 100 fuerte triste hay si -))
;(añadir-ejemplo eje1 eje2)
;(define eje3 (añadir-ejemplo eje1 eje2))

;(guardar "ejemplosA.scm" eje3)