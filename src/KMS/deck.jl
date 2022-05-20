struct Card
    suit::Int64
    value::Int64
    function Card(suit::Int64, value::Int64)
        @assert(1 <= suit <= 4, "suit is not between 1 and 4")
        @assert(1 <= value <= 13, "value is not between 1 and 13")
        new(suit, value)
    end
end

# Definitie van een kaart : Card(suit,value)

const suit_name = ["♠", "♥", "♦", "♣"]
const value_name = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

function Base.show(io::IO, card::Card)
    print(io, value_name[card.value], suit_name[card.suit])
end

#making real deck
struct Deck
    cards::Array{Card,1}
end

function Deck()
    deck = Deck(Card[])
    for suit in 1:4
        for value in 1:13
            push!(deck.cards, Card(suit, value))
        end
    end
    deck
end