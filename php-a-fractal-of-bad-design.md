# PHP: fraktal złego projektu

## Wstęp

Bardzo łatwo mnie zirytować. Narzekam na wiele rzeczy. W świecie technologii jest mnóstwo rzeczy których nie lubię
i w zasadzie nie ma w tym niczego dziwnego - programowanie jako dziedzina jest śmiesznie młode i nikt z nas nie ma
bladego pojęcia co robi. Połączmy to z [prawem Sturgeona](https://en.wikipedia.org/wiki/Sturgeon%27s_law) i będę miał
materiał do narzekania przez całe życie.

Ale to nawet nie jest kwestia powyższego. Nie chodzi o to że PHP jest trudny w użyciu, nieprzystowany do tego co jest mi potrzebne,
nieoptymalny czy niezgodny z moją religią. Mogę wymienić masę dobrych rzeczy o jęzkach programowania których unikam
albo tonę wad w językach których używam. Pytajcie śmiało – doskonały temat na rozmowę.

PHP jest jedynym wyjątkiem. Praktycznie każda cecha PHP jest w jakiś sposób zepsuta. Język, framework i ekosystem –
wszystkie te elementy są po prostu złe. Cały system jest tak skopany że nie jestem w stanie skazać pojedynczej przyczyny
tego stanu. Za każdym razem kiedy próbuję stworzyć listę bzdur w PHP to utykam w trakcie wyszukiwania w głąb odkrywając
co raz to więcej głupot (stąd fraktal).

PHP to wstyd, to ujma dla mojego zawodu. Jest zepsuty do granic możliwości a jednocześnie na jego cześć śpiewane są peany przez amatorów którzy w życiu jeszcze nie widzieli niczego innego. Jest marna garść cech które jakkolwiek wynagradzają niedociągnięcia tego języka. W zasadzie to wolałbym w ogóle zapomnieć o jego istnieniu.

Ale muszę to z siebie wyrzucić. Do trzech razy sztuka.

## Porównanie

Podczas mojej rozmowy z Mel wyrzuciłem z siebie poniższy wywód w celu opisania mojej frustracji. Umieszczam go tutaj
ponieweż bardzo na to nalegała.

> Nie jestem w stanie nawet dokładnie powiedzieć co z PHP jest nie tak bo– dobra. Wyobraź sobie że masz ee, skrzynkę z
> narzędziami. Zestaw narzędzi. Wygląda dobrze, standardowe narzędzia.
>
> Wyciągasz śrubokręt i spostrzegasz że to jeden z tych takich wichajstrów z trójkątną końcówką. Niezbyt użyteczne w tym
> momencie ale w końcu się przyda.
>
> Wyciągasz młotek, ku Twojemu zdziwieniu okazuje się że rąb znajduje się po *obu* stronach. Nie jest to koniec świata –
> gwoździe można wbijać środkiem klinu trzymając go poziomo.
>
> Wyciągasz kombinerki, okazuje się że ich wewnętrzna część jest całkowicie gładka. Zdecydowanie mniej użyteczne ale
> nadal się da nimi obracać śruby. No trudno.
>
> I tak do końca. Wszystko w skrzynce jest jakieś dziwne ale nie na tyle żeby była *całkowicie* bezużyteczna.
> Konkretnego problemu nie ma również z całym zestawem; wciąż ma wszystkie narzędzia.
>
> A teraz wyobraź sobie że spotykasz setki cieśli używających tego zestawu narzędzi którzy mówią Ci: "No ale jaki jest
> problem z tymi narzędziami? Zawsze ich używam i działają". I każdy z nich pokazuje Ci dom który zbudował, każdy z nich
> ma pokoje w kształcie pięciokąta, w każdym z nich dach jest do góry nogami. W momencie gdy pukasz do drzwi to te
> zapadają się do wewnątrz a cieśla drze się na Ciebie bo zepsułeś mu drzwi.
>
> Dokładnie taki jest problem z PHP.

## Teza

Twierdzę, że poniższe własności są *ważne* jeżeli język programowania ma być użyteczny i PHP narusza każdą z nich na
każdym kroku. Jeżeli nie zgadzasz się że te cechy są krytyczne to nie widzę w jaki sposób mielibyśmy być zgodni na jakikolwiek temat.

* Język musi być **przewidywalny**. Jest to sposób wyrażania ludzkich pomysłów w sposób taki który pozwoli komputerowi
na wykonanie go. Niezbędne zatem jest żeby człowiek poprawnie interpretował kod źródłowy.
* Język musi być **spójny**. Podobne rzeczy powinny wyglądać podobnie, różne rzeczy powinny wyglądać różnie. Poznanie części języka powinno służyć zrozumieniu i poznaniu jego reszty.
* Język musi być **zwięzły**. Nowe języki powstają po to żeby redukować ilość zbędnego kodu obecnego w starych językach (wszysycy *moglibyśmy* pisać kod maszynowy). Zatem język programowania powinien unikać dodawania dodatkowego "bagażu" od siebie.
* Język musi być **niezawodny*. Języki programowania są narzędziami do rozwiązywania problemów; powinien zatem minimalizować ilość wprowadzanych przez siebie problemów. Jakiekolwiek haczyki rozpraszają uwagę.
* Język musi dać się **debugować**. Jak coś pójdzie nie tak to programista *musi* to naprawić. A w tym celu potrzebna jest nam każda pomoc jaką możemy otrzymać.

Twierdzę zatem że:

* PHP jest pełen niespodzianek: `mysql_real_escape_string`, `E_ALL`
* PHP jest niespójny: `strpos`, `str_rot13`
* PHP wymaga pisania zbędnego kodu: sprawdzanie błędów wokół wywołań z API C, `===`
* PHP zawiera pełno haczyków: `==`, `for each ($foo as &$bar)`
* PHP jest czarną skrzynką: stos wywołań nie jest pokazywany domyślnie, złożone raportowanie błędów

Nie będę się rozwodził dlaczego każdy z tych problemów przypada właśnie do tej kategorii bo to by się nie skończyło. Myślenie zostawiam czytelnikowi.

# Nie wytaczaj poniższych argumentów

Brałem udział w *dużej* ilości dyskusji dotyczących PHP. W ich trakcie miałem okazję usłyszeć wiele ogólnikowych kontrargumentów mających na celu natychmiastowe zakończenie dyskusji. Proszę o nie wytaczanie ich.

* Nie mów mi że "dobry developerzy mogą pisać dobry kod w dowolnym języku" albo że "źli developerzy coś tam". To *nic* nie znaczy. Dobry cieśla *może* wbijać gwoździe kamieniem albo młotkiem ale ilu cieśli machających kamieniami widziałeś? Częścią tego co czyni developera dobrym jest umiejętność *dobrania* odpowiedniego narzędzia
* Nie mów mi że obowiązkiem developera jest zapamiętnie tysiąca dziwnych wyjątków i dziwnych zachowań. Tak, jest to niezbędne w wielu systemach dlatego ze komputery są głupie. Aczkolwiek nie oznacza to że nie ma górnego limitu na ilość dziwnych zachowań akceptowalnych w systemie. PHP jest niczym tylko wyjątkami i nie jest okej gdy siłowanie się z językiem zajmuje więcej czasu niż pisanie programu. Moje narzędzia nie powinny mi generować dodatkowej pracy.
* Nie mów mi że "po prostu tak działa API C", po co, u diabła, używać języka wysokiego poziomu jeżeli jedyne co on udostępnia to kilka funkcji pomocnicznych do obsługi ciągów znaków i wrapperów na identyczne funkcje w C? Po prostu pisz w C! Jest nawet [biblioteka CGI](http://www.boutell.com/cgic/) służaca do tego.
* Nie mów mi "czego się spodziewasz robiąc dziwne rzeczy". Jeżeli istnieję dwie funkcje to w końcu kiedyś ktoś znajdzie powód na to żeby użyć ich ze sobą. Po raz kolejny, to nie jest C; nie ma specyfikacji, nie ma potrzebny na "undefined behaviour".
* Nie mów mi że Facebook i Wikipedia są napisane w PHP. Zdaję sobie z tego sprawę. Dopóki znajdą się ludzie na tyle sprytni żeby rozwiązać problemy związane z platformą to równie dobrze mogliby je napisać w Brainfucku. Czas pisania tych aplikacji mógłby się podwoić albo skrócić o połowę gdyby pisano je w innym języku. Sam fakt że są napisane w PHP nic nie znaczy.
* W zasadzie to możesz mi nic mówić. Jeżeli ta lista nie niszczy Twojej opinii o PHP to *nic* jej nie zmieni więc możesz przestać wykłócać się z losowym gościem z internetu i zrobić świetną stronę w rekordowym czasie żeby udowodnić mi że nie mam racji :)

Tak ma marginesie: ubwielbiam Pythona. I mogę na niego narzekać tak długo że odpadną Ci uszy jeżeli bardzo tego pragniesz. Nie twierdzę że jest *perfekcyjny*; po prostu porównałem jego zalety i wady i doszedłem do wniosku że najbardziej pasuje do tego co chcę robić.

I nigdy nie spotkałem developera PHP który byłby w stanie zrobić to samo z PHP. Ale spotkałem dużo developerów którzy bardzo szybko przepraszali za wszystko co PHP robi. Takie nastawienie jest przerażające.

## PHP

### U podstaw

CPAN jest nazywany "standardową biblioteką Perla". To nie mówi zbyt wiele o standardowej bibliotece Perla ale z
pewnością świadczy o tym że na dobrych fundamentach można tworzyć wielkie rzeczy.

#### Filozofia

* PHP został stworzony z myślą o nieprogramistach (co za tym idzie – do nieprogramów); odejście od korzeni nie za bardzo
  mu się udało. Przytoczmy cytat z dokumentacji [PHP 2.0](http://www.php.net/manual/phpfi2.php#overload) na temat
  dlaczego `+` i spółka dokonują automatycznej konwersji typów:

  > Tworzenie osobnych operatorów dla każdego z typów czyni język zdecydowanie bardziej złożonym, np. nie możesz użyć
  > `==` dla ciągów znaków [sic], i musisz użyć `eq`. Nie widzę żadnego powodu żeby to robić, szczególnie w PHP gdzie
  > większość skryptów jest prosta pisana przez nieprogramistów pragnących niezbyt trudnego języka z
  > podstawową składnią logiczną.

* PHP jest skonstruowany tak by działać za wszelką cenę. Kiedy wybór przybiera postać "zrób coś bezsensownego" lub
  "wyrzuć błąd" PHP wybierze to pierwsze. Coś jest lepsze niż nic.

* Nie ma klarownej wizji. Wczesne wersje PHP czerpały z Perla; wielki stdlib jest wzorowany na C a elementy obiektowe
  przypominają C++ i Javę.

* PHP inspiruje się wieloma językami aczkolwiek w jakiś sposób udaje mu się pozostać niezrozumiałym dla kogokolwiek kto
  *zna* te języki. `(int)` wygląda jak C ale `int` nie istnieje. Przestrzenie nazw używają `\`. Nowa składnia dla
  tablicy to `[klucz => wartość]` co praktycznie w każdym innym języku oznacza słownik.

* Słabe typowanie (automatyczna konwersja między liczbami/ciągami znaków/czymkolwiek) jest tak złożone że jakikolwiek
  wysiłek programistyczny niwelowany przez nią nie jest jej wart.

* Niewielka ilość nowej funkcjonalności jest implementowana jako składnia; większość jest implementowana jako funkcje
  albo rzeczy które wyglądają jak funkcje. Poza wsparciem dla klas które zasłużyło na garść nowych operatorów i słów
  kluczowych.

* Niektóre z tych problemów mają rozwiązania od producenta - pod warunkiem że chcesz płacić Zendowi za poprawianie ich
  własnego języka open-source.

* Wiele rzeczy dzieje się gdzieś daleko od kodu. Rozważmy poniższy kod gdzieś z dokumentacji PHP

  `@fopen('http://example.com/not-existing-file', 'r');`

  Co się stanie?

  * Jeżeli PHP było skompilowane z `--disable-url-fopen-wrapper` to nie zadziała (dokumentacja nie mówi co "nie
    zadziała" oznacza; zwraca null, rzuca wyjątek?). W PHP 5.2.5 ta flaga została usunięta.

  * Jeżeli `allow_url_fopen` jest wyłączone w php.ini to wciąż nie zadziała (Jak? Nie mam zielonego pojęcia.).

  * Ponieważ użyto `@` ostrzeżenie o nieistniejącym pliku nie zostanie wyświetlone.

  * Ale zostanie wyświetlone jeżeli `scream.enabled` w php.ini jest włączone.

  * Albo jeżeli włączyłeś je przez `ini_set`.

  * Ale nie jeżeli `error_reporting` nie jest ustawione na odpowiednią wartość.

  * Nawet jeżeli *jest* wyświetlanie to gdzie zależy od `display_errors` w php.ini, albo ini_set.

  Nie jestem w stanie powiedzieć jak taka niewinna funkcja będzie zachowywała się bez znajomości flag z którym
  kompilowano mój interpreter, konfiguracją serwera i konfiguracją mojej aplikacji. A to wszystko to *wbudowane*
  zachowanie.

* PHP jest pełne globalnych stanów i implicit state. `mbstring` używa globalnego zestawu znaków. `func_get_arg` i spółka
  wyglądają jak normalne funkcje ale działają w kontekście obecnie wywoływanej funkcji. Obsługa błędów/wyjątków ma
  globalne ustawienia domyślne. `register_tick_function` ustawia globalną funkcję która wywoływana jest z każdym
  tickiem - że co?!

* Nie ma absolutnie żadnego wsparcia dla wątków (nic dziwnego biorąc pod uwagę powyższe) co połączone z brakiem
  wbudowanego `fork` (o czym później) czyni programowanie równoległe ekstremalnie trudnym.

* Niektóre elementy PHP są praktycznie *zaprojektowane* tak żeby tworzyły kod podatny na błędy:

  * `json_decode` zwraca null dla nieprawidłowego wejścia mimo tego że null jest całkowicie poprawnym wynikiem
    dekodowania JSON-a. Funkcja ta jest całkowicie zawodna dopóki nie wywołujesz `json_last_error` za każdym razem kiedy
    jej używasz.

  * `array_search`, `strpos` i inne podobne funkcje zwracają `0` jeżeli znajdą igłę na pozycji 0 ale zwracają fałsz
    jeżeli w ogóle go nie znajdą.

    Pozwól że rozwinę nieco ostatni element.

    W C, funkcje typu `strpos` zwracają `-1` jeżeli element nie został znaleziony. Jeżeli nie sprawdzisz tego warunku i
    spróbujesz użyć tego jako indeksu to trafisz w jakiś region pamięci i Twój program eksploduje (Prawdopodobnie. To w
    końcu C więc diabli wiedzą aczkolwiek jestem pewien że są do tego narzędzia).

    Pythonowy odpowiednik – `.index` wyrzuci wyjątek jeżeli dany element nie zostanie znaleziony. Jak nie sprawdzisz
    tego warunku to Twój program również eksploduje.

    Ale w PHP te funkcje zwracają fałsz. Jeżeli użyjesz `FALSE` jako indeksu albo zrobisz z nim cokolwiek innego za
    wyjątkiem porównania przez `===` to PHP po cichu rzutuje to na `0`. Twój program nie wybuchnie. Zamiast tego zrobi
    jakąś *durną* rzecz bez kompletnie *żadnego ostrzeżenia* dopóki nie będziesz pamiętał o opakowaniu każdego wywołania
    `strpos` w zbędną logikę.

    To jest złe! Języki programowania są narzędziami – powinny ze mną *współpracować*. Natomiast w tym przypadku PHP
    aktywnie zastawia na mnie płuapkę w którą mogę wpaść gdy nie zachowuję czujności nawet przy tak banalnych czynności
    jak operacje na ciągach znaków i porównywanie. PHP to *pole minowe*.

Słyszałem wiele historii na temat interpretera PHP i [jego twórców](http://en.wikiquote.org/wiki/Rasmus_Lerdorf) z wielu
różnych źródeł. Pochodzą one od ludzi którzy pracowali nad [jądrem PHP](http://www.reddit.com/r/lolphp/comments/qeq7k/php_540_ships_with_82_failing_tests_in_the_suite/), [debugowali jądro PHP](http://perlbuzz.com/2008/09/optimizing-for-the-developer-not-the-user-php-misses-again.html), obcowali z twórcami jądra PHP. Żadna z tych opowieści nie jest pochlebna.

Muszę więc to tutaj napisać bo trzeba to podkreślić: PHP jest społecznością amatorów. Niewiele ludzi projektujących go,
pracujących nad nim lub piszących w nim kod ma w ogóle pojęcie co robi (Ty, drogi czytelniku oczywiście jesteś rzadkim
wyjątkiem!). Ci którzy w końcu zaczynają *coś* rozumieć ochodzą w kierunku innych platform, efektywnie redukując średni
poziom pozostałych. I to właśnie to jest największy problem PHP: ślepi wiodący ślepych.

Dobra, wracamy do konkretów.
