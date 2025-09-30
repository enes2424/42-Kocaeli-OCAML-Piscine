module type FRACTIONNAL_BITS = sig val bits : int end
module type FIXED = sig
  type t
  val of_float    : float -> t
  val of_int      : int -> t
  val to_float    : t -> float
  val to_int      : t -> int
  val to_string   : t -> string
  val zero : t
  val one  : t
  val succ : t -> t
  val pred : t -> t
  val min  : t -> t -> t
  val max  : t -> t -> t
  val gth  : t -> t -> bool
  val lth  : t -> t -> bool
  val gte  : t -> t -> bool
  val lte  : t -> t -> bool
  val eqp  : t -> t -> bool
  val eqs  : t -> t -> bool
  val add  : t -> t -> t
  val sub  : t -> t -> t
  val mul  : t -> t -> t
  val div  : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

module type MAKE = functor (F : FRACTIONNAL_BITS) -> FIXED

module Make : MAKE = functor (F : FRACTIONNAL_BITS) -> struct
  type t = int

  let of_float float_val = 
    let round_to_nearest x = 
      if x >= 0.0 then
        int_of_float (x +. 0.5)
      else 
        int_of_float (x -. 0.5) in
    round_to_nearest (float_val *. float_of_int (1 lsl F.bits))
  let of_int int_val = int_val lsl F.bits
  let to_float t_val = (float_of_int t_val) /. (float_of_int (1 lsl F.bits))
  let to_int t_val = t_val lsr F.bits
  let to_string t_val = string_of_float (to_float t_val)

  let zero = 0
  let one = of_int 1

  let succ t_val = t_val + 1
  let pred t_val = t_val - 1

  let min t_val1 t_val2 = 
    if t_val1 < t_val2 then t_val1 else t_val2
  let max t_val1 t_val2 = 
    if t_val1 > t_val2 then t_val1 else t_val2

  let gth t_val1 t_val2 = t_val1 > t_val2
  let lth t_val1 t_val2 = t_val1 < t_val2
  let gte t_val1 t_val2 = t_val1 >= t_val2
  let lte t_val1 t_val2 = t_val1 <= t_val2
  let eqp t_val1 t_val2 = t_val1 == t_val2
  let eqs t_val1 t_val2 = t_val1 = t_val2

  let add t_val1 t_val2 = t_val1 + t_val2
  let sub t_val1 t_val2 = t_val1 - t_val2
  let mul t_val1 t_val2 = (t_val1 * t_val2) lsr F.bits
  let div t_val1 t_val2 = (t_val1 lsl F.bits) / t_val2

  let rec foreach start_t_val finish_t_val func =
    func start_t_val;
    if not (eqp start_t_val finish_t_val) then
      foreach (succ start_t_val) finish_t_val func
    
end

module Fixed4: FIXED = Make(struct let bits = 4 end)
module Fixed8: FIXED = Make(struct let bits = 8 end)

let() =
  print_endline "======== of_float and to_float ========";
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  print_string "x8 = ";
  print_float (Fixed8.to_float x8);
  print_string "\ny8 = ";
  print_float (Fixed8.to_float y8);
  print_endline "\n========== of_int and to_int ==========";
  let a4 = Fixed4.of_int 5 in
  let b4 = Fixed4.of_int 213124 in
  print_string "a4 = ";
  print_int (Fixed4.to_int a4);
  print_string "\nb4 = ";
  print_int (Fixed4.to_int b4);
  print_endline "\n============== to_string ==============";
  print_endline ("x8 = " ^ Fixed8.to_string x8);
  print_endline ("y8 = " ^ Fixed8.to_string y8);
  print_endline "================= zero ================";
  let zero = Fixed4.zero in
  print_endline ("zero -> " ^ Fixed4.to_string zero);
  print_endline "================= one =================";
  let one = Fixed4.one in
  print_endline ("one -> " ^ Fixed4.to_string one);
  print_endline "================= succ ================";
  let succ = Fixed4.succ zero in
  print_endline ("succ = zero + 1 -> " ^ Fixed4.to_string succ);
  print_endline "================= pred ================";
  let pred = Fixed4.pred zero in
  print_endline ("pred = zero - 1 -> " ^ Fixed4.to_string pred);
  print_endline "================= min =================";
  let min = Fixed4.min zero one in
  print_endline ("min(zero, one) -> " ^ Fixed4.to_string min);
  print_endline "================= max =================";
  let max = Fixed4.max zero one in
  print_endline ("max(zero, one) -> " ^ Fixed4.to_string max);
  print_endline "================= gth =================";
  print_endline ("zero > one -> " ^ string_of_bool (Fixed4.gth zero one));
  print_endline ("one > zero -> " ^ string_of_bool (Fixed4.gth one zero));
  print_endline "================= lth =================";
  print_endline ("zero < one -> " ^ string_of_bool (Fixed4.lth zero one));
  print_endline ("one < zero -> " ^ string_of_bool (Fixed4.lth one zero));
  print_endline "================= gte =================";
  print_endline ("zero >= one -> " ^ string_of_bool (Fixed4.gte zero one));
  print_endline ("one >= zero -> " ^ string_of_bool (Fixed4.gte one zero));
  print_endline ("zero >= zero -> " ^ string_of_bool (Fixed4.gte zero zero));
  print_endline "================= lte =================";
  print_endline ("zero <= one -> " ^ string_of_bool (Fixed4.lte zero one));
  print_endline ("one <= zero -> " ^ string_of_bool (Fixed4.lte one zero));
  print_endline ("one <= one -> " ^ string_of_bool (Fixed4.lte one one));
  let z8 = Fixed8.of_float 21.10 in
  print_endline "================= eqp =================";
  print_endline ("x8 is physically equal to z8 -> " ^ string_of_bool (Fixed8.eqp x8 z8));
  print_endline ("x8 is physically equal to x8 -> " ^ string_of_bool (Fixed8.eqp x8 x8));
  print_endline "================= eqs =================";
  print_endline ("x8 is structurally equal to y8 -> " ^ string_of_bool (Fixed8.eqs x8 y8));
  print_endline ("x8 is structurally equal to z8 -> " ^ string_of_bool (Fixed8.eqs x8 z8));
  print_endline "================= add =================";
  let r8 = Fixed8.add x8 y8 in
  print_endline ("x8 + y8 = r8 = " ^ Fixed8.to_string r8);
  print_endline "================= sub =================";
  let r8 = Fixed8.sub x8 y8 in
  print_endline ("x8 - y8 = r8 = " ^ Fixed8.to_string r8);
  print_endline "================= mul =================";
  let r8 = Fixed8.mul x8 y8 in
  print_endline ("x8 * y8 = r8 = " ^ Fixed8.to_string r8);
  print_endline "================= div =================";
  let r8 = Fixed8.div x8 y8 in
  print_endline ("x8 / y8 = r8 = " ^ Fixed8.to_string r8);
  print_endline "=============== foreach ===============";
  print_endline "zero => one :";
  Fixed4.foreach zero one (fun f -> print_endline (Fixed4.to_string f));
