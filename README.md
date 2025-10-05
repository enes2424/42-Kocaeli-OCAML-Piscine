# 42 Kocaeli OCAML Piscine

## Virtual Classes & Chemical Modeling (Sanal Sınıflar ve Kimyasal Modelleme)

Bu proje, 42 Okulu OCaml Piscine eğitiminin sekizinci modülüdür. OCaml'ın virtual classes, advanced inheritance, object composition ve chemical modeling konularında Kimya teması ile moleküler yapıları ve kimyasal reaksiyonları modelleyen kapsamlı bir nesne yönelimli sistem geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - Virtual Atom Class & Concrete Atoms

**Dosyalar:** `ex00/atom.ml`, `ex00/atoms.ml`, `ex00/main.ml`, `ex00/Makefile`

Virtual class tanımı ve concrete implementations - Temel moleküler yapı.

- **Virtual Class:** `atom` - Abstract atom sınıfı (name, symbol, atomic_number)
- **Constructor:** `(name : string) (symbol : string) (atomic_number : int)`
- **Virtual Methods:** Tüm methodlar concrete subclass'larda implement edilir
- **Methods:** `name`, `symbol`, `atomic_number`, `to_string`, `equals`
- **Concrete Classes:** `hydrogen`, `carbon`, `oxygen`, `nitrogen`, `helium`, `argon`
- **Inheritance:** `inherit Atom.atom "Hydrogen" "H" 1` pattern
- **Özellik:** Virtual class pattern, type safety, chemical properties
- **Örnek:**
  ```ocaml
  let hydrogen = new Atoms.hydrogen;;
  hydrogen#name;;           (* "Hydrogen" *)
  hydrogen#symbol;;         (* "H" *)
  hydrogen#atomic_number;;  (* 1 *)
  hydrogen#to_string;;      (* "Atom(name: Hydrogen, symbol: H, atomic_number: 1)" *)
  ```

### ex01 - Virtual Molecule Class & Complex Molecules

**Dosyalar:** `ex01/atom.ml`, `ex01/atoms.ml`, `ex01/molecule.ml`, `ex01/molecules.ml`, `ex01/main.ml`, `ex01/Makefile`

Composition pattern ve molecular formula calculation - Kompleks moleküler yapılar.

- **Virtual Class:** `molecule` - Abstract molecule sınıfı (name, atoms list)
- **Constructor:** `(name : string) (atoms : Atom.atom list)`
- **Composition:** Molecule contains list of Atom objects
- **Formula Calculation:** Automatic chemical formula generation from atom list
- **Methods:** `name`, `formula`, `to_string`, `equals`
- **Concrete Molecules:** `water`, `carbon_dioxide`, `trinitrotoluene`, `glucose`, `benzene`
- **Self Reference:** `self#formula` usage in methods
- **Özellik:** Object composition, automatic formula generation, complex inheritance
- **Örnek:**

  ```ocaml
  let water = new Molecules.water;;
  water#name;;      (* "Water" *)
  water#formula;;   (* "H2O" *)
  water#to_string;; (* "Molecule(name: Water, formula: H2O)" *)

  let glucose = new Molecules.glucose;;
  glucose#formula;; (* "C6H12O6" *)
  ```

### ex02 - Alkane Hierarchy & Homologous Series

**Dosyalar:** `ex02/atom.ml`, `ex02/atoms.ml`, `ex02/molecule.ml`, `ex02/molecules.ml`, `ex02/alkane.ml`, `ex02/alkanes.ml`, `ex02/main.ml`, `ex02/Makefile`

Parameterized classes ve systematic naming - Alkan molekül serisi.

- **Alkane Class:** `alkane (n : int)` - CnH(2n+2) formülü ile alkan üretimi
- **Constructor Validation:** `if n < 1 then invalid_arg` ile error handling
- **Systematic Naming:** 1-12 karbon için özel isimler, >12 için "Unknownane"
- **Formula Generation:** `List.init n (fun _ -> carbon) @ List.init ((2*n)+2) (fun _ -> hydrogen)`
- **Concrete Alkanes:** `methane`, `ethane`, `propane`, ..., `dodecane`, `unknownane`
- **Inheritance Chain:** `alkane` → `molecule` → composition with `atom`
- **Özellik:** Mathematical formula application, systematic naming, parameterized constructors
- **Örnek:**

  ```ocaml
  let methane = new Alkanes.methane;;  (* C1: CH4 *)
  let propane = new Alkanes.propane;;  (* C3: C3H8 *)
  let big_alkane = new Alkane.alkane 20;;  (* C20H42 *)

  (* Error handling *)
  let invalid = new Alkane.alkane 0;;  (* Invalid_argument exception *)
  ```

