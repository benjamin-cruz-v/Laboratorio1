#lang racket
;Listas para uso de ejemplo
(define l2 (list 1 2 3 4 5 6 ))
(define l1 (list (list 1 2) (list 3 4)))

;FUNCION ADD
;descripción: Implementación de la funcion add de git, esta funcion seleciona el prmer elemento de la lista
;             que viene siendo el nombre del archivo y lo añade al index como un elemento de una lista
;dom: lista X entero 
;rec: elemento de lista
;tipo de recusión: de cola
(define add1 (lambda (lista i)
               
               (if (= i 0) 
                   (list(getNombre(car lista)))
                   (add1 (cdr lista) (- i 1)) 
               )
              )
  )
;FUNCION CONSTANTE ZONA
(define (zonas f1)
  f1
  
  )

;------------------------------------------------------
;Implementación del TDA index
;representacio
;(list elemento) 

;CONSTRUCTOR
(define index (lambda (l)
                 (if (list? l)
                      l
                     "falso"
                )))

;PERTENENCIA
(define (index? lista)
  (if (list? lista)
      #t
      #f
      ))

;Modificadores
;descripción: Función que agrega una lista al workspace
;dom: lista X lista
;rec: lista
(define agregar (lambda (lista)
                  (lambda (archivo)
                    (append (index archivo) (list lista)
                    )
                  )))



;;;
(define archivo (lambda (l1 l2)
                  (if (and (string? l1)(string? l2))
      (list l1 l2)
      "Archivo formato incorrecto"
      ) 
    ))
;PERTENENCIA
;descripción: Función que permite determinar si el constructor archivo esta bien implementado
;dom: lista
;rec: boolean
(define (archivo? archivo)
  (if (list? archivo)
      #t
      #f
      ))

;SELECTORES
;descripción: Función que retorna el nombre del archivo
;dom: archivo
;rec: string 
(define (getNombre a)
   (if (archivo? a)
       (car a)
       0
   )
 )









