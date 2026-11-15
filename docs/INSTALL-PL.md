# Jailbreak Kindle Paperwhite 2 (5.12.2.2) + KOReader — instrukcja krok po kroku

Przetestowane na PW2 (6. gen.), firmware **5.12.2.2**. Metoda: **WatchThis**
(offline, bez konta Amazon). Po jailbreaku: Universal Hotfix → MRPI → KUAL →
KOReader.

> Ważne: przeczytaj CAŁĄ instrukcję, zanim zaczniesz. Reset kasuje wszystko
> z urządzenia, więc kopia zapasowa (krok 0) jest obowiązkowa.

## Spis treści

1. [Krok 0 — kopia zapasowa](#krok-0--kopia-zapasowa)
2. [Krok A — reset i tryb demo](#krok-a--reset-i-tryb-demo)
3. [Krok B — wgranie jailbreaka](#krok-b--wgranie-jailbreaka)
4. [Krok C — hotfix WatchThis](#krok-c--hotfix-watchthis)
5. [Krok D — Universal Hotfix](#krok-d--universal-hotfix)
6. [Krok E — MRPI + KUAL](#krok-e--mrpi--kual)
7. [Krok F — KOReader](#krok-f--koreader)
8. [Co dalej](#co-dalej)

---

## Krok 0 — kopia zapasowa

WatchThis robi reset do ustawień fabrycznych. Skopiuj z dysku Kindle:

- folder `documents/` (książki + foldery `.sdr` z notatkami i postępem),
- folder `fonts/` (własne czcionki).

Automatycznie: `./scripts/backup.sh /d` (lub ścieżka, pod którą montuje się Kindle).

## Krok A — reset i tryb demo

Cały interfejs będzie po angielsku; na końcu wrócisz do polskiego.

1. Na Kindle: Ustawienia → Menu → **Resetuj urządzenie** (factory reset).
2. Przy pierwszym uruchomieniu język ustaw na **English (United Kingdom)**.
3. Przy ekranie Wi-Fi: wybierz dowolną sieć i się **cofnij** (pomiń logowanie).
4. W pasku wyszukiwania wpisz `;enter_demo` i zatwierdź.
   - *Samo wpisanie NIE robi restartu* — ustawia tylko flagę.
5. Zrestartuj ręcznie: przytrzymaj przycisk zasilania ~15 s (albo Ustawienia → Restart).
6. Po restarcie Kindle wchodzi w tryb demo.
7. Pomiń Wi-Fi; przy "store registration" wpisz cokolwiek (np. `aaa`).
8. Pomiń szukanie "demo payload".
9. Wybierz typ demo **standard**.
10. Wciśnij **Done** przy monicie o sideload (NIC jeszcze nie wgrywaj).
11. Obejdź blokadę "misconfiguration" gestem: **dwa palce w prawym dolnym
    rogu, potem przesunięcie w lewo** (może trzeba 2–3 razy;
    wideo: youtube.com/watch?v=JzuIGbGPpig).
12. W wyszukiwarce wpisz `;demo` → menu demo → wybierz **Sideload Content**.

## Krok B — wgranie jailbreaka

1. Podłącz Kindle do komputera. *Jeśli dysk się nie pojawia, wpisz `;uzb`
   (włącza tryb USB w demo mode).*
2. W korzeniu Kindle utwórz folder `.demo`.
3. Do `.demo` skopiuj `PW2-5.12.2.2.zip` (**nie rozpakowuj**) i `demo.json`.
4. W `.demo` utwórz **pusty** folder `goodreads` (bez plików).
5. Bezpiecznie wysuń, odepnij USB, na Kindle wciśnij **Done**.

> `Application Error` przy Done/Exit jest **OCZEKIWANE** — to skrypt
> jailbreaka instaluje się i wywala aplikację demo. NIE kopiuj plików ponownie.
> Wtedy: przytrzymaj zasilanie 15+ s (hard reboot), wejdź w `;demo` →
> Sideload Content → **Done** jeszcze raz (BEZ USB, bez kopiowania).

6. Wyjdź z menu demo.
7. **Na PW2 wciśnij ikonę SKLEPU** (na innych modelach byłoby `;dsts`).
   - *Napis "updating" to aktualizacja treści demo, NIE firmware (brak Wi-Fi).*
8. **Help & User Guides** → **Get Started**.
9. Kindle się zrestartuje i przy starcie odpali skrypt (przewijający się tekst).
10. Po skrypcie urządzenie jest **już zjailbreakowane, ale NADAL w trybie demo**
    — to normalne, wyjdzie z niego dopiero hotfix w kroku C.

## Krok C — hotfix WatchThis

1. W wyszukiwarce wpisz `;uzb` (tryb USB).
2. Podłącz, skopiuj `Update_hotfix_watchthis_custom.bin` do **korzenia** Kindle.
3. Wysuń, odepnij.
4. Wpisz `;dsts` → Ustawienia → menu ⋮ → **Update Your Kindle**.
5. Instaluje hotfix, **wychodzi z trybu demo**, sprząta pliki. Restart.

Po restarcie jesteś na normalnym ekranie głównym. Jailbreak zrobiony.

## Krok D — Universal Hotfix

KUAL i homebrew NIE zadziałają bez Universal Hotfix (to inny plik niż hotfix
z kroku C).

1. Skopiuj `Update_hotfix_universal.bin` do **korzenia** Kindle.
2. Wysuń, odepnij.
3. Ustawienia → menu ⋮ → **Update Your Kindle**. Restart.
4. W Bibliotece pojawi się pozycja **Run Hotfix** — dotknij ją (odpala hotfix).

## Krok E — MRPI + KUAL

1. Skopiuj foldery `extensions/` i `mrpackages/` (z MRPI) do **korzenia**.
2. Skopiuj `Update_KUALBooklet_c6ac782_install.bin` do folderu `mrpackages/`.
3. Wysuń, odepnij.
4. W wyszukiwarce wpisz `;log mrpi` i zatwierdź.
   - Zobaczysz "Hush, little baby..." na dole ekranu → instaluje KUAL.
5. W Bibliotece pojawi się **KUAL** — dotknij, otworzy się menu.

> Nie używaj PEKI (archiwalny, `KUAL.sh` cicho nie działa na PW2).
> Nie używaj wariantu `HDRepack` ani `khf` (to dla hard-float ≥5.16.3).

## Krok F — KOReader

1. Skopiuj foldery `koreader/` i `extensions/koreader/` do **korzenia**.
2. Wysuń, odepnij.
3. KUAL → **KOReader** → **Start KOReader (no framework)** (najlepsze na PW2,
   mało RAM).

## Co dalej

- **Język polski**: KOReader → góra ekranu → zębatka → Language → Polski.
- **Książki**: wrzucaj EPUB-y do folderu `books/` (KOReader czyta natywnie).
  KOReader nie robi transferu USB, gdy działa — najpierw go zamknij.
- **Rozszerzenia** (BatteryStatus, KUAL+, USBNetwork/SSH, ScreenSavers):
  zobacz [EXTENSIONS.md](EXTENSIONS.md) i [SSH.md](SSH.md).

## Szybka ściąga poleceń

| Polecenie | Co robi |
|---|---|
| `;enter_demo` | ustawia flagę trybu demo (potem restart ręczny) |
| `;demo` | otwiera menu demo |
| `;uzb` | włącza tryb USB (demo mode) |
| `;dsts` | skok do ustawień |
| `;log mrpi` | uruchamia instalator pakietów (MRPI) |
| `;exit_demo` | wyjście z demo przy problemach |

## Gdyby coś poszło nie tak

- Reset z trybu demo: `;uzb`, utwórz pusty plik `DO_FACTORY_RESTORE` w korzeniu, restart.
- Oficjalne źródło: kindlemodding.org/jailbreaking/Legacy/WatchThis/
- Pomoc: Discord KindleModding, reddit r/kindlejailbreak, MobileRead.
