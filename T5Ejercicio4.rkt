#|Andrés Sebastián Arteaga Cabezas
Ejercicio 4 Tema 5: La Construcción de Listad de Decisión|#

(#%require racket)
(include "T5Ejercicio3.rkt")
(include "Ejercicio8.rkt")

(define ejemplos (leer-ejemplos "ejemplos3.scm"))
(define agaricus (leer-ejemplos "agaricus-lepiota.scm"))
(define ionos (leer-ejemplos "ionosphere.scm"))

(NSC HGS ejemplos)
(NSC HTC ejemplos)
(NSC PCP ejemplos)
(NSC LMS ejemplos)

(NSC HGS agaricus)
(NSC HTC agaricus)
(NSC PCP agaricus)
(NSC LMS agaricus)

(NSC HGS ionos)
(NSC HTC ionos)
(NSC PCP ionos)
(NSC LMS ionos)
