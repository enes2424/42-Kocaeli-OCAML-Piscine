let ft_print_rev str =
  let rec loop_char index =
    if index = -1 then
      print_char '\n'
    else begin
      print_char (String.get str index);
      loop_char (index - 1)
    end
  in loop_char (String.length(str) - 1)