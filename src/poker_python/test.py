tafel = [(7, "♠"), ("A", "♦"), (10, "♣"), (10, "♦"), (4, "♥")]
speler1 = [True, (7, "♣"), ("A", "♦"), 0, False, 1000]


for kaart_tafel in tafel:
    for kaart_speler in speler1[1:3]:
        if kaart_speler[0] in kaart_tafel:
            print("oke")
