let ft_print_comb () =
  let rec loop_first_digit digit1 =
    if digit1 = 8 then ()
    else begin
      let rec loop_second_digit digit1 digit2 =
        if (digit1 = 7 && digit2 = 9) || digit2 = 10 then ()
        else begin
          let rec loop_third_digit digit1 digit2 digit3 =
            if digit3 = 10 then ()
            else begin
              print_int digit1;
              print_int digit2;
              print_int digit3;
              if digit1 = 7 && digit2 = 8 && digit3 = 9 then
                print_string "\n"
              else
                print_string ", ";
              loop_third_digit digit1 digit2 (digit3 + 1)
            end
          in loop_third_digit digit1 digit2 (digit2 + 1);
          loop_second_digit digit1 (digit2 + 1)
        end
      in loop_second_digit digit1 (digit1 + 1);
      loop_first_digit (digit1 + 1)
    end
  in loop_first_digit 0