#lang racket

(require "TDAworkspace.rkt")
(require "tdaindex.rkt")
(require "TDAarchivo.rkt")
(require "TDAcommit.rkt")

;Funciones que se exportan
(provide localRepository)
(provide localRepository?)

;descripción: Función que retorna boolean de acuerdo a la funcion que se le pasa de parametr
;dom: funcion X lista
;rec: boolean
(define myandmap (lambda (f L)
                ;caso base
                (if (null? L) ;condición de borde. Indica que la lista es nula o que se llego al final del la lista
                    #t
                    ;se construye una nueva lista
                    ;se deja como estado pendiente
                    ;la aplicación de f al elemento actual (cabeza)
                    ;en que se sitúa la evaluación recursiva
                    (and (f (car L)) (myandmap f (cdr L))) ;descomposición recursiva para aplicar función f a cada elemento de la cola
                )
              )
)

;TDA  localRepository
;representacion
;(list (list commit)

;CONSTRUCTOR
;descripción: Función que retorna la lista con los commit
;dom: lista
;rec: lista de lista
(define (localRepository . commit)
  (if (myandmap commit? commit)
      commit
      null
      ))


;PERTENENCIA
;descripción: Función que permite determinar si el constructor localRepository esta bien implementado
;dom: cualquer cosa
;rec: boolean
(define localRepository? (lambda (commit)
  (and (list? commit)(myandmap commit? commit)
    
      )))
      

