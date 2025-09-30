let encode list =
   match list with
    | [] -> []
    | head :: tail -> begin
      let rec aux list result count item =
        match list with
        | [] -> result @ [(count, item)]
        | head :: tail ->
          if head = item then
            aux tail result (count + 1) item
          else
            aux tail (result @ [(count, item)]) 1 head
      in aux tail [] 1 head
    end

let () =
  let print_tuple printer flag (count, item) = begin
        print_char '(';
        print_int count;
        print_string ", ";
        printer item;
        print_char ')';
        if (flag = 1) then
          print_string ", "
        else
          print_char '\n'
  end
  in let rec print_list_of_tuple printer list =
    match list with
    | [] -> print_char '\n'
    | [x] -> print_tuple printer 0 x
    | h :: t -> begin
      print_tuple printer 1 h;
      print_list_of_tuple printer t
    end
  in begin
    print_list_of_tuple print_string (encode ["abc"; "abc"; "xyz"; "mno"; "mno"; "mno"]);
    print_list_of_tuple print_char (encode ['a'; 'a'; 'a'; 'b'; 'b'; 'b']);
    print_list_of_tuple print_float (encode [3.4; 3.4; 5.6; 7.2; 7.2; 9.8]);
    print_list_of_tuple print_int (encode [5; 5; 5; 5; 2; 2;8; 8; 8])
  end
