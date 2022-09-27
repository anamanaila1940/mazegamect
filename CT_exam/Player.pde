class Player extends Objects {
  int x=282, y=575;
  int xSpeed=1, ySpeed=1;
  int d, w=15, h=15;

  boolean energyd = false;
  int energyd_countdown = 0;
  Player() {
    d=0;
    super.setPosition(x, y);
    super.setRectangle(w, h);
  }

  void draw() {
    move();
    if (character==0) {
      image(play, x, y, w, h);
    }
    /*
    if (character==1) {
      image(pac, x, y, w, h);
    }
    */
    if (level1==true) {
      if (x>240 && y>361 && x<377 && y<457) {
        win=true;
        if(music){
        wingame.rewind();
        wingame.play();}
      }
    }
  }
  
  void move() {
   //there is a bug here in terms which consists in the fact that the avatar might run through the blocks because the measuremnts used in for example  !grid.is_wall(player.x+player.w+player.xSpeed, player.y) are not covering all the possibilities 
    //because there is a risk of making the avatar unable to move and also because in the fuction is_wall I have used round(x/20), not int(x/20)
    if (d==0  && !grid.is_wall(player.x+player.w+player.xSpeed, player.y) ) { 
      x+=xSpeed;
      super.setPosition(x, y);
    }
    if (d==1 && !grid.is_wall(player.x, player.y+player.h+player.ySpeed) ) { 
      y+=ySpeed;
      super.setPosition(x, y);
    }
    if (d==2 && !grid.is_wall(player.x-player.w/4-player.xSpeed, player.y)) { 
      x-=xSpeed;
      super.setPosition(x, y);
    }
    if (d==3 && !grid.is_wall(player.x, player.y-player.h/4-player.ySpeed)) { 
      y-=ySpeed;
      super.setPosition(x, y);
    }
    
    
      grid.eat_dot_at(x, y);

  }
  
}
