tafel = [(5, "♠"), (4, "♠"), (10, "♠"), ("A", "♥"), ("K", "♥")]
spelers = Dict()
spelers["speler1"] = [(4, "♦"), (3, "♦")]
spelers["speler2"] = [("Q", "♠"), ("Q", "♥")]
spelers["speler3"] = [(3, "♣"), ("Q", "♦")]
spelers["speler4"] = [(10, "♣"), (9, "♦")]

function concatenate_lijst(spelers)
    kaarten = Dict()
    for i in 1:length(spelers)
        speler = "speler" * string(i)
        kaarten[speler] = cat(tafel, spelers[speler][1:2], dims=(1, 1))
    end
    return kaarten
end

function get_cards_numbers(kaarten)
    for speler in kaarten
        numbers = []
        for card in speler[2]
            push!(numbers, card[1])
        end
        println(numbers)
    end
end

function straight(kaarten)
    nummers = get_cards_numbers(kaarten)
    println(nummers)
end

kaarten = concatenate_lijst(spelers)
speler_royal = straight(kaarten)
# println(speler_royal)

# println(kaarten["speler1"])
# println(kaarten["speler2"])
# println(kaarten["speler3"])
# println(kaarten["speler4"])