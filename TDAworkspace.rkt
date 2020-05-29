#lang racket
(require "TDAarchivo.rkt")
(require "TDAzonas.rkt")

;Funciones que se exportan
(provide workspace)
(provide workspace?)
(provide getArchivo)
(provide agregarA)


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


;TDA workspace
;representacion
;(list (list string)

;CONSTRUCTOR
;descripción: Función que retorna la lista con los archivos
;dom: lista
;rec: lista de lista
;(define (workspace . archivo)archivo)
(define (workspace . archivo)
  (if (myandmap archivo? archivo)
     archivo
     
      null
      ))

;PERTENENCIA
;descripción: Función que permite determinar si el constructor workspace esta bien implementado
;dom: cualquer cosa
;rec: boolean
;ejemplo de uso :(workspace?  (workspace (archivo"archivo" "texto" ) ))
(define workspace? (lambda (archivo)
  (and (list? archivo)(myandmap archivo? archivo)
  
      )))
      
;SELECTORES
;descripción: Función que retorna una lista en la posicion pedida
;dom: lista X entero
;rec: lista
(define getArchivo (lambda (lista p)    
               (if (= p 0)
                   (cadr lista) 
                   (getArchivo (cdr lista) (- p 1))  
               )
              ))

;Modificadores
;descripción: Función que agrega una lista al workspace
;dom: lista X lista
;rec: lista
(define agregarA (lambda (lista)
                  (lambda (archivo)
                    (append (workspace archivo) (list lista)
                    )
                  )))
;-------------------------------------------------------------------------------

;Ejemplo de uso 
(define archivo1 (archivo "nombre1" "texto1"))
(define archivo3 (archivo 56 "texto1")); ejemplo de como no se implementa
(define archivo2 (archivo "nombre2" "texto2"))
;Ejemplo de como se deben ir guardando la zonas de trabajo para su posterior uso
(define zona1 (workspace archivo1 archivo2))
(define nuevazona1 ((agregarA (archivo"nombre3" "texto3"))zona1))