#lang racket

(require "TDAworkspace.rkt")
(require "tdaindex.rkt")
(require "TDAarchivo.rkt")
(require "TDAcommit.rkt")
(require "TDAzonas.rkt")

;Funciones que se exportan
(provide Repository)
(provide Repository?)


;descripción: Función que asimila el funcionamiento de andmap,
;             Función que retorna boolean de acuerdo a la funcion que se le pasa de parametr
;dom: funcion X lista
;rec: boolean
(define myandmap (lambda (f L)
                ;caso base
                (if (null? L)
                    #t
                    (and (f (car L)) (myandmap f (cdr L)))
                )
              )
)

;TDA Repository
;representacion
;Esta representacion de TDA abarca tanto al LocalRepository y RemotoRepository pues ambas tienen
;la misma estructura
;(list (list commit)

;CONSTRUCTOR
;descripción: Función que retorna la lista con los commit
;dom: lista
;rec: lista de lista
(define (Repository . commit)
  (if (myandmap commit? commit)
      commit
      null
      ))


;PERTENENCIA
;descripción: Función que permite determinar si el constructor localRepository esta bien implementado
;dom: cualquer cosa
;rec: boolean
(define Repository? (lambda (commit)
  (and (list? commit)(myandmap commit? commit)
    
      )))
      

