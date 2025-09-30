let () =
  print_endline "=== Testing People Class ===\n";

  print_endline "--- Test 1: Creating people (initializer test) ---";
  let person1 = new People.people "Doctor Who" in
  let person2 = new People.people "Rose Tyler" in
  let person3 = new People.people "Martha Jones" in
  print_endline "";

  print_endline "--- Test 2: to_string method ---";
  print_endline person1#to_string;
  print_endline person2#to_string;
  print_endline person3#to_string;
  print_endline "";

  print_endline "--- Test 3: talk method ---";
  person1#talk;
  person2#talk;
  person3#talk;
  print_endline "";

  print_endline "--- Test 4: die method ---";
  let dead_person1 = person1#die in
  let dead_person2 = person2#die in
  let dead_person3 = person3#die in
  print_endline "";

  print_endline ("Death: " ^ dead_person1#to_string);
  print_endline ("Death: " ^ dead_person2#to_string);
  print_endline ("Death: " ^ dead_person3#to_string);
  print_endline "";

  print_endline "--- Test 5: Complete workflow ---";
  let person4 = new People.people "Captain Jack" in
  print_endline ("Created: " ^ person4#to_string);
  person4#talk;
  let dead_person4 = person4#die in
  print_endline "";

  print_endline ("Death: " ^ dead_person4#to_string);

  print_endline "=== All tests completed successfully! ==="
