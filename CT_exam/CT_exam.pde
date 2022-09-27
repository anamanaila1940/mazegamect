import g4p_controls.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
// i have decided to use Minim for the songs because the sound is more clear
Minim minim;
//here i declared the music that is played at the beginning of the game
Minim intr;
//coins represent the amount between grid.coins and grid2.coins
int coins;
//here i have declared the instances of the class Monster2
Monster2 monster4;
Monster2 monster5;
Monster2 monster6;
Monster2 monster7;
AudioPlayer c;
//here is the image that i have made for the second level 
PImage levl2;
int col=255;
//i have declared and initalised this variables in order to set the avatars visible only after buying them
boolean defaultcharacter=true;
boolean firstcharacter=false;
boolean secondcharacter=false;
boolean thirdcharacter=false;
boolean fourthcharacter=false;
boolean fifthcharacter=false;
boolean sixthcharacter=false;
//i have declared and initialised this variable in order to make the user to be able to mute the sound effects, however this feature doesn't work for the second level
boolean mouseover=false;
boolean music=true;
//here i have used the site flaticon, <div>Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
PImage musicon;
PImage mute;
//here i have declared the monster number 7, used in the second level, i have made this one in illustrator
PImage mons7;
//i have declared and initialised the timer for the energy drink the user can drink in the first and second level
int timerdrink=700;
int timerdrink2=700;
//i have declared and initialised the timer for when the user collects a super pill, which makes the enemies motionless for 300 seconds
int timer=300;
int timer2=300;
boolean win2=false;
boolean startenergy=false;
boolean starttimer=false;
boolean starttimer2=false;
boolean startenergy2=false;

AudioPlayer drink, intro, wingame, loselife;

boolean pauseframe=false;
boolean mark=false;
boolean secondframe=false;
//here i have declared and initialised the character variable, which at the start of the game is 0, which means the avatar is the default one
int character=0;
//here i have declared the images used in the game for the super pill, as well as the avatars the player can buy from the market and the image that is visible after winning the second level, all this images were made in illustrator
PImage pill;
PImage pac;
PImage restart;
PImage big;
PImage bird;
PImage purpl;
PImage play1;
PImage play2;
PImage bluegummy;
PImage end;
//here i have declared an image array for the lifes the user has in the game
PImage img[];
int nPics=3;
String wintext=" YOU\nWON";
String losttext=" YOU\nLOST";
PImage purple;
PImage block;
PImage monster;
PImage play;
PImage energy;
PImage coin;
PImage mainframe;
PImage grass;
PImage bloCK;
PImage rules;
Market market;
Grid grid;
Grid2 grid2;
Player player;
Player2 player2;
Monster blue;
Monster purp;
Monster green;
boolean main=true;
boolean level1=false;
boolean level2=false;
boolean win=false;
boolean lost=false;
PImage monster2;
boolean reSume=false;

