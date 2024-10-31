# Hardware zadanie 1
Do pomiaru prądów rzędu 50A metoda pomiaru prądu przez pomiar spadku napięcia przez rezysotor pomiarowy jest nie właściwa przez duże duży spadek napięcia oraz oraz straty może straty mocy. Przyjmując że rezystor pomiarowy ma 10 $m\Omega$, spadek napięcia przy prądzie 50A będzie wynosił 0.5V co w przypadku napięcia zasilania 24V jest zbyt dużą startą, a moc tracona przez ten spadek napięcia wynosiłą by 25W.
Rozwiązaniem do tego problemu jest wykorzystanie układu który wykorzystuje zjawisko Halla. Układy które spełniają najważniejsze wymagania tj. możliwość pomiaru do 50A to:

1. [ACS71240LLCBTR-050U5](./ACS71240-Datasheet.pdf)
   - zasilanie: 5V
   - pomiar: 0A do 50A
2. [ACS71240LLCBTR-050B3](./ACS71240-Datasheet.pdf)
   - zasilanie: 3.3V
   - pomiar: -50A do 50A
3. [MCS1805GS-350-U](./MCS1805GS.pdf)
   - zasilanie: 3.3V
   - pomiar: 0A do 50A

Najlepszym wyborem byłby 3. układ ponieważ pozwoliłby na bezpośrednie podłacznie wyjścia z układu do ADC i wykorzystanie najlepiej zakresu konwerter bez konieczności użycia dodatkowy elementów do modyfikacji sygnału, lecz ten układ jest aktualnie nie dostępny.

układ 1. i 2. spełniałyby wszystkie wymagania, ale w przypadku 2. zakres pomiaru jest bipolarny co w przypadku gdy spodziewamy się jedynie prądu unipolarnego jest nie korzystne ponieważ tracimy połowę zakresu konwertera A/D. Układ 1. pozwala na pomiar unipolarny, ale jest zasilany 5V co powoduje to że nie tylko jest potrzebne inne napięcie zasilanie niż do konwertera to wyjście układu będzie w przedziale większym niż zakres ADC.

W przypadku gdy precyzja pomiaru jest mniej istotna niż rozmiar obowdu na PCB wybrałbym opcję drugą ponieważ pozwala na bezpośrednie połączenie wyjścia do ADC.
W przypadku gdy w systemie jest dostępne zasilanie 5V wybrałbym układ pierwszy i dodał prosty dzielnik napięciowy na wyjściu układu aby zmniejszyć zakresy do 3.3V, w razie potrzeby gdy na przykład gdy sygnał nie trafia jedynie do ADC dodałbym buffer.
Jeśli jest dostępne jedynie zasilanie 3.3V i trzeba wykorzystać cały zakres ADC jedyną opcją jest układ drugi i dodanie obwodu skalującego oraz odejmujący.

[Schemat](./curret_sensor/curret_sensor.pdf)

