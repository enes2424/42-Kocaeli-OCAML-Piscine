let gray size =
  if size <= 0 then
    print_char '\n'
  else
    let is_end str =
      String.get str 0 = '1' &&
      let rec all_zero_from i =
        if i = size then true
        else if String.get str i = '1' then false
        else all_zero_from (i + 1)
      in all_zero_from 1
    in let rec generate_left str size =
      if size = 0 then begin
        print_string str;
        if is_end str then
          print_char '\n'
        else
          print_char ' '
      end
      else begin
        generate_left (str ^ "0") (size - 1);
        generate_right  (str ^ "1") (size - 1);
      end
    and generate_right  str size =
      if size = 0 then begin
        print_string str;
        if is_end str then
          print_char '\n'
        else
          print_char ' '
      end
      else begin
        generate_left (str ^ "1") (size - 1);
        generate_right  (str ^ "0") (size - 1);
      end
    in begin
      generate_left "0" (size - 1);
      generate_right  "1" (size - 1);
    end

let () =
  gray (-5);
  gray 0;
  gray 1;
  gray 2;
  gray 3;
  gray 4;
