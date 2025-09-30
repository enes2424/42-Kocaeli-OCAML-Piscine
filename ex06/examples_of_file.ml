let examples_of_file filename =
  let file = open_in filename in
  let rec read_lines list =
    try
      let line = input_line file in
      let parse_line line =
        let parts = String.split_on_char ',' line in
        let rec extract_floats list = function
          | [] -> failwith "Empty line or missing class"
          | [class_label] -> (List.rev list, class_label)
          | x :: xs -> 
              let float_val = float_of_string x in
              extract_floats (float_val :: list) xs
        in
        let (float_list, class_label) = extract_floats [] parts in
        (Array.of_list float_list, class_label)
      in
      let parsed_line = parse_line line in
      read_lines (parsed_line :: list)
    with
    | End_of_file -> 
        close_in file;
        List.rev list
  in
  read_lines []

let () =
  try
    let examples = examples_of_file "ionosphere.test.csv" in
    Printf.printf "Total number of examples: %d\n" (List.length examples);
    
    let rec print_examples count = function
      | [] -> ()
      | (features, label) :: rest when count > 0 ->
          Printf.printf "Example %d: [" (4 - count);
          Array.iteri (fun i x -> 
            if i < 3 then Printf.printf "%.3f; " x 
            else if i = 3 then Printf.printf "... (%d features)" (Array.length features)
          ) features;
          Printf.printf "] -> class: %s\n" label;
          print_examples (count - 1) rest
      | _ -> ()
    in
    print_examples 3 examples;
    
    let g_count = List.fold_left (fun acc (_, label) -> 
      if label = "g" then acc + 1 else acc) 0 examples in
    let b_count = (List.length examples) - g_count in
    Printf.printf "Class distribution: g=%d, b=%d\n" g_count b_count;
    
  with
  | Sys_error msg -> Printf.printf "File error: %s\n" msg
  | Failure msg -> Printf.printf "Parse error: %s\n" msg
