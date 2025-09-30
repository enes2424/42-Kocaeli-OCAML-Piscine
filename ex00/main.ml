let () =
  let rec test list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_endline ((Color.toString head) ^ " -> " ^ (Color.toStringVerbose head));
      test tail
  in test Color.all
