# BD1-Project

|      Wydział elektroniki       |  Kierunek: informatyka techniczna |
|:-------------------------------|------------------------:|
| Grupa zajęciowa: Pt 13:15      | Semestr: 2020/2021 Lato |
| Prowadzący:                    | dr inż. Szymon Wojciechowski |

| Autorzy         |
|:---------------:|
| Byczko Maciej   |
| Dębowski Jakub  |
| Rzymyszkiewicz Tomasz|

## Opis ogólny

Projekt na kursy Bazy Danych 1
Projekt jest podzielony na 3 części:

- Specyfikacja programu
- Diagram ER
- Implementacja

## Historia

Szef prosi o stworzenie bazy danych dla swojej firmy budowlanej, w której zostaną zawarte:

### Pracownicy

- Imię i nazwisko
- Nr. identyfikacyjny
- Kiedy został zatrudniony
- ile otrzymuje pensji
- jaki rodzaj umowy ma podpisany

### Produkty

- Id produktu
- Nazwa produktu
- Data produkcji
- Firma z której został zamówiony
- Ile posiadamy sztuk na stanie
- Cena fabryczna
- Cena dla klienta

### Sklep (Możemy założyć że Kierownik prowadzi kilka sklepów)

- Położenie
- Wielkość
- Kadra
- Obrót konkretnego sklepu
- Koszty (koszt wynajmu lokalu, pensje)
- Stan zaopatrzenia sklepu

### Stali Klienci

- Id klienta
- Adres
- kontakt
- login do konta
- hasło do konta (enkryptowane?)
**Gdy posiada firmę**
- Adres firmy
- nip

### Zamówienia

- id zamówienia
- zamówione produkty wraz z ilościami
- koszt zamówienia
## Przypadki użycia

### Aktorzy

- Szef
- Manager
- Pracownicy
- Klienci

### Szef

- Dodaje sklepy
- zarządza managerami
  - tworzy nową umowę (ustala zarobki)
  - przydzielenie do konkretnego sklepu
- Zarządza środkami
  - przeglądanie środków (przeznacza więcej na dany sklep lub buduje nowy sklep)
- posiada podgląd na wszystkich pracowników
- Generuje raporty finansowe

### Manager

- Zarządza pracownikami
  - dodaje pracowników
  - ustala pensje
- Przydziela zamówienia
  - zmienia status zamówienia z *złożone* -> *przyjęte*
- Rozpatruje wnioski uzupełnienia magazynu
  - składanie zamówień
  - utworzenie kosztorysów
- Tworzenie raportów finansowych
- Przeglądanie pracowników
  - ich zarobki, umowę [ tylko pracowników którzy są w tym samym sklepie co on]

### Pracownik

- Wykonuje zamówienia
- składa wniosek o uzupełnienie magazynu o dane towary
- Składa wniosek o podwyżkę
- Przyjmowanie uzupełnień magazynu
  - wpisuje na stan
- Przeglądanie stanu magazynu, sklepu
- zmienia status zamówień
  - z *przyjęte* -> *w trakcie*
  - *w trakcie* -> *skompletowane*

### Klient

- Składa zamówienie
  - do zamówienia wybiera sposób dokumentacji [Faktura lub Paragon]
- anuluje zamówienia
  - tylko gdy zamówienie nie zostało przyjęte przez pracownika
- przeglądanie zamówień
