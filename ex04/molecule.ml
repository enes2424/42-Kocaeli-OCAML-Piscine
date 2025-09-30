class virtual molecule (name : string) (atoms : Atom.atom list) =
  object (self)
    method name = name
    method atoms = atoms

    method formula =
      let counts =
        List.fold_left
          (fun acc atom ->
            let symbol = atom#symbol in
            let prev = try List.assoc symbol acc with Not_found -> 0 in
            (symbol, prev + 1) :: List.remove_assoc symbol acc)
          [] atoms
      in
      let sorted = List.sort (fun (a, _) (b, _) -> compare a b) counts in
      String.concat ""
        (List.map
           (fun (s, c) -> if c = 1 then s else s ^ string_of_int c)
           sorted)

    method to_string =
      "Molecule(name: " ^ name ^ ", formula: " ^ self#formula ^ ")"

    method equals (other : molecule) =
      name = other#name && self#formula = other#formula

    method count_atom (target_atom : Atom.atom) =
      List.fold_left
        (fun acc atom -> if atom#equals target_atom then acc + 1 else acc)
        0 atoms
  end