### ex03 - Virtual Reaction Class

**Dosyalar:** `ex03/...ml`, `ex03/reaction.ml`, `ex03/main.ml`, `ex03/Makefile`

Abstract reaction modeling - Kimyasal reaksiyon çerçevesi.

- **Virtual Class:** `reaction start result` - Abstract chemical reaction
- **Constructor:** `start` ve `result` molekül listeleri
- **Virtual Methods:** `get_start`, `get_result`, `balance`, `is_balanced`
- **Type Parameters:** `(Molecule.molecule * int) list` format for stoichiometry
- **Abstract Interface:** Concrete reaction classes için temel çerçeve
- **Method Signatures:** All methods must be implemented in subclasses
- **Özellik:** Abstract interface design, type-safe reaction modeling
- **Örnek:**
  ```ocaml
  (* Virtual class - cannot be instantiated directly *)
  (* Must be implemented by concrete reaction classes *)
  class virtual reaction start result = object
    method virtual get_start : (Molecule.molecule * int) list
    method virtual get_result : (Molecule.molecule * int) list
    method virtual balance : reaction
    method virtual is_balanced : bool
  end
  ```

### ex04 - Alkane Combustion Implementation

**Dosyalar:** `ex04/...ml`, `ex04/alkane_combustion.ml`, `ex04/main.ml`, `ex04/Makefile`

Complete reaction system - Alkan yanma reaksiyonları.

- **Concrete Class:** `alkane_combustion` implements `reaction`
- **Constructor:** `(alkane_list) (molecular_oxygen_coef) (carbon_dioxide_coef) (water_coef)`
- **Inheritance:** `inherit Reaction.reaction start result` pattern
- **Chemical Balancing:** CnH(2n+2) + O2 → CO2 + H2O equation balancing
- **Private Methods:** `count_carbon` for stoichiometric calculations
- **Balance Algorithm:** Mathematical formula for oxygen, CO2, and water coefficients
- **Error Handling:** Unbalanced reactions throw exceptions
- **Özellik:** Complete chemical equation balancing, complex mathematical algorithms
- **Örnek:**

  ```ocaml
  let methane = new Alkanes.methane in
  let combustion = new Alkane_combustion.alkane_combustion [methane] 2 1 2 in
  combustion#is_balanced;;  (* true: CH4 + 2O2 → CO2 + 2H2O *)

  let unbalanced = new Alkane_combustion.alkane_combustion [methane] 1 1 1 in
  let balanced = unbalanced#balance;;  (* Auto-balance equation *)
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
# ex00 - Virtual atoms
cd ex00
make run    # Derleme + çalıştırma + temizleme
make        # Sadece derleme
make clean  # Object dosyalarını temizle
make fclean # Tüm derlenmiş dosyaları temizle

# ex01 - Molecules
cd ex01
make run    # Molecule composition test

# ex02 - Alkanes
cd ex02
make run    # Alkane series analysis

# ex03 - Virtual reactions
cd ex03
make run    # Abstract reaction framework

# ex04 - Alkane combustion
cd ex04
make run    # Chemical equation balancing
```

### Manuel Derleme

```bash
# ex00 için
ocamlopt -c atom.ml
ocamlopt -c atoms.ml
ocamlopt -c main.ml
ocamlopt -o ex00 atom.cmx atoms.cmx main.cmx

# ex01 için (dependencies)
ocamlopt -c atom.ml
ocamlopt -c atoms.ml
ocamlopt -c molecule.ml
ocamlopt -c molecules.ml
ocamlopt -c main.ml
ocamlopt -o ex01 atom.cmx atoms.cmx molecule.cmx molecules.cmx main.cmx

# ex02 için (alkanes)
ocamlopt -c atom.ml
ocamlopt -c atoms.ml
ocamlopt -c molecule.ml
ocamlopt -c molecules.ml
ocamlopt -c alkane.ml
ocamlopt -c alkanes.ml
ocamlopt -c main.ml
ocamlopt -o ex02 atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx main.cmx

# ex03 için (reactions)
ocamlopt -c atom.ml
ocamlopt -c atoms.ml
ocamlopt -c molecule.ml
ocamlopt -c molecules.ml
ocamlopt -c alkane.ml
ocamlopt -c alkanes.ml
ocamlopt -c reaction.ml
ocamlopt -c main.ml
ocamlopt -o ex03 atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx reaction.cmx main.cmx

# ex04 için (full system)
ocamlopt -c atom.ml
ocamlopt -c atoms.ml
ocamlopt -c molecule.ml
ocamlopt -c molecules.ml
ocamlopt -c alkane.ml
ocamlopt -c alkanes.ml
ocamlopt -c reaction.ml
ocamlopt -c alkane_combustion.ml
ocamlopt -c main.ml
ocamlopt -o ex04 atom.cmx atoms.cmx molecule.cmx molecules.cmx alkane.cmx alkanes.cmx reaction.cmx alkane_combustion.cmx main.cmx
```

