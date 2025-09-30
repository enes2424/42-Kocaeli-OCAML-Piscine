let ft_rot_n num str =
  let rec mod26 num =
    if num < 0 then
      mod26 (num - 26)
    else if num < 26 then
      num
    else
      mod26 (num - (26 * (num / 26)))
  in let rotate c =
    if c >= 'a' && c <= 'z' then
      char_of_int (mod26 ((int_of_char c) - 97 + num) + 97)
    else if c >= 'A' && c <= 'Z' then
      char_of_int (mod26 ((int_of_char c) - 65 + num) + 65)
    else
      c
  in String.map rotate str