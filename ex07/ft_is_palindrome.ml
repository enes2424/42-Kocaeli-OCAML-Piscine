let ft_is_palindrome str =
  let len = String.length(str) in
  let rec loop_char index =
    if index >= len / 2  then
      true
    else if String.get str index <> String.get str (len - index - 1) then
      false
    else
      loop_char (index + 1)
  in loop_char (0)