# 42-Kocaeli-OCAML-Piscine

## Pattern Matching ve Data Types (Desen Eşleştirme ve Veri Türleri)

Bu proje, 42 Okulu OCaml Piscine eğitiminin üçüncü modülüdür. Pattern matching, custom data types, variant types ve record types ile moleküler biyoloji konularında algoritmalar geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - encode

**Dosya:** `ex00/encode.ml`

Run-length encoding algoritması - ardışık öğeleri sayarak kodlama.

- **Fonksiyon:** `encode : 'a list -> (int * 'a) list`
- **Açıklama:** Listede ardışık aynı öğeleri sayarak (sayı, öğe) tuple'ları oluşturur
- **Özellik:** Polymorphic function - herhangi bir tip ile çalışır
- **Örnek:**
  ```ocaml
  encode ["abc"; "abc"; "xyz"; "mno"; "mno"; "mno"];;
  (* [(2, "abc"); (1, "xyz"); (3, "mno")] *)
  encode ['a'; 'a'; 'a'; 'b'; 'b'];;
  (* [(3, 'a'); (2, 'b')] *)
  ```

### ex01 - crossover

**Dosya:** `ex01/crossover.ml`

İki liste arasında ortak öğeleri bulan intersection fonksiyonu.

- **Fonksiyon:** `crossover : 'a list -> 'a list -> 'a list`
- **Açıklama:** İki listede bulunan ortak öğeleri (duplicates olmadan) döndürür
- **Algoritma:** Linear search ile intersection hesaplama
- **Örnek:**
  ```ocaml
  crossover [1; 1; 1; 1; 2; 3; 3; 4; 5] [2; 4; 4];;
  (* [4; 2] *)
  crossover ['x'; 'y'; 'z'] ['a'; 'b'; 'y'];;
  (* ['y'] *)
  ```

### ex02 - gray

**Dosya:** `ex02/gray.ml`

Gray Code üretici - binary reflected Gray code dizisi oluşturma.

- **Fonksiyon:** `gray : int -> unit`
- **Açıklama:** Verilen bit uzunluğunda Gray code dizisini ekrana yazdırır
- **Algoritma:** Recursive binary reflected Gray code generation
- **Örnek:**
  ```ocaml
  gray 2;;
  (* 00 01 11 10 yazdırır *)
  gray 3;;
  (* 000 001 011 010 110 111 101 100 yazdırır *)
  ```

### ex03 - sequence

**Dosya:** `ex03/sequence.ml`

Look-and-say sequence - sayısal dizi açıklama algoritması.

- **Fonksiyon:** `sequence : int -> string`
- **Açıklama:** n'inci look-and-say sequence değerini string olarak döndürür
- **Konsept:** Her adımda önceki diziyi "sayıp açıklama" (count-and-say)
- **Örnek:**
  ```ocaml
  sequence 1;;   (* "1" döndürür *)
  sequence 2;;   (* "11" döndürür - "bir tane 1" *)
  sequence 5;;   (* "111221" döndürür *)
  ```

### ex04 - nucleotides

**Dosya:** `ex04/nucleotides.ml`

DNA nucleotide veri yapısı tanımı ve oluşturma fonksiyonu.

- **Tipler:** `nucleobase`, `nucleotide` record type tanımları
- **Fonksiyon:** `generate_nucleotide : char -> nucleotide`
- **Açıklama:** DNA baz karakterinden nucleotide record'u oluşturur
- **Özellik:** Custom record types ve variant types kullanımı
- **Örnek:**
  ```ocaml
  generate_nucleotide 'A';;
  (* A nucleobase'li nucleotide record'u döndürür *)
  generate_nucleotide 'Q';;
  (* None nucleobase'li nucleotide record'u döndürür *)
  ```

### ex05 - helix

**Dosya:** `ex05/helix.ml`

DNA helix (sarmal) veri yapısı ve komplementer sarmal oluşturma.

