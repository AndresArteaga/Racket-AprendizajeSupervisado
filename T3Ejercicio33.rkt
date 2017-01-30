#|Andrés Sebastián Arteaga Cabezas
Ejercicio 33 Tema 3: Inducción de Conceptos Umbral|#

(#%require racket)

;;Ejecución
;;===============================================================
(include "Ejercicio8.rkt")
(include "Ejercicio24.rkt")
(include "T3Ejercicio31.rkt");PCP
(include "T3Ejercicio32.rkt");LSM

(define 25Ejemplos (leer-ejemplos "ejemplos3.scm"))
(define agricus (leer-ejemplos "agaricus-lepiota.scm"))
(define iono (leer-ejemplos "ionosphere.scm"))

(cross-validation PCP LUUi 25Ejemplos 10)
(cross-validation LMS LUUi 25Ejemplos 10)
(cross-validation PCP LUUi agricus 10)
(cross-validation LMS LUUi agrocus 10)
(cross-validation PCP LUUi iono 10)
(cross-validation LMS LUUi iono 10)