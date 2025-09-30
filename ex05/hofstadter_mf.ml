let rec hfs_f num =
  if num < 0 then
    -1
  else if num = 0 then
    1
  else
    num - hfs_m (hfs_f (num - 1))

and hfs_m num =
  if num < 0 then
    -1
  else if num = 0 then
    0
  else
    num - hfs_f (hfs_m (num - 1))

let () =
  print_int (hfs_m (-4)); print_char '\n';
  print_int (hfs_f (-4)); print_char '\n';
  print_int (hfs_m 0); print_char '\n';
  print_int (hfs_f 0); print_char '\n';
  print_int (hfs_m 4); print_char '\n';
  print_int (hfs_f 4); print_char '\n';
