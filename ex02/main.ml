let () =
  print_endline "=== Color Module ===";
  let rec test_colors list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_endline ("  " ^ (Card.Color.toString head) ^ " -> " ^ (Card.Color.toStringVerbose head));
      test_colors tail
  in test_colors Card.Color.all;
  print_endline "----------------------------------------------------";
  print_endline "=== Value Module ===";
  let rec test_values list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_string ("  ");
      print_int (Card.Value.toInt head);
      print_endline (" -> \"" ^ (Card.Value.toString head) ^ "\" -> \"" ^ (Card.Value.toStringVerbose head) ^ "\"");
      test_values tail
  in test_values Card.Value.all;
  print_endline "----------------------------------------------------";
  print_endline "next:";
  let rec test_next value =
    print_string ("  ");
    print_int (Card.Value.toInt value);
    print_endline (" -> \"" ^ (Card.Value.toString value) ^ "\" -> \"" ^ (Card.Value.toStringVerbose value) ^ "\"");
    test_next (Card.Value.next value)
  in try
    test_next T2
  with
  | Invalid_argument msg ->
      print_endline ("  Invalid_argument: " ^ msg);
  ;
  print_endline "----------------------------------------------------";
  print_endline "previous:";
  let rec test_previous value =
    print_string ("  ");
    print_int (Card.Value.toInt value);
    print_endline (" -> \"" ^ (Card.Value.toString value) ^ "\" -> \"" ^ (Card.Value.toStringVerbose value) ^ "\"");
    test_previous (Card.Value.previous value)
  in try
    test_previous As
  with
  | Invalid_argument msg ->
      print_endline ("  Invalid_argument: " ^ msg);
  ;
  print_endline "----------------------------------------------------";
  print_endline "=== Card Module ===";
  let card1 = Card.newCard T2 Spade in
  let card2 = Card.newCard As Heart in
  let card3 = Card.newCard Jack Diamond in
  let card4 = Card.newCard Queen Club in
  print_endline "newCard:";
  print_endline ("  Card 1: " ^ (Card.toString card1) ^ " -> " ^ (Card.toStringVerbose card1));
  print_endline ("  Card 2: " ^ (Card.toString card2) ^ " -> " ^ (Card.toStringVerbose card2));
  print_endline ("  Card 3: " ^ (Card.toString card3) ^ " -> " ^ (Card.toStringVerbose card3));
  print_endline ("  Card 4: " ^ (Card.toString card4) ^ " -> " ^ (Card.toStringVerbose card4));
  print_endline "----------------------------------------------------";
  print_endline "getValue and getColor:";
  print_endline ("  getValue card1: " ^ (Card.Value.toStringVerbose (Card.getValue card1)));
  print_endline ("  getColor card1: " ^ (Card.Color.toStringVerbose (Card.getColor card1)));
  print_endline ("  getValue card2: " ^ (Card.Value.toStringVerbose (Card.getValue card2)));
  print_endline ("  getColor card2: " ^ (Card.Color.toStringVerbose (Card.getColor card2)));
  print_endline "----------------------------------------------------";
  print_endline "compare:";
  print_string ("  compare card1 card2: ");
  print_int (Card.compare card1 card2);
  print_endline "";
  print_string ("  compare card2 card1: ");
  print_int (Card.compare card2 card1);
  print_endline "";
  print_string ("  compare card1 card1: ");
  print_int (Card.compare card1 card1);
  print_endline "";
  print_endline "----------------------------------------------------";
  print_endline "max and min:";
  let max_card = Card.max card1 card2 in
  let min_card = Card.min card1 card2 in
  print_endline ("  max card1 card2: " ^ (Card.toStringVerbose max_card));
  print_endline ("  min card1 card2: " ^ (Card.toStringVerbose min_card));
  print_endline "----------------------------------------------------";
  print_endline "best:";
  let test_cards = [card1; card2; card3; card4] in
  let best_card = Card.best test_cards in
  print_endline ("  best [card1; card2; card3; card4]: " ^ (Card.toStringVerbose best_card));
  print_endline "----------------------------------------------------";
  print_endline "best with empty list:";
  try
    let _ = Card.best [] in
    ()
  with
  | Invalid_argument msg ->
      print_endline ("  Invalid_argument: " ^ msg);
  ;
  print_endline "----------------------------------------------------";
  print_endline "isOf and color checking functions:";
  print_endline ("  isOf card1 Spade: " ^ (string_of_bool (Card.isOf card1 Spade)));
  print_endline ("  isOf card1 Heart: " ^ (string_of_bool (Card.isOf card1 Heart)));
  print_endline ("  isOf card2 Heart: " ^ (string_of_bool (Card.isOf card2 Heart)));
  print_endline ("  isOf card2 Spade: " ^ (string_of_bool (Card.isOf card2 Spade)));
  print_endline ("  isSpade card1: " ^ (string_of_bool (Card.isSpade card1)));
  print_endline ("  isSpade card2: " ^ (string_of_bool (Card.isSpade card2)));
  print_endline ("  isHeart card1: " ^ (string_of_bool (Card.isHeart card1)));
  print_endline ("  isHeart card2: " ^ (string_of_bool (Card.isHeart card2)));
  print_endline ("  isDiamond card3: " ^ (string_of_bool (Card.isDiamond card3)));
  print_endline ("  isDiamond card4: " ^ (string_of_bool (Card.isDiamond card4)));
  print_endline ("  isClub card3: " ^ (string_of_bool (Card.isClub card3)));
  print_endline ("  isClub card4: " ^ (string_of_bool (Card.isClub card4)));
  print_endline "----------------------------------------------------";
  print_endline "allSpades contents:";
  let rec print_cards list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_endline ("  " ^ (Card.toString head));
      print_cards tail
  in print_cards Card.allSpades;
  print_endline "----------------------------------------------------";
  print_endline "allHearts contents:";
  print_cards Card.allHearts;
  print_endline "----------------------------------------------------";
  print_endline "allDiamonds contents:";
  print_cards Card.allDiamonds;
  print_endline "----------------------------------------------------";
  print_endline "allClubs contents:";
  print_cards Card.allClubs;
  print_endline "----------------------------------------------------";
  print_endline "List lengths:";
  print_string ("  allSpades: ");
  print_int (List.length Card.allSpades);
  print_endline " cards";
  print_string ("  allHearts: ");
  print_int (List.length Card.allHearts);
  print_endline " cards";
  print_string ("  allDiamonds: ");
  print_int (List.length Card.allDiamonds);
  print_endline " cards";
  print_string ("  allClubs: ");
  print_int (List.length Card.allClubs);
  print_endline " cards";
  print_string ("  all: ");
  print_int (List.length Card.all);
  print_endline " total cards";
