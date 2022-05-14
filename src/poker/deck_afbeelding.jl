function Base.show(io::IO, deck::Deck)
    for card in deck.cards
        print(io, card, "")
    end
    println()
end