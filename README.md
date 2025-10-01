# 42 Kocaeli OCaml Piscine - 9. Proje: Monoids & Monads# 42 Kocaeli OCaml Piscine - 9. Proje: Monoids & Monads

## 📖 Proje Hakkında## 📖 Proje Hakkında

Bu proje, **Monoids & Monads** kavramlarını OCaml dilinde öğrenmek için tasarlanmıştır. Abstract algebra'dan gelen monoid yapıları ve functional programming'in temel yapı taşlarından olan monad pattern'lerini kapsamlı olarak inceleyeceğiz. Bu proje, matematiksel soyutlamaları praktik programlama problemlerine uygulama becerisini geliştirmeyi amaçlar.Bu proje, **Monoids & Monads** kavramlarını OCaml dilinde öğrenmek için tasarlanmıştır. Abstract algebra'dan gelen monoid yapıları ve functional programming'in temel yapı taşlarından olan monad pattern'lerini kapsamlı olarak inceleyeceğiz. Bu proje, matematiksel soyutlamaları praktik programlama problemlerine uygulama becerisini geliştirmeyi amaçlar.

## 🎯 Öğrenilen Kavramlar## 🎯 Öğrenilen Kavramlar

1. **Monoid Laws**: Associativity, identity element, closure properties4. **Monad Laws**: `return`, `bind` ve monadic composition rules

2. **Abstract Algebra**: Mathematical structures ve algebraic properties

3. **Functor Pattern**: Generic modules parameterized by type interfaces5. **Error Handling**: Exception-safe computation with Try monadMonoid pattern implementation - Clock arithmetic modulo system.

4. **Monad Laws**: `return`, `bind` ve monadic composition rules

5. **Error Handling**: Exception-safe computation with Try monad6. **Non-deterministic Computation**: Set monad ve choice operations

6. **Non-deterministic Computation**: Set monad ve choice operations

7. **Module Types**: Abstract interfaces ve signature constraints7. **Module Types**: Abstract interfaces ve signature constraints- **Module:** `Watchtower` - 12-hour clock arithmetic monoid

8. **Parametric Polymorphism**: Generic programming with functors

9. **Computational Contexts**: Wrapping values in computational environments8. **Parametric Polymorphism**: Generic programming with functors- **Type:** `hour = int` - Hours represented as integers

10. **Composition Patterns**: Chaining operations with bind operators

11. **Type Safety**: Static guarantees ile runtime error prevention9. **Computational Contexts**: Wrapping values in computational environments- **Identity:** `zero = 12` - Identity element for clock arithmetic

12. **Abstract Data Types**: Implementation hiding via module signatures

13. **Higher-Order Functions**: Functions taking/returning other functions10. **Composition Patterns**: Chaining operations with bind operators- **Operations:** `add`, `sub` - Closed operations with modular arithmetic

14. **Pattern Matching**: Variant type handling ve case analysis

15. **Functional Composition**: Building complex operations from simple ones11. **Type Safety**: Static guarantees ile runtime error prevention- **Properties:** Associativity, identity element, closure

## 🗂️ Proje Yapısı12. **Abstract Data Types**: Implementation hiding via module signatures- **Modular Logic:** All operations mod 12, with 0 mapped to 12

````13. **Higher-Order Functions**: Functions taking/returning other functions- **Özellik:** Basic monoid laws, clock arithmetic, modular operations

├── ex00/        # Watchtower Monoid - Clock arithmetic with 12-hour modulo

│   └── main.ml14. **Pattern Matching**: Variant type handling ve case analysis- **Örnek:**

├── ex01/        # App Monoid - Project management with business logic

│   └── main.ml15. **Functional Composition**: Building complex operations from simple ones  ```ocaml

├── ex02/        # Calc Functor - Generic calculator with INT/FLOAT

│   └── main.ml  let zero = Watchtower.zero;;          (* 12 *)

├── ex03/        # Try Monad - Exception-safe computation

│   └── main.ml## 🗂️ Proje Yapısı  Watchtower.add 3 4;;                  (* 7 *)

└── ex04/        # Set Monad - Non-deterministic computation

    └── main.ml  Watchtower.add 11 2;;                 (* 1 *)

````

````Watchtower.sub 3 5;;                  (* 10 *)

## 🚀 Kullanım

├── ex00/        # Watchtower Monoid - Clock arithmetic with 12-hour modulo  Watchtower.add 12 12;;                (* 12 *)

### Hızlı Derleme & Test

│   ├── Color.ml  ```

```bash

# Tüm egzersizleri derle ve test et│   └── main.ml

make all

├── ex01/        # App Monoid - Project management with business logic### ex01 - App Project Monoid

# Belirli egzersizi derle

make ex00  # Watchtower monoid│   ├── Value.ml

make ex01  # App monoid

make ex02  # Calc functor│   └── main.ml**Dosyalar:** `ex01/main.ml`, `ex01/Makefile`

make ex03  # Try monad

make ex04  # Set monad├── ex02/        # Calc Functor - Generic calculator with INT/FLOAT



# Test sonuçlarını göster│   ├── Card.mlCustom monoid for project management - String concatenation with grade averaging.

make test

│   └── main.ml

# Temizle

make clean├── ex03/        # Try Monad - Exception-safe computation- **Module:** `App` - Project status management monoid

````

│ ├── Deck.ml- **Type:** `project = string * string * int` - (name, status, grade) tuple

### Manuel Derleme

│ ├── Deck.mli- **Identity:** `zero = ("", "", 0)` - Empty project identity

````bash

# ex00 - Watchtower Monoid│   └── main.ml- **Combine:** String concatenation + grade averaging + status determination

cd ex00

ocaml main.ml└── ex04/        # Set Monad - Non-deterministic computation- **Operations:** `combine`, `fail`, `success` - Project state transformations



# ex01 - App Monoid    └── main.ml- **Logic:** Grade > 80 = "succeed", otherwise "failed"

cd ex01

ocaml main.ml```- **Özellik:** Complex monoid with business logic, state transformations



