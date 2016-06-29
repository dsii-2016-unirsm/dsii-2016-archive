var radio;

var valoriSM;
var valoriSL;
var valoriVR;
var valoriMR;
var valoriFL;

var indice = 0;
var scala = 30;
var valoreConsentito = 50;

function setup() {
	
	
		/////////bottoni
	
radio = createRadio();
  radio.option("Tutti i dati");
  radio.option("San Marino");
  radio.option("San Leo");
  radio.option("Verrucchio");
  radio.option("Marecchia");
  radio.option("Flaminia");
  textAlign(CENTER);
  fill(255, 0, 0);
	
////////////////////////////////////////////////////////////////////////////////////////////////////
	
	createCanvas(windowWidth,windowHeight-100);
	ellipseMode(CENTER);
	fill(255, 0, 0);
	noStroke();
	textAlign(CENTER);
	valoriSM = new Array(48, 37, 32, 40, 18, 16, 21, 25, 11, 10, 14, 28, 22, 12, 16, 15, 18);
	valoriSL = new Array(14,32,28,28,24,14,17,14,17,25,12,8,13,24,19,13,11);
	valoriVR = new Array(21,37,29,26,35,14,15,13,19,25,12,14,16,28,27,11,16);
	valoriMR = new Array(28,50,34,35,19,17,20,25,29,15,15,14,32,33,18,22,19);
	valoriFL = new Array(35, 57,44,40,19,25,37,45,21,19,16,30,38,21,25,25,30);

}

