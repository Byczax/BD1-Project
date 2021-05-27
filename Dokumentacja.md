# Bazy Danych 1 - Sklep Budowlany

| Wydział elektroniki       | Kierunek: informatyka techniczna |
| :------------------------ | -------------------------------: |
| Grupa zajęciowa: Pt 13:15 |          Semestr: 2020/2021 Lato |
| Prowadzący:               |    mgr inż. Szymon Wojciechowski |

|        Autorzy        |
| :-------------------: |
|     Byczko Maciej     |
|    Dębowski Jakub     |
| Rzymyszkiewicz Tomasz |

# Wstęp

## Opis systemu

Celem projektu było zrealizowanie bazy danych sklepu budowlanego.

W systemie umieściliśmy niezbędne informacje z punktu widzenia różnych użytkowników bazy.
Baza danych została zaprojektowana zgodnie z zasadami normalizacji.

System przechowuje następujące informacje:

- Pracownicy
  - Imię
  - Nazwisko
  - Płaca
  - Data zatrudnienia
  - Typ zatrudnienia
  - Identyfikator Przełożonego
  - Identyfikator sklepu, w którym pracuje
  - Zamówienia do których został przydzielony
- Produkty
  - Nazwa
  - Data produkcji
  - Cena kupna fabryczna
  - Cena kupna sklepowa
  - Identyfikator dostawcy
- Sklepy
  - Powierzchnia
  - Adres sklepu
    - Nazwa miasta
    - Ulica
    - Kod pocztowy
  - Identyfikator magazynu
- Klienci
  - Adres
    - Nazwa miasta
    - Ulica
    - Kod pocztowy
    - Rodzaj miejsca (Budowa, sklep etc.)
  - Numer telefonu
  - Login
  - Hasło
  - NIP firmy
  - Zamówienia
- Zamówienia
  - Identyfikator klienta
  - Lista produktów
  - Identyfikator sklepu
  - Data zamówienia
  - Status zamówienia
- Dostawca
  - Nazwa
  - Identyfikator produktu dostarczanego
- Magazyn
  - Adres
    - Miasto
    - Ulica
    - Kod pocztowy

## Opis wymagań funkcjonalnych

-

## Diagram przypadków użycia

## Model fizyczny bazy danych

![model](Diagram%20ER.png)

## Implementacja bazy danych

Jako system zarządzający wybraliśmy `PostgreSQL`, a jako narzędzie wspomagające administrację bazy wybraliśmy `pgAdmin 4`.
Za pomocą `pgAdmin 4` wygenerowaliśmy kod SQL tworzący bazę danych na podstawie wcześniej stworzonego w tym programie diagramu.

## Przykładowe skrypty

### Tworzenie przykładowych tabel

#### Tworzenie tabeli produktów

```sql
CREATE TABLE public.products
(
    product_id serial NOT NULL,
    product_name name NOT NULL,
    production_date date NOT NULL,
    factory_price money NOT NULL,
    shop_price money NOT NULL,
    suplier_id integer NOT NULL,
    PRIMARY KEY (product_id),
	UNIQUE(suplier_id)
);
```

#### Tworzenie tabeli klientów

```sql
CREATE TABLE public.clients
(
    client_id serial NOT NULL,
    address_id integer NOT NULL,
    phone integer NOT NULL,
    login text NOT NULL,
    password text NOT NULL,
    nip integer NOT NULL,
    order_id integer,
    PRIMARY KEY (client_id),
	UNIQUE (address_id,order_id)
);
```

#### Tworzenie tabeli pracowników

```sql
CREATE TABLE public.workers
(
    worker_id serial NOT NULL,
    first_name name NOT NULL,
    last_name name NOT NULL,
    salary money NOT NULL,
    hire_date date NOT NULL,
    employment_type text NOT NULL,
    manager_id serial NOT NULL,
    shop_id integer NOT NULL,
    orders integer,
    PRIMARY KEY (worker_id)

);
```

### Przykładowe transakcje (Przypadki użycia)

#### Generacja raportu finansowego

```sql
SELECT o.order_id, pr.shop_price
FROM orders o,products pr
WHERE order_date BETWEEN '2020-01-01' AND '2021-01-01';
```

Przykładowy rezultat:

| order_id | shop_price |
| -------- | ---------- |
| 1        | $73.69     |
| 2        | $73.69     |
| 5        | $73.69     |
| 6        | $73.69     |
| 8        | $73.69     |
| 10       | $73.69     |
| 11       | $73.69     |
| 13       | $73.69     |
| 14       | $73.69     |
| 15       | $73.69     |

## Podsumowanie

Udało nam się utworzyć z naszych pomysłów bazę danych. Posiada ona sporą większość zakładanych przez nas podczas etapu planowania funkcjonalności. Dzięki temu że zanim zrobiliśmy praktyczną część projektu, dobrze zaplanowaliśmy jak baza powinna wyglądać, udało nam się w głównej mierze uniknąć problemów. Zdaliśmy sobie sprawę że posiadanie kopii zapasowej całej bazy, albo skryptów tworzących tabele, dane etc. jest bardzo ważne. Bez nich, gdyby wystąpił poważny błąd, moglibyśmy stracić mnóstwo czasu na odtwarzanie bazy oraz danych.
