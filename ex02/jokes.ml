let jokes = [|
  "Why don't scientists trust atoms? Because they make up everything!";
  "I told my wife she was drawing her eyebrows too high. She looked surprised.";
  "Why don't eggs tell jokes? They'd crack each other up!";
  "What do you call a fish wearing a crown? A king fish!";
  "Why did the scarecrow win an award? He was outstanding in his field!";
  "What do you call a bear with no teeth? A gummy bear!";
|]

let () =
  Random.self_init ();
  print_endline jokes.(Random.int 6)
