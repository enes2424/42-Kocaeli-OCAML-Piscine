let () =
    print_endline "=== Testing People Class ===\n";

  print_endline "--- Test 1: Creating people (initializer test) ---";
  let person1 = new People.people "Doctor Who" in
  let person2 = new People.people "Rose Tyler" in
  let person3 = new People.people "Martha Jones" in
  print_endline "";

  print_endline "--- Test 2: to_string method ---";
  print_endline person1#to_string;
  print_endline person2#to_string;
  print_endline person3#to_string;
  print_endline "";

  print_endline "--- Test 3: talk method ---";
  person1#talk;
  person2#talk;
  person3#talk;
  print_endline "";

  print_endline "--- Test 4: die method ---";
  let dead_person1 = person1#die in
  let dead_person2 = person2#die in
  let dead_person3 = person3#die in
  print_endline "";

  print_endline ("Death: " ^ dead_person1#to_string);
  print_endline ("Death: " ^ dead_person2#to_string);
  print_endline ("Death: " ^ dead_person3#to_string);
  print_endline "";

  print_endline "--- Test 5: Complete workflow ---";
  let person4 = new People.people "Captain Jack" in
  print_endline ("Created: " ^ person4#to_string);
  person4#talk;
  let dead_person4 = person4#die in
  print_endline "";

  print_endline ("Death: " ^ dead_person4#to_string);

  print_endline "=== Testing Doctor Class ===\n";

  print_endline
    "--- Test 1: Creating sidekick and doctor (initializer test) ---";
  let sidekick = new People.people "Rose Tyler" in
  let doctor = new Doctor.doctor "Dr. James Watson" 45 sidekick in
  print_endline "";

  print_endline "--- Test 2: to_string method ---";
  print_endline doctor#to_string;
  print_endline "";

  print_endline "--- Test 3: talk method ---";
  doctor#talk;
  print_endline "";

  print_endline "--- Test 4: use_sonic_screwdriver method ---";
  doctor#use_sonic_screwdriver;
  print_endline "";

  print_endline "--- Test 5: travel_in_time method ---";
  let time_traveled_doctor = doctor#travel_in_time 2020 2023 in
  print_endline ("Original doctor age: " ^ string_of_int 45);
  print_endline ("Doctor after travel: " ^ time_traveled_doctor#to_string);
  print_endline "";

  print_endline "--- Test 6: Multiple time travels ---";

  let second_time_traveled_doctor =
    time_traveled_doctor#travel_in_time 2023 1990
  in
  print_endline
    ("Doctor after second travel: " ^ second_time_traveled_doctor#to_string);
  print_endline "";

  print_endline "--- Test 7: Complete workflow with different sidekick ---";
  let martha = new People.people "Martha Jones" in
  let young_doctor = new Doctor.doctor "Dr. Sarah Chen" 35 martha in
  print_endline ("Created: " ^ young_doctor#to_string);
  young_doctor#talk;
  young_doctor#use_sonic_screwdriver;
  let time_traveled_young_doctor = young_doctor#travel_in_time 1969 2010 in
  print_endline ("After time travel: " ^ time_traveled_young_doctor#to_string);
  print_endline "";

  print_endline
    "--- Test 8: PRIVATE regenerate method (wounded doctor scenario) ---";
  print_endline "🩹 Creating a wounded doctor for realistic regeneration test...";
  let amy = new People.people "Amy Pond" in
  let wounded_doctor = new Doctor.doctor "Dr. Michael Stone" ~hp:15 38 amy in
  print_endline ("💔 Wounded doctor: " ^ wounded_doctor#to_string);
  print_endline "";

  print_endline "🧬 Testing regeneration of wounded doctor...";
  let regenerated_doctor = wounded_doctor#test_regenerate in
  print_endline "";
  print_endline "📊 Comparing wounded vs regenerated:";
  print_endline ("Wounded doctor:      " ^ wounded_doctor#to_string);
  print_endline ("Regenerated doctor:  " ^ regenerated_doctor#to_string);
  print_endline "";

  print_endline "=== EPIC BATTLE SIMULATION ===\n";
  print_endline "🚨 ALERT: Dalek threat detected! Initiating battle protocol...";
  print_endline "";

  print_endline "--- Battle Setup: Doctor vs Dalek vs Human ---";
  let clara = new People.people "Clara Oswald" in
  let battle_doctor = new Doctor.doctor "Dr. Tom Baker" ~hp:85 40 clara in
  let dalek_enemy = new Dalek.dalek "Battle Command" in
  let human_soldier = new People.people "Mickey Smith" in
  
  print_endline "⚔️  BATTLE PARTICIPANTS:";
  print_endline ("🩺 Doctor: " ^ battle_doctor#to_string);
  print_endline ("🤖 Dalek:  " ^ dalek_enemy#to_string);
  print_endline ("👤 Human:  " ^ human_soldier#to_string);
  print_endline "";

  print_endline "--- Round 1: Initial Confrontation ---";
  print_endline "🎬 The Doctor encounters the Dalek...";
  battle_doctor#talk;
  dalek_enemy#talk;
  human_soldier#talk;
  print_endline "";

  print_endline "--- Round 2: Sonic Screwdriver vs Dalek Shield ---";
  print_endline "🔧 Doctor uses sonic screwdriver...";
  battle_doctor#use_sonic_screwdriver;
  print_endline "🛡️  Dalek shield status: activated";
  dalek_enemy#talk;
  print_endline "";

  print_endline "--- Round 3: Dalek Attack on Human ---";
  print_endline "💥 Dalek targets the human...";
  dalek_enemy#talk;
  let dead_human = dalek_enemy#exterminate human_soldier in
  print_endline ("💀 Human status: " ^ dead_human#to_string);
  print_endline "";

  print_endline "--- Round 4: Doctor's Response ---";
  print_endline "😠 Doctor is enraged by human death...";
  battle_doctor#talk;
  print_endline "🔄 Doctor considers regeneration strategy...";
  let battle_regen_doctor = battle_doctor#test_regenerate in
  print_endline ("⚡ Regenerated Doctor: " ^ battle_regen_doctor#to_string);
  print_endline "";

  print_endline "--- Round 5: Final Confrontation ---";
  print_endline "🎯 Final battle between Doctor and Dalek...";
  battle_regen_doctor#talk;
  battle_regen_doctor#use_sonic_screwdriver;
  dalek_enemy#talk;
  print_endline "💨 Dalek initiates emergency temporal shift...";
  let escaping_dalek = dalek_enemy#die in
  print_endline ("🌀 Dalek escape status: " ^ escaping_dalek#to_string);
  print_endline "";

  print_endline "--- Battle Results ---";
  print_endline "📊 BATTLE SUMMARY:";
  print_endline ("🩺 Doctor (Final): " ^ battle_regen_doctor#to_string);
  print_endline ("👤 Human (Final):  " ^ dead_human#to_string);
  print_endline ("🤖 Dalek (Final):  " ^ escaping_dalek#to_string);
  print_endline "";
  print_endline "🏆 Battle Outcome: Doctor survives, Human casualty, Dalek escapes";
  print_endline "💭 'I'm sorry... I'm so sorry...' - The Doctor";
  print_endline "";

  print_endline "=== All tests (including epic battle) completed successfully! ==="
