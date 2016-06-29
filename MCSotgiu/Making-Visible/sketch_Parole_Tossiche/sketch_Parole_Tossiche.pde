// Demo for educational purpose, course DSII 2016 @ UniRSM
// Mod by @Fupete for @MCSotgiu project, MIT License 2016
// Based on official search_twitter_new demo by Temboo
// 
// Built Using Temboo 
// Originally based off of Temboo Examples at:
//   https://temboo.com/processing/display-tweet
//   https://temboo.com/library/Library/Twitter/Search/Tweets/
//
// Originally based on Twitter Search Demo Using Temboo by Ben Grosser
// Originally written for ARTS 444: Computational Art at UIUC


import com.temboo.core.*;
import com.temboo.Library.Twitter.Search.*;

// Temboo account
TembooSession session = new TembooSession("...", "...", "...");

Tweets twitterSearch;
TweetsResultSet tweetsResults;

String lastID = "0";

// Twitter account
String accessToken = "...";
String accessTokenSecret = "...";
String APIkey = "...";
String APISecret = "...";

int quale; // < id di quale parola
int in=0; // < contatore per visualizzare risultati in ciclo %
int i;
ArrayList ricerca = new ArrayList(); // < array dove mettere (1) i testi dei tweet + (2) le date dei tweet
StringList parole = new StringList("frocio", "puttana", "negro"); // < parole da cercare 
StringList parole_lastID = new StringList();

ArrayList<tweetTossico> nubeTossica;
float cRotaz = 0, cZoom = 0, cHigh = 0;
String visualizza_testo = "";
int visualizza_fw;
int visualizza_rt;
String visualizza_data;
String visualizza_ora;
int visto;

void setup() {
  //fullScreen(P3D);
  //pixelDensity(displayDensity());
  size(650, 650, P3D);
  noSmooth();

  background(0);
  fill(0);
  textSize(50);
  textAlign(LEFT);

  setupTwitterSearch();

  for (int j=0; j<parole.size(); j++) {
    parole_lastID.set(j, "0");
  }

  nubeTossica = new ArrayList();
}

void draw() {

  background(0);

  /*if (frameCount%600==0) {
   background(255,0,0);
   vai(); 
   println("ora");
   }*/



  pushStyle();
  textAlign(CENTER);
  fill(255);
  textSize(18);
  text("< Press any key to search... >", width/2, height/2);      
  popStyle();


  if (ricerca.size()>0) {     // < se ci sono tweet nei risultati

    background(0);
    fill(0);
    noStroke();
    rect(20, height-130, width-70, (height/6)-30);

    pushMatrix();
    translate(width/2, height/2+cHigh, cZoom);
    rotateY(cRotaz);

    if (mousePressed) {
      cZoom = map(mouseY, 0, height, -5000, 500);
      cRotaz = map(mouseX, 0, width, -3, 3);
    }

    if (keyPressed && key=='w') {
      cHigh =  map(mouseY, 0, height, -500, 500);
    }

    if (nubeTossica.size()>0) {
      for (int i=0; i<nubeTossica.size(); i++) {
        nubeTossica.get(i).display();
        if (i==visto) {
          nubeTossica.get(i).vista = true;
          visualizza_testo = nubeTossica.get(i).testo;
          visualizza_fw = nubeTossica.get(i).fw;
          visualizza_rt = nubeTossica.get(i).rt;
         // visualizza_name = nubeTossica.get(i).name;
          
          visualizza_data = nubeTossica.get(i).data;
          visualizza_ora = nubeTossica.get(i).ora;
        } else {
          nubeTossica.get(i).vista = false;
        }
      }
    }
    popMatrix();

   
    fill(255);
    textSize(14);
    text("ELEMENTO TOSSICO: " + " \n" + visualizza_testo, 20, height-90, width/3, height/2);
    text("SPREAD POTENZIALE: " + visualizza_fw, width/2-60, height-75);
    text("SPREAD POTENZIATO: " + visualizza_rt, width/2-60, height-55);
    
    text("Data e ora rilevamento: " + visualizza_data + "h" + visualizza_ora, width/2-60, height-35);

    text("[A] [D] to navigate  ||  [SPACE] to reload ", 20, 20, width/2, height/2);
    text("PAROLA TOSSICA: " + parole.get(quale), 20, 60);
  }
}


