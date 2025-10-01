module Set = struct
  type 'a t = 'a list

  let return value : 'a t = [value]

  let rec remove_duplicates = function
    | [] -> []
    | head :: tail -> head :: (remove_duplicates (List.filter ((<>) head) tail))

  let bind (attempt : 'a t) (func : 'a -> 'b t) : 'b t = 
    List.map (fun elm -> func elm) attempt
    |> List.flatten
    |> remove_duplicates
  
  let union (first : 'a t) (second : 'a t) : 'a t = 
    remove_duplicates (first @ second)

  let inter (first : 'a t) (second : 'a t) : 'a t = 
    List.filter (fun elm -> List.mem elm second) first
  
  let diff (first : 'a t) (second : 'a t) : 'a t = 
    List.filter (fun elm -> not (List.mem elm second)) first

  let filter (attempt : 'a t) (func : 'a -> bool) : 'a t =
    List.filter func attempt
  
  let foreach (attempt : 'a t) (func : 'a -> unit) : unit =
    List.iter func attempt
  
  let rec for_all (attempt : 'a t) (func : 'a -> bool) : bool =
    match attempt with
    | [] -> true
    | head :: tail -> 
      if not (func head) then
        false
      else
        for_all tail func
    
  let rec exists (attempt : 'a t) (func : 'a -> bool) : bool =
    match attempt with
    | [] -> false
    | head :: tail -> 
      if func head then
        true
      else
        exists tail func

end

let print_set set =
  print_string "[";
  Set.foreach set (fun x -> Printf.printf "%d; " x);
  print_endline "]"

let print_bool b = print_endline (string_of_bool b)

let () =
  print_endline "=== Set Monad Tests ===";
  print_endline "return tests:";
  print_endline "return 42:";
  print_set (Set.return 42);
  print_endline "return (-5):";
  print_set (Set.return (-5));
  print_endline "";

  print_endline "bind tests:";
  let set1 = [1; 2; 3] in
  let double_func x = [x; x * 2] in
  print_endline "bind [1; 2; 3] (fun x -> [x; x*2]):";
  print_set (Set.bind set1 double_func);
  let empty_func x = [] in
  print_endline "bind [1; 2] (fun x -> []):";
  print_set (Set.bind [1; 2] empty_func);
  print_endline "";

  print_endline "union tests:";
  print_endline "[1; 2] union [3; 4]:";
  print_set (Set.union [1; 2] [3; 4]);
  print_endline "[1; 2; 3] union [2; 3; 4]:";
  print_set (Set.union [1; 2; 3] [2; 3; 4]);
  print_endline "[] union [1; 2]:";
  print_set (Set.union [] [1; 2]);
  print_endline "[1; 2] union []:";
  print_set (Set.union [1; 2] []);
  print_endline "";

  print_endline "inter tests:";
  print_endline "[1; 2; 3; 4] inter [3; 4; 5; 6]:";
  print_set (Set.inter [1; 2; 3; 4] [3; 4; 5; 6]);
  print_endline "[1; 2] inter [3; 4]:";
  print_set (Set.inter [1; 2] [3; 4]);
  print_endline "[1; 2; 3] inter [1; 2; 3]:";
  print_set (Set.inter [1; 2; 3] [1; 2; 3]);
  print_endline "[] inter [1; 2]:";
  print_set (Set.inter [] [1; 2]);
  print_endline "";

  print_endline "diff tests:";
  print_endline "[1; 2; 3; 4] diff [3; 4; 5; 6]:";
  print_set (Set.diff [1; 2; 3; 4] [3; 4; 5; 6]);
  print_endline "[1; 2] diff [3; 4]:";
  print_set (Set.diff [1; 2] [3; 4]);
  print_endline "[1; 2; 3] diff [1; 2; 3]:";
  print_set (Set.diff [1; 2; 3] [1; 2; 3]);
  print_endline "[1; 2; 3] diff []:";
  print_set (Set.diff [1; 2; 3] []);
  print_endline "";

  print_endline "filter tests:";
  let is_even x = x mod 2 = 0 in
  let is_positive x = x > 0 in
  print_endline "[1; 2; 3; 4; 5; 6] filter (even):";
  print_set (Set.filter [1; 2; 3; 4; 5; 6] is_even);
  print_endline "[-2; -1; 0; 1; 2] filter (positive):";
  print_set (Set.filter [-2; -1; 0; 1; 2] is_positive);
  print_endline "[] filter (even):";
  print_set (Set.filter [] is_even);
  print_endline "";

  print_endline "foreach tests:";
  print_endline "foreach [1; 2; 3] print_int:";
  Set.foreach [1; 2; 3] (fun x -> Printf.printf "%d " x);
  print_endline "";
  print_endline "foreach [] print_int:";
  Set.foreach [] (fun x -> Printf.printf "%d " x);
  print_endline "";
  print_endline "";

  print_endline "for_all tests:";
  print_endline "[2; 4; 6] for_all (even):";
  print_bool (Set.for_all [2; 4; 6] is_even);
  print_endline "[1; 2; 3] for_all (even):";
  print_bool (Set.for_all [1; 2; 3] is_even);
  print_endline "[1; 2; 3] for_all (positive):";
  print_bool (Set.for_all [1; 2; 3] is_positive);
  print_endline "[] for_all (fun x -> false):";
  print_bool (Set.for_all [] (fun x -> false));
  print_endline "";

  print_endline "exists tests:";
  print_endline "[1; 3; 5] exists (even):";
  print_bool (Set.exists [1; 3; 5] is_even);
  print_endline "[1; 2; 3] exists (even):";
  print_bool (Set.exists [1; 2; 3] is_even);
  print_endline "[-2; -1; 0] exists (positive):";
  print_bool (Set.exists [-2; -1; 0] is_positive);
  print_endline "[] exists (fun x -> true):";
  print_bool (Set.exists [] (fun x -> true));
  print_endline "";

  print_endline "complex chaining tests:";
  print_endline "return 5 >>= (fun x -> [x-1; x; x+1]) >>= filter (even):";
  let chain_result = Set.bind (Set.return 5) (fun x -> [x-1; x; x+1]) in
  print_set (Set.filter chain_result is_even);
  print_endline "";

  print_endline "edge cases:";
  print_endline "bind with duplicates [1; 1; 2] (fun x -> [x; x]):";
  print_set (Set.bind [1; 1; 2] (fun x -> [x; x]));
  print_endline "union with duplicates [1; 1; 2] [2; 2; 3]:";
  print_set (Set.union [1; 1; 2] [2; 2; 3]);
  print_endline "";

  print_endline "=== All Set Tests Completed ==="