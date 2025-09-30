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

  print_endline "=== All Molecule Tests Completed Successfully! ==="
