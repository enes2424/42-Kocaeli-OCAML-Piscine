# 42-Kocaeli-OCAML-Piscine
## Recursion ve Higher Order Functions (Özyineleme ve Yüksek Dereceli Fonksiyonlar)

Bu proje, 42 Okulu OCaml Piscine eğitiminin ikinci modülüdür. İleri düzey recursive fonksiyonlar, higher-order functions, matematiksel algoritmalar ve fonksiyonel programlama prensiplerini öğrenmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - repeat_x
**Dosya:** `ex00/repeat_x.ml`

Verilen sayı kadar "x" karakterini tekrarlayan recursive fonksiyon.
- **Fonksiyon:** `repeat_x : int -> string`
- **Açıklama:** Negatif sayı için "Error", 0 için boş string, pozitif sayı için o kadar "x" döndürür
- **Örnek:**
  ```ocaml
  repeat_x 3;;     (* "xxx" döndürür *)
  repeat_x 0;;     (* "" döndürür *)
  repeat_x (-1);;  (* "Error" döndürür *)
  ```

### ex01 - repeat_string
**Dosya:** `ex01/repeat_string.ml`

Optional parametre kullanarak string tekrarlayan recursive fonksiyon.
- **Fonksiyon:** `repeat_string : ?str:string -> int -> string`
- **Açıklama:** Verilen string'i (varsayılan "x") belirtilen sayıda tekrarlar
- **Özellik:** Optional parameter kullanımı
- **Örnek:**
  ```ocaml
  repeat_string 2;;                (* "xx" döndürür *)
  repeat_string ~str:"hi" 3;;      (* "hihihi" döndürür *)
  repeat_string ~str:"a" 5;;       (* "aaaaa" döndürür *)
  ```

### ex02 - ackermann
**Dosya:** `ex02/ackermann.ml`

Ackermann fonksiyonu - çok hızlı büyüyen recursive matematiksel fonksiyon.
- **Fonksiyon:** `ackermann : int -> int -> int`
- **Açıklama:** İki parametreli Ackermann fonksiyonu implementasyonu
- **Algoritma:** Klasik Ackermann tanımı A(m,n)
- **Örnek:**
  ```ocaml
  ackermann 0 0;;  (* 1 döndürür *)
  ackermann 2 3;;  (* 9 döndürür *)
  ackermann 4 1;;  (* 65533 döndürür *)
  ```

### ex03 - tak
**Dosya:** `ex03/tak.ml`

Takeuchi fonksiyonu - benchmark testi için kullanılan recursive fonksiyon.
- **Fonksiyon:** `tak : int -> int -> int -> int`
- **Açıklama:** Üç parametreli Takeuchi (Tarai) fonksiyonu
- **Kullanım:** Recursive performans testleri için yaygın kullanılır
- **Örnek:**
  ```ocaml
  tak 1 2 3;;       (* 3 döndürür *)
  tak 5 23 7;;      (* 23 döndürür *)
  tak 9 1 0;;       (* 1 döndürür *)
  ```

### ex04 - fibonacci
**Dosya:** `ex04/fibonacci.ml`

Optimize edilmiş Fibonacci serisi hesaplama fonksiyonu.
- **Fonksiyon:** `fibonacci : int -> int`
- **Açıklama:** Tail recursion kullanarak verimli Fibonacci hesaplaması
- **Optimizasyon:** O(n) karmaşıklığında iteratif yaklaşım
- **Örnek:**
  ```ocaml
  fibonacci 1;;     (* 1 döndürür *)
  fibonacci 6;;     (* 8 döndürür *)
  fibonacci (-42);; (* -1 döndürür (hata) *)
  ```

### ex05 - hofstadter_mf
**Dosya:** `ex05/hofstadter_mf.ml`

Hofstadter M ve F fonksiyonları - karşılıklı recursive fonksiyonlar.
- **Fonksiyonlar:** `hfs_m : int -> int` ve `hfs_f : int -> int`
- **Açıklama:** Mutual recursion kullanarak tanımlanmış matematik fonksiyonları
- **Özellik:** `and` anahtar kelimesi ile karşılıklı tanımlama
- **Örnek:**
  ```ocaml
  hfs_m 4;;   (* 2 döndürür *)
  hfs_f 4;;   (* 3 döndürür *)
  hfs_m 0;;   (* 0 döndürür *)
  ```

### ex06 - iter
**Dosya:** `ex06/iter.ml`

