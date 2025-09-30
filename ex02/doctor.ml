class doctor ?(hp = 100) name age (sidekick : People.people) =
  object (self)
    initializer print_endline ("A new doctor named " ^ name ^ " has been created !")

    method to_string =
      "name : " ^ name ^ ", age : " ^ string_of_int age ^ ", hp : "
      ^ string_of_int hp ^ ", sidekick : (" ^ sidekick#to_string ^ ")"

    method talk = print_endline "Hi! I'm the Doctor!"

    method travel_in_time start arrival =
      let time_diff = arrival - start in
      let new_age = age + time_diff in

      print_endline "\n*TARDIS materializing*";
      print_endline "    _______________";
      print_endline "   |  ___________  |";
      print_endline "   | |           | |";
      print_endline "   | |   POLICE  | |";
      print_endline "   | |    BOX    | |";
      print_endline "   | |           | |";
      print_endline "   | |    ___    | |";
      print_endline "   | |   |___|   | |";
      print_endline "   | |___________| |";
      print_endline "   |_______________|";
      print_endline "   |_______________|";
      print_endline "";
      print_endline
        ("Traveling from year " ^ string_of_int start ^ " to year "
       ^ string_of_int arrival ^ "...");
      print_endline ("Time difference: " ^ string_of_int time_diff ^ " years");
      print_endline
        ("Doctor's age would change from " ^ string_of_int age ^ " to "
       ^ string_of_int new_age);
      print_endline "*VWORP VWORP VWORP*\n";
      new doctor name new_age sidekick

    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"

    method private regenerate = new doctor name age sidekick

    method test_regenerate : doctor = 
      print_endline "🔄 Testing regeneration process...";
      print_endline "⚡ *Golden energy swirls around the Doctor*";
      print_endline "✨ *The Doctor's cells begin to regenerate*";
      let regenerated_doctor = self#regenerate in
      print_endline "🎉 Regeneration complete! Doctor is renewed.";
      regenerated_doctor
  end
