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
