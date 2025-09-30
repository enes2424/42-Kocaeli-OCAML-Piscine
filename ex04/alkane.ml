class alkane (n : int) =
  object (self)
    initializer if n < 1 then invalid_arg "Alkane: n must be >= 1"

    inherit
      Molecule.molecule
        (match n with
        | 1 -> "Methane"
        | 2 -> "Ethane"
        | 3 -> "Propane"
        | 4 -> "Butane"
        | 5 -> "Pentane"
        | 6 -> "Hexane"
        | 7 -> "Heptane"
        | 8 -> "Octane"
        | 9 -> "Nonane"
        | 10 -> "Decane"
        | 11 -> "Undecane"
        | 12 -> "Dodecane"
        | _ -> "Unknownane")
        (let carbon = new Atoms.carbon in
         let hydrogen = new Atoms.hydrogen in
         List.init n (fun _ -> carbon)
         @ List.init ((2 * n) + 2) (fun _ -> hydrogen))
  end
