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

let () =
    Random.self_init ();
    print_endline "1.\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ helix ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
    let hel = generate_helix 6
    in begin
      print_endline (helix_to_string hel);
      print_endline "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ rna ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
      let hel_to_rna = generate_rna hel
      in print_rna hel_to_rna
    end;
    print_endline "\n2.\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ helix ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
    let hel = generate_helix 9
    in begin
      print_endline (helix_to_string hel);
      print_endline "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ rna ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
      let hel_to_rna = generate_rna hel
      in print_rna hel_to_rna
    end
