module StringMap = Map.Make(String)

class virtual reaction (start : Molecule.molecule list)
  (result : Molecule.molecule list) =
  object (self)
    method get_start =
      if not self#is_balanced then failwith "Reaction is not balanced"
      else start

    method get_result =
      if not self#is_balanced then failwith "Reaction is not balanced"
      else result

    method private concat_atoms (lst : Molecule.molecule list)
        (atoms : Atom.atom list) =
      match lst with
      | [] -> atoms
      | head :: tail -> self#concat_atoms tail (atoms @ head#atoms)

    method virtual balance : reaction

    method is_balanced =
      let start_atoms = self#concat_atoms start [] in
      let result_atoms = self#concat_atoms result [] in
      let start_molecule = new Molecules.molecule_sample start_atoms in
      let result_molecule = new Molecules.molecule_sample result_atoms in
      start_molecule#equals result_molecule

    method to_string =
      let count_molecules lst =
        let map =
          List.fold_left
            (fun acc m ->
              let name = m#formula in
              let cnt = match StringMap.find_opt name acc with
                | Some c -> c
                | None -> 0
              in
              StringMap.add name (cnt + 1) acc)
            StringMap.empty
            lst
        in
        StringMap.bindings map in

      let molecules_to_str lst =
        count_molecules lst
        |> List.map (fun (name, cnt) ->
               if cnt = 1 then name else string_of_int cnt ^ " " ^ name)
        |> String.concat " + "
      in

      let start_str = molecules_to_str start in
      let result_str = molecules_to_str result in
      start_str ^ " -> " ^ result_str
  end
