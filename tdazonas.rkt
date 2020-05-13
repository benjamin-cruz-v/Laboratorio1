#lang racket

;representacion
;(funcion git)
; 
;CONSTRUCTOR

(define (git funcion)
  (if (and (number? funcion)(string? funcion))
     "Comando incorrecto"
     funcion
      )
  )
;;;;ADD  (((git add) (list “file1.rkt” “file2.rkt”)) zonas) 
(define add (lambda (l)
             (lambda (index)
              (index l) 
               )
              ))
  
(define (zonas f1)
  (display f1)
  )
(define lista2 (list 1 2 3 4 5 6 ))
;------------------------------------------------------
;tda index
;contructor
(define index (lambda (l)
                 (if (list? l)
                      l
                     "falso"
                )))

(define zonas2 index)
;-----------------------------------------------------------------                             
;representacion
;(funcion workpace va ser una lista de archivos
; 
;CONSTRUCTOR
(define workpace (lambda (archivo)
                  (if (string? archivo)
      (list archivo)
      "falso"
      ) 
    ))

;PERTENENCIA
(define (workpace? archivo)
  (if (list? archivo)
      #t
      #f
      ))
      
;SELECTORES
;descripción: Función que retorna el día en una fecha
;dom: fecha
;rec: entero
(define (getArchivo l p)
  (list-ref l p)
  )      
;agregarr
(define agregar (lambda (lista)
                  (lambda (archivo)
                    (append (workpace archivo) lista
                    )
                  )))

;---------------------------------------







