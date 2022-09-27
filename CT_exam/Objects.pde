class Objects {  
  int x, y, rectWidth, rectHeight;  
  Objects() {
  }  
  void setPosition(int newX, int newY) {    
    x = newX;   
    y= newY;
  }  
  void setRectangle(int newrectWidth, int newrectHeight) {    
    rectWidth = newrectWidth;    
    rectHeight = newrectHeight;
  }
  boolean hit(Objects other) {    
    if (x + rectWidth >= other.x &&     // r1 right edge past r2 left      
      x <= other.x + other.rectWidth &&       // r1 left edge past r2 right     
      y + rectHeight >= other.y &&       // r1 top edge past r2 bottom      
      y <= other.y + other.rectHeight) {       // r1 bottom edge past r2 top      
      return true;
      
    }    
    return false;
  }
}
