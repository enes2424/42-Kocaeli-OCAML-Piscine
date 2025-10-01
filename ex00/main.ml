module Watchtower : sig
  type hour = int

  val zero : hour
  val add : hour -> hour -> hour
  val sub : hour -> hour -> hour
end = struct
  type hour = int

  let zero = 12

  let add first second =
    let res = (first + second) mod 12 in
    if res = 0 then 12 else res

  let sub first second =
    let res = (first - second) mod 12 in
    if res <= 0 then res + 12 else res
end

let print_hour h = print_endline (string_of_int h)

let () =
  print_endline "=== Watchtower Monoid Tests ===";
  print_endline "zero:";
  let zero = Watchtower.zero in
  print_hour zero;
  print_endline "";

  print_endline "add tests:";
  print_endline "3 + 4 =";
  print_hour (Watchtower.add 3 4);
  print_endline "11 + 2 =";
  print_hour (Watchtower.add 11 2);
  print_endline "0 + 0 =";
  print_hour (Watchtower.add zero zero);
  print_endline "12 + 1 =";
  print_hour (Watchtower.add 12 1);
  print_endline "";

  print_endline "sub tests:";
  print_endline "5 - 3 =";
  print_hour (Watchtower.sub 5 3);
  print_endline "3 - 5 =";
  print_hour (Watchtower.sub 3 5);
  print_endline "0 - 0 =";
  print_hour (Watchtower.sub zero zero);
  print_endline "1 - 12 =";
  print_hour (Watchtower.sub 1 12);
  print_endline "";

  print_endline "edge cases:";
  print_endline "12 + 12 =";
  print_hour (Watchtower.add 12 12);
  print_endline "12 - 12 =";
  print_hour (Watchtower.sub 12 12);
  print_endline "1 + 11 =";
  print_hour (Watchtower.add 1 11);
  print_endline "11 - 1 =";
  print_hour (Watchtower.sub 11 1);
  print_endline "";

  print_endline "=== All Watchtower Tests Completed ==="
