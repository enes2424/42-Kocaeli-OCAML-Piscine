module type MONOID = sig
  type element

  val zero1 : element
  val zero2 : element
  val mul : element -> element -> element
  val add : element -> element -> element
  val div : element -> element -> element
  val sub : element -> element -> element
end

module INT : MONOID with type element = int = struct
  type element = int

  let zero1 = 0
  let zero2 = 1
  let mul first second = first * second
  let add first second = first + second
  let div first second = first / second
  let sub first second = first - second
end

module FLOAT : MONOID with type element = float = struct
  type element = float

  let zero1 = 0.0
  let zero2 = 1.0
  let mul first second = first *. second
  let add first second = first +. second
  let div first second = first /. second
  let sub first second = first -. second
end

module Calc : functor (M : MONOID) -> sig
  val add : M.element -> M.element -> M.element
  val sub : M.element -> M.element -> M.element
  val mul : M.element -> M.element -> M.element
  val div : M.element -> M.element -> M.element
  val power : M.element -> int -> M.element
  val fact : M.element -> M.element
end =
functor
  (M : MONOID)
  ->
  struct
    let add first second = M.add first second
    let sub first second = M.sub first second
    let mul first second = M.mul first second
    let div first second = M.div first second

    let rec power base exponent =
      if exponent = 0 then M.zero2
      else if base = M.zero1 || base = M.zero2 || exponent = 1 then base
      else M.mul base (power base (exponent - 1))

    let rec fact x =
      if x <= M.zero2 then M.zero2 else M.mul x (fact (M.sub x M.zero2))
  end

module Calc_int = Calc (INT)
module Calc_float = Calc (FLOAT)

