let my_sleep () = Unix.sleep 1

let () =
  let args = Sys.argv in
  let argc = Array.length args in
  if (argc = 2) then
    try
      let seconds = int_of_string args.(1) in
      if seconds > 0 then
        for i = 1 to seconds do
          my_sleep ()
        done
    with
    | _ -> ()
  else
    ()