# BD1-Project

|      Wydział elektroniki       |  Kierunek: informatyka techniczna |
|:-------------------------------|------------------------:|
| Grupa zajęciowa: Pt 13:15      | Semestr: 2020/2021 Lato |
| Prowadzący:                    | mgr inż. Szymon Wojciechowski |

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

Właściciel ogólnopolskiej sieci sklepów budowlanych zleca zespołowi programistów stworzenie bazy na potrzeby obsługi jego działalności. Na spotkaniu podczas którego opisał swoje oczekiwania zostały wynotowane następujące potrzeby:

### Pracownicy

- Imię i nazwisko
- Numer identyfikacyjny
- Kiedy został zatrudniony
- Ile otrzymuje pensji
- Jaki rodzaj umowy ma podpisany

### Produkty

- Numer identyfikacyjny produktu
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

- Numer identyfikacyjny klienta
- Adres
- Kontakt
- Login do konta
- Hasło do konta (odpowiednio zabezpieczone)
**Gdy posiada firmę**
- Adres firmy
- NIP

### Zamówienia

- Numer identyfikacyjny zamówienia
- Zamówione produkty wraz z ilościami
- Koszt zamówienia

### Przypadki użycia

### Aktorzy

- Szef
- Manager
- Pracownicy
- Klienci

### Szef

- Dodaje sklepy
- Zarządza managerami
  - tworzy nową umowę (ustala zarobki)
  - przydzielenie do konkretnego sklepu
- Zarządza środkami
  - przeglądanie środków (przeznacza więcej na dany sklep lub buduje nowy sklep)
- Posiada podgląd na wszystkich pracowników
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
  - *przyjęte* -> *w trakcie*
  - *w trakcie* -> *skompletowane*

### Klient

- Składa zamówienie
  - do zamówienia wybiera sposób dokumentacji [Faktura lub Paragon]
- Anuluje zamówienia
  - tylko gdy zamówienie nie zostało przyjęte przez pracownika
- Przeglądanie zamówień

### Opis wykorzystanych narzędzi

#### PostgreSQL

#### PgAdmin 4 (version 13)

- Zalety
  - Łatwe tworzenie

- Wady
  - Brak połączenia 1 do 1
  - Nie można tworzyć relacji tabeli samej do siebie 