Higher-order function: bir fonksiyonu belirtilen sayıda tekrar uygular.
- **Fonksiyon:** `iter : ('a -> 'a) -> 'a -> int -> 'a`
- **Açıklama:** Verilen fonksiyonu x değerine num kez uygular
- **Tip:** Polymorphic function - herhangi bir tip ile çalışır
- **Örnek:**
  ```ocaml
  iter (fun x -> x * x) 2 4;;   (* 65536 döndürür (2^16) *)
  iter (fun x -> x * 2) 2 4;;   (* 32 döndürür *)
  iter (fun x -> x * 2) 2 0;;   (* 2 döndürür *)
  ```

### ex07 - converges
**Dosya:** `ex07/converges.ml`

Fonksiyonel yakınsama testi - bir fonksiyonun sabit noktaya ulaşıp ulaşmadığını test eder.
- **Fonksiyon:** `converges : ('a -> 'a) -> 'a -> int -> bool`
- **Açıklama:** Verilen adım sayısında fonksiyon sabit noktaya ulaşırsa true döndürür
- **Konsept:** Fixed-point iteration ve yakınsama analizi
- **Örnek:**
  ```ocaml
  converges (fun x -> x / 2) 2 3;;   (* true döndürür *)
  converges (fun x -> x / 2) 2 2;;   (* false döndürür *)
  converges (( * ) 2) 2 5;;          (* false döndürür *)
  ```

### ex08 - ft_sum
**Dosya:** `ex08/ft_sum.ml`

Higher-order function: belirli aralıktaki sayılar için fonksiyon değerlerinin toplamı.
- **Fonksiyon:** `ft_sum : (int -> float) -> int -> int -> float`
- **Açıklama:** [lower, upper] aralığında func fonksiyonunun değerlerini toplar
- **Kullanım:** Matematiksel toplamlar ve integral yaklaşımları
- **Örnek:**
  ```ocaml
  ft_sum (fun i -> float_of_int i) 3 5;;         (* 12.0 döndürür *)
  ft_sum (fun i -> float_of_int (i * i)) 1 10;;  (* 385.0 döndürür *)
  ```

### ex09 - leibniz_pi
**Dosya:** `ex09/leibniz_pi.ml`

Leibniz serisi kullanarak π değerini yaklaşık hesaplama.
- **Fonksiyon:** `leibniz_pi : float -> int`
- **Açıklama:** Verilen delta hassasiyetinde π'ye yaklaşmak için gereken adım sayısı
- **Algoritma:** π/4 = 1 - 1/3 + 1/5 - 1/7 + ... (Leibniz serisi)
- **Örnek:**
  ```ocaml
  leibniz_pi 0.1;;    (* Pi'ye 0.1 hassasiyetinde yaklaşma adımları *)
  leibniz_pi 0.01;;   (* Daha yüksek hassasiyet için daha fazla adım *)
  leibniz_pi 0.0;;    (* -1 döndürür (geçersiz delta) *)
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
ocaml ex00/repeat_x.ml

# Interaktif modda test etme
ocaml
# > #use "ex00/repeat_x.ml";;
# > repeat_x 5;;
```

### Derleme
```bash
# Bytecode olarak derleme
ocamlc -o program ex00/repeat_x.ml

# Native kod olarak derleme
ocamlopt -o program ex00/repeat_x.ml
```

## 🎯 Öğrenilen Kavramlar

1. **İleri Düzey Recursive Fonksiyonlar**: Tail recursion optimizasyonu ve karmaşık recursive algoritmalar
2. **Mutual Recursion**: Karşılıklı tanımlanmış fonksiyonlar (`and` anahtar kelimesi)
3. **Higher-Order Functions**: Fonksiyonları parametre olarak alan ve döndüren fonksiyonlar
4. **Optional Parameters**: Varsayılan değerli parametreler (`?parameter` syntax)
5. **Polymorphic Functions**: Genel tip parametreleri (`'a -> 'a`)
6. **Matematiksel Algoritmalar**: Ackermann, Fibonacci, Takeuchi, Hofstadter fonksiyonları
7. **Yakınsama Analizi**: Fixed-point iteration ve sayısal yaklaşım yöntemleri
8. **Fonksiyonel Kompozisyon**: Fonksiyonların iteratif uygulanması
9. **Seri Yaklaşımları**: Leibniz serisi ile π hesaplama
10. **Performans Optimizasyonu**: Tail recursion ile bellek verimliliği

## 📋 Notlar

- Tüm fonksiyonlar advanced functional programming prensipleri ile yazılmıştır
- Mutual recursion ve higher-order functions yoğun şekilde kullanılmıştır
- Tail recursion optimizasyonu stack overflow'u önlemek için uygulanmıştır
- Polymorphic tipler generic programlama için kullanılmıştır
- Matematiksel algoritmaların elegant recursive implementasyonları gösterilmiştir
- Optional parameters ile daha esnek API tasarımları örneklenmiştir