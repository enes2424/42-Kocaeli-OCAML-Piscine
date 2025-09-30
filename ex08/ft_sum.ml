let ft_sum func lower upper =
  if lower > upper then
    nan
  else
    let rec aux sum lower =
      if lower > upper then
        sum
      else
        aux (sum +. func lower) (lower + 1)
    in aux 0. lower

let () =
  print_float (ft_sum (fun i -> float_of_int (i / 5)) 6 5); print_char '\n';
  print_float (ft_sum (fun i -> float_of_int i) 3 5); print_char '\n';
  print_float (ft_sum (fun i -> float_of_int (i * i)) 1 10); print_char '\n';
