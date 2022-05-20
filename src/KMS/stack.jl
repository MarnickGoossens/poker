amount_players = 4
start_bedrag = 5000
for i = 1:amount_players
    println(@eval $(Symbol(:stack_, i)) = start_bedrag)
end