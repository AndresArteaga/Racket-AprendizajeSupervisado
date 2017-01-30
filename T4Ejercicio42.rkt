#|Andrés Sebastián Arteaga Cabezas
Ejercicio 42 Tema 4: Inducción de Conceptos Competitivos|#

(#%require racket)
(include "Ejercicio8.rkt")
(include "Ejercicio24.rkt");stratified-cross-validation
(include "T2Ejercicio2.rkt");CLi
(include "T2Ejercicio18.rkt");HGS
(include "T3Ejercicio21.rkt");TCi
(include "T3Ejercicio28.rkt");HTC
(include "T3Ejercicio31.rkt");PCP ;LUUi
(include "T3Ejercicio32.rkt");LMS
(include "T4Ejercicio35.rkt");IBi
(include "T4Ejercicio38.rkt");NB
(include "T4Ejercicio41.rkt");NBi

;(define 25Ejemplos (leer-ejemplos "ejemplos3.scm"))

;(stratified-cross-validation HGS CLi 25Ejemplos 10)
;(stratified-cross-validation HTC TCi 25Ejemplos 10)
;(stratified-cross-validation PCP LUUi 25Ejemplos 10)
;(stratified-cross-validation LMS LUUi 25Ejemplos 10)
;(stratified-cross-validation IB IBi 25Ejemplos 10)
;(stratified-cross-validation NB NBi 25Ejemplos 10)

;(define agricus (leer-ejemplos "agaricus-lepiota.scm"))

;(stratified-cross-validation HGS CLi agaricus 10)
;(stratified-cross-validation HTC TCi agaricus 10)
;(stratified-cross-validation PCP LUUi agricus 10)
;(stratified-cross-validation LMS LUUi agricus 10)
;(stratified-cross-validation IB IBi agricus 10)
;(stratified-cross-validation NB NBi agricus 10)

;(define iono (leer-ejemplos "ionosphere.scm"))

;(stratified-cross-validation HGS CLi iono 10)
;(stratified-cross-validation HTC TCi iono 10)
;(stratified-cross-validation PCP LUUi iono 10)
;(stratified-cross-validation LMS LUUi iono 10)
;(stratified-cross-validation IB IBi iono 10)
;(stratified-cross-validation NB NBi iono 10)