function draw() {
  var val = radio.value();
  background(128,128,128);

	
		
/////////////////////////////////////////// stampa tutti i valori//////////////////////////////////////////
	
	for (var i=0; i< valoriSM.length-1;i++) {
	  var areaTemp = valoriSM[i]*scala;
	  var raggioTemp = sqrt(areaTemp/PI);
	  fill(247,97,126);
	  ellipse (100+(width-100)/valoriSM.length*i,height-40,raggioTemp,raggioTemp);	
	  fill(247,97,126);
	  text(valoriSM[i], 100+(width-100)/valoriSM.length*i,height-20);
	}
	
	for (var i=0; i< valoriSL.length-1;i++) {
	  var areaTemp = valoriSL[i]*scala;
	  var raggioTemp = sqrt(areaTemp/PI);
	  fill(247,147,30);
	  ellipse (100+(width-100)/valoriSL.length*i,height-100,raggioTemp,raggioTemp);	
	  fill(247,147,30,200);
	  text(valoriSL[i], 100+(width-100)/valoriSL.length*i,height-80);
	}
	
	for (var i=0; i< valoriVR.length-1;i++) {
	  var areaTemp = valoriVR[i]*scala;
	  var raggioTemp = sqrt(areaTemp/PI);
	  fill(0,113,188);
	  ellipse (100+(width-100)/valoriVR.length*i,height-160,raggioTemp,raggioTemp);	
	  fill(0,113,188,200);
	  text(valoriVR[i], 100+(width-100)/valoriVR.length*i,height-140);
	}
	
	for (var i=0; i< valoriMR.length-1;i++) {
	  var areaTemp = valoriMR[i]*scala;
	  var raggioTemp = sqrt(areaTemp/PI);
	  fill(204,255,153);
	  ellipse (100+(width-100)/valoriMR.length*i,height-220,raggioTemp,raggioTemp);	
	  fill(204,255,153);
	  text(valoriMR[i], 100+(width-100)/valoriMR.length*i,height-200);
	}
	
	for (var i=0; i< valoriFL.length-1;i++) {
	  var areaTemp = valoriFL[i]*scala;
	  var raggioTemp = sqrt(areaTemp/PI);
	  fill(255,207,102);
	  ellipse (100+(width-100)/valoriFL.length*i,height-280,raggioTemp,raggioTemp);	
	  fill(255,207,102);
	  text(valoriFL[i], 100+(width-100)/valoriFL.length*i,height-260);
	}
	
	
//////////////////////////////////////////////////////////SAN MARINO///////////////////////////////////////////////////////////////////////	
	 if(val=="San Marino" || val=="Tutti i dati"){

	// visualizzo il valore massimo
	var valoreMassimo = max(valoriSM);
    var areaMax = valoreMassimo*scala*scala;
    var raggioMax = sqrt(areaMax/PI);
	
	noFill();
	stroke(255,0,0);
	strokeWeight(4);
	 
    ellipse(width/10, height/3, raggioMax, raggioMax);
	
	
	// visualizzo il valore consentito
    var areaConsentita = valoreConsentito*scala*scala;
    var raggioConsentito = sqrt(areaConsentita/PI);
	
	noFill();
	stroke(0,255,0);
    ellipse(width/10, height/3, raggioConsentito, raggioConsentito);
	
	
	noStroke();
	
	
	// visualizzi un valore al secondo poi vai al prossimo infine torni al primo
	if (frameCount%60 == 0) {

	  if (indice < valoriSM.length-1) {
		  indice++
		  } else {
		  indice = 0;
		  text("riparti",30,10);
		  }
	}
	var valoreTemp = valoriSM[indice];
	
	//controlla se è sopra il valore consentito e cambia colore...
	
	if (valoreTemp >= valoreConsentito) {
	  fill(255,0,0);	
	} else {
	  fill(247,97,126);	
	}
	
	var area = valoreTemp*scala*scala;
    var raggio = sqrt(area/PI);
	
	ellipse(width/10, height/3, raggio, raggio);
	
	fill(255);
	text(valoriSM[indice], width/10, height/3);
	text("San Marino", width/10, height/5);
	



	  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////SAN LEO	///////////////////////////////////////////////////////////////////////////


	 if(val=="San Leo" || val=="Tutti i dati"){
	// visualizzo il valore massimo
	var valoreMassimo = max(valoriSL);
    var areaMax = valoreMassimo*scala*scala;
    var raggioMax = sqrt(areaMax/PI);
	
	noFill();
	stroke(255,0,0);
    ellipse(width/3.5, height/3, raggioMax, raggioMax);
	
	
	// visualizzo il valore consentito
    var areaConsentita = valoreConsentito*scala*scala;
    var raggioConsentito = sqrt(areaConsentita/PI);
	
	noFill();
	stroke(0,255,0);
    ellipse(width/3.5, height/3, raggioConsentito, raggioConsentito);
	
	
	noStroke();
	
	
	// visualizzi un valore al secondo poi vai al prossimo infine torni al primo
	if (frameCount%60 == 0) {

	  if (indice < valoriSL.length-1) {
		  indice++
		  } else {
		  indice = 0;
		  text("riparti",30,10);
		  }
	}
	var valoreTemp = valoriSL[indice];
	
	//controlla se è sopra il valore consentito e cambia colore...
	
	if (valoreTemp >= valoreConsentito) {
	  fill(255,0,0);	
	} else {
	  fill(247,147,30);	
	}
	
	var area = valoreTemp*scala*scala;
    var raggio = sqrt(area/PI);
	
	ellipse(width/3.5, height/3, raggio, raggio);
	
	fill(255);
	text(valoriSL[indice], width/3.5, height/3);
	text("San Leo", width/3.5, height/5);
	 }
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////VERRUCCHIO//////////////////////////////////////////////////////////////////////

	 if(val=="Verrucchio" || val=="Tutti i dati"){

	// visualizzo il valore massimo
	var valoreMassimo = max(valoriVR);
    var areaMax = valoreMassimo*scala*scala;
    var raggioMax = sqrt(areaMax/PI);
	
	noFill();
	stroke(255,0,0);
    ellipse(width/2.08, height/3, raggioMax, raggioMax);
	
	
	// visualizzo il valore consentito
    var areaConsentita = valoreConsentito*scala*scala;
    var raggioConsentito = sqrt(areaConsentita/PI);
	
	noFill();
	stroke(0,255,0);
    ellipse(width/2.08, height/3, raggioConsentito, raggioConsentito);
	
	
	noStroke();
	

	// visualizzi un valore al secondo poi vai al prossimo infine torni al primo
	if (frameCount%60 == 0) {

	  if (indice < valoriVR.length-1) {
		  indice++
		  } else {
		  indice = 0;
		  text("riparti",30,10);
		  }
	}
	var valoreTemp = valoriVR[indice];
	
	//controlla se è sopra il valore consentito e cambia colore...
	
	if (valoreTemp >= valoreConsentito) {
	  fill(255,0,0);	
	} else {
	  fill(0,113,188);	
	}
	
	var area = valoreTemp*scala*scala;
    var raggio = sqrt(area/PI);
	
	ellipse(width/2.08, height/3, raggio, raggio);
	
	fill(255);
	text(valoriVR[indice], width/2.08, height/3);
	text("Verrucchio", width/2.08, height/5);
	
	 }
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////MARECCHIA////////////////////////////////////////////////////////////////////////
	
	
		 if(val=="Marecchia" || val=="Tutti i dati"){
	// visualizzo il valore massimo
	var valoreMassimo = max(valoriMR);
    var areaMax = valoreMassimo*scala*scala;
    var raggioMax = sqrt(areaMax/PI);
	
	noFill();
	stroke(255,0,0);
    ellipse(width/1.49, height/3, raggioMax, raggioMax);
	
	
	// visualizzo il valore consentito
    var areaConsentita = valoreConsentito*scala*scala;
    var raggioConsentito = sqrt(areaConsentita/PI);
	
	noFill();
	stroke(0,255,0);
    ellipse(width/1.49, height/3, raggioConsentito, raggioConsentito);
	
	
	noStroke();
	
	
	// visualizzi un valore al secondo poi vai al prossimo infine torni al primo
	if (frameCount%60 == 0) {

	  if (indice < valoriMR.length-1) {
		  indice++
		  } else {
		  indice = 0;
		  text("riparti",30,10);
		  }
	}
	var valoreTemp = valoriMR[indice];
	
	//controlla se è sopra il valore consentito e cambia colore...
	
	if (valoreTemp >= valoreConsentito) {
	  fill(255,0,0);	
	} else {
	  fill(204,255,153);	
	}
	
	var area = valoreTemp*scala*scala;
    var raggio = sqrt(area/PI);
	
	ellipse(width/1.49, height/3, raggio, raggio);
	
	fill(0);
	text(valoriMR[indice], width/1.49, height/3);
	fill(255);
	text("Marecchia", width/1.49, height/5);
	
	
		 }
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////FLAMINIA/////////////////////////////////////////////////////////////////////////////
		 if(val=="Flaminia" || val=="Tutti i dati"){
	// visualizzo il valore massimo
	var valoreMassimo = max(valoriFL);
    var areaMax = valoreMassimo*scala*scala;
    var raggioMax = sqrt(areaMax/PI);
	
	noFill();
	stroke(255,0,0);
    ellipse(width/1.15, height/3, raggioMax, raggioMax);
	
	
	// visualizzo il valore consentito
    var areaConsentita = valoreConsentito*scala*scala;
    var raggioConsentito = sqrt(areaConsentita/PI);
	
	noFill();
	stroke(0,255,0);
    ellipse(width/1.15, height/3, raggioConsentito, raggioConsentito);
	
	
	noStroke();
	
	// visualizzi un valore al secondo poi vai al prossimo infine torni al primo
	if (frameCount%60 == 0) {

	  if (indice < valoriFL.length-1) {
		  indice++
		  } else {
		  indice = 0;
		  text("riparti",30,10);
		  }
	}
	var valoreTemp = valoriFL[indice];
	
	//controlla se è sopra il valore consentito e cambia colore...
	
	if (valoreTemp >= valoreConsentito) {
	  fill(255,0,0);	
	} else {
	  fill(255,207,102);	
	}
	
	var area = valoreTemp*scala*scala;
    var raggio = sqrt(area/PI);
	
	ellipse(width/1.15, height/3, raggio, raggio);
	
	fill(0);
	text(valoriFL[indice], width/1.15, height/3);
	fill(255);
	text("Flaminia", width/1.15, height/5);
	
	
	

}


} // draw
