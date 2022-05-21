using Random

println("hoeveel spelers")
aantal = readline()
aantal = parse(Int64, aantal)

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
    return shuffle(kaart_spel)
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
    splice!(kaart_spel, 1:1)
    push!(tafel, kaart_spel[1])
    splice!(kaart_spel, 1:1)
    push!(tafel, kaart_spel[1])
    splice!(kaart_spel, 1:1)
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

function raise_false(spelers)
    for speler in spelers
        speler[2][5] = false
    end
end


function inzet(spelers)
    bedrag = 0
    for i in 1:length(spelers)
        hoogste_bedrag = 0
        for j in 1:length(spelers)
            speler = "speler" * string(j)
            if (spelers[speler][4] > hoogste_bedrag)
                hoogste_bedrag = spelers[speler][4]
            end
        end
        speler = "speler" * string(i)
        if (spelers[speler][1] == true)
            if (spelers[speler][5] == false)
                println("")
                kaart1 = spelers[speler][2]
                kaart2 = spelers[speler][3]
                overig_geld = spelers[speler][6]
                println("$kaart1, $kaart2, $overig_geld")

                println("$speler: fold/call/raise:  ")
                keuze = readline()

                if (keuze == "fold")
                    spelers[speler][1] = false
                end

                if (keuze == "call")
                    if (bedrag > spelers[speler][6])
                        println("u hebt teweinig geld, u moet folden")
                        fold = readline()
                        if ("fold" == fold)
                            spelers[speler][1] = false
                        end
                    else
                        spelers[speler][4] = hoogste_bedrag
                        spelers[speler][6] = spelers[speler][6] - bedrag
                    end
                end

                if (keuze == "raise")
                    println("hoeveel wilt u raise:")
                    bedrag = readline()
                    bedrag = parse(Int64, bedrag)
                    while bedrag > spelers[speler][6]
                        max_bedrag = spelers[speler][6]
                        println("U kan maximaal $max_bedrag inzetten")
                        println("hoeveel wilt u raise:")
                        bedrag = readline()
                        bedrag = parse(Int64, bedrag)
                    end
                    if (bedrag <= spelers[speler][6])
                        raise_false(spelers)
                        spelers[speler][4] = spelers[speler][4] + bedrag
                        spelers[speler][5] = true
                        spelers[speler][6] = spelers[speler][6] - bedrag
                    end
                end
            else
                spelers[speler][5] = false
                break
            end
            println("")
        end
    end

    lijst = []
    for i in 1:length(spelers)
        speler = "speler" * string(i)
        if (spelers[speler][1] == true)
            push!(lijst, spelers[speler][4])
        else
            continue
        end
    end
    return spelers, lijst
end

function check_inzet(spelers)
    result = false
    while result == false
        spelers, lijst = inzet(spelers)
        result = all(element == lijst[1] for element in lijst)
        if (result == false)
            continue
        end
    end
    calls = []
    for i in 1:length(spelers)
        speler = "speler" * string(i)
        push!(calls, spelers[speler][6])
    end
    calls_minimum = minimum(calls)
    for i in 1:length(spelers)
        speler = "speler" * string(i)
        spelers[speler][6] = calls_minimum
    end
    raise_false(spelers)
    return spelers
end

function pot(spelers)
    bedrag = 0
    for i in 1:length(spelers)
        speler = "speler" * string(i)
        bedrag = bedrag + spelers[speler][4]
    end
    return bedrag
end

spelers = spelers_maken(aantal)
kaart_spel = kaart_spel_maken()
kaart_spel, tafel = deel_kaarten(spelers, kaart_spel)
spelers = speler_inorde_maken(spelers, aantal)
spelers = check_inzet(spelers)
tafel_print = tafel[1:3]
println("tafel:\t$tafel_print")
spelers = check_inzet(spelers)
tafel_print = tafel[1:4]
println("tafel:\t$tafel_print")
spelers = check_inzet(spelers)
println("tafel:\t$tafel")
spelers = check_inzet(spelers)
bedrag_pot = pot(spelers)

println("tafel:\t\t\t$tafel")
for i in 1:length(spelers)
    speler = "speler" * string(i)
    kaart1 = spelers[speler][2]
    kaart2 = spelers[speler][3]
    overig_geld = spelers[speler][6]
    println("$speler:\t\t$kaart1, $kaart2, $overig_geld")
end
println("Winnende pot:\t$bedrag_pot")