// qualunque tasto si prema...
void keyPressed() { 
  if (key == ' ') {
    vai();
  } else if (key == 'd') {
    visto++; 
    if (visto>=nubeTossica.size()) visto = 0;
  } else if (key == 'a') {
    visto--;
    if (visto<0) visto = nubeTossica.size()-1;
  }
}

void vai() {
  // cerca una parola a caso dalla lista parole, cerca gli ultimi 100 risultati
  // se cerchi più volte la stessa prola trova solo le nuove occorrenze "uscite" dopo la prima ricerca
  background(0);
  quale=int(random(parole.size()));

  cerca(parole.get(quale), 100, parole_lastID.get(quale));
  parole_lastID.set(quale, lastID);
  in=0; // < azzera l'indice per evitare di andare fuori scala nella visualizzazione

  generaNube();
}


void generaNube() {
  if (nubeTossica.size() > 0) {
    nubeTossica.clear();
  } else if  (ricerca.size() > 0) {
    for (int i=0; i<ricerca.size(); i++) {
      //tweetTossico(int id_, int fw_, int rt_, String testo_, String data_) 
      String testoIntero = ricerca.get(i).toString();  //  < stringa intera, elementi intervallati da un carattere " — "
      String[] testo = testoIntero.split(" — ");        //  < stringa divisa in due
      nubeTossica.add(new tweetTossico(i, int(testo[2]), int(testo[3]), testo[0], testo[1]));
    }
  }
}


void cerca(String parola, int quante, String ultimo_id) {
  ricerca = getTweetsResults(parola, quante, ultimo_id);
  reportSearchesRemaining();
}

ArrayList getTweetsResults(String q, int t, String ii) {
  twitterSearch.setQuery(q); 
  twitterSearch.setCount(t);

  // setSinceId says to only get tweets SINCE lastID
  //twitterSearch.setSinceId(lastID);
  twitterSearch.setSinceId(ii);

  tweetsResults = twitterSearch.run();
  JSONObject searchResults = parseJSONObject(tweetsResults.getResponse());
  JSONArray statuses = searchResults.getJSONArray("statuses"); // Create a JSON array of the Twitter statuses in the object

  JSONObject tweets, user;

  try {
    tweets = statuses.getJSONObject(0); // Grab the first tweet and put it in a JSON object
  } 
  catch (Exception e) {
    tweets = null;
  }

  ArrayList results = new ArrayList();

  if (tweets != null) {
    // grab the lastID of the last tweet processed (in reverse order,
    // so we want index 0). this gets used on the NEXT search to ensure
    // we don't get tweets we've already seen
    lastID = statuses.getJSONObject(0).getString("id_str");

    for (int i = 0; i < statuses.size(); i++) {
      String tweetText = statuses.getJSONObject(i).getString("text");
      String tweetDate = statuses.getJSONObject(i).getString("created_at");
      String friendsCount = str(statuses.getJSONObject(i).getJSONObject("user").getInt("friends_count"));
      String reTweet = str(statuses.getJSONObject(i).getInt("retweet_count"));
      results.add(tweetText + " — " + tweetDate + " — " + friendsCount + " — " + reTweet);
    }
  }
  return results;
}  

void reportSearchesRemaining() {
  println("You have "+tweetsResults.getRemaining()+" searches remaining today.");
}

void setupTwitterSearch() {
  // Create the Choreo object using your Temboo session
  twitterSearch = new Tweets(session);

  // Set inputs
  twitterSearch.setAccessToken(accessToken);
  twitterSearch.setAccessTokenSecret(accessTokenSecret);
  twitterSearch.setConsumerSecret(APISecret);
  twitterSearch.setConsumerKey(APIkey);
}