- **Tipler:** `helix = nucleotide list` type alias
- **Fonksiyonlar:** `generate_helix`, `complementary_helix`, `helix_to_string`
- **Açıklama:** DNA sarmalı oluşturur ve komplementer sarmalını hesaplar
- **Konsept:** Watson-Crick base pairing (A-T, C-G)
- **Örnek:**
  ```ocaml
  let hel = generate_helix 5;;
  complementary_helix hel;;
  (* A→T, T→A, C→G, G→C dönüşümü ile komplementer sarmal *)
  ```

### ex06 - rna

**Dosya:** `ex06/rna.ml`

DNA'dan RNA transkripsiyonu - moleküler biyoloji simülasyonu.

- **Tipler:** `rna = nucleobase list`, U (Uracil) nucleobase eklendi
- **Fonksiyon:** `generate_rna : helix -> rna`
- **Açıklama:** DNA sarmalından RNA dizisi üretir (transcription)
- **Algoritma:** A→U, T→A, C→G, G→C dönüşümü
- **Örnek:**
  ```ocaml
  let hel = generate_helix 6;;
  let rna_seq = generate_rna hel;;
  (* DNA'dan RNA transkripsiyonu *)
  ```

### ex07 - ribosome

**Dosya:** `ex07/ribosome.ml`

RNA'dan protein sentezi - genetic code translation simülasyonu.

- **Tipler:** `aminoacid` variant type, `protein = aminoacid list`
- **Fonksiyon:** `decode_arn : rna -> protein`
- **Açıklama:** RNA triplet codon'larını amino asitlere çevirir
- **Konsept:** Genetic code table ile translation (64 codon → 21 amino acid)
- **Örnek:**
  ```ocaml
  let rna_seq = [U; A; C; A; U; G];;
  decode_arn rna_seq;;
  (* [Tyr; Met] protein dizisi döndürür *)
  ```

### ex08 - life

**Dosya:** `ex08/life.ml`

Yaşam simülasyonu - DNA'dan proteinin tam yaşam döngüsü.

- **Fonksiyon:** `generate_helix_with_string : string -> helix`
- **Açıklama:** String'den DNA sarmalı oluşturarak tam yaşam döngüsünü simüle eder
- **İşlem Akışı:** DNA → RNA → Protein (Central Dogma of Molecular Biology)
- **Özellik:** Moleküler biyolojinin temel dogmasının tam implementasyonu
- **Örnek:**
  ```ocaml
  print_test 1 "TAGCAT";;
  (* DNA → RNA → triplet → protein tam döngüsü *)
  print_test 2 "TTTTTCGGG";;
  (* Farklı DNA dizisi ile yaşam simülasyonu *)
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
ocaml ex00/encode.ml

# Interaktiv modda test etme
ocaml
# > #use "ex00/encode.ml";;
# > encode ['a'; 'a'; 'b'; 'c'; 'c'; 'c'];;
```

### Derleme

```bash
# Bytecode olarak derleme
ocamlc -o program ex00/encode.ml

# Native kod olarak derleme
ocamlopt -o program ex00/encode.ml
```

## 🎯 Öğrenilen Kavramlar

1. **Pattern Matching**: Kapsamlı desen eşleştirme teknikleri (list patterns, tuple patterns)
2. **Custom Data Types**: Variant types ve record types tanımlama
3. **Recursive Data Structures**: Liste işlemleri ve recursive veri yapıları
4. **Polymorphic Functions**: Generic tip parametreleri ('a, 'b)
5. **Molecular Biology Modeling**: DNA, RNA, protein veri modellemesi
6. **Algorithm Design**: Run-length encoding, Gray code, Look-and-say
7. **Type Safety**: Güçlü tip sistemi ile güvenli programlama
8. **Functional Composition**: Fonksiyonel programlama paradigmaları
9. **Binary Operations**: Gray code ve binary manipulation
10. **Genetic Code Simulation**: Central dogma of molecular biology

## 📋 Notlar

- Tüm egzersizler custom data types ve pattern matching odaklıdır
- Moleküler biyoloji kavramları OCaml ile modellendi
- Variant types ile güvenli state representation sağlandı
- Record types ile complex data structures oluşturuldu
- Pattern matching ile elegant algoritma implementasyonları yapıldı
- Type system ile compile-time güvenlik sağlandı
