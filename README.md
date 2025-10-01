# 42-Kocaeli-OCAML-Piscine

## Monoids & Monads (Monoidler ve Monadlar)

Bu proje, 42 Okulu OCaml Piscine eğitiminin dokuzuncu modülüdür. OCaml'ın functional programming abstractions, monoids, functors ve monads konularında matematiksel ve pratik yaklaşımlarla abstract algebraic structures ve computational contexts'i modelleyen gelişmiş fonksiyonel programlama sistemleri geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - Watchtower Monoid

**Dosyalar:** `ex00/main.ml`, `ex00/Makefile`

Monoid pattern implementation - Clock arithmetic modulo system.

- **Module:** `Watchtower` - 12-hour clock arithmetic monoid
- **Type:** `hour = int` - Hours represented as integers
- **Identity:** `zero = 12` - Identity element for clock arithmetic
- **Operations:** `add`, `sub` - Closed operations with modular arithmetic
- **Properties:** Associativity, identity element, closure
- **Modular Logic:** All operations mod 12, with 0 mapped to 12
- **Özellik:** Basic monoid laws, clock arithmetic, modular operations
- **Örnek:**
  ```ocaml
  let zero = Watchtower.zero;;          (* 12 *)
  Watchtower.add 3 4;;                  (* 7 *)
  Watchtower.add 11 2;;                 (* 1 *)
  Watchtower.sub 3 5;;                  (* 10 *)
  ```

### ex01 - App Monoid

**Dosyalar:** `ex01/main.ml`, `ex01/Makefile`

Business logic monoid - Project management combine operations.

- **Module:** `App` - Project management monoid
- **Type:** `project = string * string * int` - (name, status, grade)
- **Identity:** `zero = ("", "", 0)` - Empty project as identity
- **Operations:** `combine`, `fail`, `success` - Project composition operations
- **Combine Logic:** Name concatenation, status determination, grade averaging
- **Status Rules:** "succeed" if grade > 80, "failed" otherwise
- **Özellik:** Business rule implementation, tuple manipulation, monoid properties
- **Örnek:**
  ```ocaml
  let p1 = ("42", "succeed", 90);;
  let p2 = ("OCaml", "failed", 60);;
  App.combine p1 p2;;               (* ("42OCaml", "succeed", 75) *)
  App.fail p1;;                     (* ("42", "failed", 0) *)
  App.success p2;;                  (* ("OCaml", "succeed", 80) *)
  ```

### ex02 - Calc Functor

**Dosyalar:** `ex02/main.ml`, `ex02/Makefile`

Generic calculator system - Parametric polymorphism with functors.

- **Module Type:** `MONOID` - Abstract interface for numeric operations
- **Functor:** `Calc (M : MONOID)` - Generic calculator parameterized by monoid
- **Implementations:** `INT` and `FLOAT` monoids with respective operations
- **Operations:** `add`, `sub`, `mul`, `div`, `power`, `fact` - Generic numeric operations
- **Type Safety:** Compile-time guarantees through module signatures
- **Zero Elements:** `zero1` (additive), `zero2` (multiplicative) identities
- **Özellik:** Parametric polymorphism, code reuse, type abstraction
- **Örnek:**
  ```ocaml
  module Calc_int = Calc(INT);;
  module Calc_float = Calc(FLOAT);;
  Calc_int.power 3 3;;              (* 27 *)
  Calc_float.power 3.0 3;;          (* 27.0 *)
  Calc_int.fact 5;;                 (* 120 *)
  ```

### ex03 - Try Monad

**Dosyalar:** `ex03/main.ml`, `ex03/Makefile`

Exception-safe computation monad - Error handling with functional composition.

- **Module:** `Try` - Monad for exception-safe operations
- **Type:** `'a t = Success of 'a | Failure of exn` - Result wrapper
- **Operations:** `return`, `bind`, `recover`, `filter`, `flatten` - Monadic operations
- **Exception Safety:** All operations automatically catch and wrap exceptions
- **Chaining:** Seamless composition of potentially failing computations
- **Recovery:** Error handling with fallback values and recovery functions
- **Özellik:** Monadic error handling, functional composition, exception safety
- **Örnek:**
  ```ocaml
  let safe_divide x y = if y = 0 then raise Division_by_zero else x / y;;
  Try.return 10;;                          (* Success 10 *)
  Try.bind (Try.Success 10) (fun x -> Try.Success (x * 2));;  (* Success 20 *)
  Try.bind (Try.Success 10) (fun x -> Try.Success (safe_divide x 0));;  (* Failure *)
  Try.recover (Try.Failure Division_by_zero) (fun _ -> Try.Success 0);;  (* Success 0 *)
  ```