# ex02 - Calc Functor- **Örnek:**

cd ex02

ocaml main.ml## 🚀 Kullanım  ```ocaml



# ex03 - Try Monad  let zero = App.zero;;                 (* ("", "", 0) *)

cd ex03

ocaml main.ml### Hızlı Derleme & Test  let p1 = ("42", "succeed", 90);;



# ex04 - Set Monad  let p2 = ("OCaml", "failed", 60);;

cd ex04

ocaml main.ml```bash  App.combine p1 p2;;                   (* ("42OCaml", "failed", 75) *)

````

# Tüm egzersizleri derle ve test et App.success p2;; (_ ("OCaml", "succeed", 80) _)

## 📚 Egzersiz Detayları

make all App.fail p1;; (_ ("42", "failed", 0) _)

### **ex00: Watchtower (12-Hour Clock Monoid)**

````

**Amaç:** 12-hour clock arithmetic ile monoid properties demonstration

# Belirli egzersizi derle

**Uygulama:**

- **Identity Element:** `zero = 12` (12 o'clock as neutral element)make ex00  # Watchtower monoid### ex02 - Calc Functor System

- **Binary Operation:** `add a b = ((a + b - 1) mod 12) + 1`

- **Associativity:** Clock arithmetic with proper modulo handlingmake ex01  # App monoid

- **Closure:** Operations always result in valid hour (1-12)

make ex02  # Calc functor**Dosyalar:** `ex02/main.ml`, `ex02/Makefile`

**Key Features:**

```ocamlmake ex03  # Try monad

module Watchtower = struct