void setup() {
  size(900, 900);
  createGUI();
  grid=new Grid();
  grid2=new Grid2();
  player=new Player();
  player2=new Player2();
  monster4=new Monster2(224,705,15,15,#F5B505);
  monster5=new Monster2(533,862,15,15,#5E47FA);
  monster6=new Monster2(790,241,15,15,#47FACB);
  monster7=new Monster2(573,785,15,15,#C647FA);
  blue=new Monster( 224,705,15,15,255,0,0);
  market=new Market();
  minim=new Minim(this);
  intr=new Minim(this);
  green=new Monster(533,862,15,15,255,255,0);
 
  rules=loadImage("rules.png");
  store.setVisible(false);
  buy1.setVisible(false);
  choose1.setVisible(false);
  pause.setVisible(false);
  resume.setVisible(false);
  next.setVisible(false);
  shopback.setVisible(false);
  backlvl1.setVisible(false);
  img=new PImage[nPics];
  bluegummy=loadImage("gummy.png");
  big=loadImage("muscle.png");
  bird=loadImage("bird.png");
  musicon=loadImage("soundon.png");
  mute=loadImage("mute.png");
  end=loadImage("theend.png");
  pill=loadImage("immune.png");
  grass=loadImage("grass.png");
  bloCK=loadImage("block.png");
  restart=loadImage("backgr.png");
  img[0]=loadImage("Heart.png");
  img[1]=loadImage("Heart.png");
  img[2]=loadImage("Heart.png");
  purple=loadImage("purple.png");
  mons7=loadImage("blue.png");
  pac=loadImage("pacman.png");
  levl2=loadImage("level2.png");
  purpl=loadImage("play3.png");
  play1=loadImage("play1.png");
  play2=loadImage("play2.png");
  monster2=loadImage("gree.png");
  //as stated in the report, this sound is made by sabbyt2(2017)
  drink=minim.loadFile("drink.wav");
  //as stated in the report, this sound is made by ProjectsU012(2016)
  c=minim.loadFile("coin.wav");
  //as stated in the report, this sound is made by noirenex(2012)
  wingame=minim.loadFile("wingame.wav"); 
  //as stated in the report, this sound is made by by EVRetro(2019)
  loselife=minim.loadFile("lostlife.wav");
  //as stated in the report, this sound is made by knarmahfox(2010)
  intro=intr.loadFile("intro.wav");
  energy=loadImage("energy.png");
  mainframe=loadImage("maze.png");
  monster=loadImage("monster1.png");
  monster.resize(20, 20);
  mainframe.resize(900, 900);
  coin=loadImage("Coins.png");
  play=loadImage("square.png");
  block=loadImage("green.png");
  purp=new Monster(790,241,15,15,0,255,0);
}
void draw() {
  coins=grid.coins+grid2.coins;
  if (main) {
    background(mainframe);
    image(rules, 548, 483, 300, 400);
    intro.play();
  }
  if (level1==true) {
    background(0);
    // println(grid.coins);
    intr.stop();
    grid.draw();
    player.draw();
    display();
    blue.draw();
    blue.move();
    green.draw();
    green.move();
    purp.draw();
    purp.move();
    losinglife();
    pause.setVisible(true);
    buttonmusicon();
  }
  if (level2==true) {
    background(0);
    grid2.draw();
    secondframe=false;
    mark=false;
    level1=false;
    player2.draw();
    monster4.draw();
    monster4.move();
    monster5.draw();
    monster5.move();
    monster6.draw();
    monster6.move();
    monster7.draw();
    monster7.move();
    loselife();
    display2();
    store.setVisible(false);
    buttonmusicon();
   
  }

  if (secondframe==true) {
    background(mainframe);
    win=false;
    next.setVisible(false);
    store.setVisible(true);
    buttonlevel2();
  }

  if (starttimer==true && timer>0) {
    timer--;
    green.speed=0;
    purp.speed=0;
    blue.speed=0;
    println(timer);
  } else if (timer==0) {
    starttimer=false;
    green.speed=1;
    purp.speed=1;
    blue.speed=1;
    timer=300;
  }
  if (starttimer2==true && timer2>0) {
    timer2--;
    monster4.speed=0;
    monster5.speed=0;
    monster6.speed=0;
    monster7.speed=0;
    println(timer2);
  } else if (timer2==0) {
    starttimer2=false;
    monster4.speed=1;
    monster5.speed=1;
    monster6.speed=1;
    monster7.speed=1;
    timer2=300;
  }
  if (startenergy2==true && timerdrink2>0) {
    timerdrink2--;
    player2.xSpeed=3;
    player2.ySpeed=3;
    println(timerdrink2);
  } else if (timerdrink2==0) {
    startenergy2=false;
    player2.xSpeed=2;
    player2.ySpeed=2;
    timerdrink2=700;
  }

  if (startenergy==true && timerdrink>0) {
    timerdrink--;
    player.xSpeed=2;
    player.ySpeed=2;
    println(timerdrink);
  } else if (timerdrink==0) {
    startenergy=false;
    player.xSpeed=1;
    player.ySpeed=1;
    timerdrink=700;
  }
  //the alternative would be to make resume equal something%2!=0 for when it is false and make it an even number when it's true, this might make the resume pressable multiple times,but i haven't tried it
  if (reSume==true) {
    resume.setVisible(false);
    pauseframe=false;
    player.xSpeed=1;
    player.ySpeed=1;
    green.speed=1;
    purp.speed=1;
    blue.speed=1;
  }
  if (win2==true) {
    theEnd();
  }
  if (win==true) {
    win();
  } else if (lost==true) {
    lost();
  }
  //open the market
  if (mark==true) {
    pause.setVisible(false);
    main=false;
    level1=false;
    market.draw();
    choose1.setVisible(false);
    store.setVisible(false);
    //buttons for the market button buy, i could have used G4P, but it was no longer working, however there are some other buttons that I have made using G4P
    if (mouseX>106 && mouseX<156 && mouseY>200 && mouseY<220) {
      fill(#DBCC23);
    } else {
      fill(255, 255, 0);
    }
    rect(106, 200, 50, 20);
    textSize(15);
    fill(0, 0, 0);
    text("BUY", 116, 216);
    //button2
    if (( mouseX>340 && mouseX<390 && mouseY>200 && mouseY<220)) {
      fill(#DBCC23);
    } else {
      fill(255, 255, 0);
    }
    rect(340, 200, 50, 20);
    textSize(15);
    fill(0, 0, 0);
    text("BUY", 350, 216);
    //button3
    if (( mouseX>540 && mouseX<590 && mouseY>200 && mouseY<220)) {
      fill(#DBCC23);
    } else {
      fill(255, 255, 0);
    }
    rect(540, 200, 50, 20);
    textSize(15);
    fill(0, 0, 0);
    text("BUY", 550, 216);
    //button4
    if (( mouseX>100 && mouseX<150 && mouseY>400 && mouseY<420)) {
      fill(#DBCC23);
    } else {
      fill(255, 255, 0);
    }
    rect(100, 400, 50, 20);
    textSize(15);
    fill(0, 0, 0);
    text("BUY", 110, 416);
    //button5
    if (( mouseX>340 && mouseX<390 && mouseY>400 && mouseY<420)) {
      fill(#DBCC23);
    } else {
      fill(255, 255, 0);
    }
    rect(340, 400, 50, 20);
    textSize(15);
    fill(0, 0, 0);
    text("BUY", 350, 416);
    //button6
    if (( mouseX>540 && mouseX<590 && mouseY>400 && mouseY<420)) {
      fill(#DBCC23);
    } else {
      fill(255, 255, 0);
    }
    rect(540, 400, 50, 20);
    textSize(15);
    fill(0, 0, 0);
    text("BUY", 550, 416);
    //money at the top right
    fill(0, 255, 0);
    textSize(20);
    text("MONEY", 710, 21);
    text(coins, 796, 21);

    //this is the button back that lets the user go back to the frame for the second level
    shopback.setVisible(true);
  }
  //here i have encountered a problem, if the user presses the pause button, the special pill is not functional anymore
  if (pauseframe==true) {
    pause();
    store.setVisible(false);
  }
}
//here i am making the buy button functional for buying avatars
void mousePressed() {
  if (mouseX>106 && mouseX<156 && mouseY>200 && mouseY<220) {
    if (coins>market.price1) {
      grid.coins=grid.coins-market.price1;
      firstcharacter=true;
    }
  }
  if ( mouseX>340 && mouseX<390 && mouseY>200 && mouseY<220) {
    if (coins>market.price2) {
      grid.coins=grid.coins-market.price2;
      secondcharacter=true;
    }
  }
  if (mouseX>540 && mouseX<590 && mouseY>200 && mouseY<220) {
    if (coins>market.price3) {
      grid.coins=grid.coins-market.price3;
      thirdcharacter=true;
    }
  }
  if (mouseX>100 && mouseX<150 && mouseY>400 && mouseY<420) {
    if (coins>market.price4) {
      grid.coins=grid.coins-market.price4;
      fourthcharacter=true;
    }
  }
  if ( mouseX>340 && mouseX<390 && mouseY>400 && mouseY<420) {
    if (coins>market.price5) {
      grid.coins=grid.coins-market.price5;
      fifthcharacter=true;
    }
  }
  if ( mouseX>540 && mouseX<590 && mouseY>400 && mouseY<420) {
    if (coins>market.price6) {
      grid.coins=grid.coins-market.price6;
      sixthcharacter=true;
    }
  }
  if (defaultcharacter) {
    if (mouseX>310 && mouseX<340 && mouseY>30 && mouseY<60) {
      stroke(255);
      noFill();
      square(305, 25, 40);
      character=0;
    }
  }
  if (firstcharacter) {
    if (mouseX>350 && mouseX<380 && mouseY>30 && mouseY<60) {
      stroke(255);
      noFill();
      square(345, 25, 40);
      character=1;
    }
  }
  if (secondcharacter) {
    if (mouseX>390 && mouseX<420 && mouseY>30 && mouseY<60) {
      stroke(255);
      noFill();
      square(385, 25, 40);
      character=2;
    }
  }
  if (thirdcharacter) {
    if (mouseX>440 && mouseX<470 && mouseY>30 && mouseY<60) {
      stroke(255);
      noFill();
      square(435, 25, 40);
      character=3;
    }
  }
  if (fourthcharacter) {
    if (mouseX>490 && mouseX<520 && mouseY>30 && mouseY<60) {
      stroke(255);
      noFill();
      square(485, 25, 40);
      character=4;
    }
  }
  if (fifthcharacter) {
    if (mouseX>540 && mouseX<570 && mouseY>30 && mouseY<60) {
      stroke(255);
      noFill();
      square(535, 25, 40);
      character=5;
    }
  }
  if (sixthcharacter) {
    if (mouseX>590 && mouseX<610 && mouseY>30 && mouseY<60) {
      stroke(255);
      noFill();
      square(585, 25, 40);
      character=6;
    }
  }
}
void display2() {
  fill(#14F737);
  textSize(20);
  text("MONEY", 710, 21);
  text(coins, 796, 21);
  text("LIFE", 500, 21);
  for (int i=0; i<nPics; i++) {
    image(img[i], 540+i*22+10, 6, 20, 20);
  }
}

void buttonmusicon() {
  if (mouseX>9 && mouseX<49 && mouseY>9 && mouseY<49) {
    col=200;
  } else {
    col=255;
  }
  fill(col);
  rect(9, 9, 40, 40);
  if (music==true)
    image(musicon, 9, 9, 40, 40);
  else {
    image(mute, 9, 9, 40, 40);
  }
}

void buttonlevel2() {
  if (mouseX>387 && mouseX<515 && mouseY>617 && mouseY<657) {
    fill(#81FA94);
  } else {
    fill(#16F238);
  }
  rect(387, 617, 128, 40);
  image(levl2, 390, 617);
}
void win() {
  background(0);
  textSize(20);
  fill(255);
  text(wintext, 400, 400);
  next.setVisible(true);
  pause.setVisible(false);
  level1=false;
}
void lost() {
  background(0);
  textSize(20);
  fill(255);
  text(losttext, 400, 400);
  pause.setVisible(false);
  backlvl1.setVisible(true);
  nPics=3;
}
void display() {
  fill(#14F737);
  textSize(20);
  text("MONEY", 710, 21);
  text(grid.coins, 796, 21);
  text("LIFE", 500, 21);
  for (int i=0; i<nPics; i++) {
    image(img[i], 540+i*22+10, 6, 20, 20);
  }
}
void loselife() {
  if (player2.hit(monster4)) {
    println("hit");
    loselife.rewind();
    loselife.play();
    if (nPics==3) {
      nPics=2;
    } else if (nPics==2) {
      nPics=1;
    } else if (nPics==1) {
      nPics=0;
      lost=true;
    }
    restart2();
  }
  if (player2.hit(monster5)) {
    println("hit");
    loselife.rewind();
    loselife.play();
    if (nPics==3) {
      nPics=2;
    } else if (nPics==2) {
      nPics=1;
    } else if (nPics==1) {
      nPics=0;
      lost=true;
    }
    restart2();
  }
  if (player2.hit(monster6)) {
    loselife.rewind();
    loselife.play();
    if (nPics==3) {
      nPics=2;
    } else if (nPics==2) {
      nPics=1;
    } else if (nPics==1) {
      nPics=0;
      lost=true;
    }
    restart2();
  }
  if (player2.hit(monster7)) {
    loselife.rewind();
    loselife.play();
    if (nPics==3) {
      nPics=2;
    } else if (nPics==2) {
      nPics=1;
    } else if (nPics==1) {
      nPics=0;
      lost=true;
    }
    restart2();
  }
}
void losinglife() {
  if (player.hit(blue)) {
    println("hit");
    if (music==true) {
      loselife.rewind();
      loselife.play();
    }
    if (nPics==3) {
      nPics=2;
    } else if (nPics==2) {
      nPics=1;
    } else if (nPics==1) {
      nPics=0;
      lost=true;
    }
    restart();
  }
  if (player.hit(green)) {
    println("hit");
    if (music==true) {
      loselife.rewind();
      loselife.play();
    }
    if (nPics==3) {
      nPics=2;
    } else if (nPics==2) {
      nPics=1;
    } else if (nPics==1) {
      nPics=0;
      lost=true;
    }
    restart();
  }
  if (player.hit(purp)) {
    if (music==true) {
      loselife.rewind();
      loselife.play();
    }
    if (nPics==3) {
      nPics=2;
    } else if (nPics==2) {
      nPics=1;
    } else if (nPics==1) {
      nPics=0;
      lost=true;
    }
    restart();
  }
}
void restart2() {
  player2.x=303;
  player2.y=383;
  monster4.x=224;
  monster4.y=705;
  monster5.x=533;
  monster5.y=862;
  monster6.x=790;
  monster6.y=241;
}
void restart() {

  player.x=30;
  player.y=101;
  blue.x=123;
  blue.y=807;
  purp.x=714;
  purp.y=471;
  green.x=834;
  green.y=471;
}
/*
void pause2(){
 image(restart, 100, 200, 700, 600);
 resume.setVisible(true);
 player2.xSpeed=0;
 player2.ySpeed=0;
 monster4.speed=0;
 monster5.speed=0;
 monster6.speed=0;
 }
 */
void pause() {
  image(restart, 100, 200, 700, 600);
  resume.setVisible(true);
  player.xSpeed=0;
  player.ySpeed=0;
  green.speed=0;
  purp.speed=0;
  blue.speed=0;
}
//the next part in which I am assigning values to the variable d was a piece of code implemented by TfGuy44(2015)
void keyPressed() {
  if ( keyCode == RIGHT) { 
    player.d=0;
  }
  if ( keyCode == DOWN ) { 
    player.d=1;
  }
  if ( keyCode == LEFT ) { 
    player.d=2;
  }
  if ( keyCode == UP ) { 
    player.d=3;
  }

  if ( keyCode == RIGHT ) { 
    player2.d=0;
  }
  if ( keyCode == DOWN ) { 
    player2.d=1;
  }
  if ( keyCode == LEFT) { 
    player2.d=2;
  }
  if ( keyCode == UP ) { 
    player2.d=3;
  }
}
//frame for the end of the game
void theEnd() {
  background(0);
  image(end, 100, 100);
  store.setVisible(false);
  level2=false;
}
void mouseClicked() {
  //button level 2
  println(mouseX, mouseY);
  if (mouseX>387 && mouseX<515 && mouseY>617 && mouseY<657) {
    level2=true;
  }
  //button for muting the music
  if (mouseX>9 && mouseX<49 && mouseY>9 && mouseY<49) {
    music=!music;
  }
}
