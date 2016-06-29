#Movimento e tempo

##PROBLEMA
Le automobili sono il principale mezzo di locomozione in Italia, l’aumento  dal 2004 ad oggi è stato di 4 milioni, in totale circa 37 milioni di auto (610 ogni 1000 abitanti) [Dati ACI](http://www.comuni-italiani.it/statistiche/veicoli.html).
Quando noi siamo in automobile il tempo che impieghiamo per utilizzarla crea due principali inconvenienti: inquinamento e per la maggior parte dei "casi" la perdita di tempo per arrivare in un luogo.
La maggior parte delle persone non si chiede quanto tempo impiega sul mezzo di trasporto, o lo spazio di percorrenza da una zona all'altra, ne tantomeno quanto sta inquinando l'ambiente o la salute delle persone. 

##IDEA
L'idea è di portare in rapporto i due termini di paragone, movimento e tempo, rendendoli visibili e comprensibili attraverso 
una data visualization. Questo per rendere consapevole lo spreco sia di tempo che di energia consumata (molto spesso si utilizza un mezzo di trasporto solo per nn voglia e per fare solo piccoli spostamenti che potrebbero essere fatti anche a piedi o con una semplice bicicletta).
Per rendere vivi i dati pensavo di realizzare una mappa con le linee dei percorsi che si effettuano con le automobili evidenziando le zone "buone" da quelle "cattive", vedere quantità di tempo e movimento "sprecate" ottenendo una quantità effettiva(Es. "Quest'anno hai perso 28 giorni in automobile" o lo spazio di percorrenze in rapporto con il tempo sprecato e i consumi), evidenziare il tempo effettivo che stiamo su un mezzo di trasporto con l'impossibilità di fare altro ed osservare altro. Posso risparmiare per me e per gli altri? Come potevo spendere quei giorni in altro modo? 

Pensavo di presentare i dati settimanalmente, mensilmente ed annualmente in modo da avere la possibilità di vedere la propria variazione nel lasso di tempo. Potrebbe essere intrapreso anche l'utilizzo in termini di media, legati all'intero stato, in modo da ottenere un panorama più amplio e completo.

Credo che il format più corretto per ricevere e modificare i dati, si quello della web App o dell'applicazione nativa per smartphone.
Credo posso considerare anche dispositivi come smartband o smartwatch per il recupero dei dati.

##DATI
Per quanto riguarda i numeri, che dovrebbero far funzionare questo sistema di visualizzazione, pernsavo di prenderli direttamente da smartphone ed in tempo real: il tempo di percorrenza sarà in base ai dati di posizione e spostamento, sfruttati anche da applicazioni come Google Fit, quindi GPS accelerometro e giroscopio del device. Il problema sarà quello di intrecciare i dati al fine di ottenere una divisione corretta rispetto al mezzo di trasporto utilizzato, quindi calcolare la velocità tramite accelerometro, spazio e tempo di percorrenza. 

Per quanto riguarda i consumi (indicativi), potrei avvalermi dei dati forniti dal costruttore di auto e applicare una media rispetto al percorso intrapreso con il mezzo. Sto ancora valutando se eventualmente conviene far fare una selezione all'utente per il proprio mezzo, ad esempio la cilindrata e il tipo di carburante in uso, ottenendo così un dato indicativo di emissioni.


REFERENCE
- _How much have we polluted?_ [+](http://www.elkanodata.com/co2/)     
- _Mapped by city_ [+](http://www.theguardian.com/news/datablog/interactive/2013/jan/16/exposure-air-pollution-mapped-by-city) 
- _Bear71_ [+](http://visual.ly/bear-71?view=true)
- _I-Remeber_ [+](http://i-remember.fr/en )   
- _George & Jonathan_ [+](http://www.georgeandjonathan.com/#8)

##WHAT IF
Potrebbe essere interessante analizzare l'intero tempo sprecato e renderlo visibile: ad esempio, il tempo sprecato nei social network, dormire troppo ed in generale eccedere in attività che creano dipendenza o da cui dipendiamo involontariamente (es. automobile, pulizie non condivise, videogames).
