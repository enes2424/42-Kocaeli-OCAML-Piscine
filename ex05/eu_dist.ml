let eu_dist arr1 arr2 =
  let len = Array.length arr1 in
  if len <> Array.length arr2 then
    failwith "Arrays must be of the same length"
  else
    let rec aux sum index = 
      if index = len then
        sqrt sum
      else
        let diff = arr1.(index) -. arr2.(index) in
        aux (sum +. diff *. diff) (index + 1)
    in
    aux 0. 0

let () =
  let p1 = [|0.0; 0.0|] in
  let p2 = [|3.0; 4.0|] in
  let result1 = eu_dist p1 p2 in
  Printf.printf "Distance between (0,0) and (3,4): %.2f\n" result1;

  let p3 = [|1.0; 2.0; 3.0|] in
  let p4 = [|1.0; 2.0; 3.0|] in
  let result2 = eu_dist p3 p4 in
  Printf.printf "Distance between same points: %.2f\n" result2;
  
  let p5 = [|10.0|] in
  let p6 = [|13.0|] in
  let result3 = eu_dist p5 p6 in
  Printf.printf "1D distance: %.2f\n" result3;
  
  let p7 = [|1.0; 2.0; 3.0|] in
  let p8 = [|4.0; 6.0; 8.0|] in
  let result4 = eu_dist p7 p8 in
  Printf.printf "3D distance: %.2f\n" result4;

  try
    let p9 = [|1.0; 2.0|] in
    let p10 = [|1.0; 2.0; 3.0|] in
    let _ = eu_dist p9 p10 in
    Printf.printf "ERROR: Should have failed!\n"
  with
  | Failure msg -> Printf.printf "Error handling: %s\n" msg
