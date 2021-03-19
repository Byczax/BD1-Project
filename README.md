# BD1-Project

## Opis ogólny

Projekt na kursy Bazy Danych 1
Projekt jest podzielony na 3 części:

- Specyfikacja programu
- Diagram ER
- Implementacja

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
- Zarządza środkami (przeglądanie środków),(Przeznacza więcej na dany sklep lub buduje nowy sklep)
  - przeglądanie środków (przeznacza więcej na dany sklep lub buduje nowy sklep)
- posiada podgląd na wszystkich pracowników
- Generuje raporty finansowe

### Manager

- Zarządza pracownikami (dodaje pracowników, ustala pensje)
- Przydziela zamówienia (zmienia status zamówienia z *złożone* -> *przyjęte*)
- Rozpatruje wnioski uzupełnienia magazynu (składanie zamówień, utworzenie kosztorysów)
- Tworzenie raportów finansowych
- Przeglądanie pracowników (ich zarobki, umowę [ tylko pracowników którzy są w tym samym sklepie co on])

### Pracownik

- Wykonuje zamówienia
- składa wniosek o uzupełnienie magazynu o dane towary
- Składa wniosek o podwyżkę
- Przyjmowanie uzupełnień magazynu (wpisuje na stan)
- Przeglądanie stanu magazynu, sklepu
- zmienia status zamówień (z *przyjęte* -> *w trakcie*, następnie z *w trakcie* -> *skompletowane*)

### Klient

- Składa zamówienie (do zamówienia wybiera sposób dokuemntacji [Faktura lub Paragon])
- anuluje zamówienia (tylko gdy zamówienie nie zostało przyjęte przez pracownika)
- przeglądanie zamówień
