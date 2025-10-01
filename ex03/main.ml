module Try = struct
  type 'a t = Success of 'a | Failure of exn

  let return value = Success value

  let bind (attempt : 'a t) (func : 'a -> 'b t) =
    match attempt with
    | Success v -> ( try func v with e -> Failure e)
    | Failure e -> Failure e

  let recover (attempt : 'a t) (func : exn -> 'a t) =
    match attempt with
    | Success v -> attempt
    | Failure e -> ( try func e with new_e -> Failure new_e)

  let filter (attempt : 'a t) (func : 'a -> bool) =
    match attempt with
    | Success v -> (
        try
          if func v then attempt
          else Failure (Invalid_argument "filter failed")
        with e -> Failure e)
    | Failure e -> attempt

  let flatten (nested : 'a t t) =
    match nested with
    | Success inner_try -> inner_try
    | Failure e -> Failure e
end

let print_result result =
  match result with
  | Try.Success v -> print_endline ("Success: " ^ string_of_int v)
  | Try.Failure e -> print_endline ("Failure: " ^ Printexc.to_string e)

let print_bool_result result =
  match result with
  | Try.Success v -> print_endline ("Success: " ^ string_of_bool v)
  | Try.Failure e -> print_endline ("Failure: " ^ Printexc.to_string e)

let print_string_result result =
  match result with
  | Try.Success v -> print_endline ("Success: " ^ v)
  | Try.Failure e -> print_endline ("Failure: " ^ Printexc.to_string e)

let safe_divide x y = if y = 0 then raise Division_by_zero else x / y

let safe_sqrt x =
  if x < 0 then raise (Invalid_argument "negative sqrt")
  else int_of_float (sqrt (float_of_int x))

let is_positive x = x > 0
let is_even x = x mod 2 = 0

let exception_handler e =
  match e with
  | Division_by_zero -> Try.Success 0
  | Invalid_argument _ -> Try.Success (-1)
  | _ -> Try.Failure e

let () =
  print_endline "=== Try Monad Tests ===";
  print_endline "";

  print_endline "return tests:";
  print_endline "return 42:";
  print_result (Try.return 42);
  print_endline "return (-5):";
  print_result (Try.return (-5));
  print_endline "";

  print_endline "bind tests (success cases):";
  print_endline "Success 10 >>= (fun x -> Success (x * 2)):";
  print_result (Try.bind (Try.Success 10) (fun x -> Try.Success (x * 2)));
  print_endline "Success 20 >>= (fun x -> Success (x / 4)):";
  print_result (Try.bind (Try.Success 20) (fun x -> Try.Success (x / 4)));
  print_endline "";

  print_endline "bind tests (failure propagation):";
  print_endline "Failure e >>= (fun x -> Success (x * 2)):";
  print_result
    (Try.bind (Try.Failure Division_by_zero) (fun x -> Try.Success (x * 2)));
  print_endline "";

  print_endline "bind tests (exception handling):";
  print_endline "Success 10 >>= (fun x -> safe_divide x 0):";
  print_result (Try.bind (Try.Success 10) (fun x -> Try.Success (safe_divide x 0)));
  print_endline "Success 10 >>= (fun x -> safe_divide x 2):";
  print_result (Try.bind (Try.Success 10) (fun x -> Try.Success (safe_divide x 2)));
  print_endline "";

  print_endline "recover tests (success cases):";
  print_endline "Success 42 recover with handler:";
  print_result (Try.recover (Try.Success 42) exception_handler);
  print_endline "";

  print_endline "recover tests (failure recovery):";
  print_endline "Failure Division_by_zero recover:";
  print_result (Try.recover (Try.Failure Division_by_zero) exception_handler);
  print_endline "Failure Invalid_argument recover:";
  print_result
    (Try.recover (Try.Failure (Invalid_argument "test")) exception_handler);
  print_endline "";

  print_endline "filter tests (success with true predicate):";
  print_endline "Success 5 filter is_positive:";
  print_result (Try.filter (Try.Success 5) is_positive);
  print_endline "Success 8 filter is_even:";
  print_result (Try.filter (Try.Success 8) is_even);
  print_endline "";

  print_endline "filter tests (success with false predicate):";
  print_endline "Success (-3) filter is_positive:";
  print_result (Try.filter (Try.Success (-3)) is_positive);
  print_endline "Success 7 filter is_even:";
  print_result (Try.filter (Try.Success 7) is_even);
  print_endline "";

  print_endline "filter tests (failure propagation):";
  print_endline "Failure e filter is_positive:";
  print_result (Try.filter (Try.Failure Division_by_zero) is_positive);
  print_endline "";

  print_endline "flatten tests (Success of Success):";
  print_endline "Success(Success 42) flatten:";
  print_result (Try.flatten (Try.Success (Try.Success 42)));
  print_endline "";

  print_endline "flatten tests (Success of Failure):";
  print_endline "Success(Failure e) flatten:";
  print_result (Try.flatten (Try.Success (Try.Failure Division_by_zero)));
  print_endline "";

  print_endline "flatten tests (Failure):";
  print_endline "Failure e flatten:";
  print_result (Try.flatten (Try.Failure (Invalid_argument "outer")));
  print_endline "";

  print_endline "complex chaining tests:";
  print_endline "return 20 >>= divide_by_2 >>= add_10:";
  let divide_by_2 x = Try.Success (x / 2) in
  let add_10 x = Try.Success (x + 10) in
  let result = Try.bind (Try.bind (Try.return 20) divide_by_2) add_10 in
  print_result result;
  print_endline "";

  print_endline "complex chaining with failure:";
  print_endline "return 20 >>= safe_divide_by_0 >>= add_10:";
  let safe_divide_by_0 x = Try.Success (safe_divide x 0) in
  let result2 = Try.bind (Try.bind (Try.return 20) safe_divide_by_0) add_10 in
  print_result result2;
  print_endline "";

  print_endline "edge cases:";
  print_endline "filter with exception-throwing predicate:";
  let bad_predicate _ = raise (Failure "bad predicate") in
  print_result (Try.filter (Try.Success 5) bad_predicate);
  print_endline "";

  print_endline "recover with exception-throwing handler:";
  let bad_handler _ = raise (Failure "bad handler") in
  print_result (Try.recover (Try.Failure Division_by_zero) bad_handler);
  print_endline "";

  print_endline "=== All Try Monad Tests Completed ==="
