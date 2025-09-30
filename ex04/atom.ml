class virtual atom (name : string) (symbol : string) (atomic_number : int) =
  object
    method name = name
    method symbol = symbol
    method atomic_number = atomic_number

    method to_string =
      "Atom(name: " ^ name ^ ", symbol: " ^ symbol ^ ", atomic_number: "
      ^ string_of_int atomic_number
      ^ ")"

    method equals (other : atom) =
      name = other#name && symbol = other#symbol
      && atomic_number = other#atomic_number
  end