### İnteraktif Modda Test Etme

````bash
ocaml
# > #use "ex00/atom.ml";;
# > #use "ex00/atoms.ml";;
# > let h = new Atoms.hydrogen;;
# > h#name;;

# Multiple files için
# > #use "ex01/atom.ml";;
# > #use "ex01/atoms.ml";;
# > #use "ex01/molecule.ml";;
# > #use "ex01/molecules.ml";;
# > let water = new Molecules.water;;
# > water#formula;;

# Alkane testing
# > #use "ex02/alkane.ml";;
# > let methane = new Alkane.alkane 1;;
# > methane#name;;
```## 🎯 Öğrenilen Kavramlar

1. **Virtual Classes**: `class virtual` ile abstract base class tanımlama
2. **Virtual Methods**: `method virtual` ile subclass implementation requirement
3. **Inheritance Chains**: Multi-level inheritance (atom → molecule → alkane)
4. **Object Composition**: Molecule contains list of Atom objects
5. **Constructor Validation**: `initializer` ile parameter validation
6. **Self Reference**: `self#method` kullanımı ve recursive method calls
7. **Mathematical Modeling**: Chemical formulas ve stoichiometric calculations
8. **Systematic Naming**: Pattern-based naming systems (alkane nomenclature)
9. **Error Handling**: `invalid_arg` exceptions ve defensive programming
10. **Type Polymorphism**: Abstract interfaces ile concrete implementations
11. **Algorithm Design**: Chemical equation balancing algorithms
12. **Complex Inheritance**: Virtual → Abstract → Concrete class hierarchies
13. **Parameterized Classes**: Constructor parameters ile flexible object creation
14. **Chemical Modeling**: Real-world chemistry concepts in OOP
15. **Formula Generation**: Automatic chemical formula calculation from composition

## ⚗️ Chemical OOP Hierarchy

### Class Architecture:
````

Virtual Atom (Abstract Base)
├── Constructor: (name : string) (symbol : string) (atomic_number : int)
├── Virtual Methods: All methods must be implemented in subclasses
├── Methods: name, symbol, atomic_number, to_string, equals
└── Concrete Atoms: hydrogen, carbon, oxygen, nitrogen, helium, argon

Virtual Molecule (Composition Class)
├── Constructor: (name : string) (atoms : Atom.atom list)
├── Composition: Contains list of Atom objects
├── Methods: name, formula (calculated), to_string, equals
├── Formula Algorithm: Automatic generation from atom composition
└── Concrete Molecules: water, carbon_dioxide, trinitrotoluene, glucose, benzene

Alkane (Specialized Molecule)
├── Constructor: (n : int) with validation
├── Inheritance: alkane → molecule → atoms composition
├── Formula: CnH(2n+2) mathematical formula
├── Naming System: 1-12 named, >12 "Unknownane"
└── Concrete Alkanes: methane, ethane, propane, ..., dodecane

Virtual Reaction (Abstract Interface)
├── Constructor: start result molecule lists
├── Virtual Methods: get_start, get_result, balance, is_balanced
├── Type Safety: (Molecule.molecule \* int) list format
└── Implementation: alkane_combustion concrete class

Alkane Combustion (Complete System)
├── Constructor: (alkane_list) (O2_coef) (CO2_coef) (H2O_coef)
├── Inheritance: implements reaction virtual class
├── Algorithm: Chemical equation balancing CnH(2n+2) + O2 → CO2 + H2O
└── Methods: get_start, get_result, balance, is_balanced

````

### Chemical Modeling Patterns:

#### 1. **Virtual Class Pattern** (Abstract Base):
```ocaml
class virtual atom (name : string) (symbol : string) (atomic_number : int) =
  object
    method name = name
    method symbol = symbol
    method atomic_number = atomic_number
    method virtual to_string : string
    method virtual equals : atom -> bool
  end
````

#### 2. **Composition Pattern** (Molecule contains Atoms):

```ocaml
class virtual molecule (name : string) (atoms : Atom.atom list) =
  object (self)
    method name = name
    method formula = (* Calculate from atoms list *)
    method to_string = "Molecule(name: " ^ name ^ ", formula: " ^ self#formula ^ ")"
  end
