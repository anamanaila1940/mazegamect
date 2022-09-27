class Monster2 extends Objects {
  //int x=224, y=705;
  //int w=15, h=15;
  int colour;
  int speed=1;
  Monster2(int x,int y,int w,int h,int col) {
    super.setPosition(x, y);
    super.setRectangle(w, h);
    colour=col;
  }
  void draw(){
    fill(colour);
    rect(x,y,rectWidth,rectHeight);
  }
  void move(){
    if(player2.x<x && !grid2.is_wall(x-rectWidth/4, y) ){
      x-=speed;
      super.setPosition(x, y);
    }
    else if(player2.x<x && !grid2.is_wall(x-rectWidth, y) && !grid2.is_wall(x+rectWidth, y) ){
      x+=speed;
      super.setPosition(x, y);
    }
    if(player2.x>x && !grid2.is_wall(x+rectWidth, y) ){
      x+=speed;
      super.setPosition(x, y);
    }
    if(player2.y<y && !grid2.is_wall(x,y-rectHeight/2+4) && !grid2.is_wall(x+2,y-rectHeight/2+4)){
      y-=speed;
      super.setPosition(x, y);
    }
    if(player2.y>y && !grid2.is_wall(x,y+rectHeight)){
      y+=speed;
      super.setPosition(x, y);
    }
  }
}
