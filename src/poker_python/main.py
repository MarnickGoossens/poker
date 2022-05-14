from random import shuffle, choice, choices


# spelers aanmaken
def spelers_maken():
    # aantal_spelers = int(input(f"hoeveel spelers\n"))
    aantal_spelers = 4
    for x in range(1, aantal_spelers + 1):
        globals()[f"speler{x}"] = [True, 0]
    globals()[f"tafel"] = []
    return aantal_spelers


# kaartspel maken
def kaart_spel_maken():
    kaart_reeks = ["A"] + list(range(2, 11)) + ["J", "Q", "K"]
    kaart_kleuren = ["♠", "♥", "♦", "♣"]
    kaart_spel = []

    for kaart_kleur in kaart_kleuren:
        for kaart_index in range(len(kaart_reeks)):
            kaart_spel.append((kaart_reeks[kaart_index], kaart_kleur))
    shuffle(kaart_spel)
    return kaart_spel


# kaarten delen
def deel_kaarten(aantal_spelers):
    for i in range(1, aantal_spelers + 1):
        kaart = choice(kaart_spel)
        globals()[f"speler{i}"].insert(1, kaart)
        kaart_spel.remove(kaart)
    kaart_spel.remove(choice(kaart_spel))
    for i in range(1, aantal_spelers + 1):
        kaart = choice(kaart_spel)
        globals()[f"speler{i}"].insert(2, kaart)
        kaart_spel.remove(kaart)
    kaart_spel.remove(choice(kaart_spel))
    for i in range(3):
        kaart = choice(kaart_spel)
        tafel.append(kaart)
        kaart_spel.remove(kaart)
    kaart_spel.remove(choice(kaart_spel))
    tafel.append(choice(kaart_spel))
    kaart_spel.remove(choice(kaart_spel))
    tafel.append(choice(kaart_spel))


# inzet functie
def inzet():
    for i in range(1, aantal_spelers + 1):
        hoogste_bedrag = 0
        for j in range(1, aantal_spelers + 1):
            if globals()[f"speler{j}"][3] > hoogste_bedrag:
                hoogste_bedrag = globals()[f"speler{j}"][3]
        if globals()[f"speler{i}"][0] == True:
            print()
            print(globals()[f"speler{i}"][1], globals()[f"speler{i}"][2])
            keuze = input(f"Speler{i}: fold/call/raise:    ")
            if keuze == "fold":
                globals()[f"speler{i}"][0] = False
            if keuze == "call":
                globals()[f"speler{i}"][3] = hoogste_bedrag
            if keuze == "raise":
                bedrag = int(input(f"hoeveel wilt u raise:    "))
                globals()[f"speler{i}"][3] = bedrag
            print()
    lijst = []
    for i in range(1, aantal_spelers + 1):
        if globals()[f"speler{i}"][0] == True:
            lijst.append(globals()[f"speler{i}"][3])
        else:
            continue
    return lijst


# checkt of de kaarten mogen gedraaid worden
def check_inzet():
    result = False
    while result == False:
        lijst = inzet()
        result = all(element == lijst[0] for element in lijst)
        if result == False:
            continue


aantal_spelers = spelers_maken()
kaart_spel = kaart_spel_maken()
deel_kaarten(aantal_spelers)
check_inzet()
print(tafel[:3])
check_inzet()
print(tafel[:4])
check_inzet()
print(tafel)
check_inzet()
print(tafel)
