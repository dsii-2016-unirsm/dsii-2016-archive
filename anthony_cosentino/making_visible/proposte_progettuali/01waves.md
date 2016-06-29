#Making Visible

##[01] Waves

###Abstract
Negli ultimi decenni lo spazio è divenuto il principale mezzo di propagazione delle informazioni digitali, diventando una vera e propria autostrada dei dati.
Waves 01 vuole raccontare i processi attraverso i quali avviene il trasferimento di questi via etere, rilevando le onde elettromagnetiche di uno spazio e restituendole sotto forma di flussi sonori e visivi in continuo mutamento.

###Dataset
####Onde elettromagnetiche
Gli spazi in cui viviamo sono quotidianamente immersi in un universo invisibile, una sub architettura con cui conviviamo e che oggi più che mai definisce il nostro “essere” nel mondo virtuale: le onde elettromagnetiche. Lo spazio è la “linea di connessione” attraverso il quale si propagano i segnali, e fornisce le basi per la trasmissione di qualsiasi tipo di informazione sotto forma di dati binari (sequenze di zero e uno). <br>

Nella fase di ricerca, ho riflettuto sulla possibilità di utilizzare un dato variabile nel tempo e reperibile facilmente nell’ambiente, senza la necessità di ricorrere a dispendiosi metodi di rilevazione. Da qui l’idea di rilevare la frequenza delle onde elettromagnetiche, grazie alle quali i dati viaggiano e si spostano nello spazio sotto forma di segnali. Con l’acquisizione di questo dato, tuttavia, non è possibile rilevare realmente il tipo di informazione contenuta in un’onda, per far ciò sarebbero necessari altri mezzi e tecniche, pertanto lo scopo del progetto è quello di rendere visibile un “processo” e concettualizzarlo per uno scopo di visualizzazione e sonorizzazione.


####Modalità di acquisizione e codifica
Per trasmette un messaggio per mezzo di onde elettromagnetiche, sia esso suono, immagine o testo, occorre procedere alla sua trasformazione in forma numerica ricorrendo alla sua trasformazione con una sequenza di 0 e 1 (sì/no, acceso/spento, presenza/assenza di segnale). Ogni valore determinato viene associato a due frequenze, elettrica e magnetica. In fase ricevente, viene rilevata tale variazione di frequenze e, passando nuovamente attraverso il codice binario, vengono riconvertite nel messaggio originario per poter essere fruite dall’uomo.


####Contesto
Il progetto nasce e si sviluppa all’interno delle aule dell’Università degli Studi della Repubblica di San Marino dove, studenti di design alle prese con dispositivi mobile e laptop sono connessi alla rete generando un’enorme quantità di informazioni che vengono trasferite da un luogo a un altro. Trattandosi di un’installazione audio-visiva costituita da pochi e semplici elementi qualsiasi luogo, potenzialmente, può diventare teatro di tale esperienza. Infatti la presenza di dispositivi elettronici è sufficiente a provocare variazioni di campo elettromagnetico che generano risultati visivi e sonori in continuo mutamento.


####Referenze
Nel percorso è stato fondamentale scoprire personaggi e autori di opere che, direttamente e indirettamente, hanno influenzato le mie scelte progettuali. Su tutti Ryoji Ikeda, sound-visual artist giapponese che, con “The Transfinite”, il cui titolo evoca uno spazio che va al di là delle dimensioni percettibili, realizza un’opera monumentale proiettata su una parete di 54x40 metri. L’installazione mira a suscitare suggestioni visive e sonore, in cui il visitatore viene sommerso da dati che nel loro evolversi creano effetti psichedelici che rimandano ad un immaginario del mondo digitale, il tutto attraverso l’uso sapiente di luci, ombre, musiche e suoni. Altri progetti di riferimento:  Data.Matrix, Data.Path.

Un altro progetto utile al mio scopo, seppur indirettamente, è “Sound on Intuition” di Pieter Jan-Pieters, un prototipo costituito da diverse componenti hardware che trasformano il corpo umano in uno strumento musicale. Grazie a questo ho potuto indagare e approfondire concetti legati alla mappatura midi che ho successivamente sfruttato per lo sviluppo della parte sonora del mio lavoro. 

