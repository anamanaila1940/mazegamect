class Monster extends Objects {
  //int x=224, y=705;
  //int w=15, h=15;
  int c1,c2,c3;
  int speed=1;
  Monster(int x,int y,int w,int h,int col1,int col2,int col3) {
    super.setPosition(x, y);
    super.setRectangle(w, h);
    c1=col1;
    c2=col2;
    c3=col3;
  }
  void draw(){
    fill(c1,c2,c3);
    rect(x,y,rectWidth,rectHeight);
  }
  void move(){
    
    if(player.x<x && !grid.is_wall(x-rectWidth/4, y) ){
      x-=speed;
      super.setPosition(x, y);
    }
    else if(player.x<x && !grid.is_wall(x-rectWidth, y) && !grid.is_wall(x+rectWidth, y) ){
      x+=speed;
      super.setPosition(x, y);
    }
    if(player.x>x && !grid.is_wall(x+rectWidth, y) ){
      x+=speed;
      super.setPosition(x, y);
    }
    if(player.y<y && !grid.is_wall(x,y-rectHeight/2+4) && !grid.is_wall(x+2,y-rectHeight/2+4)){
      y-=speed;
      super.setPosition(x, y);
    }
    if(player.y>y && !grid.is_wall(x,y+rectHeight)){
      y+=speed;
      super.setPosition(x, y);
    }
  }
}
