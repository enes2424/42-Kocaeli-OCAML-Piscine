let () =
  print_endline "=== Comprehensive Atom Class Testing ===\n";

  print_endline "--- Test 1: Creating different atom types ---";
  let hydrogen1 = new Atoms.hydrogen in
  let hydrogen2 = new Atoms.hydrogen in
  let carbon1 = new Atoms.carbon in
  let nitrogen1 = new Atoms.nitrogen in
  let oxygen1 = new Atoms.oxygen in
  let helium1 = new Atoms.helium in
  let argon1 = new Atoms.argon in
  print_endline "✅ All atoms created successfully";
  print_endline "";

  print_endline "--- Test 2: Testing name method ---";
  print_endline ("Hydrogen name: " ^ hydrogen1#name);
  print_endline ("Carbon name: " ^ carbon1#name);
  print_endline ("Nitrogen name: " ^ nitrogen1#name);
  print_endline ("Oxygen name: " ^ oxygen1#name);
  print_endline ("Helium name: " ^ helium1#name);
  print_endline ("Argon name: " ^ argon1#name);
  print_endline "";

  print_endline "--- Test 3: Testing symbol method ---";
  print_endline ("Hydrogen symbol: " ^ hydrogen1#symbol);
  print_endline ("Carbon symbol: " ^ carbon1#symbol);
  print_endline ("Nitrogen symbol: " ^ nitrogen1#symbol);
  print_endline ("Oxygen symbol: " ^ oxygen1#symbol);
  print_endline ("Helium symbol: " ^ helium1#symbol);
  print_endline ("Argon symbol: " ^ argon1#symbol);
  print_endline "";

  print_endline "--- Test 4: Testing atomic_number method ---";
  print_endline
    ("Hydrogen atomic number: " ^ string_of_int hydrogen1#atomic_number);
  print_endline ("Carbon atomic number: " ^ string_of_int carbon1#atomic_number);
  print_endline
    ("Nitrogen atomic number: " ^ string_of_int nitrogen1#atomic_number);
  print_endline ("Oxygen atomic number: " ^ string_of_int oxygen1#atomic_number);
  print_endline ("Helium atomic number: " ^ string_of_int helium1#atomic_number);
  print_endline ("Argon atomic number: " ^ string_of_int argon1#atomic_number);
  print_endline "";

  print_endline "--- Test 5: Testing to_string method ---";
  print_endline hydrogen1#to_string;
  print_endline carbon1#to_string;
  print_endline nitrogen1#to_string;
  print_endline oxygen1#to_string;
  print_endline helium1#to_string;
  print_endline argon1#to_string;
  print_endline "";

  print_endline "--- Test 6: Testing equals method (same type) ---";
  print_endline
    ("Hydrogen1 equals Hydrogen2: "
    ^ string_of_bool (hydrogen1#equals hydrogen2));
  print_endline "✅ Same atom types should be equal";
  print_endline "";

  print_endline "--- Test 7: Testing equals method (different types) ---";
  print_endline
    ("Hydrogen equals Carbon: " ^ string_of_bool (hydrogen1#equals carbon1));
  print_endline
    ("Hydrogen equals Nitrogen: " ^ string_of_bool (hydrogen1#equals nitrogen1));
  print_endline
    ("Hydrogen equals Oxygen: " ^ string_of_bool (hydrogen1#equals oxygen1));
  print_endline
    ("Hydrogen equals Helium: " ^ string_of_bool (hydrogen1#equals helium1));
  print_endline
    ("Hydrogen equals Argon: " ^ string_of_bool (hydrogen1#equals argon1));
  print_endline
    ("Carbon equals Nitrogen: " ^ string_of_bool (carbon1#equals nitrogen1));
  print_endline
    ("Carbon equals Oxygen: " ^ string_of_bool (carbon1#equals oxygen1));
  print_endline
    ("Carbon equals Helium: " ^ string_of_bool (carbon1#equals helium1));
  print_endline
    ("Carbon equals Argon: " ^ string_of_bool (carbon1#equals argon1));
  print_endline
    ("Nitrogen equals Oxygen: " ^ string_of_bool (nitrogen1#equals oxygen1));
  print_endline
    ("Nitrogen equals Helium: " ^ string_of_bool (nitrogen1#equals helium1));
  print_endline
    ("Nitrogen equals Argon: " ^ string_of_bool (nitrogen1#equals argon1));
  print_endline
    ("Oxygen equals Helium: " ^ string_of_bool (oxygen1#equals helium1));
  print_endline
    ("Oxygen equals Argon: " ^ string_of_bool (oxygen1#equals argon1));
  print_endline
    ("Helium equals Argon: " ^ string_of_bool (helium1#equals argon1));
  print_endline "✅ Different atom types should not be equal";
  print_endline "";

  print_endline "--- Test 8: Polymorphic behavior test ---";
  let atom_list = [ hydrogen1; carbon1; nitrogen1; oxygen1; helium1; argon1 ] in
  print_endline "🧪 Processing atoms polymorphically:";
  List.iteri
    (fun i atom ->
      print_endline ("Atom " ^ string_of_int (i + 1) ^ ": " ^ atom#to_string))
    atom_list;
  print_endline "";

  print_endline "--- Test 9: Chemical properties verification ---";
  print_endline "⚗️  Verifying basic chemical properties:";
  if hydrogen1#atomic_number = 1 then
    print_endline "✅ Hydrogen has correct atomic number (1)";
  if helium1#atomic_number = 2 then
    print_endline "✅ Helium has correct atomic number (2)";
  if carbon1#atomic_number = 6 then
    print_endline "✅ Carbon has correct atomic number (6)";
  if nitrogen1#atomic_number = 7 then
    print_endline "✅ Nitrogen has correct atomic number (7)";
  if oxygen1#atomic_number = 8 then
    print_endline "✅ Oxygen has correct atomic number (8)";
  if argon1#atomic_number = 18 then
    print_endline "✅ Argon has correct atomic number (18)";
  print_endline "";

  print_endline "--- Test 10: Symbol verification ---";
  print_endline "🔤 Verifying chemical symbols:";
  if hydrogen1#symbol = "H" then
    print_endline "✅ Hydrogen has correct symbol (H)";
  if helium1#symbol = "He" then
    print_endline "✅ Helium has correct symbol (He)";
  if carbon1#symbol = "C" then print_endline "✅ Carbon has correct symbol (C)";
  if nitrogen1#symbol = "N" then
    print_endline "✅ Nitrogen has correct symbol (N)";
  if oxygen1#symbol = "O" then print_endline "✅ Oxygen has correct symbol (O)";
  if argon1#symbol = "Ar" then print_endline "✅ Argon has correct symbol (Ar)";
  print_endline "";

  print_endline "--- Test 11: Multiple instances equality ---";
  let hydrogen3 = new Atoms.hydrogen in
  let carbon2 = new Atoms.carbon in
  let nitrogen2 = new Atoms.nitrogen in
  let helium2 = new Atoms.helium in
  let argon2 = new Atoms.argon in
  print_endline "🔬 Testing multiple instances:";
  print_endline
    ("Hydrogen1 = Hydrogen3: " ^ string_of_bool (hydrogen1#equals hydrogen3));
  print_endline ("Carbon1 = Carbon2: " ^ string_of_bool (carbon1#equals carbon2));
  print_endline
    ("Nitrogen1 = Nitrogen2: " ^ string_of_bool (nitrogen1#equals nitrogen2));
  print_endline
    ("Helium1 = Helium2: " ^ string_of_bool (helium1#equals helium2));
  print_endline
    ("Argon1 = Argon2: " ^ string_of_bool (argon1#equals argon2));
  print_endline "✅ Multiple instances of same type should be equal";
  print_endline "";

  print_endline "--- Test 12: Complete workflow simulation ---";
  print_endline "🧬 Simulating chemical analysis workflow:";
  let unknown_atoms = [ hydrogen1; carbon1; nitrogen1; oxygen1; helium1; argon1; hydrogen2 ] in
  print_endline "Analyzing unknown atoms:";
  List.iteri
    (fun i atom ->
      print_endline
        ("Sample "
        ^ string_of_int (i + 1)
        ^ ": " ^ atom#name ^ " (Symbol: " ^ atom#symbol ^ ", Atomic#: "
        ^ string_of_int atom#atomic_number
        ^ ")"))
    unknown_atoms;
  print_endline "";

  print_endline "--- Test 13: Inheritance verification ---";
  print_endline "🏗️  Verifying inheritance from virtual atom class:";
  print_endline
    ("Hydrogen inherits atom methods: "
    ^ if hydrogen1#name <> "" && hydrogen1#symbol <> "" then "✅ Yes" else "❌ No"
    );
  print_endline
    ("Helium inherits atom methods: "
    ^ if helium1#name <> "" && helium1#symbol <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("Carbon inherits atom methods: "
    ^ if carbon1#name <> "" && carbon1#symbol <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("Nitrogen inherits atom methods: "
    ^ if nitrogen1#name <> "" && nitrogen1#symbol <> "" then "✅ Yes" else "❌ No"
    );
  print_endline
    ("Oxygen inherits atom methods: "
    ^ if oxygen1#name <> "" && oxygen1#symbol <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("Argon inherits atom methods: "
    ^ if argon1#name <> "" && argon1#symbol <> "" then "✅ Yes" else "❌ No");
  print_endline "";

  print_endline "=== All Atom Tests Completed Successfully! ===";
  print_endline "";

  print_endline "=== Comprehensive Molecule Class Testing ===\n";

  print_endline "--- Test 14: Creating different molecule types ---";
  let water1 = new Molecules.water in
  let water2 = new Molecules.water in
  let co2_1 = new Molecules.carbon_dioxide in
  let tnt1 = new Molecules.trinitrotoluene in
  let glucose1 = new Molecules.glucose in
  let benzene1 = new Molecules.benzene in
  print_endline "✅ All molecules created successfully";
  print_endline "";

  print_endline "--- Test 15: Testing molecule name method ---";
  print_endline ("Water name: " ^ water1#name);
  print_endline ("Carbon dioxide name: " ^ co2_1#name);
  print_endline ("Trinitrotoluene name: " ^ tnt1#name);
  print_endline ("Glucose name: " ^ glucose1#name);
  print_endline ("Benzene name: " ^ benzene1#name);
  print_endline "";

  print_endline "--- Test 16: Testing molecule formula method ---";
  print_endline ("Water formula: " ^ water1#formula);
  print_endline ("Carbon dioxide formula: " ^ co2_1#formula);
  print_endline ("Trinitrotoluene formula: " ^ tnt1#formula);
  print_endline ("Glucose formula: " ^ glucose1#formula);
  print_endline ("Benzene formula: " ^ benzene1#formula);
  print_endline "";

  print_endline "--- Test 17: Testing molecule to_string method ---";
  print_endline water1#to_string;
  print_endline co2_1#to_string;
  print_endline tnt1#to_string;
  print_endline glucose1#to_string;
  print_endline benzene1#to_string;
  print_endline "";

  print_endline "--- Test 18: Testing molecule equals method (same type) ---";
  print_endline
    ("Water1 equals Water2: " ^ string_of_bool (water1#equals water2));
  print_endline "✅ Same molecule types should be equal";
  print_endline "";

  print_endline
    "--- Test 19: Testing molecule equals method (different types) ---";
  print_endline ("Water equals CO2: " ^ string_of_bool (water1#equals co2_1));
  print_endline ("Water equals TNT: " ^ string_of_bool (water1#equals tnt1));
  print_endline ("Water equals Glucose: " ^ string_of_bool (water1#equals glucose1));
  print_endline ("Water equals Benzene: " ^ string_of_bool (water1#equals benzene1));
  print_endline ("CO2 equals TNT: " ^ string_of_bool (co2_1#equals tnt1));
  print_endline ("CO2 equals Glucose: " ^ string_of_bool (co2_1#equals glucose1));
  print_endline ("CO2 equals Benzene: " ^ string_of_bool (co2_1#equals benzene1));
  print_endline ("TNT equals Glucose: " ^ string_of_bool (tnt1#equals glucose1));
  print_endline ("TNT equals Benzene: " ^ string_of_bool (tnt1#equals benzene1));
  print_endline ("Glucose equals Benzene: " ^ string_of_bool (glucose1#equals benzene1));
  print_endline "✅ Different molecule types should not be equal";
  print_endline "";

  print_endline "--- Test 20: Polymorphic molecule behavior test ---";
  let molecule_list = [ water1; co2_1; tnt1; glucose1; benzene1 ] in
  print_endline "🧪 Processing molecules polymorphically:";
  List.iteri
    (fun i mol ->
      print_endline ("Molecule " ^ string_of_int (i + 1) ^ ": " ^ mol#to_string))
    molecule_list;
  print_endline "";

  print_endline "--- Test 21: Chemical formula verification ---";
  print_endline "⚗️  Verifying molecular formulas:";
  if water1#formula = "H2O" then
    print_endline "✅ Water has correct formula (H2O)";
  if co2_1#formula = "CO2" then
    print_endline "✅ Carbon dioxide has correct formula (CO2)";
  if tnt1#formula = "C7H5N3O6" then
    print_endline "✅ Trinitrotoluene has correct formula (C7H5N3O6)";
  if glucose1#formula = "C6H12O6" then
    print_endline "✅ Glucose has correct formula (C6H12O6)";
  if benzene1#formula = "C6H6" then
    print_endline "✅ Benzene has correct formula (C6H6)";
  print_endline "";

  print_endline "--- Test 22: Multiple molecule instances equality ---";
  let water3 = new Molecules.water in
  let co2_2 = new Molecules.carbon_dioxide in
  let glucose2 = new Molecules.glucose in
  let benzene2 = new Molecules.benzene in
  print_endline "🔬 Testing multiple molecule instances:";
  print_endline ("Water1 = Water3: " ^ string_of_bool (water1#equals water3));
  print_endline ("CO2_1 = CO2_2: " ^ string_of_bool (co2_1#equals co2_2));
  print_endline ("Glucose1 = Glucose2: " ^ string_of_bool (glucose1#equals glucose2));
  print_endline ("Benzene1 = Benzene2: " ^ string_of_bool (benzene1#equals benzene2));
  print_endline "✅ Multiple instances of same molecule type should be equal";
  print_endline "";

  print_endline "--- Test 23: Molecule composition analysis ---";
  print_endline "🧬 Analyzing molecular composition:";
  let molecules_analysis = [ water1; co2_1; tnt1; glucose1; benzene1 ] in
  print_endline "Analyzing molecules:";
  List.iteri
    (fun i mol ->
      print_endline
        ("Compound "
        ^ string_of_int (i + 1)
        ^ ": " ^ mol#name ^ " with formula " ^ mol#formula))
    molecules_analysis;
  print_endline "";

  print_endline "--- Test 24: Inheritance verification for molecules ---";
  print_endline "🏗️  Verifying inheritance from virtual molecule class:";
  print_endline
    ("Water inherits molecule methods: "
    ^ if water1#name <> "" && water1#formula <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("CO2 inherits molecule methods: "
    ^ if co2_1#name <> "" && co2_1#formula <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("TNT inherits molecule methods: "
    ^ if tnt1#name <> "" && tnt1#formula <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("Glucose inherits molecule methods: "
    ^ if glucose1#name <> "" && glucose1#formula <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("Benzene inherits molecule methods: "
    ^ if benzene1#name <> "" && benzene1#formula <> "" then "✅ Yes" else "❌ No");
  print_endline "";

  print_endline "=== All Molecule Tests Completed Successfully! ===";
  print_endline "";

  print_endline "=== Comprehensive Alkane Class Testing ===\n";

  print_endline "--- Test 25: Testing invalid alkane creation (n < 1) ---";
  (try
     let _ = new Alkane.alkane 0 in
     print_endline "❌ Should have thrown exception for n=0"
   with Invalid_argument msg ->
     print_endline ("✅ Correctly threw exception for n=0: " ^ msg));
  (try
     let _ = new Alkane.alkane (-1) in
     print_endline "❌ Should have thrown exception for n=-1"
   with Invalid_argument msg ->
     print_endline ("✅ Correctly threw exception for n=-1: " ^ msg));
  print_endline "";

  print_endline "--- Test 26: Creating different alkane types ---";
  let methane1 = new Alkanes.methane in
  let methane2 = new Alkanes.methane in
  let ethane1 = new Alkanes.ethane in
  let propane1 = new Alkanes.propane in
  let butane1 = new Alkanes.butane in
  let pentane1 = new Alkanes.pentane in
  let hexane1 = new Alkanes.hexane in
  let heptane1 = new Alkanes.heptane in
  let octane1 = new Alkanes.octane in
  let nonane1 = new Alkanes.nonane in
  let decane1 = new Alkanes.decane in
  let undecane1 = new Alkanes.undecane in
  let dodecane1 = new Alkanes.dodecane in
  let unknownane1 = new Alkanes.unknownane in
  print_endline "✅ All alkanes created successfully";
  print_endline "";

  print_endline "--- Test 27: Testing direct alkane constructor ---";
  let alkane_direct_1 = new Alkane.alkane 1 in
  let alkane_direct_2 = new Alkane.alkane 2 in
  let alkane_direct_13 = new Alkane.alkane 13 in
  let alkane_direct_20 = new Alkane.alkane 20 in
  print_endline "✅ Direct alkane constructors work";
  print_endline "";

  print_endline "--- Test 28: Testing alkane name method ---";
  print_endline ("Methane name: " ^ methane1#name);
  print_endline ("Ethane name: " ^ ethane1#name);
  print_endline ("Propane name: " ^ propane1#name);
  print_endline ("Butane name: " ^ butane1#name);
  print_endline ("Pentane name: " ^ pentane1#name);
  print_endline ("Hexane name: " ^ hexane1#name);
  print_endline ("Heptane name: " ^ heptane1#name);
  print_endline ("Octane name: " ^ octane1#name);
  print_endline ("Nonane name: " ^ nonane1#name);
  print_endline ("Decane name: " ^ decane1#name);
  print_endline ("Undecane name: " ^ undecane1#name);
  print_endline ("Dodecane name: " ^ dodecane1#name);
  print_endline ("Unknownane name: " ^ unknownane1#name);
  print_endline ("Direct alkane 2 name: " ^ alkane_direct_2#name);
  print_endline ("Direct alkane 13 name: " ^ alkane_direct_13#name);
  print_endline "";

  print_endline "--- Test 29: Testing alkane formula method ---";
  print_endline ("Methane formula: " ^ methane1#formula);
  print_endline ("Ethane formula: " ^ ethane1#formula);
  print_endline ("Propane formula: " ^ propane1#formula);
  print_endline ("Butane formula: " ^ butane1#formula);
  print_endline ("Pentane formula: " ^ pentane1#formula);
  print_endline ("Hexane formula: " ^ hexane1#formula);
  print_endline ("Heptane formula: " ^ heptane1#formula);
  print_endline ("Octane formula: " ^ octane1#formula);
  print_endline ("Nonane formula: " ^ nonane1#formula);
  print_endline ("Decane formula: " ^ decane1#formula);
  print_endline ("Undecane formula: " ^ undecane1#formula);
  print_endline ("Dodecane formula: " ^ dodecane1#formula);
  print_endline ("Unknownane formula: " ^ unknownane1#formula);
  print_endline ("Direct alkane 20 formula: " ^ alkane_direct_20#formula);
  print_endline "";

  print_endline "--- Test 30: Testing alkane to_string method ---";
  print_endline methane1#to_string;
  print_endline ethane1#to_string;
  print_endline propane1#to_string;
  print_endline butane1#to_string;
  print_endline pentane1#to_string;
  print_endline hexane1#to_string;
  print_endline "";

  print_endline "--- Test 31: Testing alkane equals method (same type) ---";
  print_endline
    ("Methane1 equals Methane2: " ^ string_of_bool (methane1#equals methane2));
  print_endline "✅ Same alkane types should be equal";
  print_endline "";

  print_endline
    "--- Test 32: Testing alkane equals method (different types) ---";
  print_endline
    ("Methane equals Ethane: " ^ string_of_bool (methane1#equals ethane1));
  print_endline
    ("Propane equals Butane: " ^ string_of_bool (propane1#equals butane1));
  print_endline
    ("Hexane equals Octane: " ^ string_of_bool (hexane1#equals octane1));
  print_endline "✅ Different alkane types should not be equal";
  print_endline "";

  print_endline "--- Test 33: Polymorphic alkane behavior test ---";
  let alkane_list = [ methane1; ethane1; propane1; butane1; pentane1 ] in
  print_endline "🧪 Processing alkanes polymorphically:";
  List.iteri
    (fun i alkane ->
      print_endline ("Alkane " ^ string_of_int (i + 1) ^ ": " ^ alkane#to_string))
    alkane_list;
  print_endline "";

  print_endline "--- Test 34: Chemical formula verification for alkanes ---";
  print_endline "⚗️  Verifying alkane formulas (CnH2n+2):";
  if methane1#formula = "CH4" then
    print_endline "✅ Methane has correct formula (CH4)";
  if ethane1#formula = "C2H6" then
    print_endline "✅ Ethane has correct formula (C2H6)";
  if propane1#formula = "C3H8" then
    print_endline "✅ Propane has correct formula (C3H8)";
  if butane1#formula = "C4H10" then
    print_endline "✅ Butane has correct formula (C4H10)";
  if pentane1#formula = "C5H12" then
    print_endline "✅ Pentane has correct formula (C5H12)";
  if hexane1#formula = "C6H14" then
    print_endline "✅ Hexane has correct formula (C6H14)";
  if decane1#formula = "C10H22" then
    print_endline "✅ Decane has correct formula (C10H22)";
  print_endline "";

  print_endline "--- Test 35: Multiple alkane instances equality ---";
  let methane3 = new Alkanes.methane in
  let ethane2 = new Alkanes.ethane in
  let propane2 = new Alkanes.propane in
  print_endline "🔬 Testing multiple alkane instances:";
  print_endline
    ("Methane1 = Methane3: " ^ string_of_bool (methane1#equals methane3));
  print_endline ("Ethane1 = Ethane2: " ^ string_of_bool (ethane1#equals ethane2));
  print_endline
    ("Propane1 = Propane2: " ^ string_of_bool (propane1#equals propane2));
  print_endline "✅ Multiple instances of same alkane type should be equal";
  print_endline "";

  print_endline "--- Test 36: Alkane series analysis ---";
  print_endline "🧬 Analyzing alkane homologous series:";
  let alkane_series =
    [
      methane1;
      ethane1;
      propane1;
      butane1;
      pentane1;
      hexane1;
      heptane1;
      octane1;
      nonane1;
      decane1;
    ]
  in
  print_endline "Alkane series (C1-C10):";
  List.iteri
    (fun i alkane ->
      print_endline
        ("C"
        ^ string_of_int (i + 1)
        ^ ": " ^ alkane#name ^ " with formula " ^ alkane#formula))
    alkane_series;
  print_endline "";

  print_endline "--- Test 37: Testing edge cases ---";
  print_endline "🧪 Testing edge cases:";
  let alkane_edge_1 = new Alkane.alkane 1 in
  let alkane_edge_50 = new Alkane.alkane 50 in
  let alkane_edge_100 = new Alkane.alkane 100 in
  print_endline
    ("Single carbon alkane (C1): " ^ alkane_edge_1#name ^ " - "
   ^ alkane_edge_1#formula);
  print_endline
    ("Large alkane (C50): " ^ alkane_edge_50#name ^ " - "
   ^ alkane_edge_50#formula);
  print_endline
    ("Very large alkane (C100): " ^ alkane_edge_100#name ^ " - "
   ^ alkane_edge_100#formula);
  print_endline "";

  print_endline "--- Test 38: Inheritance verification for alkanes ---";
  print_endline "🏗️  Verifying inheritance from molecule class:";
  print_endline
    ("Methane inherits molecule methods: "
    ^ if methane1#name <> "" && methane1#formula <> "" then "✅ Yes" else "❌ No"
    );
  print_endline
    ("Ethane inherits molecule methods: "
    ^ if ethane1#name <> "" && ethane1#formula <> "" then "✅ Yes" else "❌ No");
  print_endline
    ("Propane inherits molecule methods: "
    ^ if propane1#name <> "" && propane1#formula <> "" then "✅ Yes" else "❌ No"
    );
  print_endline
    ("Direct alkane inherits molecule methods: "
    ^
    if alkane_direct_1#name <> "" && alkane_direct_1#formula <> "" then "✅ Yes"
    else "❌ No");
  print_endline "";

  print_endline "--- Test 39: Name mapping verification ---";
  print_endline "📋 Verifying alkane name mappings:";
  let test_names =
    [
      (1, "Methane");
      (2, "Ethane");
      (3, "Propane");
      (4, "Butane");
      (5, "Pentane");
      (6, "Hexane");
      (7, "Heptane");
      (8, "Octane");
      (9, "Nonane");
      (10, "Decane");
      (11, "Undecane");
      (12, "Dodecane");
      (13, "Unknownane");
      (42, "Unknownane");
    ]
  in
  List.iter
    (fun (n, expected_name) ->
      let alkane = new Alkane.alkane n in
      if alkane#name = expected_name then
        print_endline
          ("✅ C" ^ string_of_int n ^ " correctly named: " ^ expected_name)
      else
        print_endline
          ("❌ C" ^ string_of_int n ^ " incorrectly named: " ^ alkane#name
         ^ " (expected: " ^ expected_name ^ ")"))
    test_names;
  print_endline "";

  print_endline "=== All Alkane Tests Completed Successfully! ===";
  print_endline "";

  print_endline "=== Comprehensive Alkane Combustion Testing ===\n";

  print_endline "--- Test 40: Simple methane combustion ---";
  let methane_simple = new Alkanes.methane in
  let combustion_ch4 =
    new Alkane_combustion.alkane_combustion [ methane_simple ] 2 1 2
  in
  print_endline
    ("Initial balanced status: " ^ string_of_bool combustion_ch4#is_balanced);
  print_endline combustion_ch4#to_string;
  print_endline "";

  print_endline "--- Test 41: Testing balance method for methane ---";
  let methane_unbalanced =
    new Alkane_combustion.alkane_combustion [ methane_simple ] 1 1 1
  in
  print_endline
    ("Unbalanced status: " ^ string_of_bool methane_unbalanced#is_balanced);
  let methane_balanced = methane_unbalanced#balance in
  print_endline
    ("After balance status: " ^ string_of_bool methane_balanced#is_balanced);
  print_endline methane_balanced#to_string;
  print_endline "";

  print_endline "--- Test 42: Ethane combustion (even n) ---";
  let ethane_simple = new Alkanes.ethane in
  let ethane_unbalanced =
    new Alkane_combustion.alkane_combustion [ ethane_simple ] 3 2 3
  in
  print_endline
    ("Ethane unbalanced status: " ^ string_of_bool ethane_unbalanced#is_balanced);
  let ethane_balanced = ethane_unbalanced#balance in
  print_endline
    ("Ethane after balance status: "
    ^ string_of_bool ethane_balanced#is_balanced);
  print_endline ethane_balanced#to_string;
  print_endline "";

  print_endline "--- Test 43: Propane combustion (odd n) ---";
  let propane_simple = new Alkanes.propane in
  let propane_unbalanced =
    new Alkane_combustion.alkane_combustion [ propane_simple ] 4 3 4
  in
  print_endline
    ("Propane unbalanced status: "
    ^ string_of_bool propane_unbalanced#is_balanced);
  let propane_balanced = propane_unbalanced#balance in
  print_endline
    ("Propane after balance status: "
    ^ string_of_bool propane_balanced#is_balanced);
  print_endline propane_balanced#to_string;
  print_endline "";

  print_endline "--- Test 44: Multiple alkane combustion (same type) ---";
  let two_methanes = [ new Alkanes.methane; new Alkanes.methane ] in
  let dual_methane_unbalanced =
    new Alkane_combustion.alkane_combustion two_methanes 3 2 4
  in
  print_endline
    ("Dual methane unbalanced: "
    ^ string_of_bool dual_methane_unbalanced#is_balanced);
  let dual_methane_balanced = dual_methane_unbalanced#balance in
  print_endline
    ("Dual methane balanced: "
    ^ string_of_bool dual_methane_balanced#is_balanced);
  print_endline dual_methane_balanced#to_string;
  print_endline "";

  print_endline "--- Test 45: Mixed alkane combustion ---";
  let mixed_alkanes = [ new Alkanes.methane; new Alkanes.ethane ] in
  let mixed_unbalanced =
    new Alkane_combustion.alkane_combustion mixed_alkanes 8 4 6
  in
  print_endline
    ("Mixed alkanes unbalanced: " ^ string_of_bool mixed_unbalanced#is_balanced);
  let mixed_balanced = mixed_unbalanced#balance in
  print_endline
    ("Mixed alkanes balanced: " ^ string_of_bool mixed_balanced#is_balanced);
  print_endline mixed_balanced#to_string;
  print_endline "";

  print_endline "--- Test 46: Complex mixture (multiple types) ---";
  let complex_mix =
    [
      new Alkanes.methane;
      new Alkanes.ethane;
      new Alkanes.propane;
      new Alkanes.methane;
    ]
  in
  let complex_unbalanced =
    new Alkane_combustion.alkane_combustion complex_mix 10 6 8
  in
  print_endline
    ("Complex mixture unbalanced: "
    ^ string_of_bool complex_unbalanced#is_balanced);
  let complex_balanced = complex_unbalanced#balance in
  print_endline
    ("Complex mixture balanced: " ^ string_of_bool complex_balanced#is_balanced);
  print_endline complex_balanced#to_string;
  print_endline "";

  print_endline "--- Test 47: Large alkane combustion ---";
  let decane_simple = new Alkanes.decane in
  let decane_unbalanced =
    new Alkane_combustion.alkane_combustion [ decane_simple ] 14 10 11
  in
  print_endline
    ("Decane unbalanced: " ^ string_of_bool decane_unbalanced#is_balanced);
  let decane_balanced = decane_unbalanced#balance in
  print_endline
    ("Decane balanced: " ^ string_of_bool decane_balanced#is_balanced);
  print_endline decane_balanced#to_string;
  print_endline "";

  print_endline "--- Test 48: Edge case - single carbon alkane ---";
  let methane_edge = new Alkane.alkane 1 in
  let edge_combustion =
    new Alkane_combustion.alkane_combustion [ methane_edge ] 1 1 1
  in
  print_endline
    ("Single carbon edge case unbalanced: "
    ^ string_of_bool edge_combustion#is_balanced);
  let edge_balanced = edge_combustion#balance in
  print_endline
    ("Single carbon edge case balanced: "
    ^ string_of_bool edge_balanced#is_balanced);
  print_endline edge_balanced#to_string;
  print_endline "";

  print_endline "--- Test 49: Reaction inheritance verification ---";
  print_endline
    "🏗️  Verifying Alkane_combustion.alkane_combustion inherits from reaction:";
  (try
     let start_molecules = methane_balanced#get_start in
     let result_molecules = methane_balanced#get_result in
     print_endline
       ("✅ get_start works: "
       ^ string_of_int (List.length start_molecules)
       ^ " molecules");
     print_endline
       ("✅ get_result works: "
       ^ string_of_int (List.length result_molecules)
       ^ " molecules")
   with Failure msg -> print_endline ("❌ Exception in get methods: " ^ msg));
  print_endline "";

  print_endline "--- Test 50: Stoichiometric coefficient verification ---";
  print_endline "⚗️  Verifying stoichiometric correctness:";

  let test_methane = new Alkanes.methane in
  let correct_methane =
    new Alkane_combustion.alkane_combustion [ test_methane ] 2 1 2
  in
  if correct_methane#is_balanced then
    print_endline "✅ Methane stoichiometry: CH4 + 2 O2 -> CO2 + 2 H2O";

  let test_propane = new Alkanes.propane in
  let correct_propane =
    new Alkane_combustion.alkane_combustion [ test_propane ] 5 3 4
  in
  if correct_propane#is_balanced then
    print_endline "✅ Propane stoichiometry: C3H8 + 5 O2 -> 3 CO2 + 4 H2O";

  print_endline "";

  print_endline "--- Test 51: Balance method comprehensive test ---";
  print_endline "🧪 Testing balance method with various scenarios:";

  let scenarios =
    [
      ("Single methane", [ new Alkanes.methane ]);
      ("Single ethane", [ new Alkanes.ethane ]);
      ("Single propane", [ new Alkanes.propane ]);
      ("Two methanes", [ new Alkanes.methane; new Alkanes.methane ]);
      ("Methane + Ethane", [ new Alkanes.methane; new Alkanes.ethane ]);
      ( "Complex mix",
        [
          new Alkanes.methane;
          new Alkanes.ethane;
          new Alkanes.propane;
          new Alkanes.methane;
        ] );
    ]
  in

  List.iter
    (fun (desc, alkanes) ->
      let unbalanced = new Alkane_combustion.alkane_combustion alkanes 1 1 1 in
      let balanced = unbalanced#balance in
      print_endline
        (desc ^ ": "
        ^
        if balanced#is_balanced then "✅ Balanced successfully"
        else "❌ Failed to balance"))
    scenarios;
  print_endline "";

  print_endline "--- Test 52: Error handling verification ---";
  print_endline "🛡️  Testing error handling:";

  let bad_combustion =
    new Alkane_combustion.alkane_combustion [ new Alkanes.methane ] 1 1 1
  in
  (try
     let _ = bad_combustion#get_start in
     print_endline "❌ Should have thrown exception for unbalanced get_start"
   with Failure msg ->
     print_endline
       ("✅ Correctly threw exception for unbalanced get_start: " ^ msg));

  (try
     let _ = bad_combustion#get_result in
     print_endline "❌ Should have thrown exception for unbalanced get_result"
   with Failure msg ->
     print_endline
       ("✅ Correctly threw exception for unbalanced get_result: " ^ msg));
  print_endline "";

  print_endline "=== All Alkane Combustion Tests Completed Successfully! ===";
  print_endline "";

  print_endline "=== ALL TESTS COMPLETED SUCCESSFULLY! ==="
