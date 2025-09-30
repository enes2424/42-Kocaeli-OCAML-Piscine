type phosphate = string

type deoxyribose = string

type nucleobase = A | T | C | G | None

type nucleotide = {
  phosphate: phosphate;
  deoxyribose: deoxyribose;
  nucleobase: nucleobase;
}

type helix = nucleotide list

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

let rec helix_to_string (hel : helix) =
  match hel with
  | [] -> ""
  | head :: tail ->
    "{ phosphate = \"" ^ head.phosphate ^ "\"; deoxyribose = \"" ^ head.deoxyribose ^ "\"; nucleobase = " ^ (match head.nucleobase with
    | A -> "A"
    | T -> "T"
    | C -> "C"
    | G -> "G"
    | None -> "None") ^ " }" ^ (
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
    | None -> generate_nucleotide 'N')
    :: complementary_helix tail

let () =
  Random.self_init ();
  print_endline "1.\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ helix ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
  let hel = generate_helix 5
  in begin
    print_endline (helix_to_string hel);
    print_endline "\n~~~~~~~~~~~~~~~~~~~~~~~~~ complementary_helix ~~~~~~~~~~~~~~~~~~~~~~~~~";
    let comp_hel = complementary_helix hel
    in print_endline (helix_to_string comp_hel)
  end;
  print_endline "\n2.\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ helix ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
  let hel = generate_helix 8
  in begin
    print_endline (helix_to_string hel);
    print_endline "\n~~~~~~~~~~~~~~~~~~~~~~~~~ complementary_helix ~~~~~~~~~~~~~~~~~~~~~~~~~";
    let comp_hel = complementary_helix hel
    in print_endline (helix_to_string comp_hel)
  end