### ex04 - Set Monad

**Dosyalar:** `ex04/main.ml`, `ex04/Makefile`

Non-deterministic computation monad - Choice operations and set theory.

- **Module:** `Set` - Monad for non-deterministic computations
- **Type:** `'a t = 'a list` - Sets represented as lists with deduplication
- **Operations:** `return`, `bind`, `union`, `inter`, `diff`, `filter` - Set operations
- **Bind Logic:** Cartesian product with automatic duplicate removal
- **Set Theory:** Mathematical set operations (union, intersection, difference)
- **Non-determinism:** Multiple possible outcomes through choice points
- **Özellik:** Non-deterministic computation, set theory, choice operations
- **Örnek:**
  ```ocaml
  Set.return 42;;                          (* [42] *)
  Set.bind [1; 2] (fun x -> [x; x*2]);;    (* [1; 2; 2; 4] *)
  Set.union [1; 2] [2; 3];;                (* [1; 2; 3] *)
  Set.inter [1; 2; 3] [2; 3; 4];;          (* [2; 3] *)
  Set.diff [1; 2; 3] [2; 3; 4];;           (* [1] *)
  ```

## 🏗️ Temel Kavramlar

### Monoid Laws (Monoid Kuralları)

**Associativity (Birleşmeli Özellik):**

```ocaml
(* Monoid operasyonu için: (a ⊕ b) ⊕ c = a ⊕ (b ⊕ c) *)
(* Watchtower örnegi: (3 + 4) + 5 = 3 + (4 + 5) = 12 mod 12 *)
```

**Identity Element (Birim Eleman):**

```ocaml
(* e ⊕ a = a ⊕ e = a şartını sağlayan e elementi *)
(* Watchtower: zero = 12, App: zero = ("", "", 0) *)
```

**Closure (Kapalılık):**

```ocaml
(* Aynı türden iki eleman birleştirildiğinde yine aynı türden sonuç *)
(* Watchtower: hour + hour → hour *)
```

### Monad Laws (Monad Kuralları)

**Left Identity (Sol Birim):**

```ocaml
(* return a >>= f = f a *)
(* Try.return 5 >>= f = f 5 *)
```

**Right Identity (Sağ Birim):**

```ocaml
(* m >>= return = m *)
(* Try monad example: Try.Success 5 >>= Try.return = Try.Success 5 *)
```

**Associativity (Birleşmeli Özellik):**

```ocaml
(* (m >>= f) >>= g = m >>= (fun x -> f x >>= g) *)
(* Monadic composition associativity *)
```

### Functor Pattern

**Generic Programming:**

```ocaml
(* Calc functor parameterized by MONOID *)
module Calc (M : MONOID) = struct
  let power base exp = (* Generic power using M.mul *)
  let fact n = (* Generic factorial using M.mul *)
end
```

## 🔧 Kullanım

### OCaml Kurulumu

```bash
# Ubuntu/Debian
sudo apt-get install ocaml

# macOS (Homebrew)
brew install ocaml

# OPAM ile
opam install ocaml
```

### Makefile ile Derleme ve Çalıştırma

```bash
# ex00 - Watchtower Monoid
cd ex00
make run    # Derleme + çalıştırma + temizleme
make        # Sadece derleme
make clean  # Object dosyalarını temizle
make fclean # Tüm derlenmiş dosyaları temizle

# ex01 - App Monoid
cd ex01
make run    # Project management monoid test

# ex02 - Calc Functor
cd ex02
make run    # Generic calculator test

# ex03 - Try Monad
cd ex03
make run    # Exception-safe computation test

# ex04 - Set Monad
cd ex04
make run    # Non-deterministic computation test
```

### Manuel Derleme

