###Read me
####Istruzioni
N.B. Il sistema viene attivato dal rilevamento delle frequenze elettromagnetiche<b>

1 - scaricare il codice Processing; <br>
2 - scaricare il file "waves01_osc_communication_processing.als (file Ableton live);<br>
3 - all'interno del file .als sono presenti 2 sole tracce audio in cui andranno inserite rispettivamente: canale 1, un solo clip (traffic), canale 2, quattro clip; <br>

####Messaggi
/live/play/clip         (int track, int clip)<br>
Con questo messaggio Processing comunica ad Ableton di riprodurre un determinato clip.<br>
int track = numero della traccia;<br>
int clip = numero del clip all'interno della traccia; <br>
<br>
/live/stop/clip         (int track, int clip)<br>
Con questo messaggio Processing comunica ad Ableton di mettere in stop un determinato clip.<br>
int track = numero della traccia;<br>
int clip = numero del clip all'interno della traccia; <br>

####OSC in Waves 01
L'algoritmo in Processing è stato programmato per svolgere le seguenti funzioni:<br>
Se il valore è uguale a 1 riproduci tutte le tracce;<br>
Se il valore è uguale a 0 metti in pausa la traccia 2 ed esegui soltanto la traccia 1;<br>


