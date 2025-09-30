let sum x y = x +. y

let () =
  let result1 = sum 3.14 2.86 in
  Printf.printf "sum 3.14 2.86 = %.2f\n" result1;
  
  let result2 = sum 0.0 5.5 in
  Printf.printf "sum 0.0 5.5 = %.2f\n" result2;
  
  let result3 = sum (-2.5) 7.5 in
  Printf.printf "sum (-2.5) 7.5 = %.2f\n" result3;
  
  let result4 = sum 1.23456 4.56789 in
  Printf.printf "sum 1.23456 4.56789 = %.5f\n" result4;
  
  let result5 = sum 0.0 0.0 in
  Printf.printf "sum 0.0 0.0 = %.2f\n" result5;
  
  let result6 = sum (-10.5) 10.5 in
  Printf.printf "sum (-10.5) 10.5 = %.2f\n" result6;
  
  let result7 = sum 999999.99 0.01 in
  Printf.printf "sum 999999.99 0.01 = %.2f\n" result7;

  let add_five = sum 5.0 in
  let result8 = add_five 3.0 in
  Printf.printf "Partial application: add_five 3.0 = %.2f\n" result8;

  let numbers = [1.0; 2.0; 3.0; 4.0; 5.0] in
  let add_ten = sum 10.0 in
  let results = List.map add_ten numbers in
  Printf.printf "Adding 10.0 to [1.0; 2.0; 3.0; 4.0; 5.0]: [";
  List.iteri (fun i x -> 
    Printf.printf "%.1f%s" x (if i < List.length results - 1 then "; " else "")
  ) results;
  Printf.printf "]\n";

  let double x = sum x x in
  let result9 = double 7.5 in
  Printf.printf "Double 7.5 (using sum): %.2f\n" result9;

  let operations = [sum 1.0; sum 2.0; sum 3.0] in
  let base_value = 10.0 in
  Printf.printf "Applying different additions to %.1f:\n" base_value;
  List.iteri (fun i op ->
    let result = op base_value in
    Printf.printf "  Operation %d: %.1f\n" (i+1) result
  ) operations