````bash
```bash
# ex00 - Watchtower Monoid
cd ex00
ocaml main.ml

# ex01 - App Monoid
cd ex01
ocaml main.ml

# ex02 - Calc Functor
cd ex02
ocaml main.ml

# ex03 - Try Monad
cd ex03
ocaml main.ml

# ex04 - Set Monad
cd ex04
ocaml main.ml

# Derlenmiş binary oluşturmak için
ocamlopt -o watchtower main.ml   # ex00
ocamlopt -o app main.ml          # ex01
ocamlopt -o calc main.ml         # ex02
ocamlopt -o try_monad main.ml    # ex03
ocamlopt -o set_monad main.ml    # ex04
ocamlopt -o ex04 atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx reaction.cmx alkane_combustion.cmx main.cmx
````

### İnteraktif Modda Test Etme

```bash
ocaml
# Watchtower monoid test
# > #use "ex00/main.ml";;
# > Watchtower.add 3 4;;
# > Watchtower.zero;;

# App monoid test
# > #use "ex01/main.ml";;
# > let p1 = ("42", "succeed", 90);;
# > let p2 = ("OCaml", "failed", 60);;
# > App.combine p1 p2;;

# Calc functor test
# > #use "ex02/main.ml";;
# > Calc_int.power 3 3;;
# > Calc_float.fact 5.0;;

# Try monad test
# > #use "ex03/main.ml";;
# > Try.return 42;;
# > Try.bind (Try.Success 10) (fun x -> Try.Success (x * 2));;

# Set monad test
# > #use "ex04/main.ml";;
# > Set.return 42;;
# > Set.union [1; 2] [2; 3];;
```

## 🎯 Öğrenilen Kavramlar

1. **Monoid Laws**: Associativity, identity element, closure properties
2. **Abstract Algebra**: Mathematical structures ve algebraic operations
3. **Functor Pattern**: Generic modules parameterized by type interfaces
4. **Monad Laws**: `return`, `bind`, left/right identity, associativity
5. **Exception Safety**: Try monad ile exception-safe computation chains
6. **Non-deterministic Logic**: Set monad ile choice ve backtracking
7. **Type Safety**: OCaml type system ile compile-time guarantees
8. **Parametric Polymorphism**: Code reuse through generic programming
9. **Functional Composition**: Higher-order functions ve monadic chaining
10. **Error Handling**: Monadic error propagation ve recovery patterns
11. **Mathematical Abstractions**: Category theory concepts in practice
12. **Computational Contexts**: Wrapping computations in structured environments
13. **Generic Operations**: Type-agnostic algorithms via functors
14. **Pattern Matching**: Variant type handling ve case analysis
15. **Abstract Interfaces**: Module signatures ile implementation hiding

## 🧮 Functional Programming Hierarchy

### Abstract Algebraic Structures:

### Abstract Algebraic Structures:

**Semigroup (Yarıgrup)**
├── Set with associative binary operation
├── Property: (a ⊕ b) ⊕ c = a ⊕ (b ⊕ c)
└── Example: Non-empty lists with concatenation

**Monoid (Monoid)**
├── Semigroup + identity element
├── Properties: Associativity + Identity + Closure
├── Identity: e ⊕ a = a ⊕ e = a
└── Examples: Watchtower (clock), App (projects)

**Functor (Fonktör)**
├── Structure-preserving mapping between categories
├── Laws: fmap id = id, fmap (g ∘ f) = fmap g ∘ fmap f
├── Generic Programming: Code reuse via parameterization
└── Example: Calc functor with MONOID parameter

**Monad (Monad)**
├── Functor + return + bind operations
├── Laws: Left identity, Right identity, Associativity
├── Computational Context: Wrapping values in structured computation
├── Error Handling: Try monad with Success/Failure
└── Non-determinism: Set monad with choice operations

### Monadic Computation Patterns:

#### 1. **Identity Monad Pattern**:

```ocaml
(* Simple value wrapping *)
type 'a identity = Identity of 'a
let return x = Identity x
let bind (Identity x) f = f x
```

#### 2. **Error Handling Pattern** (Try Monad):

```ocaml
type 'a result = Success of 'a | Failure of exn
let return x = Success x
let bind m f = match m with
  | Success x -> (try f x with e -> Failure e)
  | Failure e -> Failure e
```

#### 3. **Choice Pattern** (Set Monad):

```ocaml
type 'a set = 'a list
let return x = [x]
let bind m f = List.concat_map f m |> List.sort_uniq compare
let union s1 s2 = List.sort_uniq compare (s1 @ s2)
```

#### 4. **Generic Programming Pattern** (Functor):

```ocaml
module type MONOID = sig
  type t
  val zero : t
  val add : t -> t -> t
end

module Calc (M : MONOID) = struct
  let power base exp = (* Generic power using M.mul *)
  let factorial n = (* Generic factorial using M.mul *)
