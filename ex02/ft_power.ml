let rec ft_power num power =
  if power = 0 then
    1
  else if power = 2 * (power / 2) then
    let half = ft_power num (power / 2) in half * half
  else
    let half = ft_power num ((power - 1) / 2) in num * half * half