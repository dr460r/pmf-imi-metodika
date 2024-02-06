# Radionica - _Space Shooter_ igrica u Godot-u

## Preuzimanje Godot-a

_Godot_ možemo preuzeti sa zvaničnog sajta [godotengine.org](https://godotengine.org/). Program zauzima svega nekoliko desetina megabajta.

## Kreiranje projekta

Nakon pokretanja aplikacije dobićemo prozor sa listom projekata koje imamo (za sada ih nemamo) i opciju da kreiramo novi projekat. Svaki projekat predstavlja jendu igricu ili aplikaciju, tako da ćemo kreirati jedan projekat za našu _Space Shooter_ igricu:

![New Project](img/01-new-project.png)

![New Project](img/02-new-project.png)

## Kreiranje prve scene

U _Godot_-u svaki vidljivi element ili element koji nosi neku funkcionalnost predstavljamo preko _Node_-a, tj. čvora. Ono što će ultimativno u igrici postojati kada je pokrenemo je gomila _Node_-ova povezanih u stablo, i svaki od njih doprinosi na neki svoj način. U kontekstu objektno-orjentisanog programiranja _Node_ je ekvivalent objektu, a _Godot_-u postoje ugrađene klase čije su instance različiti _Node_-ovi.

Jedan od načina da opišemo koje _Node_-ove želimo da imamo u igri i na koj način će oni međusobno biti povezani je da kreiramo takozvanu "scenu" (en. _Scene_). Scena je tekstualni fajl koga smeštamo među fajlove projekta napisan u sintaksi koja opisuje koji objekti (_Node_-ovi) će se instancirati u igri, kako će biti povezani u okviru stabla, koje vrednosti različitih svojstava će im se postaviti, itd.

Evo jednog primera fajla scene:

![Scene File Example](img/06-tscn-example.png)

Našu igru ćemo predstaviti jednom scenom. Možemo je kreirati na sledeći način:

![First Scene](img/03-create-first-scene.png)

Sa leve strane, u tabu _Scene_ možemo videti grafiku reprezentaciju strukture stbla koje _Node_-ovi (objekti) sačinjavaju a koja je opisa na u scene fajlu. Međutim, taj fajl još uvek ne postoji u našem projektu, to možemo videti u tabu same scene:

![First Scene](img/04-create-first-scene.png)

Zato ćemo sačuvati scenu, skraćenica `ctrl+s`:

![First Scene](img/05-create-first-scene.png)

Sada je scena sačuvana kao `level.tscn` fajl.

## Dodvanje Node-ova

Svak scena mora imati samo jedan _root_ _Node_, što naša nova scena i ima. Scenu smo nazvali _level_, i njenim instanciranjem želimo da dobijemo jedan _Node_, koga će sam _engine_ uzeti da koristi prilikom pokretanja igrice, ali želimo i da sadrži sve ostale elemente igrice, naravno predstavljene preko ugnježdenih _Node_-ova.

Evo primera kako da dodamo novi _Node_ u okviru ove scene (kao _child_ _Node_ od _root_ _Node_-a u ovoj sceni). Kreiraćemo _Node_ kome možemo dodeliti fajl nekom slikom kako bi mogao da bude vidljiv grafički u sceni:

![Add Node](img/07-add-sprite2d.png)

U scenu smo dodali informacije o kreiranju _Node_-a (objekat) tipa _Sprite2D_ (klasa). Sa desne strane se nalazi panel _Inspector_ koji prikazuje osobine koje će izabrani _Node_ imati kada bude bio instanciran.

![Inspector](img/08-sprite2d-properties.png)

U fajlovima projekta se nalazi _Godot_ ikonica (`icon.svg`) koju možemo iskoristiti kao sliku _Node_-a. Postavićemo _texture_ svojstvo _Node_-a na putanju do fajla slike:

![Texture Quick Load](img/09-texture-quick-load-01.png)

![Texture Quick Load](img/09-texture-quick-load-02.png)

![Texture Quick Load](img/10-texture-quick-load-03.png)

Sada, kada smo povezali _Node_ i sliku, ona je vidljiva na sceni na lokaciji tog _Node_-a. Po ovom principu funkcionišu i ostali tipovi _Node_-ova i njihova svojstva.

Možemo krenuti sa radom na ostalim delovima igrice.

## Struktura projekta

Projekat ćemo organizovati tako da se sastoji iz 4 scene, gde svaka opisuje kako će se kreirati _Node_ (zajedno sa svojim stablom _child_ _Node_-ova) za svaki od galvnim elemenata igrice. Ti elementi su:
* _Level_ - Instancira se prilikom pokretanja igrice. U njemu se instanciraju sve ostale scene.
* _Ship_ - Reaguje na input igrača, može da se kreće horizontalno i da ispaljuje rakete.
* _Rocket_ - Kada se instancira kreće se vertikalno na gore. Prilikom udara u asteroid uništava se i igrač dobija poen.
* _Asteroid_ - Kada se instancira kreće se vertikalno na dole. Prilikom udara brod ili raketu uništava se.

![Game Elements](img/11-game-elements.png)

U nastavku ćemo realizovati sve elemente igrice.


