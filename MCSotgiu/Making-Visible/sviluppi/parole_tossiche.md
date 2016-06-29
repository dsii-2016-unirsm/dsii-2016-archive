## PAROLE TOSSICHE
#### Parole chiave: linguaggio, discriminazione, importanza parole, ambiente tossico
Il saggio “Parole Tossiche. Cronache di ordinario sessismo” scritto da Graziella Priulla ed edito da [_Settenove_](http://www.settenove.it/) nel 2014, sostiene che _le parole sono i sintomi, non le malattie_. Da questo punto non considereremo più le parole come portatrici di odio (come da proposta precedente), ma piuttosto le parole come elementi che descrivono il contesto in cui viviamo; come indici di un vento di violenza nell’aria, segnalato, appunto, dal linguaggio.

La consapevolezza del contesto tossico e l’uso consapevole della lingua come portatrice di significati può essere, in  questo senso, un efficace strumento della lotta alle disuguaglianze e alle discriminazioni.

>«Chi parla male, pensa male e vive male. Bisogna trovare le parole giuste. Le parole sono importanti» (dal film “Palombella rossa” di Nanni Moretti, 1989)  [_+_](https://www.youtube.com/watch?v=qtP3FWRo6Ow)

## Obiettivo
Rendere visibile l’alto grado di discriminazione presente in Italia rendendo visibile quella che chiameremo nube tossica: l’insieme delle parole tossiche considerate denigranti, accusatorie e mortificanti rispetto quattro categorie prese in esame (razzismo, omofobia, misoginia e disabilità). Far così riflettere sul contesto Italiano e sull’importanza della scelta e dell’utilizzo delle parole.

## Dati
Prendendo in considerazione Twitter, estrapolare, tramite le API, i commenti degli utenti che utilizzano parole presenti nelle quattro categorie citate. 
Si è notato il fatto che l’utilizzo delle parole (nell’esempio sono state utilizzate tre parole) risulta molto frequente sui commenti degli utenti Twitter. Programmando una chiamata ogni ora avremo un numero considerevole di commenti.
Le Api di Twitter ci permettono di effettuare 180 “chiamate” al giorno. Ogni “chiamata” fornirà gli ultimi 100 commenti contenenti una delle tre parole (“pescata” random tra le tre). La chiamata successiva considererà un’altra delle tre parole.


## What is
È una interfaccia programmata con processing, nella quale ogni commento è rappresentato da una sfera e ogni sfera è un elemento tossico in quanto “intossicato” dalla parola utilizzata. Le sfere andranno a sommarsi ad ogni chiamata e a creare quella che chiamiamo nube tossica: l’insieme dei commenti contenenti le parole tossiche.
L’interfaccia conterrà più informazioni estrapolate dalle API di Twitter:
-	il commento, considerato elemento tossico pericoloso in quanto possibile elemento di contaminazione. Si estrapola dal JSON fornito dalle API del social network tramite l’attributo _text_
-	il nome dell’utente che ha condiviso il commento, considerato la persona affetta. Si estrapola dal JSON tramite l’attributo _name_
-	il numero di followers dell’utente, degno di nota in quanto considerabile come “spread potenziale” dell’elemento tossico. Si estrapola dal JSON tramite l’attributo _followers_count_
-	il numero di retweet, considerato “spread potenziato”: il numero di persone che sono state contagiate. Si estrapola dal JSON tramite l’attributo _retweet_count_
-	data e ora del rilevamento. Si estrapola dal JSON tramite l’attributo _created_at_

L’interfaccia sarà navigabile tramite tastiera. Un cubo in wireframe farà da puntatore e andrà a considerate, di volta in volta, ogni sfera. Verranno così fornite le informazioni scritte sopra relative ad ogni sfera/elemento tossico.


## Nuovo riferimento

### [_Parole tossiche. Cronache di ordinario sessismo._](http://www.settenove.it/articoli/parole-tossiche/308)
![](http://i.imgur.com/ALaWfan.png)
