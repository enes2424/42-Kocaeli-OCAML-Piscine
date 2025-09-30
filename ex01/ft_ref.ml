type 'a ft_ref = {
  mutable content : 'a
}

let return var = {content = var}

let get refe = refe.content

let set refe var = refe.content <- var

let bind refe func : 'b ft_ref = func refe.content

let () =
  let ref1 = return 42 in
  print_string "Created ref with 42: ";
  print_int (get ref1);
  print_newline ();
  
  set ref1 100;
  print_string "After setting to 100: ";
  print_int (get ref1);
  print_newline ();
  
  let double_ref x = return (x * 2) in
  let ref2 = bind ref1 double_ref in
  print_string "After bind with double function: ";
  print_int (get ref2);
  print_newline ();
  
  let ref3 = return "hello" in
  let to_upper_ref s = return (String.uppercase_ascii s) in
  let ref4 = bind ref3 to_upper_ref in
  print_string "String test: ";
  print_string (get ref4);
  print_newline ();
  
  print_endline "All tests completed!"
