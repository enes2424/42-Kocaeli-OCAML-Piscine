let ft_print_comb2 () =
  let rec loop_first_num num1 =
    if num1 = 99 then ()
    else begin
      let rec loop_second_num num1 num2 =
        if num2 = 100 then ()
        else begin
          if num1 < 10 then
            print_int 0;
          print_int num1;
          print_string " ";
          if num2 < 10 then
            print_int 0;
          print_int num2;
          if num1 = 98 && num2 = 99 then
            print_string "\n"
          else
            print_string ", ";
          loop_second_num num1 (num2 + 1)
        end
      in loop_second_num num1 (num1 + 1);
      loop_first_num (num1 + 1)
    end
  in loop_first_num 0