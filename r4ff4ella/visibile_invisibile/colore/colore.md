# COLORE

colore/sensazione/oggettività/energia/onde/luce/vibrazione


## ABSTRACT

Il colore è l’elemento visibile per eccellenza.  
Siamo abituati a pensarlo come una qualità intrinseca di ciò che osserviamo, ma in realtà è una sensazione soggettiva, che dipende da molteplici fattori. 
La sua oggettività risiede nella sua natura fisica di radiazione elettromagnetica, quindi fenomeno ondulatorio.

##CONCEPT

La realtà fisica di ciò che ci circonda è spesso invisibile.
Questo ci porta a stime basate solo sulle nostre sensazioni: quello che percepiamo come reale. 
Ma, come per ogni ambito della nostra esistnza, sarebbe auspicabile riuscire ad andare oltre ciò che appare e focalizzare l’attenzione sull’ effettività delle cose.
Questo è ben rappresentato dal colore, ciò che caratterizza e definisce il mondo che osserviamo, ma di cui non cogliamo la fisicità.


##ANALISI

Il colore non è una grandezza fisica, ma una qualità della sensazione visiva e come tale è un’entità puramente soggettiva ed incomunicabile. Le informazioni che ognuno di noi elabora rispetto ai colori che osserva sono molto personali, mediate da esperienze e riferimenti.
Il colore percepito dipende infatti da diversi fattori quali la sorgente luminosa, il materiale dell’oggetto di cui si osserva il colore e l’osservatore .

###Fisiologicamente

La sensazione di colore è un’esperienza dovuta alla stimolazione dei fotorecettori dell’occhio (coni visione tricromatica) da parte di una radiazione elettromagnetica visibile (la luce);

###Fisicamente

Per radiazione si intende la propagazione di energia tramite onde. Ogni onda è descritta attraverso lunghezza d’onda e frequenza.
La relazione esistente tra energia di un onda e la sua lunghezza è inversamente proporzionale. Questo vuol dire che maggiore sarà la lunghezza d’onda, minore sarà l’energia condotta dall’onda.


##L’INSTALLAZIONE

E’ realizzata in uno spazio essenzialmente vuoto illuminato da lampade Led RGB. La luce colorata sarà elemento invasivo e protagonista dello spazio.
Al centro sarà posta una corda tesa ancorata dal soffitto ad una base, provvista di sensore piezoelettrico, mentre la parete frontale sarà adibita a proiezioni.
Il visitatore pizzicherà la corda, che vibrando, più o meno intensamente, produrrà il dato rilevato dal sensore, e simulerà una lunghezza d’onda dello spettro visibile. Tale dato verrà trasformato attraverso un algoritmo in valori RGB che determineranno il colore della luce nella stanza; contemporaneamente verrà proiettata sulla parete frontale la riproduzione in scala d’ingrandimento 1milione :1 dell’onda generata pizzicando la corda che produce il colore della stanza.
L’intento è  quello di far percepire il colore al di la della sensazione cromatica,  avvicinandolo alla sua oggetività fisica: una certa forza produce un energia misurabile e determina un colore.


