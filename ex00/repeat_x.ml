let rec repeat_x num =
  if num < 0 then
    "Error"
  else if num = 0 then
    ""
  else
    "x" ^ repeat_x (num - 1)

let () =
    print_endline (repeat_x (-1));
    print_endline (repeat_x 0);
    print_endline (repeat_x 1);
    print_endline (repeat_x 2);
    print_endline (repeat_x 5);
