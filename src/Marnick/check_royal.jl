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


function check_royal_flush(kaarten)
    for speler in kaarten
        lijst = speler[2]
        result = []
        for item in lijst
            if 10 in item
                result = cat(result, item, dims=(1, 1))
            end
            if "J" in item
                result = cat(result, item, dims=(1, 1))
            end
            if "Q" in item
                result = cat(result, item, dims=(1, 1))
            end
            if "K" in item
                result = cat(result, item, dims=(1, 1))
            end
            if "A" in item
                result = cat(result, item, dims=(1, 1))
            end
        end
        if length(result) == 5
            println(result)
            return (speler[1], true)
        else
            continue
        end
    end
end

kaarten = concatenate_lijst(spelers)
speler_royal = check_royal_flush(kaarten)
println(speler_royal)

# println(kaarten["speler1"])
# println(kaarten["speler2"])
# println(kaarten["speler3"])
# println(kaarten["speler4"])