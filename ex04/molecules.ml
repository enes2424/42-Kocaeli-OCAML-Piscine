class trinitrotoluene =
  object
    inherit
      Molecule.molecule
        "Trinitrotoluene"
        [
          new Atoms.nitrogen;
          new Atoms.nitrogen;
          new Atoms.nitrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
        ]
  end

class water =
  object
    inherit
      Molecule.molecule
        "Water"
        [ new Atoms.hydrogen; new Atoms.hydrogen; new Atoms.oxygen ]
  end

class carbon_dioxide =
  object
    inherit
      Molecule.molecule
        "Carbon dioxide"
        [ new Atoms.carbon; new Atoms.oxygen; new Atoms.oxygen ]
  end

class glucose =
  object
    inherit
      Molecule.molecule
        "Glucose"
        [ new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen;
          new Atoms.oxygen ]
  end

class benzene =
  object
    inherit
      Molecule.molecule
        "Benzene"
        [ new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.carbon;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen;
          new Atoms.hydrogen ]
  end

class molecule_sample (atoms : Atom.atom list) =
  object
    inherit Molecule.molecule "Molecule" atoms
  end
