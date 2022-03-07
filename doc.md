
- [Uruchomienie gry](#uruchomienie-gry)
  - [Windows](#windows)
  - [Ubuntu](#ubuntu)
- [Ekran startowy](#ekran-startowy)
- [Ekran zapisów](#ekran-zapisów)
- [Ranking](#ranking)
- [Wybór mudułów](#wybór-mudułów)
  - [Moduł pierwszy](#moduł-pierwszy)
    - [Opis modułu pierwszego](#opis-modułu-pierwszego)
  - [Moduł drugi](#moduł-drugi)
    - [Opis modułu drugiego](#opis-modułu-drugiego)
  - [Moduł drugi](#moduł-drugi-1)
    - [Opis modułu drugiego](#opis-modułu-drugiego-1)
- [Interfejs w trakcie rozgrywki](#interfejs-w-trakcie-rozgrywki)
  - [Menu Pauzy](#menu-pauzy)
  - [Ekran końcowy](#ekran-końcowy)
- [Rodzaje broni](#rodzaje-broni)
- [Artefakty](#artefakty)
- [Sterowanie](#sterowanie)
- [Konsola](#konsola)

___
# Uruchomienie gry
## Windows
Do pobrania.
## Ubuntu
Do pobrania.

# Ekran startowy
![Ekran startowy](Screens/start_screen.jpg)
| Ikona                                                                    | Opis                                         |
| ------------------------------------------------------------------------ | -------------------------------------------- |
| <img src="Assets/Buttons/Normal/Start.png" alt="Start" width="50"/>      | Przejście do wyboru modułów.                 |
| <img src="Assets/Buttons/Normal/Save.png" alt="Saves" width="50"/>       | Przejście do zapisanych wcześniej rozgrywek. |
| <img src="Assets/Buttons/Normal/Score.png" alt="Scoreboard" width="50"/> | Wyświetlenie tablicy wyników.                |
| <img src="Assets/Buttons/Normal/Back.png" alt="Exit" width="50"/>        | Wyjście z gry.                               |

# Ekran zapisów 
![Ekran zapisów](Screens/saves_screen.jpg)
| Ikona                                                                 | Opis                               |
| --------------------------------------------------------------------- | ---------------------------------- |
| <img src="Assets/Buttons/Normal/Start.png" alt="Start" width="50"/>   | Kontynuowanie zapisanej rozgrywki. |
| <img src="Assets/Buttons/Normal/Delete.png" alt="Delete" width="50"/> | Usunięcie zapisanej rozgrywki.     |
| <img src="Assets/Buttons/Normal/Back.png" alt="Back" width="50"/>     | Cofnięcie do ekranu startowego.    |

# Ranking 
![Ranking](Screens/results_screen.jpg)
| Ikona                                                             | Opis                            |
| ----------------------------------------------------------------- | ------------------------------- |
| <img src="Assets/Buttons/Normal/Back.png" alt="Back" width="50"/> | Cofnięcie do ekranu startowego. |

# Wybór mudułów
![Wybór modułów](Screens/module_select_screen.jpg)
| Ikona                                                                             | Opis                            |
| --------------------------------------------------------------------------------- | ------------------------------- |
| <img src="Assets/Buttons/Normal/Module_one.png" alt="Moduł pierwszy" width="50"/> | Przejście do modułu pierwszego. |
| <img src="Assets/Buttons/Normal/Module_one.png" alt="Moduł drugi" width="50"/>    | Przejście do modułu drugi.      |
| <img src="Assets/Buttons/Normal/Module_one.png" alt="Moduł trzeci" width="50"/>   | Przejście do modułu trzeciego.  |
| <img src="Assets/Buttons/Normal/Back.png" alt="Back" width="50"/>                 | Cofnięcie do ekranu startowego. |

## Moduł pierwszy
![Moduł pierwszy](Screens/module_1_screen.jpg)
| Ikona                                                                             | Poziom trudności |
| --------------------------------------------------------------------------------- | ---------------- |
| <img src="Assets/Buttons/Normal/Easy_mode.png" alt="Tryb łatwy" width="50"/>      | Łatwy            |
| <img src="Assets/Buttons/Normal/Medium_mode.png" alt="Tryb normalny" width="50"/> | Normalny         |
| <img src="Assets/Buttons/Normal/Hard_mode.png" alt="Tryb trudny" width="50"/>     | Trudny           |

### Opis modułu pierwszego
Rozpoczęcie rozgrywki skutkuje wylosowaniem puli map z wybranego poziomu trudności.
Moduł polega na przejściu jak największej ilości plansz, w celu uzyskania największego wyniku. Strata wszyskich żyć skutkuje zakończeniem rozgrywki. Wynik jest dodawany do rankingu. 


## Moduł drugi
![Moduł drugi](Screens/module_2_screen.jpg)
| Ikona                                                                                | Poziom trudności                         |
| ------------------------------------------------------------------------------------ | ---------------------------------------- |
| <img src="Assets/Buttons/Normal/Arrow_right.png" alt="Strzałka w prawo" width="50"/> | Następny poziom.                         |
| <img src="Assets/Buttons/Normal/Arrow_left.png" alt="Strzałka w lewo" width="50"/>   | Poprzedni poziom.                        |
| <img src="Assets/Buttons/Normal/Start.png" alt="Start" width="50"/>                  | Rozpoczęcie rozgrywki na wybranej mapie. |

### Opis modułu drugiego
Moduł drugi umożliwia wybór jednej z ponad 15 plansz. Po przejściu planszy ładowana jest kolejna. W module tym występują urozmaicenia w formie spadających broni. Strata wszyskich żyć skutkuje zakończeniem rozgrywki. Wynik jest dodawany do rankingu. 


## Moduł drugi
![Moduł trzeci](Screens/module_3_screen.jpg)
| Ikona                                                                                | Poziom trudności                         |
| ------------------------------------------------------------------------------------ | ---------------------------------------- |
| <img src="Assets/Buttons/Normal/Arrow_right.png" alt="Strzałka w prawo" width="50"/> | Następny poziom.                         |
| <img src="Assets/Buttons/Normal/Arrow_left.png" alt="Strzałka w lewo" width="50"/>   | Poprzedni poziom.                        |
| <img src="Assets/Buttons/Normal/Start.png" alt="Start" width="50"/>                  | Rozpoczęcie rozgrywki na wybranej mapie. |

### Opis modułu drugiego
Moduł trzeci posiada 5 ekskluzywnych poziomów przygotowanych specjalnie do tego trybu. Na planszach pojawiają się ułatwienia w postaci spadających artefaktów. Strata wszystkich żyć skutkuje zakończeniem rozgrywki. Celem trybu gry jest uzyskanie najwyższego wyniku. Wynik dodawany jest do rankingu.


# Interfejs w trakcie rozgrywki
![Interfejs](Screens/ui_in_game.jpg)
| Ikona     | Opis                                          |
| --------- | --------------------------------------------- |
| Serce     | Ilość żyć na dany poziom.                     |
| Magazynek | Pokazuje kiedy broń jest gotowa do wystrzału. |
| Score     | Wynik rozgrywki.                              |
| Pauza     | Pauzuje grę.                                  |


## Menu Pauzy
![Menu pauzy](Screens/pause_menu.jpg)

| Ikona                                                                   | Opis                                                          |
| ----------------------------------------------------------------------- | ------------------------------------------------------------- |
| <img src="Assets/Buttons/Normal/Start.png" alt="Start" width="50"/>     | Wznawia grę.                                                  |
| <img src="Assets/Buttons/Normal/Home.png" alt="Home" width="50"/>       | Powrót do menu głównego. __Stan rozgrywki zostaje zapisany.__ |
| <img src="Assets/Buttons/Normal/Skull.png" alt="Game over" width="50"/> | Zakończenie gry.                                              |

## Ekran końcowy
![Ekran końcowy](Screens/game_over.png)
| Ikona                                                                 | Opis                                                                   |
| --------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Your nick                                                             | Pozwala na wpisanie nazwy gracza w celu dołączenia wyniku do rankingu. |
| <img src="Assets/Buttons/Normal/Accept.png" alt="Accept" width="50"/> | Dodaje wynik do rankingu oraz przenosi do ekranu startowego.           |


# Rodzaje broni
| Ikona                                                                    | Nazwa   | Opis                                                                                              |
| ------------------------------------------------------------------------ | ------- | ------------------------------------------------------------------------------------------------- |
| <img src="Assets/Player/Weapons/weapon_1.png" alt="Gun" width="50"/>     | Gun     | Broń podstawowa, która wystrzeliwuje pojedyncze pociski. Cechuje się szybkostrzelnością.          |
| <img src="Assets/Player/Weapons/weapon_2.png" alt="Shotgun" width="50"/> | Shotgun | Broń dodatkowa, która wystrzeliwuje 3 pociski jednocześnie.                                       |
| <img src="Assets/Player/Weapons/weapon_3.png" alt="RPG" width="50"/>     | RPG     | Broń dodatkowa, wystrzeliwuje jedną rakietę, która w momencie wybuchu zadaje obszarowe obrażenia. |
| <img src="Assets/Player/Weapons/weapon_4.png" alt="Laser" width="50"/>   | Laser   | Broń dodatkowa, wystrzeliwuje wiązkę laseru, która anihiluje wszystkie. __Nie niszczy szkła__.    |

# Artefakty
| Ikona                                                                      | Nazwa             | Opis                                                                                     | Czas trwania |
| -------------------------------------------------------------------------- | ----------------- | ---------------------------------------------------------------------------------------- | ------------ |
| <img src="Assets/Items/Heart.png" alt="Serce" width="50"/>                 | Bonusowe życie    | Artefakt zwiększający ilość żyć.                                                         | -            |
| <img src="Assets/Items/clock.jpg" alt="Zegar" width="50"/>                 | Zatrzymanie czasu | Artefakt zatrzymuje czas poruszania się piłek.                                           | 5s           |
| <img src="Assets/Items/spring.png" alt="Sprężyna" width="50"/>             | Kauczuk           | Artefakt zwiększający sprężystość piłek, umożliwiający łatwiejsze przemknięcie pod nimi. | 10s          |
| <img src="Assets/Items/arrows_right.png" alt="Przyspieszenie" width="50"/> | Przyspieszenie    | Artefakt zwiększający prędkość ruchu gracza.                                             | 10s          |

# Sterowanie
| Przycisk             | Działanie                     |
| -------------------- | ----------------------------- |
| Strzałka w lewo / A  | Przesuwa gracza w lewo.       |
| Strzałka w prawo / D | Przesuwa gracza w prawo.      |
| Strzałka w górę / W  | Gracz wspina się po drabinie. |
| Strzałka w dół / S   | Gracz schodzi po drabinie.    |
| Spacja / Enter       | Oddanie strzału.              |

# Konsola
Dostępna po naciśnięciu kombinacji klawiszy: `Ctrl + ~`

| Polecenie         | Argumenty                                            | Opis                                          |
| ----------------- | ---------------------------------------------------- | --------------------------------------------- |
| `save`            |                                                      | Zapisuje stan rozgrywki.                      |
| `load`            |                                                      | Wczytuje stan rozgrywki.                      |
| `spawn_ball`      | Rozmiar piłki [int]                                  | Tworzy piłkę.                                 |
| `nuke`            |                                                      | Zadaje wszystkim piłkom pojedyncze obrażenie. |
| `set_lives`       | Ilość żyć [int]                                      | Ustawia ilość żyć.                            |
| `give_weapon`     | `gun` / `rpg` / `shotgun` / `laser`                  | Zmienia broń.                                 |
| `timescale`       | Mnożnik czasu [float]                                | Ustawia szybkość gry.                         |
| `add_score`       | Nick [string], Punkty [int], Moduł [`1` / `2` / `3`] | Dodaje punkty.                                |
| `switch_to_scene` | Ścieżka do sceny [string]                            | Przełącza scenę.                              |
| `commands`        |                                                      | Wyświetla listę poleceń.                      |