end
```

## 💡 Monadic Composition Examples

### 1. **Sequential Computation** (Try Monad):

```ocaml
let safe_computation x =
  Try.return x
  >>= safe_divide_by_2
  >>= safe_sqrt
  >>= safe_log
  |> Try.recover 0.0

(* Equivalent to: *)
let result =
  match safe_divide_by_2 x with
  | Success v1 -> (match safe_sqrt v1 with
    | Success v2 -> (match safe_log v2 with
      | Success v3 -> Success v3
      | Failure e -> Failure e)
    | Failure e -> Failure e)
  | Failure e -> Failure e
```

### 2. **Non-deterministic Choice** (Set Monad):

```ocaml
let cartesian_product =
  [1; 2; 3] >>= fun x ->
  ['a'; 'b'] >>= fun y ->
  Set.return (x, y)
(* Result: [(1,'a'); (1,'b'); (2,'a'); (2,'b'); (3,'a'); (3,'b')] *)
```

### 3. **Business Logic Composition** (App Monoid):

```ocaml
let project_pipeline =
  App.zero
  |> App.combine ("Frontend", "succeed", 85)
  |> App.combine ("Backend", "succeed", 90)
  |> App.combine ("Testing", "failed", 70)
(* Result: Combined project with averaged grades and status *)
```

## 🔬 Mathematical Foundations

### Category Theory in Practice:

**Functor Laws:**

```ocaml
(* Identity: fmap id = id *)
fmap (fun x -> x) container = container

(* Composition: fmap (g ∘ f) = fmap g ∘ fmap f *)
fmap (fun x -> g (f x)) = compose (fmap g) (fmap f)
```

**Monad Laws:**

```ocaml
(* Left Identity: return a >>= f = f a *)
Try.return 5 >>= f = f 5

(* Right Identity: m >>= return = m *)
Try.Success 5 >>= Try.return = Try.Success 5

(* Associativity: (m >>= f) >>= g = m >>= (fun x -> f x >>= g) *)
```

### Algebraic Data Types:

```ocaml
(* Sum Types (Variants) *)
type 'a result = Success of 'a | Failure of string
type color = Red | Green | Blue

(* Product Types (Records/Tuples) *)
type project = string * string * int
type point = { x : float; y : float }

(* Recursive Types *)
type 'a tree = Leaf | Node of 'a * 'a tree * 'a tree
type 'a list = [] | (::) of 'a * 'a list
```

### Computational Complexity:

**Time Complexity:**

- **Watchtower operations:** O(1) - Constant time modulo arithmetic
- **App combine:** O(1) - Simple tuple operations
- **Calc operations:** O(n) for power, O(n!) for factorial
- **Try bind chain:** O(n) where n is chain length
- **Set operations:** O(n log n) for deduplication, O(n²) for intersection

**Space Complexity:**

- **Monoid operations:** O(1) - In-place operations
- **Set monad bind:** O(n²) - Cartesian product expansion
- **Try monad chain:** O(1) - Constant space overhead
- **Functor applications:** O(1) - Type-level operations only

## 📋 Notlar

- **Monoid Laws**: Identity, associativity, closure properties ile mathematical rigor
- **Functional Purity**: Side-effect-free functions ve referential transparency
- **Type Safety**: OCaml's strong type system ile compile-time error prevention
- **Abstract Algebra**: Real mathematical structures in practical programming
- **Parametric Polymorphism**: Generic programming ile code reuse ve maintainability
- **Monadic Composition**: Sequential computation ile elegant error handling
- **Category Theory**: Mathematical foundations ile principled software design
- **Exception Safety**: Try monad ile robust error propagation
- **Non-deterministic Logic**: Set monad ile choice ve backtracking algorithms
- **Mathematical Abstractions**: Pure functional approach to complex problems
- **Generic Algorithms**: Functor pattern ile type-agnostic implementations
- **Computational Contexts**: Structured computation environments ile powerful abstractions
- **Higher-Order Functions**: Functions as first-class values ile expressive programming
- **Pattern Matching**: Algebraic data types ile exhaustive case analysis
- **Progressive Complexity**: Simple monoids to advanced monadic transformations

Bu proje, functional programming'in matematiksel temellerini OCaml dilinde pratik olarak uygulamanızı sağlar. Monoids ve monads'ın güçlü soyutlama kapasitelerini keşfederek, daha elegant ve maintainable kod yazma becerilerinizi geliştireceksiniz.
