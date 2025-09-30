let () =
  print_endline "=== Color Module ===";
  let rec test_colors list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_endline ("  " ^ (Deck.Card.Color.toString head) ^ " -> " ^ (Deck.Card.Color.toStringVerbose head));
      test_colors tail
  in test_colors Deck.Card.Color.all;
  print_endline "----------------------------------------------------";
  print_endline "=== Value Module ===";
  let rec test_values list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_string ("  ");
      print_int (Deck.Card.Value.toInt head);
      print_endline (" -> \"" ^ (Deck.Card.Value.toString head) ^ "\" -> \"" ^ (Deck.Card.Value.toStringVerbose head) ^ "\"");
      test_values tail
  in test_values Deck.Card.Value.all;
  print_endline "----------------------------------------------------";
  print_endline "next:";
  let rec test_next value =
    print_string ("  ");
    print_int (Deck.Card.Value.toInt value);
    print_endline (" -> \"" ^ (Deck.Card.Value.toString value) ^ "\" -> \"" ^ (Deck.Card.Value.toStringVerbose value) ^ "\"");
    test_next (Deck.Card.Value.next value)
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
    print_int (Deck.Card.Value.toInt value);
    print_endline (" -> \"" ^ (Deck.Card.Value.toString value) ^ "\" -> \"" ^ (Deck.Card.Value.toStringVerbose value) ^ "\"");
    test_previous (Deck.Card.Value.previous value)
  in try
    test_previous As
  with
  | Invalid_argument msg ->
      print_endline ("  Invalid_argument: " ^ msg);
  ;
  print_endline "----------------------------------------------------";
  print_endline "=== Card Module ===";
  let card1 = Deck.Card.newCard T2 Spade in
  let card2 = Deck.Card.newCard As Heart in
  let card3 = Deck.Card.newCard Jack Diamond in
  let card4 = Deck.Card.newCard Queen Club in
  print_endline "newCard:";
  print_endline ("  Card 1: " ^ (Deck.Card.toString card1) ^ " -> " ^ (Deck.Card.toStringVerbose card1));
  print_endline ("  Card 2: " ^ (Deck.Card.toString card2) ^ " -> " ^ (Deck.Card.toStringVerbose card2));
  print_endline ("  Card 3: " ^ (Deck.Card.toString card3) ^ " -> " ^ (Deck.Card.toStringVerbose card3));
  print_endline ("  Card 4: " ^ (Deck.Card.toString card4) ^ " -> " ^ (Deck.Card.toStringVerbose card4));
  print_endline "----------------------------------------------------";
  print_endline "getValue and getColor:";
  print_endline ("  getValue card1: " ^ (Deck.Card.Value.toStringVerbose (Deck.Card.getValue card1)));
  print_endline ("  getColor card1: " ^ (Deck.Card.Color.toStringVerbose (Deck.Card.getColor card1)));
  print_endline ("  getValue card2: " ^ (Deck.Card.Value.toStringVerbose (Deck.Card.getValue card2)));
  print_endline ("  getColor card2: " ^ (Deck.Card.Color.toStringVerbose (Deck.Card.getColor card2)));
  print_endline "----------------------------------------------------";
  print_endline "compare:";
  print_string ("  compare card1 card2: ");
  print_int (Deck.Card.compare card1 card2);
  print_endline "";
  print_string ("  compare card2 card1: ");
  print_int (Deck.Card.compare card2 card1);
  print_endline "";
  print_string ("  compare card1 card1: ");
  print_int (Deck.Card.compare card1 card1);
  print_endline "";
  print_endline "----------------------------------------------------";
  print_endline "max and min:";
  let max_card = Deck.Card.max card1 card2 in
  let min_card = Deck.Card.min card1 card2 in
  print_endline ("  max card1 card2: " ^ (Deck.Card.toStringVerbose max_card));
  print_endline ("  min card1 card2: " ^ (Deck.Card.toStringVerbose min_card));
  print_endline "----------------------------------------------------";
  print_endline "best:";
  let test_cards = [card1; card2; card3; card4] in
  let best_card = Deck.Card.best test_cards in
  print_endline ("  best [card1; card2; card3; card4]: " ^ (Deck.Card.toStringVerbose best_card));
  print_endline "----------------------------------------------------";
  print_endline "best with empty list:";
  try
    let _ = Deck.Card.best [] in
    ()
  with
  | Invalid_argument msg ->
      print_endline ("  Invalid_argument: " ^ msg);
  ;
  print_endline "----------------------------------------------------";
  print_endline "isOf and color checking functions:";
  print_endline ("  isOf card1 Spade: " ^ (string_of_bool (Deck.Card.isOf card1 Spade)));
  print_endline ("  isOf card1 Heart: " ^ (string_of_bool (Deck.Card.isOf card1 Heart)));
  print_endline ("  isOf card2 Heart: " ^ (string_of_bool (Deck.Card.isOf card2 Heart)));
  print_endline ("  isOf card2 Spade: " ^ (string_of_bool (Deck.Card.isOf card2 Spade)));
  print_endline ("  isSpade card1: " ^ (string_of_bool (Deck.Card.isSpade card1)));
  print_endline ("  isSpade card2: " ^ (string_of_bool (Deck.Card.isSpade card2)));
  print_endline ("  isHeart card1: " ^ (string_of_bool (Deck.Card.isHeart card1)));
  print_endline ("  isHeart card2: " ^ (string_of_bool (Deck.Card.isHeart card2)));
  print_endline ("  isDiamond card3: " ^ (string_of_bool (Deck.Card.isDiamond card3)));
  print_endline ("  isDiamond card4: " ^ (string_of_bool (Deck.Card.isDiamond card4)));
  print_endline ("  isClub card3: " ^ (string_of_bool (Deck.Card.isClub card3)));
  print_endline ("  isClub card4: " ^ (string_of_bool (Deck.Card.isClub card4)));
  print_endline "----------------------------------------------------";
  print_endline "allSpades contents:";
  let rec print_cards list =
    match list with
    | [] -> ()
    | head :: tail ->
      print_endline ("  " ^ (Deck.Card.toString head));
      print_cards tail
  in print_cards Deck.Card.allSpades;
  print_endline "----------------------------------------------------";
  print_endline "allHearts contents:";
  print_cards Deck.Card.allHearts;
  print_endline "----------------------------------------------------";
  print_endline "allDiamonds contents:";
  print_cards Deck.Card.allDiamonds;
  print_endline "----------------------------------------------------";
  print_endline "allClubs contents:";
  print_cards Deck.Card.allClubs;
  print_endline "----------------------------------------------------";
  print_endline "List lengths:";
  print_string ("  allSpades: ");
  print_int (List.length Deck.Card.allSpades);
  print_endline " cards";
  print_string ("  allHearts: ");
  print_int (List.length Deck.Card.allHearts);
  print_endline " cards";
  print_string ("  allDiamonds: ");
  print_int (List.length Deck.Card.allDiamonds);
  print_endline " cards";
  print_string ("  allClubs: ");
  print_int (List.length Deck.Card.allClubs);
  print_endline " cards";
  print_string ("  all: ");
  print_int (List.length Deck.Card.all);
  print_endline " total cards";

  print_endline "----------------------------------------------------";
  print_endline "=== Deck Module ===";
  print_endline "newDeck:";
  let deck1 = Deck.newDeck () in
  let deck2 = Deck.newDeck () in
  print_string ("  Deck 1 size: ");
  print_int (List.length (Deck.toStringList deck1));
  print_endline " cards";
  print_string ("  Deck 2 size: ");
  print_int (List.length (Deck.toStringList deck2));
  print_endline " cards";
  print_endline ("  All cards of Deck 1: ");
  let rec print_all_cards list =
    match list with
    | [] -> ()
    | head :: tail -> 
      print_string ("    " ^ head ^ " ");
      print_all_cards tail
  in 
  print_all_cards (Deck.toStringList deck1);
  print_endline "";
  print_endline ("  All cards of Deck 2: ");
  print_all_cards (Deck.toStringList deck2);
  print_endline "";
  print_endline "----------------------------------------------------";
  print_endline "toStringList vs toStringListVerbose:";
  let small_deck = Deck.newDeck () in
  let string_list = Deck.toStringList small_deck in
  let verbose_list = Deck.toStringListVerbose small_deck in
  print_endline ("  All cards (short format): ");
  print_all_cards string_list;
  print_endline "";
  print_endline ("  All cards (verbose format): ");
  let rec print_all_cards_verbose list =
    match list with
    | [] -> ()
    | head :: tail -> 
      print_endline ("    " ^ head);
      print_all_cards_verbose tail
  in 
  print_all_cards_verbose verbose_list;
  print_endline "----------------------------------------------------";
  print_endline "drawCard:";
  let test_deck = Deck.newDeck () in
  let (first_card, remaining_deck) = Deck.drawCard test_deck in
  print_endline ("  Drew card: " ^ (Deck.Card.toString first_card));
  print_string ("  Remaining deck size: ");
  print_int (List.length (Deck.toStringList remaining_deck));
  print_endline " cards";
  let (second_card, remaining_deck2) = Deck.drawCard remaining_deck in
  print_endline ("  Drew another card: " ^ (Deck.Card.toString second_card));
  print_string ("  Remaining deck size: ");
  print_int (List.length (Deck.toStringList remaining_deck2));
  print_endline " cards";
  print_endline "----------------------------------------------------";
  print_endline "drawCard from empty deck:";
  let test_deck = Deck.newDeck () in
  let rec empty_the_deck deck =
    try
      let (_, remaining) = Deck.drawCard deck in
      empty_the_deck remaining
    with
    | Failure msg ->
      print_endline ("  Caught Failure: " ^ msg);
  in empty_the_deck test_deck
