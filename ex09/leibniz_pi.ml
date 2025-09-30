let leibniz_pi delta =
  if delta <= 0. then
    -1
  else
    let pi = 4. *. atan 1. in
    let rec aux sum steps =
      if pi > sum && delta > (pi -. sum) then
        steps
      else if pi < sum && delta > (sum -. pi) then
        steps
      else if steps = 2 * (steps / 2) then
        aux (sum +. 4. /. (float_of_int (2 * steps + 1))) (steps + 1)
      else
        aux (sum -. 4. /. (float_of_int (2 * steps + 1))) (steps + 1)
    in aux 0. 0

let () =
  print_int (leibniz_pi 3.15); print_char '\n';
  print_int (leibniz_pi 3.14); print_char '\n';
  print_int (leibniz_pi 0.86); print_char '\n';
  print_int (leibniz_pi 0.85); print_char '\n';
  print_int (leibniz_pi 0.1); print_char '\n';
  print_int (leibniz_pi 0.01); print_char '\n';
  print_int (leibniz_pi 0.); print_char '\n';
  print_int (leibniz_pi (-1.)); print_char '\n';
