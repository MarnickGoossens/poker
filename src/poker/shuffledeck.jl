using Random

function Random.shuffle!(deck::Deck)
    shuffle!(deck.cards)
    deck
end
shuffled_Deck = shuffle!(Deck())
