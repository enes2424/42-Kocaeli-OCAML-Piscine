let ft_string_all func str =
  let rec loop_char index =
    if index = -1 then
      true
    else if func (String.get str index) = false then
      false
    else
      loop_char (index - 1)
  in loop_char (String.length(str) - 1)