let rec converges func x num =
  if num < 0 then
    false
  else
    let fx = func x in
    if fx = x then true
    else converges func fx (num - 1)

let () =
  print_endline ( string_of_bool (converges (( * ) 2) 2 (-5)));
  print_endline ( string_of_bool (converges (( * ) 2) 2 5));
  print_endline ( string_of_bool (converges (fun x -> x / 2) 2 3));
  print_endline ( string_of_bool (converges (fun x -> x / 2) 2 2));
