  
#lang racket

(require "TDAarchivo.rkt")
(require "TDAworkspace.rkt")

(provide index)
(provide index?)
(provide agregarIndex)

;TDA index
;representacion
;(list string)
;(lista con nombre archivo

;CONSTRUCTOR
;descripción: Función que retorna la lista con los archivos subidos al index
;dom: lista
;rec: lista de lista

(define index (lambda (nombre)
                 (if (list? nombre)
                     nombre
                     null
                )))

;PERTENENCIA
;descripción: Función que permite determinar si el constructor index esta bien implementado
;dom: culaquer cosa
;rec: boolean
(define (index? lista)
  (and (list? lista)
      ))

;Modificadores
;descripción: Función que agrega una lista al index
;dom: lista X lista
;rec: lista
(define agregarIndex (lambda (string)
                  (lambda (archivo)
                    (append (index archivo) (list string)
                    )
                  )))