let () =
  print_endline "=== Calc INT Tests ===";
  print_endline "add tests:";
  print_endline "0 + 0 =";
  print_endline (string_of_int (Calc_int.add 0 0));
  print_endline "1 + 0 =";
  print_endline (string_of_int (Calc_int.add 1 0));
  print_endline "-3 + 5 =";
  print_endline (string_of_int (Calc_int.add (-3) 5));
  print_endline "100 + (-50) =";
  print_endline (string_of_int (Calc_int.add 100 (-50)));
  print_endline "";

  print_endline "sub tests:";
  print_endline "5 - 3 =";
  print_endline (string_of_int (Calc_int.sub 5 3));
  print_endline "3 - 5 =";
  print_endline (string_of_int (Calc_int.sub 3 5));
  print_endline "0 - 0 =";
  print_endline (string_of_int (Calc_int.sub 0 0));
  print_endline "-10 - 5 =";
  print_endline (string_of_int (Calc_int.sub (-10) 5));
  print_endline "";

  print_endline "mul tests:";
  print_endline "0 * 5 =";
  print_endline (string_of_int (Calc_int.mul 0 5));
  print_endline "1 * 7 =";
  print_endline (string_of_int (Calc_int.mul 1 7));
  print_endline "7 * 1 =";
  print_endline (string_of_int (Calc_int.mul 7 1));
  print_endline "-3 * 4 =";
  print_endline (string_of_int (Calc_int.mul (-3) 4));
  print_endline "-3 * -4 =";
  print_endline (string_of_int (Calc_int.mul (-3) (-4)));
  print_endline "";

  print_endline "div tests:";
  print_endline "10 / 2 =";
  print_endline (string_of_int (Calc_int.div 10 2));
  print_endline "9 / 3 =";
  print_endline (string_of_int (Calc_int.div 9 3));
  print_endline "7 / 2 = (integer division)";
  print_endline (string_of_int (Calc_int.div 7 2));
  print_endline "-12 / 3 =";
  print_endline (string_of_int (Calc_int.div (-12) 3));
  print_endline "5 / -2 =";
  print_endline (string_of_int (Calc_int.div 5 (-2)));
  print_endline "";

  print_endline "power tests:";
  print_endline "2 ^ 1 =";
  print_endline (string_of_int (Calc_int.power 2 1));
  print_endline "2 ^ 3 =";
  print_endline (string_of_int (Calc_int.power 2 3));
  print_endline "3 ^ 4 =";
  print_endline (string_of_int (Calc_int.power 3 4));
  print_endline "1 ^ 5 =";
  print_endline (string_of_int (Calc_int.power 1 5));
  print_endline "";

  print_endline "fact tests:";
  print_endline "0! =";
  print_endline (string_of_int (Calc_int.fact 0));
  print_endline "1! =";
  print_endline (string_of_int (Calc_int.fact 1));
  print_endline "5! =";
  print_endline (string_of_int (Calc_int.fact 5));
  print_endline "6! =";
  print_endline (string_of_int (Calc_int.fact 6));
  print_endline "";

  print_endline "=== Calc FLOAT Tests ===";
  print_endline "add tests:";
  print_endline "0.0 + 0.0 =";
  print_endline (string_of_float (Calc_float.add 0.0 0.0));
  print_endline "1.5 + 2.25 =";
  print_endline (string_of_float (Calc_float.add 1.5 2.25));
  print_endline "-3.0 + 5.5 =";
  print_endline (string_of_float (Calc_float.add (-3.0) 5.5));
  print_endline "100.5 + (-50.25) =";
  print_endline (string_of_float (Calc_float.add 100.5 (-50.25)));
  print_endline "";

  print_endline "sub tests:";
  print_endline "5.5 - 3.25 =";
  print_endline (string_of_float (Calc_float.sub 5.5 3.25));
  print_endline "3.25 - 5.5 =";
  print_endline (string_of_float (Calc_float.sub 3.25 5.5));
  print_endline "-2.0 - 4.0 =";
  print_endline (string_of_float (Calc_float.sub (-2.0) 4.0));
  print_endline "";

  print_endline "mul tests:";
  print_endline "0.0 * 5.0 =";
  print_endline (string_of_float (Calc_float.mul 0.0 5.0));
  print_endline "1.0 * 7.25 =";
  print_endline (string_of_float (Calc_float.mul 1.0 7.25));
  print_endline "-3.0 * 4.0 =";
  print_endline (string_of_float (Calc_float.mul (-3.0) 4.0));
  print_endline "-3.0 * -4.0 =";
  print_endline (string_of_float (Calc_float.mul (-3.0) (-4.0)));
  print_endline "";

  print_endline "div tests:";
  print_endline "10.0 / 2.0 =";
  print_endline (string_of_float (Calc_float.div 10.0 2.0));
  print_endline "7.0 / 2.0 =";
  print_endline (string_of_float (Calc_float.div 7.0 2.0));
  print_endline "-12.0 / 3.0 =";
  print_endline (string_of_float (Calc_float.div (-12.0) 3.0));
  print_endline "5.0 / -2.0 =";
  print_endline (string_of_float (Calc_float.div 5.0 (-2.0)));
  print_endline "";

  print_endline "power tests:";
  print_endline "2.0 ^ 1 =";
  print_endline (string_of_float (Calc_float.power 2.0 1));
  print_endline "2.0 ^ 3 =";
  print_endline (string_of_float (Calc_float.power 2.0 3));
  print_endline "1.0 ^ 5 =";
  print_endline (string_of_float (Calc_float.power 1.0 5));
  print_endline "";

  print_endline "fact tests:";
  print_endline "0.0! =";
  print_endline (string_of_float (Calc_float.fact 0.0));
  print_endline "1.0! =";
  print_endline (string_of_float (Calc_float.fact 1.0));
  print_endline "5.0! =";
  print_endline (string_of_float (Calc_float.fact 5.0));
  print_endline "6.0! =";
  print_endline (string_of_float (Calc_float.fact 6.0));
  print_endline "";

  print_endline "original quick sample tests:";
  print_endline (string_of_int (Calc_int.power 3 3));
  print_endline (string_of_float (Calc_float.power 3.0 3));
  print_endline (string_of_int (Calc_int.mul (Calc_int.add 20 1) 2));
  print_endline (string_of_float (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0));
  print_endline "";

  print_endline "=== All Calc Tests Completed ==="