let zero = 12  (* Identity: 12 o'clock *)make ex04  # Set monadFunctor pattern with MONOID interface - Generic calculator implementation.



let add a b =

  ((a + b - 1) mod 12) + 1  (* Proper 1-12 range *)

  # Test sonuçlarını göster- **Module Type:** `MONOID` - Abstract interface with two identity elements

let sub a b =

  ((a - b + 11) mod 12) + 1  (* Subtraction with wrap-around *)make test- **Elements:** `zero1`, `zero2` - Additive (0) and multiplicative (1) identities

end

```- **Operations:** `add`, `sub`, `mul`, `div` - Basic arithmetic operations



**Test Cases:**# Temizle- **Implementations:** `INT`, `FLOAT` - Concrete monoid instances

- Identity: `add 5 zero = 5`, `add zero 7 = 7`

- Associativity: `add (add 3 4) 5 = add 3 (add 4 5)`make clean- **Functor:** `Calc` - Generic calculator parameterized by MONOID

- Clock wrap: `add 11 3 = 2` (11 + 3 = 14 → 2 o'clock)

```- **Advanced Ops:** `power`, `fact` - Complex operations using monoid properties

### **ex01: App (Project Management Monoid)**

- **Özellik:** Parametric polymorphism, functors, abstract interfaces

**Amaç:** Business logic ile monoid structure combination

### Manuel Derleme- **Örnek:**

**Uygulama:**

- **Elements:** `(project_name, grade)` tuples  ```ocaml

- **Identity:** `("", 0)` empty project

- **Operation:** String concatenation + grade averaging```bash  module Calc_int = Calc(INT);;

- **Business Rules:** Project status determination based on grades

# ex00 - Watchtower Monoid  module Calc_float = Calc(FLOAT);;

**Key Features:**

```ocamlcd ex00  Calc_int.power 2 3;;                  (* 8 *)

module App = struct

let zero = ("", 0)ocaml main.ml  Calc_int.fact 5;;                     (* 120 *)



let combine (name1, grade1) (name2, grade2) =  Calc_float.power 2.0 3;;              (* 8.0 *)

  let combined_name =

    if name1 = "" then name2# ex01 - App Monoid  ```

    else if name2 = "" then name1

    else name1 ^ " + " ^ name2cd ex01

  in

  let combined_grade = (grade1 + grade2) / 2 inocaml main.ml### ex03 - Try Monad

  (combined_name, combined_grade)

end

````

# ex02 - Calc Functor**Dosyalar:** `ex03/main.ml`, `ex03/Makefile`

**Business Logic:**

- Grade ranges: A (90-100), B (80-89), C (70-79), D (60-69), F (<60)cd ex02

- Project status: "Ready", "In Progress", "Cancelled" based on combined grades

- Automatic project name merging with " + " separatorocaml main.mlError handling monad - Exception-safe computation sequences.

### **ex02: Calc (Generic Calculator Functor)**

**Amaç:** Parametric polymorphism ile reusable calculator system# ex03 - Try Monad- **Module:** `Try` - Exception handling monad implementation

**Uygulama:**cd ex03- **Type:** `'a t = Success of 'a | Failure of exn` - Result with exception

- **MONOID Signature:** Abstract interface for numeric types

- **Calc Functor:** Generic calculator parameterized by MONOIDocaml main.ml- **Monad Laws:** `return`, `bind` - Core monadic operations

- **Implementations:** INT_MONOID ve FLOAT_MONOID

- **Operations:** `recover`, `filter`, `flatten` - Extended monad operations

**Key Features:**

````ocaml# ex04 - Set Monad- **Exception Safety:** Automatic exception catching in bind operations

module type MONOID = sig

  type tcd ex04- **Chaining:** Safe composition of potentially failing operations

  val zero : t

  val add : t -> t -> tocaml main.ml- **Özellik:** Error propagation, exception handling, safe computation chains

  val mul : t -> t -> t

end```- **Örnek:**



module Calc (M : MONOID) = struct  ```ocaml

  let power base exp = (* Generic power function *)

  let factorial n = (* Generic factorial using M.mul *)## 📚 Egzersiz Detayları  Try.return 42;;                       (* Success 42 *)

  let sum_range start finish = (* Range sum using M.add *)

end  Try.bind (Success 10) (fun x -> Success (x * 2));;  (* Success 20 *)

````

### **ex00: Watchtower (12-Hour Clock Monoid)** Try.recover (Failure Division_by_zero) exception_handler;;

**Generic Operations:**

- **Power:** `base^exp` using repeated multiplication Try.filter (Success 5) is_positive;; (_ Success 5 _)

- **Factorial:** `n!` using monoid multiplication

- **Sum Range:** `Σ(start..finish)` using monoid addition**Amaç:** 12-hour clock arithmetic ile monoid properties demonstration ```

- **Type Safety:** Compile-time guarantees for operations

### **ex03: Try (Exception-Safe Monad)**

**Uygulama:**### ex04 - Set Monad

**Amaç:** Error handling ile monadic computation

- **Identity Element:** `zero = 12` (12 o'clock as neutral element)

**Uygulama:**

- **Type:** `Success of 'a | Failure of string`- **Binary Operation:** `add a b = ((a + b - 1) mod 12) + 1`**Dosyalar:** `ex04/main.ml`, `ex04/Makefile`

- **Bind:** Automatic exception propagation

- **Return:** Value wrapping in Success context- **Associativity:** Clock arithmetic with proper modulo handling

- **Recover:** Error recovery with fallback values

- **Closure:** Operations always result in valid hour (1-12)Non-deterministic computation monad - Set operations with monadic interface.

**Key Features:**

````ocaml

type 'a t = Success of 'a | Failure of string

**Key Features:**- **Module:** `Set` - Set-based monad for non-deterministic computations

let return x = Success x

```ocaml- **Type:** `'a t = 'a list` - Sets represented as lists without duplicates

let bind m f = match m with

  | Success x -> (try f x with exn -> Failure (Printexc.to_string exn))module Watchtower = struct- **Monad Laws:** `return`, `bind` - Non-deterministic computation chaining

  | Failure s -> Failure s

    let zero = 12  (* Identity: 12 o'clock *)- **Set Operations:** `union`, `inter`, `diff` - Standard set operations

let recover m fallback = match m with

  | Success x -> x  - **Higher-Order:** `filter`, `foreach`, `for_all`, `exists` - Functional operations

  | Failure _ -> fallback

```  let add a b = - **Deduplication:** Automatic duplicate removal in all operations



**Monadic Operations:**    ((a + b - 1) mod 12) + 1  (* Proper 1-12 range *)- **Özellik:** Non-deterministic computation, set theory, list comprehensions

- **Safe Division:** Division by zero handling

- **Chain Operations:** Automatic error propagation    - **Örnek:**

- **Exception Safety:** All exceptions caught and converted

- **Recovery Patterns:** Fallback values for error cases  let sub a b =   ```ocaml



### **ex04: Set (Non-deterministic Monad)**    ((a - b + 11) mod 12) + 1  (* Subtraction with wrap-around *)  Set.return 42;;                       (* [42] *)



**Amaç:** Choice operations ile non-deterministic computationend  Set.bind [1; 2; 3] (fun x -> [x; x*2]);; (* [1; 2; 2; 4; 3; 6] *)



**Uygulama:**```  Set.union [1; 2] [3; 4];;             (* [1; 2; 3; 4] *)

- **Type:** `'a list` (sets as lists with deduplication)

- **Bind:** Cartesian product with flattening  Set.filter [1; 2; 3; 4] is_even;;     (* [2; 4] *)

- **Return:** Singleton set creation

- **Set Operations:** Union, intersection, difference**Test Cases:**  ```



**Key Features:**- Identity: `add 5 zero = 5`, `add zero 7 = 7`

```ocaml

let return x = [x]- Associativity: `add (add 3 4) 5 = add 3 (add 4 5)`## 🔧 Kullanım



let bind m f = - Clock wrap: `add 11 3 = 2` (11 + 3 = 14 → 2 o'clock)

  let result = List.concat_map f m in

  List.sort_uniq compare result  (* Remove duplicates *)### OCaml Kurulumu



let union s1 s2 = List.sort_uniq compare (s1 @ s2)### **ex01: App (Project Management Monoid)**

let inter s1 s2 = List.filter (fun x -> List.mem x s2) s1

let diff s1 s2 = List.filter (fun x -> not (List.mem x s2)) s1```bash

````

**Amaç:** Business logic ile monoid structure combination# Ubuntu/Debian

**Non-deterministic Operations:**

- **Choice Points:** Multiple possible outcomessudo apt-get install ocaml

- **Backtracking:** Explore all possibilities

- **Set Operations:** Mathematical set theory operations**Uygulama:**

- **Combination Logic:** Cartesian products with bind

- **Elements:** `(project_name, grade)` tuples# macOS (Homebrew)

## 🔬 Monoid Laws & Properties

- **Identity:** `("", 0)` empty projectbrew install ocaml

### Associativity Law:

- **Operation:** String concatenation + grade averaging

```````ocaml

(* For any monoid, this must hold: *)- **Business Rules:** Project status determination based on grades# OPAM ile

(a ⊕ b) ⊕ c = a ⊕ (b ⊕ c)

opam install ocaml

(* Examples from our implementations: *)

(* Watchtower: (2 + 3) + 4 = 2 + (3 + 4) = 9 mod 12 *)**Key Features:**```

(* App: (p1 combine p2) combine p3 = p1 combine (p2 combine p3) *)

``````ocaml



### Identity Element Law:module App = struct### Makefile ile Derleme ve Çalıştırma



```ocaml  let zero = ("", 0)

(* There exists an element e such that: *)

e ⊕ a = a ⊕ e = a  ```bash



(* Examples: *)  let combine (name1, grade1) (name2, grade2) =# ex00 - Watchtower monoid

(* Watchtower: zero = 12, (12 + a) mod 12 = a *)

(* App: empty project with ("", 0) combines neutrally *)    let combined_name = cd ex00

```````

      if name1 = "" then name2make run    # Derleme + çalıştırma + temizleme

### Closure Property:

      else if name2 = "" then name1  make        # Sadece derleme

```ocaml

(* For elements a, b in set S: *)      else name1 ^ " + " ^ name2make clean  # Object dosyalarını temizle

a ⊕ b ∈ S

    inmake fclean # Tüm derlenmiş dosyaları temizle

(* Watchtower: hours 1-12 ⊕ hours 1-12 → hours 1-12 *)

(* App: project ⊕ project → project *)    let combined_grade = (grade1 + grade2) / 2 in

```

    (combined_name, combined_grade)# ex01 - App monoid

### Monoid Signatures:

endcd ex01

````ocaml

module type MONOID = sig```make run    # Project management tests

  type t

  val zero : t

  val add : t -> t -> t

end**Business Logic:**# ex02 - Calc functor



(* Integer Addition Monoid *)- Grade ranges: A (90-100), B (80-89), C (70-79), D (60-69), F (<60)cd ex02

module IntAdd : MONOID = struct

  type t = int- Project status: "Ready", "In Progress", "Cancelled" based on combined gradesmake run    # Generic calculator tests

  let zero = 0

  let add = (+)- Automatic project name merging with " + " separator

end

# ex03 - Try monad

(* Float Multiplication Monoid *)

module FloatMult : MONOID = struct### **ex02: Calc (Generic Calculator Functor)**cd ex03

  type t = float

  let zero = 1.0make run    # Exception handling tests

  let add = ( *. )

end**Amaç:** Parametric polymorphism ile reusable calculator system

````

# ex04 - Set monad

## 🧮 Monad Laws & Patterns

**Uygulama:**cd ex04

### Left Identity Law:

- **MONOID Signature:** Abstract interface for numeric typesmake run # Non-deterministic computation tests

````ocaml

(* return a >>= f = f a *)- **Calc Functor:** Generic calculator parameterized by MONOID```



(* Try monad example: *)- **Implementations:** INT_MONOID ve FLOAT_MONOID

Try.return 5 >>= (fun x -> Success (x * 2)) = Success 10

Try.return 5 >>= (fun x -> Success (x * 2)) = (fun x -> Success (x * 2)) 5### Manuel Derleme

````

**Key Features:**

### Right Identity Law:

`ocaml`bash

```ocaml

(* m >>= return = m *)module type MONOID = sig# ex00 için



(* Set monad example: *)  type tocamlopt -c main.ml

[1; 2; 3] >>= Set.return = [1; 2; 3]

[1; 2; 3] >>= (fun x -> [x]) = [1; 2; 3]  val zero : tocamlopt -o ex00 main.cmx

```

val add : t -> t -> t

### Associativity Law:

val mul : t -> t -> t# ex01 için

```ocaml

(* (m >>= f) >>= g = m >>= (fun x -> f x >>= g) *)endocamlopt -c main.ml



(* Try monad chaining: *)ocamlopt -o ex01 main.cmx

(try_divide 10 2 >>= try_sqrt) >>= try_log =

try_divide 10 2 >>= (fun x -> try_sqrt x >>= try_log)module Calc (M : MONOID) = struct

```

let power base exp = (_ Generic power function _)# ex02 için

### Monad Usage Patterns:

let factorial n = (_ Generic factorial using M.mul _)ocamlopt -c main.ml

````ocaml

(* 1. Error Propagation (Try Monad) *)  let sum_range start finish = (* Range sum using M.add *)ocamlopt -o ex02 main.cmx

let safe_calculation x =

  Try.return xend

  >>= try_divide_by_2

  >>= try_sqrt```# ex03 için

  >>= try_log

  |> Try.recover 0.0ocamlopt -c main.ml



(* 2. Non-deterministic Choice (Set Monad) *)**Generic Operations:**ocamlopt -o ex03 main.cmx

let all_combinations =

  [1; 2] >>= fun x ->- **Power:** `base^exp` using repeated multiplication

  ['a'; 'b'] >>= fun y ->

  Set.return (x, y)- **Factorial:** `n!` using monoid multiplication# ex04 için

(* Result: [(1,'a'); (1,'b'); (2,'a'); (2,'b')] *)

- **Sum Range:** `Σ(start..finish)` using monoid additionocamlopt -c main.ml

(* 3. Composition with Bind *)

let (>>=) = Try.bind- **Type Safety:** Compile-time guarantees for operationsocamlopt -o ex04 main.cmx

let (>>=) = Set.bind

````

(_ Chain operations naturally _)

computation >>= process >>= validate >>= output### **ex03: Try (Exception-Safe Monad)**

````

### İnteraktif Modda Test Etme

## 🎨 Functor Patterns

**Amaç:** Error handling ile monadic computation

### Generic Programming:

```bash

```ocaml

(* Parameterized modules for code reuse *)**Uygulama:**ocaml

module MakeCalculator (M : MONOID) = struct

  include M- **Type:** `Success of 'a | Failure of string`# > #use "ex00/main.ml";;



  let power base exp =- **Bind:** Automatic exception propagation# > Watchtower.add 3 4;;

    let rec loop acc n =

      if n <= 0 then acc- **Return:** Value wrapping in Success context

      else loop (M.mul acc base) (n - 1)

    in- **Recover:** Error recovery with fallback values# Monoid testing

    loop M.zero exp

    # > let zero = Watchtower.zero;;

  let sum_of_powers base start finish =

    let rec loop acc i =**Key Features:**# > Watchtower.add zero 5;;

      if i > finish then acc

      else loop (M.add acc (power base i)) (i + 1)```ocaml

    in

    loop M.zero starttype 'a t = Success of 'a | Failure of string# Monad testing

end

```# > Try.return 42;;



### Type-Safe Abstractions:let return x = Success x# > Try.bind (Try.Success 10) (fun x -> Try.Success (x * 2));;



```ocaml

(* Different number types with same interface *)

module IntCalc = MakeCalculator(structlet bind m f = match m with# Set operations

  type t = int

  let zero = 1  (* Multiplicative identity *)  | Success x -> (try f x with exn -> Failure (Printexc.to_string exn))# > Set.union [1; 2] [3; 4];;

  let add = (+)

  let mul = ( * )  | Failure s -> Failure s# > Set.bind [1; 2] (fun x -> [x; x*2]);;

end)

````

module FloatCalc = MakeCalculator(struct

type t = floatlet recover m fallback = match m with

let zero = 1.0

let add = (+.) | Success x -> x### Manuel Derleme

let mul = ( \*. )

end) | Failure \_ -> fallback

```````

``````bash

## 📋 Mathematical Foundations

# ex00 için

### Abstract Algebra Concepts:

**Monadic Operations:**ocamlopt -c atom.ml

1. **Semigroup:** Set with associative binary operation

2. **Monoid:** Semigroup with identity element- **Safe Division:** Division by zero handlingocamlopt -c atoms.ml

3. **Group:** Monoid with inverse elements

4. **Functor:** Structure-preserving map between categories- **Chain Operations:** Automatic error propagationocamlopt -c main.ml

5. **Monad:** Functor with unit and join operations

- **Exception Safety:** All exceptions caught and convertedocamlopt -o ex00 atom.cmx atoms.cmx main.cmx

### Categorical Theory in Practice:

- **Recovery Patterns:** Fallback values for error cases

```ocaml

(* Functor Laws *)# ex01 için (dependencies)

fmap id = id                    (* Identity preservation *)

fmap (g ∘ f) = fmap g ∘ fmap f  (* Composition preservation *)### **ex04: Set (Non-deterministic Monad)**ocamlopt -c atom.ml



(* Monad Laws *)ocamlopt -c atoms.ml

return >=> f = f                (* Left identity *)

f >=> return = f                (* Right identity *)  **Amaç:** Choice operations ile non-deterministic computationocamlopt -c molecule.ml

(f >=> g) >=> h = f >=> (g >=> h) (* Associativity *)

```ocamlopt -c molecules.ml



### Practical Applications:**Uygulama:**ocamlopt -c main.ml



- **Watchtower:** Clock arithmetic modulo operations- **Type:** `'a list` (sets as lists with deduplication)ocamlopt -o ex01 atom.cmx atoms.cmx molecule.cmx molecules.cmx main.cmx

- **App:** Business logic with algebraic properties

- **Calc:** Generic numeric computations- **Bind:** Cartesian product with flattening

- **Try:** Exception handling as computational context

- **Set:** Non-deterministic choice and backtracking- **Return:** Singleton set creation# ex02 için (alkanes)



## 📋 Notlar- **Set Operations:** Union, intersection, differenceocamlopt -c atom.ml



- **Monoid Properties**: Identity, associativity, closure laws ile mathematical rigorocamlopt -c atoms.ml

- **Type Safety**: OCaml's type system ile compile-time error prevention

- **Functional Composition**: Higher-order functions ile elegant code patterns**Key Features:**ocamlopt -c molecule.ml

- **Abstract Interfaces**: Module signatures ile implementation hiding

- **Generic Programming**: Functors ile code reuse and parameterization```ocamlocamlopt -c molecules.ml

- **Error Handling**: Monadic error propagation ile robust programs

- **Mathematical Modeling**: Abstract algebra concepts ile practical applicationslet return x = [x]ocamlopt -c alkane.ml

- **Non-deterministic Logic**: Set monad ile choice and backtracking

- **Computational Contexts**: Monads as containers for structured computationocamlopt -c alkanes.ml

- **Categorical Thinking**: Category theory foundations ile principled design

let bind m f = ocamlopt -c main.ml

## 🎓 İleri Düzey Konular

  let result = List.concat_map f m inocamlopt -o ex02 atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx main.cmx

### Monad Transformers:

  List.sort_uniq compare result  (* Remove duplicates *)

```ocaml

(* Combining multiple monadic effects *)# ex03 için (reactions)

module MaybeT (M : MONAD) = struct

  type 'a t = 'a option M.tlet union s1 s2 = List.sort_uniq compare (s1 @ s2)ocamlopt -c atom.ml



  let return x = M.return (Some x)let inter s1 s2 = List.filter (fun x -> List.mem x s2) s1ocamlopt -c atoms.ml

  let bind m f = M.bind m (function

    | None -> M.return Nonelet diff s1 s2 = List.filter (fun x -> not (List.mem x s2)) s1ocamlopt -c molecule.ml

    | Some x -> f x)

end```ocamlopt -c molecules.ml

```````

ocamlopt -c alkane.ml

### Free Monads:

**Non-deterministic Operations:**ocamlopt -c alkanes.ml

````ocaml

(* Building interpreters for domain-specific languages *)- **Choice Points:** Multiple possible outcomesocamlopt -c reaction.ml

type 'a free_monad =

  | Pure of 'a- **Backtracking:** Explore all possibilitiesocamlopt -c main.ml

  | Free of ('a free_monad -> 'a free_monad)

```- **Set Operations:** Mathematical set theory operationsocamlopt -o ex03 atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx reaction.cmx main.cmx



### Kleisli Categories:- **Combination Logic:** Cartesian products with bind



```ocaml# ex04 için (full system)

(* Monadic function composition *)

let (>=>) f g x = f x >>= g## 🔬 Monoid Laws & Propertiesocamlopt -c atom.ml

let (<=<) g f x = f x >>= g

```ocamlopt -c atoms.ml



Bu proje, functional programming'in matematiksel temellerini OCaml dilinde pratik olarak uygulamanızı sağlar. Monoids ve monads'ın güçlü soyutlama kapasitelerini keşfederek, daha elegant ve maintainable kod yazma becerilerinizi geliştireceksiniz.### Associativity Law:ocamlopt -c molecule.ml

ocamlopt -c molecules.ml

```ocamlocamlopt -c alkane.ml

(* For any monoid, this must hold: *)ocamlopt -c alkanes.ml

(a ⊕ b) ⊕ c = a ⊕ (b ⊕ c)ocamlopt -c reaction.ml

ocamlopt -c alkane_combustion.ml

(* Examples from our implementations: *)ocamlopt -c main.ml

(* Watchtower: (2 + 3) + 4 = 2 + (3 + 4) = 9 mod 12 *)ocamlopt -o ex04 atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx reaction.cmx alkane_combustion.cmx main.cmx

(* App: (p1 combine p2) combine p3 = p1 combine (p2 combine p3) *)```

````

### İnteraktif Modda Test Etme

### Identity Element Law:

`````bash

```ocamlocaml

(* There exists an element e such that: *)# > #use "ex00/atom.ml";;

e ⊕ a = a ⊕ e = a# > #use "ex00/atoms.ml";;

# > let h = new Atoms.hydrogen;;

(* Examples: *)# > h#name;;

(* Watchtower: zero = 12, (12 + a) mod 12 = a *)

(* App: empty project with ("", 0) combines neutrally *)# Multiple files için

```# > #use "ex01/atom.ml";;

# > #use "ex01/atoms.ml";;

### Closure Property:# > #use "ex01/molecule.ml";;

# > #use "ex01/molecules.ml";;

```ocaml# > let water = new Molecules.water;;

(* For elements a, b in set S: *)# > water#formula;;

a ⊕ b ∈ S

# Alkane testing

(* Watchtower: hours 1-12 ⊕ hours 1-12 → hours 1-12 *)# > #use "ex02/alkane.ml";;

(* App: project ⊕ project → project *)# > let methane = new Alkane.alkane 1;;

```# > methane#name;;

```## 🎯 Öğrenilen Kavramlar

### Monoid Signatures:

1. **Virtual Classes**: `class virtual` ile abstract base class tanımlama

```ocaml2. **Virtual Methods**: `method virtual` ile subclass implementation requirement

module type MONOID = sig3. **Inheritance Chains**: Multi-level inheritance (atom → molecule → alkane)

  type t4. **Object Composition**: Molecule contains list of Atom objects

  val zero : t5. **Constructor Validation**: `initializer` ile parameter validation

  val add : t -> t -> t6. **Self Reference**: `self#method` kullanımı ve recursive method calls

end7. **Mathematical Modeling**: Chemical formulas ve stoichiometric calculations

8. **Systematic Naming**: Pattern-based naming systems (alkane nomenclature)

(* Integer Addition Monoid *)9. **Error Handling**: `invalid_arg` exceptions ve defensive programming

module IntAdd : MONOID = struct10. **Type Polymorphism**: Abstract interfaces ile concrete implementations

  type t = int11. **Algorithm Design**: Chemical equation balancing algorithms

  let zero = 012. **Complex Inheritance**: Virtual → Abstract → Concrete class hierarchies

  let add = (+)13. **Parameterized Classes**: Constructor parameters ile flexible object creation

end14. **Chemical Modeling**: Real-world chemistry concepts in OOP

15. **Formula Generation**: Automatic chemical formula calculation from composition

(* Float Multiplication Monoid *)

module FloatMult : MONOID = struct## ⚗️ Chemical OOP Hierarchy

  type t = float

  let zero = 1.0### Class Architecture:

  let add = ( *. )````

end

```Virtual Atom (Abstract Base)

├── Constructor: (name : string) (symbol : string) (atomic_number : int)

## 🧮 Monad Laws & Patterns├── Virtual Methods: All methods must be implemented in subclasses

├── Methods: name, symbol, atomic_number, to_string, equals

### Left Identity Law:└── Concrete Atoms: hydrogen, carbon, oxygen, nitrogen, helium, argon



```ocamlVirtual Molecule (Composition Class)

(* return a >>= f = f a *)├── Constructor: (name : string) (atoms : Atom.atom list)

├── Composition: Contains list of Atom objects

(* Try monad example: *)├── Methods: name, formula (calculated), to_string, equals

Try.return 5 >>= (fun x -> Success (x * 2)) = Success 10├── Formula Algorithm: Automatic generation from atom composition

Try.return 5 >>= (fun x -> Success (x * 2)) = (fun x -> Success (x * 2)) 5└── Concrete Molecules: water, carbon_dioxide, trinitrotoluene, glucose, benzene

```

Alkane (Specialized Molecule)

### Right Identity Law:├── Constructor: (n : int) with validation

├── Inheritance: alkane → molecule → atoms composition

```ocaml├── Formula: CnH(2n+2) mathematical formula

(* m >>= return = m *)├── Naming System: 1-12 named, >12 "Unknownane"

└── Concrete Alkanes: methane, ethane, propane, ..., dodecane

(* Set monad example: *)

[1; 2; 3] >>= Set.return = [1; 2; 3]Virtual Reaction (Abstract Interface)

[1; 2; 3] >>= (fun x -> [x]) = [1; 2; 3]├── Constructor: start result molecule lists

```├── Virtual Methods: get_start, get_result, balance, is_balanced

├── Type Safety: (Molecule.molecule \* int) list format

### Associativity Law:└── Implementation: alkane_combustion concrete class



```ocamlAlkane Combustion (Complete System)

(* (m >>= f) >>= g = m >>= (fun x -> f x >>= g) *)├── Constructor: (alkane_list) (O2_coef) (CO2_coef) (H2O_coef)

├── Inheritance: implements reaction virtual class

(* Try monad chaining: *)├── Algorithm: Chemical equation balancing CnH(2n+2) + O2 → CO2 + H2O

(try_divide 10 2 >>= try_sqrt) >>= try_log =└── Methods: get_start, get_result, balance, is_balanced

try_divide 10 2 >>= (fun x -> try_sqrt x >>= try_log)

`````

### Monad Usage Patterns:### Chemical Modeling Patterns:

`````ocaml#### 1. **Virtual Class Pattern** (Abstract Base):

(* 1. Error Propagation (Try Monad) *)```ocaml

let safe_calculation x =class virtual atom (name : string) (symbol : string) (atomic_number : int) =

  Try.return x  object

  >>= try_divide_by_2    method name = name

  >>= try_sqrt    method symbol = symbol

  >>= try_log    method atomic_number = atomic_number

  |> Try.recover 0.0    method virtual to_string : string

    method virtual equals : atom -> bool

(* 2. Non-deterministic Choice (Set Monad) *)  end

let all_combinations =````

  [1; 2] >>= fun x ->

  ['a'; 'b'] >>= fun y ->#### 2. **Composition Pattern** (Molecule contains Atoms):

  Set.return (x, y)

(* Result: [(1,'a'); (1,'b'); (2,'a'); (2,'b')] *)```ocaml

class virtual molecule (name : string) (atoms : Atom.atom list) =

(* 3. Composition with Bind *)  object (self)

let (>>=) = Try.bind    method name = name

let (>>=) = Set.bind    method formula = (* Calculate from atoms list *)

    method to_string = "Molecule(name: " ^ name ^ ", formula: " ^ self#formula ^ ")"

(* Chain operations naturally *)  end

computation >>= process >>= validate >>= output```

`````

#### 3. **Mathematical Modeling** (Alkane Formula):

## 🎨 Functor Patterns

````ocaml

### Generic Programming:class alkane (n : int) =

  object

```ocaml    initializer if n < 1 then invalid_arg "Alkane: n must be >= 1"

(* Parameterized modules for code reuse *)    inherit Molecule.molecule

module MakeCalculator (M : MONOID) = struct      (match n with | 1 -> "Methane" | 2 -> "Ethane" | _ -> "Unknownane")

  include M      (List.init n (fun _ -> new Atoms.carbon) @

         List.init ((2 * n) + 2) (fun _ -> new Atoms.hydrogen))

  let power base exp =  end

    let rec loop acc n =```

      if n <= 0 then acc

      else loop (M.mul acc base) (n - 1)#### 4. **Chemical Reaction Balancing** (Stoichiometry):

    in

    loop M.zero exp```ocaml

    let balance_equation alkanes =

  let sum_of_powers base start finish =  let num_carbons = count_carbon alkanes in

    let rec loop acc i =  let num_alkanes = List.length alkanes in

      if i > finish then acc  if ((3 * num_carbons) + num_alkanes) mod 2 = 0 then

      else loop (M.add acc (power base i)) (i + 1)    (* Even case: normal balancing *)

    in    (((3 * num_carbons) + num_alkanes) / 2, num_carbons, num_carbons + num_alkanes)

    loop M.zero start  else

end    (* Odd case: double the equation *)

```    ((3 * num_carbons) + num_alkanes, 2 * num_carbons, 2 * (num_carbons + num_alkanes))

````

### Type-Safe Abstractions:

## 🔄 Virtual vs Concrete Class Karşılaştırması

````ocaml

(* Different number types with same interface *)### Virtual Class Approach:

module IntCalc = MakeCalculator(struct

  type t = int```ocaml

  let zero = 1  (* Multiplicative identity *)(* Abstract base - cannot be instantiated *)

  let add = (+)class virtual atom name symbol atomic_number = object

  let mul = ( * )  method name = name

end)  method symbol = symbol

  method atomic_number = atomic_number

module FloatCalc = MakeCalculator(struct  method virtual to_string : string

  type t = float  method virtual equals : atom -> bool

  let zero = 1.0end

  let add = (+.)

  let mul = ( *. )(* Must be implemented by concrete classes *)

end)class hydrogen = object

```  inherit atom "Hydrogen" "H" 1

  method to_string = "Atom(name: Hydrogen, symbol: H, atomic_number: 1)"

## 📋 Mathematical Foundations  method equals other = (* implementation required *)

end

### Abstract Algebra Concepts:```



1. **Semigroup:** Set with associative binary operation### Concrete Class Approach:

2. **Monoid:** Semigroup with identity element

3. **Group:** Monoid with inverse elements```ocaml

4. **Functor:** Structure-preserving map between categories(* Direct implementation - can be instantiated *)

5. **Monad:** Functor with unit and join operationsclass concrete_atom name symbol atomic_number = object

  method name = name

### Categorical Theory in Practice:  method symbol = symbol

  method atomic_number = atomic_number

```ocaml  method to_string = "Atom(name: " ^ name ^ ", symbol: " ^ symbol ^ ", atomic_number: " ^ string_of_int atomic_number ^ ")"

(* Functor Laws *)  method equals other = name = other#name && symbol = other#symbol

fmap id = id                    (* Identity preservation *)end

fmap (g ∘ f) = fmap g ∘ fmap f  (* Composition preservation *)```



(* Monad Laws *)### Composition vs Inheritance:

return >=> f = f                (* Left identity *)

f >=> return = f                (* Right identity *)  ```ocaml

(f >=> g) >=> h = f >=> (g >=> h) (* Associativity *)(* Composition: Molecule contains Atoms *)

```class molecule name atoms = object

  method name = name

### Practical Applications:  method atoms = atoms  (* Contains other objects *)

  method formula = calculate_formula atoms

- **Watchtower:** Clock arithmetic modulo operationsend

- **App:** Business logic with algebraic properties

- **Calc:** Generic numeric computations(* Inheritance: Alkane extends Molecule *)

- **Try:** Exception handling as computational contextclass alkane n = object

- **Set:** Non-deterministic choice and backtracking  inherit molecule (get_alkane_name n) (generate_alkane_atoms n)

  method carbon_count = n

## 📋 Notlar  method formula_type = "CnH(2n+2)"

end

- **Monoid Properties**: Identity, associativity, closure laws ile mathematical rigor```

- **Type Safety**: OCaml's type system ile compile-time error prevention

- **Functional Composition**: Higher-order functions ile elegant code patterns## ⚗️ Chemical Equation Balancing System

- **Abstract Interfaces**: Module signatures ile implementation hiding

- **Generic Programming**: Functors ile code reuse and parameterization### Alkane Combustion Algorithm:

- **Error Handling**: Monadic error propagation ile robust programs

- **Mathematical Modeling**: Abstract algebra concepts ile practical applications**General Equation:** CnH(2n+2) + O2 → CO2 + H2O

- **Non-deterministic Logic**: Set monad ile choice and backtracking

- **Computational Contexts**: Monads as containers for structured computation#### Balancing Rules:

- **Categorical Thinking**: Category theory foundations ile principled design

1. **Carbon Balance:** Each alkane produces n CO2 molecules

## 🎓 İleri Düzey Konular2. **Hydrogen Balance:** Each alkane produces (n+1) H2O molecules

3. **Oxygen Balance:** O2 coefficient = (3n+1)/2 for single alkane

### Monad Transformers:4. **Multiple Alkanes:** Sum carbon counts, adjust coefficients



```ocaml#### Mathematical Implementation:

(* Combining multiple monadic effects *)

module MaybeT (M : MONAD) = struct```ocaml

  type 'a t = 'a option M.tmethod balance : alkane_combustion =

    let num_carbons = self#count_carbon alkane_list in

  let return x = M.return (Some x)  let num_alkanes = List.length alkane_list in

  let bind m f = M.bind m (function  if ((3 * num_carbons) + num_alkanes) mod 2 = 0 then

    | None -> M.return None    (* Even case: direct calculation *)

    | Some x -> f x)    new alkane_combustion

end      alkane_list

```      (((3 * num_carbons) + num_alkanes) / 2)  (* O2 coefficient *)

      num_carbons                               (* CO2 coefficient *)

### Free Monads:      (num_carbons + num_alkanes)              (* H2O coefficient *)

  else

```ocaml    (* Odd case: double the entire equation *)

(* Building interpreters for domain-specific languages *)    new alkane_combustion

type 'a free_monad =       (alkane_list @ alkane_list)              (* Double alkanes *)

  | Pure of 'a      ((3 * num_carbons) + num_alkanes)       (* O2 coefficient *)

  | Free of ('a free_monad -> 'a free_monad)      (2 * num_carbons)                       (* CO2 coefficient *)

```      ((2 * num_carbons) + (2 * num_alkanes)) (* H2O coefficient *)

````

### Kleisli Categories:

### Example Balanced Equations:

````ocaml

(* Monadic function composition *)#### 1. **Methane Combustion** (C1H4):

let (>=>) f g x = f x >>= g

let (<=<) g f x = f x >>= g```

```CH4 + 2 O2 → CO2 + 2 H2O

Coefficients: [1, 2, 1, 2]

Bu proje, functional programming'in matematiksel temellerini OCaml dilinde pratik olarak uygulamanızı sağlar. Monoids ve monads'ın güçlü soyutlama kapasitelerini keşfederek, daha elegant ve maintainable kod yazma becerilerinizi geliştireceksiniz.Calculation: C=1, H=4 → O2=(3*1+1)/2=2, CO2=1, H2O=1+1=2
````

#### 2. **Ethane Combustion** (C2H6):

```
2 C2H6 + 7 O2 → 4 CO2 + 6 H2O
Coefficients: [2, 7, 4, 6]
Calculation: C=2, H=6 → (3*2+1)=7 (odd), so double equation
```

#### 3. **Mixed Alkanes** (CH4 + C2H6):

```
CH4 + C2H6 + 5 O2 → 3 CO2 + 5 H2O
Calculation: Total C=3, Alkanes=2 → O2=(3*3+2)/2=5.5→multiply by 2
Final: 2 CH4 + 2 C2H6 + 11 O2 → 6 CO2 + 10 H2O
```

### Object Lifecycle in Chemical System:

#### **Creation Phase:**

- **Atoms:** Virtual class instantiation through concrete subclasses
- **Molecules:** Composition of atom lists, automatic formula calculation
- **Alkanes:** Mathematical generation based on carbon count
- **Reactions:** Start/result molecule lists with coefficients

#### **Computation Phase:**

- **Formula Generation:** Atom counting and sorting for chemical formulas
- **Validation:** Constructor checks (n ≥ 1 for alkanes)
- **Balancing:** Mathematical algorithms for stoichiometric coefficients
- **Verification:** is_balanced checks for equation correctness

#### **Output Phase:**

- **String Representation:** to_string methods for all objects
- **Chemical Equations:** Human-readable reaction equations
- **Error Handling:** Exceptions for invalid operations
- **Results:** Balanced reaction objects with correct coefficients

## 📋 Notlar

- **Virtual Classes**: Abstract base classes ile type safety ve code reuse
- **Chemical Accuracy**: Gerçek kimyasal formüller ve reaksiyon denklemi kuralları
- **Mathematical Modeling**: Stoichiometric calculations ile precise balancing
- **Inheritance Chains**: Virtual → Abstract → Concrete class progression
- **Composition Patterns**: Molecule-Atom relationships ile real-world modeling
- **Error Handling**: Constructor validation ve defensive programming
- **Algorithm Design**: Chemical equation balancing ile complex mathematical logic
- **Type Polymorphism**: Virtual methods ile flexible implementations
- **Systematic Design**: Progressive complexity from atoms to complex reactions
- **Real-world Application**: Chemistry domain ile practical OOP learning
