let fibonacci num =
  if num < 0 then
    -1
  else if num = 0 then
    0
  else if num < 3 then
    1
  else
    let rec aux twoprev prev steps =
      if steps = 0 then
        twoprev + prev
      else
        aux prev (twoprev + prev) (steps - 1)
    in aux 1 1 (num - 3)

let () =
  print_int (fibonacci (-42)); print_char '\n';
  print_int (fibonacci 1); print_char '\n';
  print_int (fibonacci 3); print_char '\n';
  print_int (fibonacci 6); print_char '\n';
