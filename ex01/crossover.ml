let crossover source_list target_list =
  if target_list = [] then []
  else
    let rec contains list item =
      match list with
      | [] -> false
      | head :: tail ->
        if head = item then
          true
        else
          contains tail item
    in let rec aux source_list target_list result =
      match source_list with
      | [] -> result
      | head :: tail ->
        let rec aux2 item target_list result =
          match target_list with
          | [] -> result
          | head :: tail ->
            if item = head then
              if not (contains result head) then
                head :: result
              else
                result
            else
              aux2 item tail result
        in aux tail target_list (aux2 head target_list result)
    in aux source_list target_list []

let () =
  let rec print_list printer list =
    match list with
    | [] -> print_char '\n'
    | [x] -> begin
      printer x;
      print_char '\n'
    end
    | h :: t ->
      printer h;
      print_string ", ";
      print_list printer t
  in begin
    print_list print_int (crossover [1; 2; 5; 5] []);
    print_list print_int (crossover [] [4; 6; 6; 6]);
    print_list print_int (crossover [1; 1; 1; 1; 2; 3; 3; 4; 5] [2; 4; 4]);
    print_list print_char (crossover ['x'; 'y' ;'z'] ['a'; 'b'; 'y']);
    print_list print_string (crossover ["abc"; "abc"; "xyz"; "mno"] ["abc"; "mno"; "mno"; "hij"; "hij"]);
    print_list print_float (crossover [1.4; 2.5; 6.5; 9.8] [2.5; 6.5; 9.8; 12.4; 56.7])
  end

