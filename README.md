# 42-Kocaeli-OCAML-Piscine
## Temel Sözdizimi ve Anlambilim (Basic Syntax and Semantics)

Bu proje, 42 Okulu OCaml Piscine eğitiminin ilk modülüdür. OCaml programlama dilinin temel sözdizimi, recursive fonksiyonlar, string manipülasyonu ve algoritmik düşünme becerilerini geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - ft_test_sign
**Dosya:** `ex00/ft_test_sign.ml`

Verilen sayının işaretini kontrol eden fonksiyon.
- **Fonksiyon:** `ft_test_sign : int -> unit`
- **Açıklama:** Sayı pozitif veya sıfır ise "positive", negatif ise "negative" yazdırır
- **Örnek:**
  ```ocaml
  ft_test_sign 5;;    (* "positive" yazdırır *)
  ft_test_sign (-3);; (* "negative" yazdırır *)
  ft_test_sign 0;;    (* "positive" yazdırır *)
  ```

### ex01 - ft_countdown
**Dosya:** `ex01/ft_countdown.ml`

Verilen sayıdan 0'a kadar geri sayan recursive fonksiyon.
- **Fonksiyon:** `ft_countdown : int -> unit`
- **Açıklama:** Verilen sayıdan başlayarak 0'a kadar olan tüm sayıları alt alta yazdırır
- **Örnek:**
  ```ocaml
  ft_countdown 3;;
  (* Çıktı:
     3
     2
     1
     0 *)
  ```

### ex02 - ft_power
**Dosya:** `ex02/ft_power.ml`

Optimize edilmiş üs alma fonksiyonu (fast exponentiation algoritması).
- **Fonksiyon:** `ft_power : int -> int -> int`
- **Açıklama:** İkili üs alma yöntemi kullanarak num^power değerini hesaplar
- **Algoritma:** O(log n) karmaşıklığında hızlı üs alma
- **Örnek:**
  ```ocaml
  ft_power 2 3;;  (* 8 döndürür *)
  ft_power 5 2;;  (* 25 döndürür *)
  ```

### ex03 - ft_print_alphabet
**Dosya:** `ex03/ft_print_alphabet.ml`

Alfabeyi a'dan z'ye yazdıran fonksiyon.
- **Fonksiyon:** `ft_print_alphabet : unit -> unit`
- **Açıklama:** ASCII kodları kullanarak a-z harflerini tek satırda yazdırır
- **Çıktı:** `abcdefghijklmnopqrstuvwxyz`

### ex04 - ft_print_comb
**Dosya:** `ex04/ft_print_comb.ml`

3 haneli artan sıralı sayı kombinasyonlarını yazdıran fonksiyon.
- **Fonksiyon:** `ft_print_comb : unit -> unit`
- **Açıklama:** ABC formatında (A < B < C) olan tüm 3 haneli kombinasyonları yazdırır
- **Çıktı:** `012, 013, 014, ..., 789`
- **Kural:** Her basamak bir öncekinden büyük olmalı

### ex05 - ft_print_rev
**Dosya:** `ex05/ft_print_rev.ml`

String'i ters çevirerek yazdıran fonksiyon.
- **Fonksiyon:** `ft_print_rev : string -> unit`
- **Açıklama:** Verilen string'i sondan başa doğru yazdırır
- **Örnek:**
  ```ocaml
  ft_print_rev "hello";; (* "olleh" yazdırır *)
  ft_print_rev "42";;    (* "24" yazdırır *)
  ```

### ex06 - ft_string_all
**Dosya:** `ex06/ft_string_all.ml`

String'in tüm karakterleri için verilen koşulu kontrol eden fonksiyon.
- **Fonksiyon:** `ft_string_all : (char -> bool) -> string -> bool`
- **Açıklama:** Higher-order function - tüm karakterler verilen koşulu sağlıyorsa true döndürür
- **Örnek:**
  ```ocaml
  ft_string_all (fun c -> c >= 'a' && c <= 'z') "hello";; (* true *)
  ft_string_all (fun c -> c >= '0' && c <= '9') "123";;   (* true *)
  ```

### ex07 - ft_is_palindrome
**Dosya:** `ex07/ft_is_palindrome.ml`

String'in palindrom olup olmadığını kontrol eden fonksiyon.
- **Fonksiyon:** `ft_is_palindrome : string -> bool`
- **Açıklama:** String'in baştan ve sondan aynı okunup okunmadığını kontrol eder
- **Örnek:**
  ```ocaml
  ft_is_palindrome "radar";;  (* true *)
  ft_is_palindrome "hello";;  (* false *)
  ft_is_palindrome "aba";;    (* true *)
  ```

### ex08 - ft_rot_n
**Dosya:** `ex08/ft_rot_n.ml`

ROT-N şifreleme algoritması (Caesar cipher).
- **Fonksiyon:** `ft_rot_n : int -> string -> string`
- **Açıklama:** Verilen string'deki harfleri n pozisyon kaydırır
- **Özellik:** Büyük/küçük harf ayrımı yapar, alfabe dışı karakterleri değiştirmez
- **Örnek:**
  ```ocaml
  ft_rot_n 13 "hello";;  (* ROT13: "uryyb" *)
  ft_rot_n 1 "abc";;     (* "bcd" *)
  ```

### ex09 - ft_print_comb2
**Dosya:** `ex09/ft_print_comb2.ml`

İki haneli sayı çiftlerinin kombinasyonlarını yazdıran fonksiyon.
- **Fonksiyon:** `ft_print_comb2 : unit -> unit`
- **Açıklama:** 00-99 arası sayı çiftlerini AB AC formatında yazdırır (A < B)
- **Format:** `00 01, 00 02, ..., 98 99`
- **Kural:** İlk sayı ikinci sayıdan küçük olmalı

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
ocaml ex00/ft_test_sign.ml

# Interaktif modda test etme
ocaml
# > #use "ex00/ft_test_sign.ml";;
# > ft_test_sign 42;;
```

### Derleme
```bash
# Bytecode olarak derleme
ocamlc -o program ex00/ft_test_sign.ml

# Native kod olarak derleme
ocamlopt -o program ex00/ft_test_sign.ml
```

## 🎯 Öğrenilen Kavramlar

1. **Recursive Fonksiyonlar**: Tail recursion ve genel recursive yaklaşımlar
2. **Pattern Matching**: OCaml'in güçlü pattern matching sistemi
3. **Higher-Order Functions**: Fonksiyonları parametre olarak alan fonksiyonlar
4. **String Manipülasyonu**: Karakter dizileri üzerinde işlemler
5. **ASCII Kodları**: Karakter-sayı dönüşümleri
6. **Algoritma Optimizasyonu**: Fast exponentiation gibi verimli algoritmalar
7. **Loop Yapıları**: Recursive fonksiyonlarla loop simülasyonu

## 📋 Notlar

- Tüm fonksiyonlar functional programming prensipleri ile yazılmıştır
- Side-effect'ler minimize edilmiştir (sadece print fonksiyonlarında kullanılmıştır)
- Recursive çözümler iterative çözümlere tercih edilmiştir
- OCaml'in tip sistemi ve immutability özellikleri göz önünde bulundurulmuştur

## 🏫 42 Okulu Hakkında

Bu proje 42 Okulu'nun peer-to-peer öğrenme metodolojisi kapsamında hazırlanmıştır. Projeler öğrencilerin birbirlerinden öğrenmesini ve algoritmic düşünme becerilerini geliştirmesini amaçlar.