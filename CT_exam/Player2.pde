class Player2 extends Objects {
  int x=303, y=383;
  int xSpeed=2, ySpeed=2;
  int d, w=15, h=15;

  boolean energyd = false;
  int energyd_countdown = 0;
  Player2() {
    d=0;
    super.setPosition(x, y);
    super.setRectangle(w, h);
  }

  void draw() {
    move();
    if (character==0) {
      image(play, x, y, w, h);
    }
    if (character==1) {
      image(pac, x, y, w, h);
    }
    if(character==2){
      image(play1,x,y,w,h);
    }
    if(character==3){
      image(play2,x,y,w,h);
    }
    if(character==4){
      image(bird,x,y,w,h);
    }
    if(character==5){
      image(big,x,y,w,h);
    }
    if(character==6){
      image(bluegummy,x,y,w,h);
    }
      if (x>859 && y>519 && x<898 && y<576 ) {
        win2=true;
        xSpeed=0;
        ySpeed=0;
        wingame.rewind();
        wingame.play();
      }
  }
  void move() {

    if (d==0 && !grid2.is_wall(player2.x+player2.w, player2.y)) { 
      x+=xSpeed;
      super.setPosition(x, y);
    }
    if (d==1 && !grid2.is_wall(player2.x, player2.y+player2.h+player2.ySpeed) ) { 
      y+=ySpeed;
      super.setPosition(x, y);
    }
    if (d==2  && !grid2.is_wall(player2.x-player2.w/4-player2.xSpeed, player2.y)) { 
      x-=xSpeed;
      super.setPosition(x, y);
    }
    if (d==3 && !grid2.is_wall(player2.x, player2.y-player2.w/4-player2.ySpeed)) { 
      y-=ySpeed;
      super.setPosition(x, y);
    }
   
      grid2.eat_dot_at(x, y);

    
  }
}
