class Monster3 extends Objects{
   int x=533, y=862;
  int w=15, h=15;
  int speed=1;
  Monster3() {
    super.setPosition(x, y);
    super.setRectangle(w, h);
  }
  void draw(){
    image(monster2,x,y,w,h);
  }
  void move(){
    if(player.x<x && !grid.is_wall(x-w/4, y) ){
      x-=speed;
      super.setPosition(x, y);
    }
    else if(player.x<x && !grid.is_wall(x-w, y) && !grid.is_wall(x+w, y) ){
      x+=speed;
      super.setPosition(x, y);
    }
    if(player.x>x && !grid.is_wall(x+w, y) ){
      x+=speed;
      super.setPosition(x, y);
    }
    if(player.y<y && !grid.is_wall(x,y-h/2+4) && !grid.is_wall(x+2,y-h/2+4)){
      y-=speed;
      super.setPosition(x, y);
    }
    if(player.y>y && !grid.is_wall(x,y+h)){
      y+=speed;
      super.setPosition(x, y);
    }
  }
}
