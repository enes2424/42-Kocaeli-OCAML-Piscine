let sequence nth =
  if nth <= 0 then
    ""
  else if nth = 1 then
    "1"
  else
    let int_to_string num =
      if num  = 0 then "0"
      else if num = 1 then "1"
      else if num = 2 then "2"
      else if num = 3 then "3"
      else if num = 4 then "4"
      else if num = 5 then "5"
      else if num = 6 then "6"
      else if num = 7 then "7"
      else if num = 8 then "8"
      else if num = 9 then "9"
      else ""
    in let rec encode list steps =
    match list with
      | [] -> []
      | head :: tail -> begin
        let rec aux list result count item =
          match list with
          | [] ->
            if steps = 0 then
              result @ [int_to_string count; item]
            else
              encode (result @ [int_to_string count; item]) (steps - 1)
          | head :: tail ->
            if head = item then
              aux tail result (count + 1) item
            else
              aux tail (result @ [int_to_string count; item]) 1 head
        in aux tail [] 1 head
      end
    in let list = encode ["1"] (nth - 2)
    in let rec string_of_list list str =
      match list with
      | [] -> str
      | head :: tail ->
        string_of_list tail (str ^ head)
    in string_of_list list ""

let () =
  print_string (sequence 2); print_char '\n';
  print_string (sequence 5); print_char '\n';
  print_string (sequence 7); print_char '\n';