```

#### 3. **Mathematical Modeling** (Alkane Formula):

```ocaml
class alkane (n : int) =
  object
    initializer if n < 1 then invalid_arg "Alkane: n must be >= 1"
    inherit Molecule.molecule
      (match n with | 1 -> "Methane" | 2 -> "Ethane" | _ -> "Unknownane")
      (List.init n (fun _ -> new Atoms.carbon) @
       List.init ((2 * n) + 2) (fun _ -> new Atoms.hydrogen))
  end
```

#### 4. **Chemical Reaction Balancing** (Stoichiometry):

```ocaml
let balance_equation alkanes =
  let num_carbons = count_carbon alkanes in
  let num_alkanes = List.length alkanes in
  if ((3 * num_carbons) + num_alkanes) mod 2 = 0 then
    (* Even case: normal balancing *)
    (((3 * num_carbons) + num_alkanes) / 2, num_carbons, num_carbons + num_alkanes)
  else
    (* Odd case: double the equation *)
    ((3 * num_carbons) + num_alkanes, 2 * num_carbons, 2 * (num_carbons + num_alkanes))
```

## 🔄 Virtual vs Concrete Class Karşılaştırması

### Virtual Class Approach:

```ocaml
(* Abstract base - cannot be instantiated *)
class virtual atom name symbol atomic_number = object
  method name = name
  method symbol = symbol
  method atomic_number = atomic_number
  method virtual to_string : string
  method virtual equals : atom -> bool
end

(* Must be implemented by concrete classes *)
class hydrogen = object
  inherit atom "Hydrogen" "H" 1
  method to_string = "Atom(name: Hydrogen, symbol: H, atomic_number: 1)"
  method equals other = (* implementation required *)
end
```

### Concrete Class Approach:

```ocaml
(* Direct implementation - can be instantiated *)
class concrete_atom name symbol atomic_number = object
  method name = name
  method symbol = symbol
  method atomic_number = atomic_number
  method to_string = "Atom(name: " ^ name ^ ", symbol: " ^ symbol ^ ", atomic_number: " ^ string_of_int atomic_number ^ ")"
  method equals other = name = other#name && symbol = other#symbol
end
```

### Composition vs Inheritance:

```ocaml
(* Composition: Molecule contains Atoms *)
class molecule name atoms = object
  method name = name
  method atoms = atoms  (* Contains other objects *)
  method formula = calculate_formula atoms
end

(* Inheritance: Alkane extends Molecule *)
class alkane n = object
  inherit molecule (get_alkane_name n) (generate_alkane_atoms n)
  method carbon_count = n
  method formula_type = "CnH(2n+2)"
end
```

## ⚗️ Chemical Equation Balancing System

### Alkane Combustion Algorithm:

**General Equation:** CnH(2n+2) + O2 → CO2 + H2O

#### Balancing Rules:

1. **Carbon Balance:** Each alkane produces n CO2 molecules
2. **Hydrogen Balance:** Each alkane produces (n+1) H2O molecules
3. **Oxygen Balance:** O2 coefficient = (3n+1)/2 for single alkane
4. **Multiple Alkanes:** Sum carbon counts, adjust coefficients

#### Mathematical Implementation:

```ocaml
method balance : alkane_combustion =
  let num_carbons = self#count_carbon alkane_list in
  let num_alkanes = List.length alkane_list in
  if ((3 * num_carbons) + num_alkanes) mod 2 = 0 then
    (* Even case: direct calculation *)
    new alkane_combustion
      alkane_list
      (((3 * num_carbons) + num_alkanes) / 2)  (* O2 coefficient *)
      num_carbons                               (* CO2 coefficient *)
      (num_carbons + num_alkanes)              (* H2O coefficient *)
  else
    (* Odd case: double the entire equation *)
    new alkane_combustion
      (alkane_list @ alkane_list)              (* Double alkanes *)
      ((3 * num_carbons) + num_alkanes)       (* O2 coefficient *)
      (2 * num_carbons)                       (* CO2 coefficient *)
      ((2 * num_carbons) + (2 * num_alkanes)) (* H2O coefficient *)
```

### Example Balanced Equations:

#### 1. **Methane Combustion** (C1H4):

```
CH4 + 2 O2 → CO2 + 2 H2O
Coefficients: [1, 2, 1, 2]
Calculation: C=1, H=4 → O2=(3*1+1)/2=2, CO2=1, H2O=1+1=2
```

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

