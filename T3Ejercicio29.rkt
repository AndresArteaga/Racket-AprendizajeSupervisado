(#%require racket)
(include "Ejercicio8.rkt")
(include "T3Ejercicio28.rkt")

(define agaricus (leer-ejemplos "agaricus-lepiota.scm"))
(define ionos (leer-ejemplos "ionosphere.scm"))

(HTC agaricus)
(HTC ionos)