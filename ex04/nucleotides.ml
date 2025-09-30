type phosphate = string

type deoxyribose = string

type nucleobase = A | T | C | G | None

type nucleotide = {
  phosphate: phosphate;
  deoxyribose: deoxyribose;
  nucleobase: nucleobase;
}

let generate_nucleotide c =
  match c with
  | 'A' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = A}
  | 'T' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = T}
  | 'C' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = C}
  | 'G' -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = G}
  | _ -> {phosphate = "phosphate"; deoxyribose = "deoxyribose"; nucleobase = None}

let () =
  let print_nucleotide nt =
    print_string "{ phosphate = \"";
    print_string nt.phosphate;
    print_string "\"; deoxyribose = \"";
    print_string nt.deoxyribose;
    print_string "\"; nucleobase = ";
    (match nt.nucleobase with
    | A -> print_char 'A'
    | T -> print_char 'T'
    | C -> print_char 'C'
    | G -> print_char 'G'
    | None -> print_string "None");
    print_endline " }"
  in begin
    print_nucleotide (generate_nucleotide 'A');
    print_nucleotide (generate_nucleotide 'T');
    print_nucleotide (generate_nucleotide 'C');
    print_nucleotide (generate_nucleotide 'G');
    print_nucleotide (generate_nucleotide 'Q');
    print_nucleotide (generate_nucleotide 'K');
  end
