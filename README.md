# 42 Kocaeli OCAML Piscine

## Functors (Fonktörler)

Bu proje, 42 Okulu OCaml Piscine eğitiminin altıncı modülüdür. OCaml'ın güçlü functor sistemi, parameterized modules, module signatures ve advanced module system konularında pratik uygulamalar geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - StringSet

**Dosya:** `ex00/ex00.ml`

Built-in Set functor kullanımı ile string koleksiyonu.

- **Functor:** `Set.Make(String)` - String tipine özelleşmiş Set modülü
- **İşlemler:** `add`, `fold_right`, `iter`, `fold`
- **Açıklama:** OCaml'ın standart kütüphanesindeki Set functor'ını kullanarak string seti oluşturma
- **Özellik:** Built-in functors, set operations, functional data structures
- **Örnek:**
  ```ocaml
  module StringSet = Set.Make(String);;
  let set = List.fold_right StringSet.add ["foo"; "bar"; "baz"] StringSet.empty;;
  StringSet.iter print_endline set;;  (* Alfabetik sırada yazdırır *)
  ```

### ex01 - StringHashtbl

**Dosya:** `ex01/ex01.ml`

Custom hash table functor implementasyonu.

- **Module Type:** `StringHashable` - Hash table için gerekli signature
- **Fonksiyonlar:** `equal`, `hash` - Hashtbl.Make için gerekli fonksiyonlar
- **Functor:** `Hashtbl.Make(StringHashable)` - Custom hash table oluşturma
- **Açıklama:** String'ler için hash table oluşturup, key-value pair'ları saklama
- **Özellik:** Custom module types, hash functions, mutable data structures
- **Örnek:**
  ```ocaml
  module StringHashtbl = Hashtbl.Make(StringHashable);;
  let ht = StringHashtbl.create 5;;
  StringHashtbl.add ht "Hello" 5;;    (* "Hello" -> 5 mapping *)
  StringHashtbl.iter (fun k v -> Printf.printf "%s -> %d\n" k v) ht;;
  ```

### ex02 - MakeProjection

**Dosya:** `ex02/ex02.ml`

First ve second projection functor'ları - tuple elemanlarına erişim.

- **Module Types:** `PAIR`, `VAL`, `MAKEPROJECTION` - Functor signatures
- **Functors:** `MakeFst`, `MakeSnd` - Tuple'ın birinci ve ikinci elemanını çıkaran functors
- **Açıklama:** Pair tipinden değer çıkaran generic functor implementasyonu
- **Konsept:** Higher-order modules, projection operations, parameterized modules
- **Örnek:**
  ```ocaml
  module Pair = struct let pair = (21, 42) end;;
  module Fst = MakeFst(Pair);;  (* Fst.x = 21 *)
  module Snd = MakeSnd(Pair);;  (* Snd.x = 42 *)
  ```

### ex03 - Fixed Point Arithmetic

**Dosya:** `ex03/ex03.ml`

Fixed-point arithmetic system - sabit noktalı sayı sistemi functor'u.

- **Module Types:** `FRACTIONNAL_BITS`, `FIXED`, `MAKE` - Complex type signatures
- **Functor:** `Make` - Bit precision parametresi alan fixed-point arithmetic
- **İşlemler:** Aritmetik (`add`, `sub`, `mul`, `div`), karşılaştırma (`gth`, `lth`), dönüşüm (`of_float`, `to_int`)
- **Açıklama:** Farklı precision'larda sabit noktalı sayı aritmetiği implementasyonu
- **Özellik:** Complex parameterized modules, bit manipulation, numerical computing
- **Örnek:**
  ```ocaml
  module Fixed8 = Make(struct let bits = 8 end);;
  let x = Fixed8.of_float 21.5;;
  let y = Fixed8.add x (Fixed8.of_int 10);;  (* 31.5 *)
  Fixed8.to_string y;;  (* "31.5" *)
  ```

### ex04 - Expression Evaluator

**Dosya:** `ex04/ex04.ml`

Generic expression evaluator functor - farklı tiplerle matematiksel ifade değerlendirme.

- **Module Types:** `VAL`, `EVALEXPR`, `MAKEEVALEXPR` - Generic evaluation system
- **Expression Types:** `Value`, `Add`, `Mul` - Recursive data structure
- **Implementations:** `IntVal`, `FloatVal`, `StringVal` - Farklı tip implementasyonları
- **Açıklama:** Aynı expression syntax'ı ile farklı tiplerde hesaplama yapabilen generic evaluator
- **Özellik:** Recursive data types, generic algorithms, type abstraction
- **Örnek:**

  ```ocaml
  module IntEvalExpr = MakeEvalExpr(IntVal);;
  let expr = IntEvalExpr.Add(IntEvalExpr.Value 40, IntEvalExpr.Value 2);;
  IntEvalExpr.eval expr;;  (* 42 *)

  (* Aynı yapı, farklı tip *)
  module StringEvalExpr = MakeEvalExpr(StringVal);;
  let str_expr = StringEvalExpr.Mul(StringEvalExpr.Value "Hello", StringEvalExpr.Value " World");;
  StringEvalExpr.eval str_expr;;  (* "Hello World" *)
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

### Dosyaları Çalıştırma

```bash
# ex00 - StringSet
ocaml ex00/ex00.ml

