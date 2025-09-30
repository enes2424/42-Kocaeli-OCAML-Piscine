# 42-Kocaeli-OCAML-Piscine

## Modules ve Data Structures (Modüller ve Veri Yapıları)

Bu proje, 42 Okulu OCaml Piscine eğitiminin dördüncü modülüdür. OCaml modül sistemi, custom data types, variant types ve record types ile kart oyunu sistemi geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - Color

**Dosyalar:** `ex00/Color.ml`, `ex00/main.ml`

Kart renklerini temsil eden basit variant type modülü.

- **Type:** `Color.t = Spade | Heart | Diamond | Club`
- **Fonksiyonlar:** `toString`, `toStringVerbose`, `all`
- **Açıklama:** Iskambil kartlarının 4 rengini (maça, kupa, karo, sinek) modelleme
- **Özellik:** Basit variant type ve pattern matching kullanımı
- **Örnek:**
  ```ocaml
  Color.toString Spade;;    (* "S" döndürür *)
  Color.toStringVerbose Heart;;  (* "Heart" döndürür *)
  Color.all;;              (* [Spade; Heart; Diamond; Club] *)
  ```

### ex01 - Value

**Dosyalar:** `ex01/Value.ml`, `ex01/main.ml`

Kart değerlerini temsil eden kapsamlı variant type modülü.

- **Type:** `Value.t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As`
- **Fonksiyonlar:** `toInt`, `toString`, `toStringVerbose`, `next`, `previous`, `all`
- **Açıklama:** Iskambil kartlarının 13 değerini modelleme ve değer dönüşümleri
- **Algoritma:** Sequential value navigation ve tip güvenli değer dönüşümleri
- **Örnek:**
  ```ocaml
  Value.toInt As;;         (* 13 döndürür *)
  Value.toString Jack;;    (* "J" döndürür *)
  Value.next T2;;          (* T3 döndürür *)
  Value.previous King;;    (* Queen döndürür *)
  ```

### ex02 - Card

**Dosyalar:** `ex02/Card.ml`, `ex02/main.ml`

Color ve Value modüllerini birleştiren kart sistemi modülü.

- **Type:** `Card.t = {color : Color.t; value : Value.t}`
- **Alt Modüller:** `Card.Color`, `Card.Value` (önceki modüllerin tekrarı)
- **Fonksiyonlar:** `newCard`, `getValue`, `getColor`, `toString`, `compare`, `max`, `min`, `best`
- **Kolleksiyonlar:** `allSpades`, `allHearts`, `allDiamonds`, `allClubs`, `all`
- **Konsept:** Record types, module composition, kart karşılaştırma algoritmaları
- **Örnek:**
  ```ocaml
  let card = Card.newCard As Spade;;  (* As maça kartı *)
  Card.toString card;;                (* "AS" döndürür *)
  Card.compare card1 card2;;          (* Değer karşılaştırması *)
  Card.best [card1; card2; card3];;   (* En yüksek değerli kartı bulur *)
  ```

### ex03 - Deck

**Dosyalar:** `ex03/Deck.ml`, `ex03/Deck.mli`, `ex03/main.ml`

Tam kart destesi yönetimi ve karıştırma sistemi.

- **Type:** `Deck.t = Card.t list`
- **Interface:** `Deck.mli` ile public API tanımı
- **Fonksiyonlar:** `newDeck`, `toStringList`, `toStringListVerbose`, `drawCard`
- **Açıklama:** 52 kartlık desteyi karıştırarak oluşturur ve kart çekme işlemleri
- **Algoritma:** Fisher-Yates benzeri karıştırma algoritması, immutable deck operations
- **Özellik:** Module interface (.mli) kullanımı, encapsulation, random deck generation
- **Örnek:**
  ```ocaml
  let deck = Deck.newDeck ();;        (* Karışık 52 kartlık deste *)
  let (card, remaining) = Deck.drawCard deck;;  (* Kart çek *)
  Deck.toStringList deck;;            (* ["AS"; "3H"; "QC"; ...] *)
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
# Tek bir dosyayı çalıştırma
ocaml ex00/main.ml

# Interaktiv modda test etme
ocaml
# > #use "ex00/Color.ml";;
# > Color.toString Spade;;

# Module interface ile çalıştırma (ex03)
ocaml ex03/Deck.mli ex03/Deck.ml ex03/main.ml
```

### Derleme

```bash
# Bytecode olarak derleme
ocamlc -o color_test ex00/Color.ml ex00/main.ml

# Native kod olarak derleme (ex03 için)
ocamlc -o deck_test ex03/Deck.mli ex03/Deck.ml ex03/main.ml

# Interactive modda modülleri test etme
ocaml -init ex02/Card.ml
```

### Test Etme

```bash
# Her egzersizi çalıştırma
cd ex00 && ocaml main.ml
cd ex01 && ocaml main.ml
cd ex02 && ocaml main.ml
cd ex03 && ocaml main.ml
```

## 🎯 Öğrenilen Kavramlar

1. **OCaml Module System**: Module tanımlama, module interfaces (.mli), module composition
2. **Variant Types**: Custom algebraic data types (Color.t, Value.t)
3. **Record Types**: Structured data modeling (Card record type)
4. **Pattern Matching**: Comprehensive pattern matching on custom types
5. **Module Encapsulation**: Public/private API design ile interface control
6. **Type Safety**: Compile-time güvenlik ve tip denetimi
7. **Immutable Data Structures**: Functional data manipulation
8. **List Operations**: List.map, List.fold_left, list processing
9. **Random Operations**: Shuffle algorithms, randomized data structures
10. **Card Game Modeling**: Real-world domain modeling with types
11. **Function Composition**: Modular function design ve composition
12. **Error Handling**: Exception handling with invalid_arg ve Failure

## 🃏 Kart Sistemi Mimarisi

### Modül Hiyerarşisi

```
Deck (ex03)
├── Card Module (ex02)
│   ├── Color Module (ex00)
│   └── Value Module (ex01)
└── Deck Operations
```

### Veri Akışı

1. **Color + Value** → **Card** (İki basit tipi birleştirme)
2. **Card Collection** → **Full Deck** (52 kartlık tam deste)
3. **Shuffle Algorithm** → **Random Deck** (Karışık deste)
4. **Draw Operations** → **Game State** (Oyun durumu yönetimi)

### Type Safety Benefits

- **Compile-time Validation**: Invalid kart kombinasyonları önlenir
- **Exhaustive Pattern Matching**: Tüm durumlar kontrol edilir
- **Interface Encapsulation**: Internal implementation gizlenir
- **Immutable Operations**: Side-effect free deck operations

## 📋 Notlar

- **Module System Focus**: OCaml'ın güçlü modül sistemi kullanımı
- **Progressive Complexity**: Basit tiplerden karmaşık sistemlere evolüsyon
- **Interface Design**: `.mli` dosyaları ile API design patterns
- **Real-world Modeling**: Iskambil kartları ile somut domain modeling
- **Type-driven Development**: Tipler önce, implementasyon sonra yaklaşımı
- **Functional Paradigm**: Pure functions ve immutable data structures
- **Card Game Foundation**: Daha karmaşık kart oyunları için temel yapı
