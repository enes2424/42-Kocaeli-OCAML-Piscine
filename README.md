# 42 Kocaeli OCAML Piscine

## Object-Oriented Programming (Nesne Yönelimli Programlama)

Bu proje, 42 Okulu OCaml Piscine eğitiminin yedinci modülüdür. OCaml'ın object-oriented programming özellikleri, class definitions, inheritance, encapsulation, method overriding ve object interactions konularında Doctor Who teması ile pratik uygulamalar geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - People Class

**Dosyalar:** `ex00/people.ml`, `ex00/main.ml`, `ex00/Makefile`

Temel sınıf tanımı ve nesne oluşturma - OOP'nin temel kavramları.

- **Class:** `people` - Temel insan karakteri sınıfı
- **Constructor Parameters:** `?(hp = 100) name` - Optional hp, required name
- **Methods:** `to_string`, `talk`, `die` - Temel nesne davranışları
- **Initializer:** Constructor çağrıldığında otomatik çalışan kod bloğu
- **Özellik:** Basic class definition, object instantiation, method calls
- **Örnek:**
  ```ocaml
  let person = new People.people "Rose Tyler";;
  (* "A new person named Rose Tyler has been created !" yazdırır *)
  person#to_string;;  (* "name : Rose Tyler, hp : 100" *)
  person#talk;;       (* "I'm Rose Tyler! Do you know the Doctor?" *)
  let dead = person#die;;  (* Yeni nesne döndürür, hp:0 ile *)
  ```

### ex01 - Doctor Class (Inheritance)

**Dosyalar:** `ex01/people.ml`, `ex01/doctor.ml`, `ex01/main.ml`, `ex01/Makefile`

Kalıtım ve kompozisyon - gelişmiş sınıf yapıları.

- **Class:** `doctor` - Doctor karakteri için özelleşmiş sınıf
- **Constructor:** `?(hp = 100) name age (sidekick : People.people)` - Sidekick composition
- **Methods:** `to_string`, `talk`, `travel_in_time`, `use_sonic_screwdriver`
- **Private Method:** `regenerate` - Encapsulation örneği
- **Object Reference:** `(self)` - Kendi nesnesine referans
- **Özellik:** Object composition, private methods, complex object interactions
- **Örnek:**
  ```ocaml
  let rose = new People.people "Rose Tyler";;
  let doctor = new Doctor.doctor "The Doctor" 900 rose;;
  doctor#talk;;  (* "Hi! I'm the Doctor!" *)
  doctor#use_sonic_screwdriver;;  (* Sonic screwdriver sesi *)
  let time_traveled = doctor#travel_in_time 2005 2023;;  (* Zaman yolculuğu *)
  ```

### ex02 - Dalek Class (Full OOP System)

**Dosyalar:** `ex02/people.ml`, `ex02/doctor.ml`, `ex02/dalek.ml`, `ex02/main.ml`, `ex02/Makefile`

Tam nesne yönelimli sistem - çoklu sınıf etkileşimi ve polimorfizm.

- **Class:** `dalek` - Doctor Who'nun düşman karakteri
- **Instance Variables:** `name` (computed), `mutable shield` - State management
- **Constructor:** `?(hp = 100) (unnecessary : string)` - Unused parameter example
- **Methods:** `to_string`, `talk`, `exterminate`, `die` - Complex behaviors
- **Random Generation:** Dinamik isim üretimi ve rastgele konuşma
- **Object Interaction:** Dalek vs People vs Doctor interactions
- **Özellik:** Mutable state, random behavior, complex object relationships
- **Örnek:**
  ```ocaml
  let dalek = new Dalek.dalek "Command";;
  (* Rastgele isim: "DalekAbc" gibi *)
  dalek#talk;;  (* Rastgele Dalek konuşması *)
  let human = new People.people "Mickey Smith";;
  let dead_human = dalek#exterminate human;;  (* Dalek insanı öldürür *)
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
# ex00 - People class
cd ex00
make run    # Derleme + çalıştırma + temizleme
make        # Sadece derleme
make clean  # Object dosyalarını temizle
make fclean # Tüm derlenmiş dosyaları temizle

# ex01 - Doctor class
cd ex01
make run    # Tam test suite çalıştır

# ex02 - Full OOP system
cd ex02
make run    # Epic battle simulation dahil
```

### Manuel Derleme

```bash
# ex00 için
ocamlopt -c people.ml
ocamlopt -c main.ml
ocamlopt -o ex00 people.cmx main.cmx

# ex01 için (dependencies)
ocamlopt -c people.ml
ocamlopt -c doctor.ml
ocamlopt -c main.ml
ocamlopt -o ex01 people.cmx doctor.cmx main.cmx

# ex02 için (full system)
ocamlopt -c people.ml
ocamlopt -c doctor.ml
ocamlopt -c dalek.ml
ocamlopt -c main.ml
ocamlopt -o ex02 people.cmx doctor.cmx dalek.cmx main.cmx
```

