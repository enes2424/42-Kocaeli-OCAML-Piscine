class alkane_combustion (alkane_list : Alkane.alkane list)
  (molecular_oxygen_coef : int) (carbon_dioxide_coef : int) (water_coef : int) =
  object (self)
    inherit
      Reaction.reaction
        (let molecular_oxygen =
           new Molecules.molecule_sample [ new Atoms.oxygen; new Atoms.oxygen ]
         in
         let oxygens : Molecule.molecule list =
           List.init molecular_oxygen_coef (fun _ ->
               (molecular_oxygen :> Molecule.molecule))
         in
         let alkanes : Molecule.molecule list =
           List.map
             (fun (a : Alkane.alkane) -> (a :> Molecule.molecule))
             alkane_list
         in
         alkanes @ oxygens)
        (let carbon_dioxide = new Molecules.carbon_dioxide in
         let water = new Molecules.water in
         let co2s =
           List.init carbon_dioxide_coef (fun _ ->
               (carbon_dioxide :> Molecule.molecule))
         in
         let waters =
           List.init water_coef (fun _ -> (water :> Molecule.molecule))
         in
         co2s @ waters)

    method private count_carbon list =
      let carbon = new Atoms.carbon in
      let rec aux lst count =
        match lst with
        | [] -> count
        | head :: tail -> aux tail (count + head#count_atom carbon)
      in
      aux list 0

    method balance : alkane_combustion =
      if self#is_balanced then
        new alkane_combustion
          alkane_list molecular_oxygen_coef carbon_dioxide_coef water_coef
      else
        let num_carbons = self#count_carbon alkane_list in
        let num_alkanes = List.length alkane_list in
        if ((3 * num_carbons) + num_alkanes) mod 2 = 0 then
          new alkane_combustion
            alkane_list
            (((3 * num_carbons) + num_alkanes) / 2)
            num_carbons
            (num_carbons + num_alkanes)
        else
          new alkane_combustion
            (alkane_list @ alkane_list)
            ((3 * num_carbons) + num_alkanes)
            (2 * num_carbons)
            ((2 * num_carbons) + (2 * num_alkanes))
  end