Per l’acquisizione del dato è stato utile il progetto delle due designer italiane Cora Bellotto e Laura Malinverni con il loro “Gusho- Reactive protective dress”. Consiste in un vestito reattivo che  in presenza di un aumento delle radiazioni elettromagnetiche attiva una reazione meccanica e si trasforma in un rifugio protettivo, grazie all’utilizzo di un tessuto schermante.<br>

Sound On Intuition By Pieter-Jan Pieters (https://vimeo.com/51611669)<br>
The Transfinite By Ryoji Ikeda (https://www.youtube.com/watch?v=omDK2Cm2mwo)<br>

###Progetto
In breve
Il dato viene acquisito tramite ARDUINO UNO ed è definito, come spiegato precedentemente, dalla frequenza del campo elettromagnetico in un range di valori che va da 30 Hz a 10 GHz (range che comprende i dispositivi di uso comune).

Alcuni esempi:
Radio AM 526 - 1606 Hz;
Televisore 460 - 870 MHz;
Telefoni cellulari 1,2 - 2,2 MHz;
Microonde 2,4 GHz;
WiFi 5 GHz;

PROCESSING elabora e converte il dato acquisito in codice binario che viene rappresentato a schermo come un insieme di linee verticali bianche e nere.

#####Hardware
Nella fase di prototipazione hardware mi sono avvalso dell’utilizzo di Arduino Uno come componente principale per la rilevazione del dato. Sulla scheda principale sono state applicate una resistenza da 3,3 MegaOhm e un cavo sguainato che funge da antenna. Inoltre ho applicato un led ad alta luminosità al fine di ricevere un feedback in tempo reale sulle variazioni di campo.

Il supporto fisico si compone di una cornice di dimensioni 100x40 cm alla base della quale è applicato uno specchio. La parte interna è composta da 200 led di cui 100 nella parte superiore e 100 nella parte inferiore della cornice. L’intera cornice sarà coperta da un ulteriore lastra in vetro oscurato.
Grazie alle riflessioni della luce all’interno della cornice si verranno a creare illusioni ottiche che simulano uno spazio infinito.

#####Software
Arduino: il codice di programmazione della scheda è disponibile sulla rete, già nel 2009 Aroon Alai con pochissimi strumenti era riuscito a rilevare i campi elettromagnetici generati da dispositivi di uso comune; nel mio progetto ho fatto uso di tale codice variando alcune funzioni relative alla mappatura dei valori.


Processing: grazie ad una procedura di “porting” tra Arduino e Processing il dato rilevato viene trasferito ed elaborato in tempo reale.

Step 1 consiste nel convertire il valore ricevuto da decimale a binario, successivamente il software viene istruito per svolgere la seguente operazione: “se il valore riportato è 1 disegna un rettangolo bianco, se 0 disegna un rettangolo nero”. Questa fase “condizionale”, come vedremo successivamente, determina la quasi totalità dei meccanismi di funzionamento.

Step 2 - Parte sonora - in questa fase ho utilizzato la libreria oscP5 di processing e il software di editing audio, Ableton Live. L’OSC (Open Sound Control),  è un protocollo di trasmissione che permette di scambiare “music performance data” in tempo reale attraverso una semplice rete interna (TCP/IP, Ethernet) o internet.
Secondo il principio “condizionale” di cui sopra, se il valore riportato è =1 Processing comunica ad Ableton di riprodurre in sequenza le clip all’interno di una traccia, se il valore è =0 smette di riprodurre le clip precedenti riproducendone delle altre all’interno di una seconda traccia.

####Suoni
Scelta dei suoni

Per la parte sonora ho dato sfogo alla mia immaginazione pensando ai dati come ad auto che transitano a velocità sulle grandi strade di una città, ai rumori che esse generano e alle difficoltà che incontrano nel loro percorso, congestioni, semafori etc.
Ho utilizzando quindi suoni del paesaggio urbano, auto che sfrecciano, clacson, come metafora del traffico e transito dei dati sull’autostrada delle onde elettromagnetiche, filtrati con degli effetti sonori che fungano da “collante” con i suoni in background rievocando nell’immaginazione dello spettatore uno paesaggio digitale.

###Sviluppi futuri

Work in Progress
