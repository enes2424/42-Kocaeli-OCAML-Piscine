# 42-Kocaeli-OCAML-Piscine

## Imperative Features (Durum Değiştiren Özellikler)

Bu proje, 42 Okulu OCaml Piscine eğitiminin beşinci modülüdür. OCaml'ın imperative programming özellikleri, mutable data structures, I/O operations, system programming ve dosya işlemleri konularında pratik uygulamalar geliştirmek için tasarlanmıştır.

## 📚 Egzersizler

### ex00 - micronap

**Dosya:** `ex00/micronap.ml`

Unix sistem çağrıları ile sleep fonksiyonu implementasyonu.

- **Fonksiyon:** `my_sleep : unit -> unit`
- **Açıklama:** Command line argument olarak verilen saniye kadar bekler
- **Sistem Çağrısı:** `Unix.sleep` kullanımı
- **Özellik:** System programming, command line argument handling
- **Örnek:**
  ```bash
  ocaml ex00/micronap.ml 5    # 5 saniye bekler
  ocaml ex00/micronap.ml 0    # Hiç beklemez
  ocaml ex00/micronap.ml abc  # Hata durumu, hiçbir şey yapmaz
  ```

### ex01 - ft_ref

**Dosya:** `ex01/ft_ref.ml`

Custom reference type implementation - OCaml referanslarının yeniden implementasyonu.

- **Type:** `'a ft_ref = {mutable content : 'a}`
- **Fonksiyonlar:** `return`, `get`, `set`, `bind`
- **Açıklama:** Mutable record field kullanarak kendi referans tipimizi oluşturma
- **Konsept:** Mutable data structures, generic types, monadic operations
- **Örnek:**
  ```ocaml
  let ref1 = return 42;;       (* 42 değerli referans oluştur *)
  get ref1;;                   (* 42 döndürür *)
  set ref1 100;;               (* Değeri 100 yap *)
  bind ref1 (fun x -> return (x * 2));;  (* Bind operation *)
  ```

### ex02 - jokes

**Dosya:** `ex02/jokes.ml`

Array kullanımı ve rastgele seçim algoritması.

- **Veri Yapısı:** `jokes : string array`
- **Fonksiyonlar:** `Random.self_init`, `Random.int`, array indexing
- **Açıklama:** Sabit array'den rastgele bir şaka seçip ekrana yazdırma
- **Özellik:** Arrays, random number generation, immutable data access
- **Örnek:**
  ```ocaml
  (* Her çalıştırmada farklı bir şaka yazdırır *)
  "Why don't scientists trust atoms? Because they make up everything!"
  "I told my wife she was drawing her eyebrows too high. She looked surprised."
  ```

### ex03 - jokes (File Version)

**Dosyalar:** `ex03/jokes.ml`, `ex03/jokes.txt`

Dosyadan veri okuma ve dinamik array oluşturma.

- **Fonksiyonlar:** `read_jokes_from_file`, `open_in`, `input_line`, `close_in`
- **Açıklama:** Text dosyasından şakaları okuyarak dinamik array oluşturur
- **I/O Operations:** File reading, exception handling (`End_of_file`)
- **Özellik:** File I/O, dynamic data structures, command line arguments
- **Örnek:**
  ```bash
  ocaml ex03/jokes.ml jokes.txt  # jokes.txt'den rastgele şaka okur
  ocaml ex03/jokes.ml invalid.txt # Dosya bulunamaz ise sessizce çıkar
  ```

### ex04 - sum

**Dosya:** `ex04/sum.ml`

Floating point aritmetiği ve partial application.

- **Fonksiyon:** `sum : float -> float -> float`
- **Açıklama:** İki float sayıyı toplayan basit matematik fonksiyonu
- **Özellik:** Floating point arithmetic, partial application, function composition
- **Test Senaryoları:** Normal toplama, sıfır değerler, negatif sayılar, büyük sayılar
- **Örnek:**
  ```ocaml
  sum 3.14 2.86;;              (* 6.00 döndürür *)
  let add_five = sum 5.0;;     (* Partial application *)
  add_five 3.0;;               (* 8.0 döndürür *)
  List.map (sum 10.0) [1.0; 2.0; 3.0];;  (* [11.0; 12.0; 13.0] *)
  ```

### ex05 - eu_dist

**Dosya:** `ex05/eu_dist.ml`

Euclidean distance hesaplama algoritması.

- **Fonksiyon:** `eu_dist : float array -> float array -> float`
- **Açıklama:** İki N-boyutlu nokta arasındaki Euclidean mesafeyi hesaplar
- **Algoritma:** √(∑(xi - yi)²) matematiksel formülü
- **Özellik:** Array operations, mathematical computations, error handling
- **Örnek:**
  ```ocaml
  eu_dist [|0.0; 0.0|] [|3.0; 4.0|];;    (* 5.0 döndürür (3-4-5 üçgeni) *)
  eu_dist [|1.0; 2.0; 3.0|] [|1.0; 2.0; 3.0|];;  (* 0.0 (aynı nokta) *)
  eu_dist [|1.0|] [|4.0|];;               (* 3.0 (1D mesafe) *)
  ```

### ex06 - examples_of_file

**Dosyalar:** `ex06/examples_of_file.ml`, `ex06/ionosphere.test.csv`

CSV dosyası parsing ve machine learning data processing.

