class tweetTossico {
  int id;
  int fw;       // Spread potenziale | followers
  int rt;       // Spread potenziato | rt
  String testo;          // testo tweet
  String data;           // data tweet
  String ora;            // ora tweet
  PVector c;
  boolean vista;

  tweetTossico(int id_, int fw_, int rt_, String testo_, String data_) {
    id = id_;
    fw = fw_;
    rt = rt_;
    testo = testo_;
    String[] d_ = data_.split(" "); 
    data = d_[2] +" " + d_[1] + " " + d_[5];
    ora = d_[3];
    c = new PVector (random(-width/3, width/3), random(-width/3, height/3), random(-350, 350));
  }

  void display() {

    float r1 = pow(3*rt/PI*4, 1/3.0);
    float r2 = pow(3*fw/PI*4, 1/3.0);

    pushStyle();
    pushMatrix();
    translate(c.x, c.y, c.z);

    noFill();
    stroke(255, 0, 0);
    strokeWeight(2+rt*0.001);
    for (int i=0; i<rt; i++) {
      pushMatrix();
      if (r1>=r2) {
        float a = random(-r1, r1);
        rotateX(random(2*PI));
        rotateY(random(2*PI));
        rotateZ(random(2*PI));
        point(a, 0, 0);
      } else {
        float a = random(-r2, r2);
        rotateX(random(2*PI));
        rotateY(random(2*PI));
        rotateZ(random(2*PI));
        point(a, 0, 0);
      }
      popMatrix();
    }

    stroke(50);
    strokeWeight(.5);
    sphere(r2*2);

    if (vista) {
      stroke(250);
      box(r2*6);
    }
    popMatrix();
    popStyle();
  }
}