import Base.isless

# OPGELET: functie "sort!" kijkt alleen naar value en NIET naar suit
function sortCards(hand)
    sort!(hand)
end

function isless(c1::Card, c2::Card)
    (c1.value) < (c2.value)
end

function highestCard(hand)
    return hand[length(hand)]
end

function hasPairs(hand)
    number_pairs = 0
    for index in 1:length(hand)-1
        actual_card = hand[index]
        next_card = hand[index+1]
        if actual_card.value == next_card.value
            number_pairs += 1
            index += 1
            actual_card = hand[index]
            next_card = hand[index+1]
            if actual_card.value == next_card.value
        end
    end
        return number_pairs
end


function hasThreeOfAKind(hand)
    
end

function straight(hand)
    
    

speler1 = [Card(3,4),Card(1,4),Card(2,12),Card(2,3),Card(3,12)]
sortCards(speler1)

println("Speler 1: ", speler1)

println(hasPairs(speler1))
println(highestCard(speler1))