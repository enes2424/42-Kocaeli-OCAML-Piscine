class people ?(hp = 100) name =
  object
    initializer
      print_endline ("A new person named " ^ name ^ " has been created !")

    method to_string = "name : " ^ name ^ ", hp : " ^ string_of_int hp
    method talk = print_endline ("I'm " ^ name ^ "! Do you know the Doctor?")
    method die = print_endline "Aaaarghh!";
    new people ~hp:0 name
  end
