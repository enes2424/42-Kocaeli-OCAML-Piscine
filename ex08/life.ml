type phosphate = string

type deoxyribose = string

type nucleobase = A | T | C | G | U | None

type nucleotide = {
  phosphate: phosphate;
  deoxyribose: deoxyribose;
  nucleobase: nucleobase;
}

type helix = nucleotide list

type rna = nucleobase list

type aminoacid = Stop | Ala | Arg | Asn | Asp | Cys | Gln | Glu | Gly | His | Ile | Leu | Lys | Met | Phe | Pro | Ser | Thr | Trp | Tyr | Val

type protein = aminoacid list

let rec generate_bases_triplets (r : rna) =
  match r with
  | first :: second :: third :: tail -> (first, second, third) :: generate_bases_triplets tail
  | _ -> []

let rec string_of_protein (pro : protein) =
  match pro with
  | [] -> ""
  | head :: tail ->
    (match head with
    | Stop -> "Stop"
    | Ala -> "Ala"
    | Arg -> "Arg"
    | Asn -> "Asn"
    | Asp -> "Asp"
    | Cys -> "Cys"
    | Gln -> "Gln"
    | Glu -> "Glu"
    | Gly -> "Gly"
    | His -> "His"
    | Ile -> "Ile"
    | Leu -> "Leu"
    | Lys -> "Lys"
    | Met -> "Met"
    | Phe -> "Phe"
    | Pro -> "Pro"
    | Ser -> "Ser"
    | Thr -> "Thr"
    | Trp -> "Trp"
    | Tyr -> "Tyr"
    | Val -> "Val")
    ^ (if tail = [] then "" else ", " ^ string_of_protein tail)

let decode_arn (r : rna) : protein =
  let bases_triplet = generate_bases_triplets r
  in let rec aux bases_triplet pro =
    match bases_triplet with
    | [] -> pro
    | head :: tail ->
      let aa =
        match head with
        | (U, A, A) | (U, A, G) | (U, G, A) -> Stop
        | (G, C, A) | (G, C, C) | (G, C, G) | (G, C, U) -> Ala
        | (A, G, A) | (A, G, G) | (C, G, A) | (C, G, C) | (C, G, G) | (C, G, U) -> Arg
        | (A, A, C) | (A, A, U) -> Asn
        | (G, A, C) | (G, A, U) -> Asp
        | (U, G, C) | (U, G, U) -> Cys
        | (C, A, A) | (C, A, G) -> Gln
        | (G, A, A) | (G, A, G) -> Glu
        | (G, G, A) | (G, G, C) | (G, G, G) | (G, G, U) -> Gly
        | (C, A, C) | (C, A, U) -> His
        | (A, U, A) | (A, U, C) | (A, U, U) -> Ile
        | (C, U, A) | (C, U, C) | (C, U, G) | (C, U, U) | (U, U, A) | (U, U, G) -> Leu
        | (A, A, A) | (A, A, G) -> Lys
        | (A, U, G) -> Met
        | (U, U, C) | (U, U, U) -> Phe
        | (C, C, C) | (C, C, A) | (C, C, G) | (C, C, U) -> Pro
        | (U, C, A) | (U, C, C) | (U, C, G) | (U, C, U) | (A, G, U) | (A, G, C) -> Ser
        | (A, C, A) | (A, C, C) | (A, C, G) | (A, C, U) -> Thr
        | (U, G, G) -> Trp
        | (U, A, C) | (U, A, U) -> Tyr
        | (G, U, A) | (G, U, C) | (G, U, G) | (G, U, U) -> Val
        | _ -> Stop
      in match aa with
      | Stop -> pro @ [aa]
      | _ -> aux tail (pro @ [aa])
  in aux bases_triplet []

let rec generate_rna (hel : helix) : rna =
  match hel with
  | [] -> []
  | head :: tail ->
    (match head.nucleobase with
    | A -> U
    | T -> A
    | C -> G
    | G -> C
    | _ -> None)
    :: generate_rna tail

let generate_nucleotide c =
  match c with
  | 'A' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = A}
  | 'T' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = T}
  | 'C' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = C}
  | 'G' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = G}
  | _ -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = None}

let generate_nucleotide_with_num num =
  match num with
  | 1 -> generate_nucleotide 'A'
  | 2 -> generate_nucleotide 'T'
  | 3 -> generate_nucleotide 'C'
  | 4 -> generate_nucleotide 'G'
  | _ -> generate_nucleotide 'N'

let rec generate_helix n : helix =
  if n <= 0 then
    []
  else
    (generate_nucleotide_with_num (1 + Random.int 4)) :: generate_helix (n - 1)

let generate_helix_with_string str : helix =
  let rec aux str index =
    if index = String.length str then
      []
    else
      generate_nucleotide (String.get str index) ::  aux str (index + 1)
  in aux str 0

let nucleobase_to_string nuc =
  match nuc with
  | A -> "A"
  | T -> "T"
  | C -> "C"
  | G -> "G"
  | U -> "U"
  | None -> "None"

let rec helix_to_string (hel : helix) =
  match hel with
  | [] -> ""
  | head :: tail ->
    "{ phosphate = \"" ^ head.phosphate ^ "\"; deoxyribose = \"" ^ head.deoxyribose ^ "\"; nucleobase = " ^ (nucleobase_to_string head.nucleobase) ^ " }" ^ (
      let rest = helix_to_string tail in
      if rest = "" then "" else "\n" ^ rest)

let rec complementary_helix (hel : helix) : helix =
  match hel with
  | [] -> []
  | head :: tail ->
    (match head.nucleobase with
    | A -> generate_nucleotide 'T'
    | T -> generate_nucleotide 'A'
    | C -> generate_nucleotide 'G'
    | G -> generate_nucleotide 'C'
    | _ -> generate_nucleotide 'N')
    :: complementary_helix tail

let rec print_rna (r : rna) =
    match r with
    | [] -> ()
    | head :: tail ->
      print_endline (nucleobase_to_string head);
      print_rna tail

let rec print_bases_triplets bases_triplet =
  match bases_triplet with
  | [] -> ()
  | head :: tail ->
    let aux (first, second, third) =
      print_string (nucleobase_to_string first);
      print_string (nucleobase_to_string second);
      print_string (nucleobase_to_string third);
      print_char '\n'
    in aux head;
    print_bases_triplets tail

let print_test nth str =
  print_char '\n';
  print_int nth;
  print_endline ".\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ helix ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
  let hel = generate_helix_with_string str
  in begin
    print_endline (helix_to_string hel);
    print_endline "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ rna ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
    let hel_to_rna = generate_rna hel
    in begin
      print_rna hel_to_rna;
      print_endline "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~ bases_triplet ~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
      let bases_triplet = generate_bases_triplets hel_to_rna
      in print_bases_triplets bases_triplet;
      print_endline "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ protein ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
      let pro = decode_arn hel_to_rna
      in print_endline (string_of_protein pro)
    end
  end

let () =
    Random.self_init ();
    print_test 1 "TAGCAT";
    print_test 2 "TTTTTCGGG";
    print_test 3 "CGTACGACCATCGTGT";