![](http://i.imgur.com/IsNvUCi.png)

##DATI E FUNZIONAMENTO
Per seguire un ragionamento coerente è opportuno trasformare i dati in modo che si arrivi infine al colore (perche ogni lunghezza d’onda dello spettro visibile è rappresentabile come un colore, ma non viceversa).
I dati necessari all’installazione saranno raccolti real time, attraverso un sensore piezoelettrico, che rileverà l’intensità della vibrazione di una corda; questa potra essere pizzicata più o meno intensamente.  Verranno stimati dei valori minimi e massimi, che questo dato può assumere, in modo da definire un range che verrà mappato, secondo una relazione inversamente proporzionale, su quello dei valori delle lunghezze d’onda dello spettro visibile.
Quindi ad ogni lunghezza d’onda corrisponderà un colore dello spazio RGB.
I dati verranno quindi trasformati attraverso un algoritmo, realizzato  a partire da un codice FORTRAN. In linea di massima questo algoritmo trasforma valori di lunghezze d’onda in codici colore CIE XYZ in codici colore RGB.


![](http://i.imgur.com/dfwQL2J.png)



##STATO DEI LAVORI

###Prototipo software 

Processing : funzionante la parte relativa ai valori RGB, da implementare la parte reativa alla proiezione dell’onda.
Arduino : funzionante ma probabilmente da migliorare.

###Prototipo Hardware

 Arduino 1 + sensore piezoelettrico + Led RGB 
 
 
 ![](http://i.imgur.com/1rBhDnC.png)

 
 
###Risorse

Codice Javascript per convertire le lunghezze d'onda dello spettro visibile (range di valori da 380 a 780 nm) in colori RGB [qui ](http://scienceprimer.com/javascript-code-convert-light-wavelength-color). 

Codice FORTRAN per valori indicativi RGB per lunghezze d'onda visibili [qui ](http://www.physics.sfasu.edu/astro/color/spectra.html). 


### Rifermenti
[_TED: I listen to color, Neil Harbisson ](https://www.ted.com/talks/neil_harbisson_i_listen_to_color)


installazioni basate sul colore_percezione/spazio


[_Multiple shadow house 2010_, Olafur eliasson ](http://olafureliasson.net/archive/artwork/WEK100053/multiple-shadow-house)

![](http://i.imgur.com/tvVl4iS.jpg)


In questa installazione, Olafur Eliasson dimostra le interazioni tra luce e ombra . L'aspetto multi-colore di questo lavoro aggiunge meraviglia al nostro mondo naturale . In definitiva, ciò che rende questo lavoro affascinante è che si tratta di un'esperienza che si concentra su una forza della natura che diamo per scontato: la luce.



[_Blue red  and yellow, Ann Veronica Janssens](http://www.ornotmagazine.it/project/rendere-visibile-linvisibile-ann-veronica-janssens/)


![](http://i.imgur.com/n2IpUqy.jpg?1)

Artista Ann Veronica Janssens costruisce sculture sensoriali delle pareti in policarbonato coperte da film trasparenti piene di densa nebbia. Le sue opere sono concepite come "esperienze spazio-temporali ". Lo spettatore le vive, si immerge in tale esperienza di luce e colore e vede modificare la propria percezione dello spazio e del tempo attraverso le sensazioni indotte indotte dalla nebbia colorata

[_Chromosaturation: Interactive Art Installations, Carlos Cruz-Diez](http://theinspirationgrid.com/chromosaturation-interactive-art-installations-by-carlos-cruz-diez/)

![](http://www.designboom.com/wp-content/uploads/2012/11/carlos02.jpg)

![](https://lightartblog.files.wordpress.com/2013/05/carlos-cruz-diez-chromosaturation.jpg)


installazioni 

[_))))) repetition at my distance, Gabey Tjon a Tham ](http://www.gabeytjonatham.com/repetition-at-my-distance/)

![](http://api.ning.com/files/DtcI2O2Ry7D3hNzVRfuxiWLslfVoR1kyz2*Yrxsdgt84ECyV7S42MddYXJbDN6XQzdPWRgnUg2zqprX8ONvTy1eF5fUAze1A/1082112328.jpeg)

[_Sound of light, plastique fantastique + Marco Barotti](http://www.designboom.com/architecture/marco-barotti-plastique-fantastique-sound-of-light-urban-lights-ruhr-2014-germany-10-29-2014/)

![](http://www.designboom.com/wp-content/uploads/2014/10/marco-barotti-plastique-fantastique-sound-of-light-urban-lights-ruhr-2014-germany-designboom-09.jpg)
 



installazioni basate su fenomeni fisici


[_Matière noire / Dark matter ](http://www.scenocosme.com/matiere_noire_en.htm#1)


[_Entre fiction et réalité_Ambre Fluide ](http://www.scenocosme.com/fiction_realite_en.htm)

##vecchie immagini

![](http://i.imgur.com/Vzf0oLg.jpg?1)











