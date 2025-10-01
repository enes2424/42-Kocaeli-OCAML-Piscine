module App : sig
  type project = string * string * int

  val zero : project
  val combine : project -> project -> project
  val fail : project -> project
  val success : project -> project
end = struct
  type project = string * string * int

  let zero = ("", "", 0)

  let combine first second =
    let name1, status1, grade1 = first in
    let name2, status2, grade2 = second in
    let grade = (grade1 + grade2) / 2 in
    let status = if grade > 80 then "succeed" else "failed" in
    (name1 ^ name2, status, grade)

  let fail pro =
    let name, status, grade = pro in
    (name, "failed", 0)

  let success pro =
    let name, status, grade = pro in
    (name, "succeed", 80)
end

let print_proj (proj : App.project) =
  let name, status, grade = proj in
  print_endline
    ("name: " ^ name ^ ", status: " ^ status ^ ", grade: " ^ string_of_int grade)

let () =
  print_endline "=== App Monoid Tests ===";
  print_endline "zero:";
  let zero = App.zero in
  print_proj zero;
  print_endline "";

  print_endline "combine tests:";
  let p1 = ("42", "succeed", 90) in
  let p2 = ("OCaml", "failed", 60) in
  print_endline "p1:";
  print_proj p1;
  print_endline "p2:";
  print_proj p2;
  print_endline "combine p1 p2:";
  print_proj (App.combine p1 p2);
  print_endline "combine p2 p1:";
  print_proj (App.combine p2 p1);
  print_endline "combine p1 zero:";
  print_proj (App.combine p1 zero);
  print_endline "combine zero p2:";
  print_proj (App.combine zero p2);
  print_endline "";

  print_endline "fail/success tests:";
  print_endline "fail p1:";
  print_proj (App.fail p1);
  print_endline "success p2:";
  print_proj (App.success p2);
  print_endline "";

  print_endline "=== All App Tests Completed ==="