- **Fonksiyon:** `examples_of_file : string -> (float array * string) list`
- **Açıklama:** CSV formatındaki ML dataset'ini parse ederek feature arrays ve class labels çıkarır
- **Veri:** Ionosphere dataset (radar sinyalleri sınıflandırması)
- **Özellik:** String processing, CSV parsing, complex data structures, file I/O
- **Örnek:**
  ```ocaml
  let data = examples_of_file "ionosphere.test.csv";;
  (* [(features_array, "g"); (features_array, "b"); ...] *)
  (* Her örnek: 34 özellik + 1 sınıf etiketi ("g" veya "b") *)
  ```

## 🔧 Kullanım

### Gerekli Bağımlılıklar

```bash
# Unix modülü için OCaml kurulumu
sudo apt-get install ocaml

# Unix kütüphanesi ile derleme
ocamlc unix.cma -o program file.ml
```

### Dosyaları Çalıştırma

```bash
# ex00 - micronap
ocamlc unix.cma -o micronap ex00/micronap.ml
./micronap 3  # 3 saniye bekler

# ex01 - ft_ref
ocaml ex01/ft_ref.ml

# ex02 - jokes
ocaml ex02/jokes.ml

# ex03 - file jokes
ocaml ex03/jokes.ml ex03/jokes.txt

# ex04 - sum
ocaml ex04/sum.ml

# ex05 - euclidean distance
ocaml ex05/eu_dist.ml

# ex06 - CSV parser
ocaml ex06/examples_of_file.ml
```

### İnteraktif Modda Test Etme

```bash
ocaml
# > #use "ex01/ft_ref.ml";;
# > let r = return 42;;
# > get r;;

# Unix modülü gerektiren dosyalar için
ocaml unix.cma
# > #use "ex00/micronap.ml";;
```

### Derleme ve Çalıştırma

```bash
# Tek seferde derleme ve çalıştırma
ocamlc unix.cma ex00/micronap.ml -o micronap && ./micronap 5

# Normal derleme (Unix modülü gerektirmeyen)
ocamlc -o program ex04/sum.ml && ./program
```

## 🎯 Öğrenilen Kavramlar

1. **Imperative Programming**: OCaml'da zorunlu programlama paradigması
2. **Mutable Data Structures**: `mutable` keyword, references, arrays
3. **System Programming**: Unix sistem çağrıları, process control
4. **File I/O Operations**: Dosya okuma/yazma, exception handling
5. **Arrays ve Indexing**: Array operations, mutable collections
6. **Random Number Generation**: `Random` modülü, seed initialization
7. **String Processing**: String manipulation, CSV parsing
8. **Mathematical Computations**: Floating point arithmetic, distance algorithms
9. **Command Line Arguments**: `Sys.argv` ile argument handling
10. **Exception Handling**: `try...with`, `failwith`, error management
11. **Data Parsing**: CSV format parsing, type conversion
12. **Memory Management**: Mutable state management, resource cleanup

## 🔄 Imperative vs Functional

### Imperative Özellikler Bu Projede:

```ocaml
(* Mutable references *)
let ref1 = {mutable content = 42}
ref1.content <- 100

(* Arrays ve indexing *)
let arr = [|1; 2; 3|]
arr.(0) <- 10

(* File I/O side effects *)
let file = open_in "data.txt"
let line = input_line file
close_in file

(* For loops *)
for i = 1 to n do
  Printf.printf "%d\n" i
done
```

### Functional Approach ile Karşılaştırma:

```ocaml
(* Immutable data *)
let list = [1; 2; 3]
let new_list = 10 :: (List.tl list)

(* Pure functions *)
let rec factorial n =
  if n <= 1 then 1
  else n * factorial (n-1)
```

## 💻 System Programming Aspects

### Unix Modülü Kullanımı:

- **Process Control**: `Unix.sleep` ile process suspension
- **System Calls**: Direct OS interaction
- **Resource Management**: File descriptors, memory management

### File Operations:

- **Sequential Reading**: `input_line` ile satır satır okuma
- **Exception Handling**: `End_of_file` exception management
- **Resource Cleanup**: `close_in` ile file descriptor cleanup

## 📊 Data Processing Pipeline

### CSV Processing Workflow (ex06):

1. **File Opening**: `open_in filename`
2. **Line-by-Line Reading**: `input_line` loop
3. **String Splitting**: `String.split_on_char ','`
4. **Type Conversion**: `float_of_string` for features
5. **Data Structure**: `(float array * string) list`
6. **Analysis**: Class distribution, feature statistics

### Machine Learning Context:

- **Ionosphere Dataset**: Radar signal classification
- **Feature Vectors**: 34-dimensional float arrays
- **Binary Classification**: "g" (good) vs "b" (bad) signals
- **Data Format**: Standard ML dataset structure

## 📋 Notlar

- **Imperative Focus**: OCaml'ın fonksiyonel dili olmakla birlikte imperative özellikleri
- **System Integration**: Unix sistem çağrıları ile OS entegrasyonu
- **Real-world Applications**: Dosya işleme, veri analizi, sistem programlama
- **Performance Considerations**: Mutable data structures ile performans optimizasyonu
- **Error Handling**: Robust exception handling patterns
- **Data Science**: CSV parsing ve machine learning data preprocessing
- **Memory Safety**: OCaml'ın memory safety garantileri imperative kodda da geçerli

