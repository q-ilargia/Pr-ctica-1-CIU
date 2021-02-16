import processing.sound.*;

//Tamaño y movimiento de las figuras de juego
int pheight=75;
int pwidth=15;
int pmove=10;
//Posiciones de las figuras de juego
float posp1x, posp2x, posp1y,posp2y;
//Puntuaciones, no confundir con versiones de Windows XP
int sp1=0;
int sp2=0;
//Estado de las teclas de movimiento
boolean u1, d1, u2, d2;
//Datos de la pelota
float pospelx, pospely;
float pelrad=10;
float pelmovex;
float pelmovey;
//Sonidos del juego
SoundFile rebote;
SoundFile gol;
//Controla si es inicio o no del juego
boolean inicio=false;
PFont font;


void setup(){
  //Tamaño de la pantalla
  size(1100,768);
  //Posición inicial de la pelota, en el centro
  pospelx = width/2; 
  pospely = random(60, height-60);
  //Posición inicial de las figuras de juego
  posp1x=20;
  posp2x=width -(pwidth+20);
  posp1y=height/2-pheight/2;
  posp2y=height/2-pheight/2;
  pelmovex=10;
  pelmovey=10;
  font = createFont("bit5x3.ttf",32);
  textFont(font);
  rebote = new SoundFile(this,"rebote.mp3");
  gol = new SoundFile(this,"gol.mp3");

}

void draw(){
  inicio();
  if(inicio){
    tablero();
    elementos();
    desplazamientos();
    bordes();
    raquetazo();
  }
}

void inicio(){
    
    background (0) ;
    textSize(100);
    textAlign(CENTER);
    text("PONG CIU",width/2,height/4);

    textSize(100);
    textAlign(CENTER);
    text("Instrucciones",width/2,height/4+150);
    
    textSize(50);
    textAlign(CENTER);
    text("Controles P2",width/4,height/4+250);
    textSize(45);
    textAlign(CENTER);
    text("-Flecha arriba para subir",width/4,height/4+325);
    textSize(45);
    textAlign(CENTER);
    text("-Flecha abajo para bajar",width/4,height/4+400);
    
    textSize(50);
    textAlign(CENTER);
    text("Controles P1",width-width/4,height/4+250);
    textSize(45);
    textAlign(CENTER);
    text("-W para subir",width-width/4,height/4+325);
    textSize(45);
    textAlign(CENTER);
    text("-S para bajar",width-width/4,height/4+400);
    
    textSize(75);
    textAlign(CENTER);
    text("Pulsa ENTER para comenzar",width/2,height/4+500);

}

//Rellenamos el tablero de juego
void tablero(){
  background(0);
  fill(255,255,255);
  stroke(1000);
  rect(20,20,width-40,20);
  rect(20,height-40,width-40,20);
  //Separación de mitad de campo
  for(int i = 2; i <= 52; i+=2)
    if(20*i<height-40)
      rect(width/2-10,20*i,20,20);
}

//Añadimos los elementos de juegos, véase figuras de juego y la pelota
void elementos(){
  //Creamos la pelota
  ellipse(pospelx, pospely, 2*pelrad, 2*pelrad);
  //Creamos las figuras de juego
  rect(posp1x, posp1y, pwidth, pheight);
  rect(posp2x, posp2y, pwidth, pheight);
  //Añadimos las puntuaciones a ambos lados de la divisoria del tablero
  textSize(75);
  textAlign(LEFT);
  text(sp1,width/3,100);
  textSize(75);
  textAlign(RIGHT);
  text(sp2,width-width/3,100);
  
}

void desplazamientos(){
  
  if (u1) {
    if(posp1y>40){
      posp1y = posp1y - pmove;
    
    }else{
      posp1y=40;
    
    }
        
  } else if (d1) {
    if(posp1y<height-(pheight+40)){
      posp1y = posp1y + pmove;
    }else{
      posp1y=height- (pheight+40);  
    }
  }
  
  if (u2) {
    if(posp2y>40){
      posp2y = posp2y - pmove;
    
    }else{
      posp2y=40;
    
    }
        
  } else if (d2) {
    if(posp2y<height-(pheight+40)){
      posp2y = posp2y + pmove;
    }else{
      posp2y=height- (pheight+40);  
    }
  }  
 
  
  pospelx=pospelx +pelmovex;
  pospely=pospely +pelmovey;

}


void bordes(){
  if ( pospely > (height-40)) {
    rebote.play();
    pospely=height-40;
    pelmovey = -pelmovey;
  } else if ( pospely <= 40) {
    rebote.play();
    pospely=40;
    pelmovey = -pelmovey;
  }
  
   if ( pospelx >= width) {
    gol.play();
    setup();
    pelmovex = -pelmovex;
    sp1 = sp1 + 1;
  } else if (pospelx <=0) {
    gol.play();
    setup();
    sp2 = sp2 + 1;
  }

}

void raquetazo(){

   if (pospelx < posp1x + pelrad && pospely < posp1y + pheight && pospely + pelrad > posp1y ) {
    if (pelmovex < 0) {
      rebote.play();
      pelmovex = -pelmovex;
    }
  }
  else if (pospelx + pelrad > posp2x  && pospely < posp2y + pheight && pospely + pelrad  > posp2y) {
    if (pelmovex > 0) {
      rebote.play();
      pelmovex= -pelmovex;
    }
  }
  
}



void keyPressed() {
  
  if (keyCode == ENTER) {
    inicio = true;
    
  }
 
  if (key == 'w' || key == 'W') {
    u1 = true;
  } else if (key == 's' || key == 'S') {
    d1= true;
  }
  
  if (keyCode == UP) {
    u2 = true;
  } else if (keyCode == DOWN) {
    d2 = true;
  }
}

void keyReleased() {


  if (key == 'w' || key == 'W') {
    u1 = false;
  } else if (key == 's' || key == 'S') {
    d1 = false;
  }
  
  if (keyCode == UP) {
    u2 = false;
  } else if (keyCode == DOWN) {
    d2 = false;
  }
}  
  
