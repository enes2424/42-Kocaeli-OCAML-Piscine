let read_jokes_from_file filename =
  let file = open_in filename in
  let lines = ref [] in
  (try
    while true do
      lines := (input_line file) :: !lines
    done
  with
  | End_of_file -> 
      close_in file;
      lines := List.rev !lines
  );
  Array.of_list !lines

let () =
  let args = Sys.argv in
  let argc = Array.length args in
  if (argc = 2) then
    try
      let filename = args.(1) in
      let jokes = read_jokes_from_file filename in
      Random.self_init ();
      print_endline jokes.(Random.int (Array.length jokes))
    with
    | _ -> ()
