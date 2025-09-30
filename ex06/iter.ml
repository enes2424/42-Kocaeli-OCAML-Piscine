let iter func x num =
  if num < 0 then
    -1
  else
    let rec aux x num =
      if num = 0 then
        x
      else
        aux (func x) (num - 1)
    in aux x num

let () =
  print_int (iter (fun x -> x * x) 2 (-4)); print_char '\n';
  print_int (iter (fun x -> x * x) 2 4); print_char '\n';
  print_int (iter (fun x -> x * 2) 2 4); print_char '\n';
  print_int (iter (fun x -> x * 2) 2 0); print_char '\n';
