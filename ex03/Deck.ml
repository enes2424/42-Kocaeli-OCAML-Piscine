module Card = struct
  module Color = struct
    type t = Spade | Heart | Diamond | Club

    let all = [Spade; Heart; Diamond; Club]

    let toString color =
      match color with
      | Spade -> "S"
      | Heart -> "H"
      | Diamond -> "D"
      | Club -> "C"

    let toStringVerbose color =
      match color with
      | Spade -> "Spade"
      | Heart -> "Heart"
      | Diamond -> "Diamond"
      | Club -> "Club"
  end

  module Value = struct
    type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

    let all = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]

    let toInt value =
      match value with
      | T2 -> 1
      | T3 -> 2
      | T4 -> 3
      | T5 -> 4
      | T6 -> 5
      | T7 -> 6
      | T8 -> 7
      | T9 -> 8
      | T10 -> 9
      | Jack -> 10
      | Queen -> 11
      | King -> 12
      | As  -> 13

    let toString value =
      match value with
      | T2 -> "2"
      | T3 -> "3"
      | T4 -> "4"
      | T5 -> "5"
      | T6 -> "6"
      | T7 -> "7"
      | T8 -> "8"
      | T9 -> "9"
      | T10 -> "10"
      | Jack -> "J"
      | Queen -> "Q"
      | King -> "K"
      | As  -> "A"

    let toStringVerbose value =
      match value with
      | T2 -> "2"
      | T3 -> "3"
      | T4 -> "4"
      | T5 -> "5"
      | T6 -> "6"
      | T7 -> "7"
      | T8 -> "8"
      | T9 -> "9"
      | T10 -> "10"
      | Jack -> "Jack"
      | Queen -> "Queen"
      | King -> "King"
      | As  -> "As"

    let next value =
      match value with
      | T2 -> T3
      | T3 -> T4
      | T4 -> T5
      | T5 -> T6
      | T6 -> T7
      | T7 -> T8
      | T8 -> T9
      | T9 -> T10
      | T10 -> Jack
      | Jack -> Queen
      | Queen -> King
      | King -> As
      | As -> invalid_arg "As has no next value"

    let previous value =
      match value with
      | T2 -> invalid_arg "T2 has no previous value"
      | T3 -> T2
      | T4 -> T3
      | T5 -> T4
      | T6 -> T5
      | T7 -> T6
      | T8 -> T7
      | T9 -> T8
      | T10 -> T9
      | Jack -> T10
      | Queen -> Jack
      | King -> Queen
      | As  -> King
  end

  type t = {
    color : Color.t;
    value : Value.t;
  }

  let newCard value color = {value = value; color = color}

  let allSpades = List.map (fun value -> newCard value Spade) Value.all
  let allHearts = List.map (fun value -> newCard value Heart) Value.all
  let allDiamonds = List.map (fun value -> newCard value Diamond) Value.all
  let allClubs = List.map (fun value -> newCard value Club) Value.all
  let all = allSpades @ allHearts @ allDiamonds @ allClubs

  let getValue card = card.value
  let getColor card = card.color

  let toString card = (Value.toString card.value) ^ (Color.toString card.color)
  let toStringVerbose card = Printf.sprintf "Card(%s, %s)" (Value.toStringVerbose card.value) (Color.toStringVerbose card.color)

  let compare card1 card2 = Value.toInt card1.value - Value.toInt card2.value
  let max card1 card2 =
    if compare card1 card2 >= 0 then
      card1
    else
      card2
  let min card1 card2 =
    if compare card1 card2 <= 0 then
      card1
    else
      card2
  let best list =
    match list with
    | [] -> invalid_arg "Empty list"
    | head :: tail -> List.fold_left max head tail

  let isOf card color = card.color = color
  let isSpade card = isOf card Spade
  let isHeart card = isOf card Heart
  let isDiamond card = isOf card Diamond
  let isClub card = isOf card Club
end

type t = Card.t list

let newDeck () = 
  let rec aux card_list deck count =
    match card_list with
    | [] -> deck
    | _ -> 
      let target_index = Random.int count in
      let rec remove_at lst idx target new_lst result_deck =
        match lst with
        | [] -> (new_lst, result_deck)
        | head :: tail ->
          if idx = target then
            (tail @ new_lst, head :: result_deck)
          else
            remove_at tail (idx + 1) target (head :: new_lst) result_deck
      in let (new_card_list, new_deck) = remove_at card_list 0 target_index [] deck
      in aux new_card_list new_deck (count - 1)
  in aux Card.all [] (List.length Card.all)

let rec toStringList deck =
  match deck with
  | [] -> []
  | head :: tail ->
    Card.toString head :: toStringList tail 

let rec toStringListVerbose deck =
  match deck with
  | [] -> []
  | head :: tail ->
    Card.toStringVerbose head :: toStringListVerbose tail 

let drawCard deck = 
  match deck with
  | [] -> raise (Failure "Deck is empty")
  | head :: tail -> (head, tail)