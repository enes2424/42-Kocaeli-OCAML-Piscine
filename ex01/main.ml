let () =
  let rec test list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_int (Value.toInt head);
      print_endline (" -> \"" ^ (Value.toString head) ^ "\" -> \"" ^ (Value.toStringVerbose head) ^ "\"");
      test tail
  in test Value.all;
  print_endline "----------------------------------------------------";
  print_endline "next:";
  let rec test_next value =
    print_int (Value.toInt value);
    print_endline (" -> \"" ^ (Value.toString value) ^ "\" -> \"" ^ (Value.toStringVerbose value) ^ "\"");
    test_next (Value.next value)
  in try
    test_next T2
  with
  | Invalid_argument msg ->
      print_endline ("Invalid_argument: " ^ msg);
  ;
  print_endline "----------------------------------------------------";
  print_endline "previous:";
  let rec test_previous value =
    print_int (Value.toInt value);
    print_endline (" -> \"" ^ (Value.toString value) ^ "\" -> \"" ^ (Value.toStringVerbose value) ^ "\"");
    test_previous (Value.previous value)
  in try
    test_previous As
  with
  | Invalid_argument msg ->
      print_endline ("Invalid_argument: " ^ msg);
  ;
