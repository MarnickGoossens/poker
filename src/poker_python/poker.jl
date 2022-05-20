using Random

println("hoeveel spelers")
println("4")
#aantal = readline()
aantal = 4

function spelers_maken(aantal)
    spelers = Dict()
    for i in 1:aantal
        speler = "speler" * string(i)
        spelers[speler] = []
    end
    return spelers
end

function kaart_spel_maken()
    kaart_reeks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"]
    kaart_kleuren = ["♠", "♥", "♦", "♣"]
    kaart_spel = []

    for kaart_kleur in kaart_kleuren
        for kaart_index in 1:length(kaart_reeks)
            push!(kaart_spel, (kaart_reeks[kaart_index], kaart_kleur))
        end
    end
    return kaart_spel
end

function deel_kaarten(spelers, kaart_spel)
    tafel = []
    for i in 1:length(spelers)
        speler = "speler" * string(i)
        push!(spelers[speler], kaart_spel[1])
        splice!(kaart_spel, 1:1)
    end
    splice!(kaart_spel, 1:1)
    for i in 1:length(spelers)
        speler = "speler" * string(i)
        push!(spelers[speler], kaart_spel[1])
        splice!(kaart_spel, 1:1)
    end
    splice!(kaart_spel, 1:1)
    push!(tafel, kaart_spel[1])
    push!(tafel, kaart_spel[1])
    push!(tafel, kaart_spel[1])
    splice!(kaart_spel, 1:1)
    push!(tafel, kaart_spel[1])
    splice!(kaart_spel, 1:1)
    push!(tafel, kaart_spel[1])
    splice!(kaart_spel, 1:1)
    return kaart_spel, tafel
end

function speler_inorde_maken(spelers, aantal)
    for i in 1:aantal
        speler = "speler" * string(i)
        pushfirst!(spelers[speler], true)
        push!(spelers[speler], 0)
        push!(spelers[speler], false)
        push!(spelers[speler], 1000)
    end
    return spelers
end


spelers = spelers_maken(aantal)
kaart_spel = kaart_spel_maken()
kaart_spel, tafel = deel_kaarten(spelers, kaart_spel)
spelers = speler_inorde_maken(spelers, aantal)

println("")
println("spelers")
println(spelers["speler1"])
println(spelers["speler2"])
println(spelers["speler3"])
println(spelers["speler4"])
println("")
println("overige kaarten")
println(kaart_spel)
println("")
println("tafel")
println(tafel)
