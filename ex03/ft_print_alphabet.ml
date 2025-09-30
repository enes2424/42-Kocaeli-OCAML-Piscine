let ft_print_alphabet () =
  let rec print_letters_from num =
    if num = 0 then
      print_char '\n'
    else begin
      print_char (char_of_int (97 + 26 - num));
      print_letters_from (num - 1)
    end
  in print_letters_from 26
