# flipdiagbmp24
```c
void flipdiagbmp24(void *img, int width);
````
Odbicie lustrzane kwadratowego obrazu .BMP w formacie 24bpp względem przekątnej.

## Dodatkowe informacje

Projekt wykonywany w domu, oddawany w czasie sesji laboratoryjnych.
Napisać program działający pod kontrolą systemu Linux, składający się z głównego modułu w
języku ANSI C, zapewniającego wejście i wyjście oraz modułu asemblerowego realizującego
przetwarzanie danych. Treść zadania zawiera deklarację funkcji asemblerowej widzianą na
poziomie języka C. Do asemblacji używamy asemblera NASM (nasm.sf.net). Kompilacja
i konsolidacja następuje przy użyciu drivera kompilatora CC.
Projekt powinien być przygotowany w dwóch wersjach – 32- i 64-bitowej. Z uwagi na dostępność
większej liczby rejestrów wersja 64-bitowa powinna korzystać z mniejszej liczby zmiennych na
stosie w pamięci. Ocena za jedną (dowolną) wersję – 6 punktów, za drugą – 2 punkty. Dane 32-
bitowe powinny być w wersji 64-bitowej traktowane jako 32-bitowe – jedynie operacje na adresach
są 64 bitowe.
Argumenty dla programu powinny być zadawane w linii polecenia, w celu ułatwienia testowania.
Moduł asemblerowy nie powinien wywoływać funkcji z biblioteki języka C. Argumenty dla
procedur operujących na bitach powinny być zadawane przez użytkownika w postaci
szesnastkowej. Procedury przetwarzające obrazy w formacie .BMP mogą otrzymywać jako
argument wskaźnik na bufor zawierający cały plik albo wskaźnik na samą strukturę obrazu i
informację o jego rozmiarach w postaci dwóch argumentów całkowitoliczbowych. Jeśli nie
zaznaczono inaczej, procedura powinna poprawnie przetwarzać obraz o dowolnych rozmiarach.
Należy unikać sekwencji skoków, zwłaszcza skoków bezwarunkowych następujących bezpośrednio
po skokach warunkowych. Próba oddania projektu jawnie niezgodnego konwencję wołania
powoduje stratę jednego punktu.
Przyporządkowanie projektów zgodnie z pozycjami na załączonej wyżej liście studentów