# ex01 - StringHashtbl
ocaml ex01/ex01.ml

# ex02 - MakeProjection
ocaml ex02/ex02.ml

# ex03 - Fixed Point Arithmetic
ocaml ex03/ex03.ml

# ex04 - Expression Evaluator
ocaml ex04/ex04.ml
```

### İnteraktif Modda Test Etme

```bash
ocaml
# > #use "ex00/ex00.ml";;
# > let set = StringSet.empty;;
# > let set = StringSet.add "test" set;;

# Module sistemi test etme
# > #use "ex02/ex02.ml";;
# > Fst.x;;
# > Snd.x;;
```

### Derleme

```bash
# Bytecode olarak derleme
ocamlc -o ex00 ex00/ex00.ml

# Native kod olarak derleme
ocamlopt -o ex00 ex00/ex00.ml

# Tüm egzersizleri derleme
for i in {0..4}; do ocamlc -o ex0$i ex0$i/ex0$i.ml; done
```

## 🎯 Öğrenilen Kavramlar

1. **Functors (Fonktörler)**: Module'dan module'a fonksiyonlar, parameterized modules
2. **Module Signatures**: Module type definitions, interface specifications
3. **Higher-Order Modules**: Module'ları parametre olarak alan ve döndüren functors
4. **Built-in Functors**: `Set.Make`, `Hashtbl.Make`, `Map.Make` gibi standart functors
5. **Parameterized Data Structures**: Generic veri yapıları ve algoritmalar
6. **Module System Design**: Complex module hierarchies ve dependencies
7. **Type Abstraction**: Module signatures ile implementation hiding
8. **Generic Programming**: Type-parametric algorithms ve data structures
9. **Module Composition**: Functor'lar ile module'ları birleştirme
10. **Advanced Type System**: `with type` constraints, signature matching
11. **Code Reusability**: Generic components ile kod tekrarının önlenmesi
12. **Design Patterns**: OCaml'da functional design patterns

## 🏗️ Functor Mimarisi

### Functor Türleri Bu Projede:

#### 1. **Simple Application Functors** (ex00, ex01):

```ocaml
(* Built-in functor kullanımı *)
module StringSet = Set.Make(String)
module StringHashtbl = Hashtbl.Make(StringHashable)
```

#### 2. **Custom Functors** (ex02):

```ocaml
(* Kendi functor'umuzu tanımlama *)
module type MAKEPROJECTION = functor (P : PAIR) -> VAL
module MakeFst : MAKEPROJECTION = functor (P : PAIR) -> struct
  let x = fst P.pair
end
```

#### 3. **Complex Parameterized Modules** (ex03):

```ocaml
(* Çoklu parametre ve complex interface *)
module type MAKE = functor (F : FRACTIONNAL_BITS) -> FIXED
module Make : MAKE = functor (F : FRACTIONNAL_BITS) -> struct
  (* Complex implementation *)
end
```

#### 4. **Generic Algorithm Functors** (ex04):

```ocaml
(* Generic evaluation system *)
module type MAKEEVALEXPR = functor (V : VAL) -> EVALEXPR with type t = V.t
```

### Functor Avantajları:

- **Code Reuse**: Aynı algorithm, farklı tiplerle
- **Type Safety**: Compile-time type checking
- **Modularity**: Clean separation of concerns
- **Abstraction**: Implementation details hiding
- **Genericity**: Type-parametric programming

## 🔄 Functor vs Function Karşılaştırması

### Functions (Değerler arası):

```ocaml
let add x y = x + y
let result = add 5 3  (* 8 *)
```

### Functors (Modüller arası):

```ocaml
module type NUM = sig
  type t
  val add : t -> t -> t
end

module MakeCalculator(N : NUM) = struct
  let calculate x y = N.add x y
end

module IntCalc = MakeCalculator(struct type t = int let add = (+) end)
```

## 🧮 Mathematical Applications

### Fixed-Point Arithmetic (ex03):

- **Use Case**: Financial calculations, embedded systems
- **Precision Control**: Configurable fractional bits
- **Performance**: Integer arithmetic speed with decimal precision
- **Applications**: Graphics, signal processing, monetary calculations

### Expression Evaluation (ex04):

- **Generic Evaluation**: Same syntax, different semantics
- **Applications**: Calculator, symbolic math, compiler design
- **Extensibility**: Easy to add new operations or types

## 📋 Notlar

- **Advanced Module System**: OCaml'ın en güçlü özelliklerinden biri olan functor sistemi
- **Generic Programming**: Type-safe generic programming without runtime overhead
- **Standard Library**: OCaml'ın standard library'si functor'larla yazılmış
- **Design Philosophy**: "Make illegal states unrepresentable" principle
- **Performance**: Zero-cost abstractions, compile-time specialization
- **Real-world Usage**: Compiler construction, data structure libraries, numerical computing
- **Learning Curve**: Advanced concept, but extremely powerful for large-scale software design