### İnteraktif Modda Test Etme

```bash
ocaml
# > #use "ex00/people.ml";;
# > let p = new people "Test";;
# > p#talk;;

# Multiple files için
# > #use "ex01/people.ml";;
# > #use "ex01/doctor.ml";;
# > let rose = new People.people "Rose";;
# > let doc = new Doctor.doctor "Doc" 30 rose;;
```

## 🎯 Öğrenilen Kavramlar

1. **Class Definition**: OCaml'da sınıf tanımlama syntax'ı ve semantiği
2. **Object Instantiation**: `new` keyword ile nesne oluşturma
3. **Method Calls**: `object#method` syntax ile method çağırma
4. **Initializers**: Constructor davranışları ve nesne initialization
5. **Optional Parameters**: `?(param = default)` ile varsayılan değerler
6. **Instance Variables**: `val` ve `val mutable` ile nesne durumu
7. **Private Methods**: `method private` ile encapsulation
8. **Object Composition**: Nesnelerin diğer nesneleri içermesi
9. **Self Reference**: `(self)` ile kendi nesnesine erişim
10. **Mutable State**: `mutable` fields ile değişebilir durum
11. **Random Generation**: Dinamik davranış ve rastgele değerler
12. **Object Interactions**: Nesneler arası karmaşık etkileşimler

## 🎭 Doctor Who OOP Hierarchy

### Class Relationships:

```
People (Base Class)
├── Constructor: ?(hp=100) name
├── Methods: to_string, talk, die
└── Used as: Base type, Sidekick composition

Doctor (Enhanced Class)
├── Constructor: ?(hp=100) name age sidekick
├── Composition: Contains People object (sidekick)
├── Methods: to_string, talk, travel_in_time, use_sonic_screwdriver
├── Private: regenerate method
└── Used as: Main character, complex behaviors

Dalek (Enemy Class)
├── Constructor: ?(hp=100) unnecessary
├── Instance vars: name (computed), mutable shield
├── Methods: to_string, talk, exterminate, die
├── Random: Name generation, speech patterns
└── Used as: Antagonist, battle system
```

### Object Interaction Patterns:

#### 1. **Composition Pattern** (Doctor + Sidekick):

```ocaml
let sidekick = new People.people "Rose Tyler" in
let doctor = new Doctor.doctor "The Doctor" 900 sidekick
(* Doctor nesnesi People nesnesini içerir *)
```

#### 2. **Method Interaction** (Dalek vs People):

```ocaml
let human = new People.people "Mickey" in
let dalek = new Dalek.dalek "Command" in
let dead_human = dalek#exterminate human
(* Dalek, People nesnesini parametre olarak alır *)
```

#### 3. **State Mutation** (Shield Management):

```ocaml
let dalek = new Dalek.dalek "Test" in
(* dalek.shield başlangıçta true *)
let _ = dalek#exterminate someone in
(* dalek.shield artık false *)
```

## 🔄 OOP vs Functional Karşılaştırması

### Object-Oriented Approach:

```ocaml
(* Stateful objects *)
let doctor = new Doctor.doctor "Who" 900 sidekick in
let new_doctor = doctor#travel_in_time 2020 2025
(* new_doctor farklı age'e sahip yeni nesne *)

(* Mutable state *)
let dalek = new Dalek.dalek "Command" in
dalek#exterminate human;  (* shield state değişir *)
```

### Functional Approach:

```ocaml
(* Pure functions *)
let travel_time age start_year end_year =
  age + (end_year - start_year)

(* Immutable data *)
type person = {name: string; hp: int}
let create_person name = {name; hp = 100}
```

## 🎮 Battle System Architecture

### Epic Battle Simulation (ex02):

1. **Setup Phase**: Doctor, Dalek, Human nesneleri oluşturma
2. **Interaction Phase**: Her nesne kendi talk() methodunu çağırır
3. **Combat Phase**: Dalek#exterminate vs Doctor#use_sonic_screwdriver
4. **Resolution Phase**: Doctor#regenerate, Dalek#die (temporal shift)

### Object Lifecycle:

- **Creation**: `new` ile instantiation + initializer çalışır
- **Usage**: Method calls ile nesne davranışları
- **Transformation**: Methods yeni nesneler döndürebilir (immutable style)
- **State Change**: Mutable fields değişebilir (mutable style)

## 📋 Notlar

- **OCaml OOP**: Functional programming temelinde object-oriented features
- **Immutable by Default**: Method'lar genellikle yeni nesneler döndürür
- **Selective Mutability**: `mutable` keyword ile seçici değişebilirlik
- **Type Safety**: Compile-time type checking ile güvenli object interactions
- **Performance**: Zero-cost abstractions, efficient method dispatch
- **Design Pattern**: Composition over inheritance principle
- **Real-world Modeling**: Doctor Who universe ile concrete domain modeling
- **Progressive Learning**: Simple classes → Inheritance → Complex interactions

