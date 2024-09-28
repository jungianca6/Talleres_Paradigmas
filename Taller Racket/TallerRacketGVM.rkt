#lang racket

(define (elim elem lista)
  (cond
    [(null? lista) '()]
    [(equal? elem (car lista)) (cdr lista)]
    [else (cons (car lista) (elim elem (cdr lista)))]))

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))

(define (fib n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))
    )
  )

(define (miembro elem lista)
  (cond
    [(empty? lista) #f]
    [(equal? elem (car lista)) #t]
    [else (miembro elem (cdr lista))]))


(define (menores p lista)
  (cond
    [(empty? lista) '()]
    [(< (car lista) p) (cons (car lista) (menores p (cdr lista)))]
    [else (menores p (cdr lista))]))

(define (mayores-iguales p lista)
  (cond
    [(empty? lista) '()]
    [(>= (car lista) p) (cons (car lista) (mayores-iguales p (cdr lista)))]
    [else (mayores-iguales p (cdr lista))]))

(define (quicksort lista)
  (if (or (empty? lista) (empty? (cdr lista)))
      lista
      (append
       (quicksort (menores (car lista) (cdr lista)))
       (list (car lista))
       (quicksort (mayores-iguales (car lista) (cdr lista))))))

;6
(define (automovil atributos valores)
  (cond
    [(or (null? atributos) (null? valores)) '()] ; Si una lista está vacía, devuelve la lista vacía.
    [else (cons (list (car valores) (car atributos)) ; Toma el primer valor y el primer atributo y los empareja.
                (automovil (cdr atributos) (cdr valores)))])) ; Llama recursivamente para los siguientes valores.

;7
; Definir el árbol binario como vacío o un nodo con un valor y dos subárboles (izquierdo y derecho).
(define (arbol-vacio? arbol)
  (null? arbol))

(define (valor arbol)
  (car arbol))

(define (izquierdo arbol)
  (cadr arbol))

(define (derecho arbol)
  (caddr arbol))

; Función para encontrar el valor mínimo en un árbol (necesario para eliminar).
(define (minimo arbol)
  (if (arbol-vacio? (izquierdo arbol))
      (valor arbol)
      (minimo (izquierdo arbol))))

; Función para eliminar un elemento de un árbol binario de búsqueda.
(define (eliminar elemento arbol)
  (cond
    [(arbol-vacio? arbol) '()] ; Si el árbol está vacío, devuelve vacío.

    [(< elemento (valor arbol)) ; Si el valor a eliminar es menor que el valor del nodo, busca en el subárbol izquierdo.
     (cons (valor arbol)
           (cons (eliminar elemento (izquierdo arbol))
                 (derecho arbol)))]

    [(> elemento (valor arbol)) ; Si el valor a eliminar es mayor que el valor del nodo, busca en el subárbol derecho.
     (cons (valor arbol)
           (cons (izquierdo arbol)
                 (eliminar elemento (derecho arbol))))]

    [else ; Si el valor coincide con el nodo actual, hay que eliminarlo.
     (cond
       [(arbol-vacio? (izquierdo arbol)) ; Si no tiene subárbol izquierdo, devuelve el derecho.
        (derecho arbol)]
       
       [(arbol-vacio? (derecho arbol)) ; Si no tiene subárbol derecho, devuelve el izquierdo.
        (izquierdo arbol)]
       
       [else ; Si tiene ambos subárboles, encuentra el mínimo en el subárbol derecho y reemplaza el nodo.
        (cons (minimo (derecho arbol)) ; En lugar de usar let, directamente tomamos el mínimo aquí.
              (cons (izquierdo arbol)
                    (eliminar (minimo (derecho arbol)) (derecho arbol))))])]))
; > (define arbol '(5 (3 (1 () ()) (4 () ())) (7 (6 () ()) (8 () ()))))
; (eliminar 5 arbol)
;'(6 (3 (1 () ()) (4 () ())) 7 () 8 () ())

;8

(define (BFS grafo nodo-inicial)
  (define (aux cola visitados)
    (if (null? cola)
        (reverse visitados)  ; Invertir al final para mantener el orden correcto
        (cond
          ((member (car cola) visitados)
           (aux (cdr cola) visitados))
          (else
           (aux (append (cdr cola) (grafo (car cola)))
                (cons (car cola) visitados))))))
  (aux (cons nodo-inicial '()) '()))  ; Cola inicial

;; Ejemplo de un grafo representado como un procedimiento
(define (grafo nodo)
  (cond
    ((equal? nodo 'A) (cons 'B (cons 'C '())))  ; Usar cons
    ((equal? nodo 'B) (cons 'D '()))              ; Usar cons
    ((equal? nodo 'C) (cons 'D (cons 'E '())))   ; Usar cons
    ((equal? nodo 'D) (cons 'F '()))              ; Usar cons
    ((equal? nodo 'E) '())                        ; Lista vacía
    ((equal? nodo 'F) '())                        ; Lista vacía
    (else '())))                                   ; Lista vacía

;; Ejemplo de uso
(BFS grafo 'A)  ; Esto debería devolver '(A B C D E F)


;9
(define (LongitudC lista)
  (define (aux lista contador)
    (if (null? lista)
        contador
        (aux (cdr lista) (+ contador 1))))
  (aux lista 0))


(define (LongitudP lista)
  (if (null? lista)
      0
      (+ 1 (LongitudP (cdr lista)))))

