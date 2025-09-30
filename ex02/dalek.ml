class dalek ?(hp = 100) (unnecessary : string) =
  object (self)

    val name =
      Random.self_init ();
      "Dalek"
      ^ String.uppercase_ascii
          (String.make 1 (char_of_int (Random.int 26 + 97)))
      ^ String.make 1 (char_of_int (Random.int 26 + 97))
      ^ String.make 1 (char_of_int (Random.int 26 + 97))

    val mutable shield = true

    method to_string = "name : " ^ name ^ ", hp : " ^ string_of_int hp ^ ", shield : " ^ string_of_bool shield

    method talk =
      Random.self_init ();
      let index = Random.int 4 in
      let list = [ "∗ Explain! Explain!"; "∗ Exterminate! Exterminate!"; "∗ I obey!"; "∗ You are the Doctor! You are the enemy of the Daleks!" ] in
      print_endline (List.nth list index)

    method exterminate (target : People.people) = shield <- false;
      print_endline (name ^ " is exterminating " ^ target#to_string);
      let dead_target = target#die in
      print_endline (target#to_string ^ " has been exterminated.");
      dead_target

    method die =
      print_endline ("Emergency Temporal Shift!");
      new dalek ~hp:0 ""
  end
