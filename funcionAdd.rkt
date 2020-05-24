#lang racket

(require "TDAarchivo.rkt")
(require "TDAworkspace.rkt")
(require "tdaindex.rkt")
(require racket/date)
(provide add)

;Uso de las funciones y para ocupar de ejemplo
(define archivo1 (archivo "nombre1" "texto1"))
(define archivo2 (archivo "nombre2" "texto2"))
(define zona1 (workspace archivo1 archivo2))

;FUNCION ADD
;descripción:  Función que añade los cambios locales registrados en el
;              Workspace al Index registrados en las zonas de trabajo.
;              Para esto la funcion recibe de parametro el nombre del archivo el cual es comparado
;              con lo que hay en workspace si coinciden se añade al index
;dom:lista X zonas
;rec:lista
;tipo de recusión: de cola
;Ejemplo de uso: ((add (list "nombre1"))zona1)
(define add (lambda (lista)
             (lambda (zona)
               (if (not(list? lista))
                   null
               (if (equal? lista (getNombre (car zona)))
                   (getNombre(car zona))
                   ((add lista) (cdr zona)) 
               )
              )
  )))
 
(define zonas (lambda(x)
                x))

;FUNCION GIT
;descripción:  Función que permite aplicar los comandos (funciones en este caso)
;              en el contexto de git sobre las zonas de trabajo.
;dom:funcion X zonas
;rec:recorrido de la funcion
;Ejemplo de uso: (((git add) (list "nombre1"))zona1)
(define git (lambda (funcion)
              (lambda (zonas)
                (funcion zonas)
                
              )))




;FUNCION GIT con registro de fecha
;descripción:  Función que permite aplicar los comandos (funciones en este caso)
;              en el contexto de git sobre las zonas de trabajo.
;              Esta funcion permite obtener la fecha de cuando se realiza la ejecucion
;dom:funcion X zona
;rec:recorrido de la funcion
(define fecha (date->string (current-date) second))
(define gitFecha(lambda (git)
               (list git fecha)))



