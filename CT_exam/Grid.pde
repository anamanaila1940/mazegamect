class Grid {
  //t is for block, f is for coins, m is for energy drink, p is for pill and q is for the empty space
  int t=1, f=2, m=3, p=0, q=4;
  int coins=0;
  //i have chosen to put blocks on the first 4 rows in order to let space for the UI elements
  int[][] grid = {{t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
                  {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
                  {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
                  {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
                  {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
                  {t, f, f, f, f, f, f, t, t, f, f, t, t, t, t, t, t, t, t, t, t, t, t, f, f, f, f, t, t, t, t, t, t, f, f, f, f, f, t, t, t, t, t, t, t}, 
                  {t, f, f, f, t, t, f, q, t, f, f, f, m, t, f, m, f, f, f, f, f, f, t, f, t, t, f, t, t, f, f, f, f, q, f, f, f, f, f, f, f, f, t, t, t}, 
                  {t, f, f, f, f, t, f, f, f, f, f, t, f, t, f, t, f, t, t, t, t, f, f, f, t, t, f, t, t, f, t, t, f, f, t, f, t, m, t, f, f, f, t, t, t}, 
                  {t, f, t, t, f, t, t, f, f, t, f, t, f, f, m, f, f, f, t, t, t, f, f, f, f, f, f, f, f, f, t, t, t, f, t, m, f, f, t, f, f, f, t, t, t}, 
                  {t, f, f, q, f, t, t, f, t, t, t, t, t, t, t, f, f, t, f, f, t, f, t, f, t, t, t, f, f, f, f, t, t, m, t, t, t, m, t, f, f, f, f, t, t}, 
                  {t, f, t, t, f, f, f, f, f, f, f, f, f, f, f, f, f, t, t, f, f, f, f, m, t, t, t, f, t, t, f, t, t, f, f, t, t, t, t, f, f, f, f, t, t}, 
                  {t, f, t, t, f, t, t, t, t, f, f, f, f, t, f, t, f, t, t, f, m, t, f, f, t, f, f, f, m, f, f, t, t, f, f, t, t, t, t, f, f, f, f, t, t}, 
                  {t, f, f, f, q, t, t, t, t, f, t, t, m, t, f, f, f, f, f, f, t, t, t, q, t, f, t, t, f, f, t, t, f, t, f, f, f, f, t, f, t, t, f, f, t}, 
                  {t, t, f, t, f, t, t, t, t, f, t, t, t, t, f, f, t, t, f, t, t, t, t, f, t, f, f, t, f, m, t, t, f, t, t, t, t, f, f, f, t, t, t, f, t}, 
                  {t, t, f, f, f, t, f, f, f, f, f, t, t, t, t, t, t, t, f, t, t, t, t, f, t, t, t, f, f, f, t, t, f, t, t, t, t, t, f, f, t, t, f, f, t}, 
                  {t, t, t, f, t, f, f, t, t, t, f, f, t, t, t, t, t, t, f, f, t, t, t, f, f, m, f, f, t, m, f, f, f, t, t, t, t, f, f, f, t, t, f, t, t}, 
                  {t, t, t, f, f, f, t, t, t, f, f, f, t, t, t, t, t, t, t, f, t, f, f, f, f, m, t, f, t, t, t, t, f, t, t, t, t, f, t, t, f, f, f, t, t}, 
                  {t, t, f, t, t, t, t, t, f, f, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, m, f, f, f, t, t, f, t, t, t, t, f, f, f, f, t, f, t, t}, 
                  {t, t, f, t, t, t, t, f, f, f, t, t, p, p, p, p, p, p, p, t, f, f, f, f, t, t, f, t, t, t, t, t, f, t, t, t, t, t, f, t, t, t, f, t, t}, 
                  {t, m, f, t, t, t, f, f, t, f, t, t, p, p, p, p, p, p, p, t, f, t, t, m, t, t, f, t, t, t, t, f, q, t, f, f, f, t, m, t, t, t, f, t, t}, 
                  {t, t, f, t, t, f, f, t, t, f, t, t, p, p, p, p, p, p, p, f, f, f, t, f, t, t, f, t, t, f, f, f, t, t, f, t, f, t, f, t, t, t, f, t, t}, 
                  {t, f, f, t, f, f, t, t, t, f, t, t, p, p, p, p, p, p, p, t, t, f, t, t, t, t, f, t, t, f, t, f, t, t, f, t, f, t, f, f, f, f, f, t, t}, 
                  {t, f, f, f, f, f, f, f, f, f, f, t, p, p, p, p, p, p, p, t, t, f, t, f, f, f, t, t, t, f, f, f, f, f, f, f, f, t, f, t, t, f, f, t, t}, 
                  {t, f, f, f, f, f, t, f, t, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, t, t, f, f, f, f, f, f, f, f, f, f, t, t, f, f, f, t, t}, 
                  {t, f, f, f, f, f, t, f, t, t, f, t, t, t, t, t, f, f, f, f, f, f, f, f, f, t, f, f, f, t, t, t, f, t, t, t, t, f, t, t, f, m, t, t, t}, 
                  {t, f, f, t, t, f, f, f, f, f, f, t, t, t, t, t, f, f, m, m, t, t, f, f, f, f, f, t, f, t, t, t, f, t, t, t, t, f, t, t, f, f, t, t, t}, 
                  {t, f, f, f, f, f, t, f, t, t, f, f, f, t, t, t, f, t, t, m, f, t, f, f, f, t, f, t, f, t, t, t, f, t, t, t, t, f, t, t, f, f, t, t, t}, 
                  {t, f, f, f, t, f, f, f, t, t, f, f, f, f, f, t, f, f, f, f, f, f, f, f, f, f, f, f, q, f, f, f, f, t, t, t, t, f, m, f, m, f, f, f, t}, 
                  {t, t, f, f, f, f, f, t, t, t, f, t, t, t, f, t, f, f, m, f, t, t, t, t, t, t, t, f, t, f, t, t, f, f, f, t, t, f, t, f, f, t, t, f, t}, 
                  {t, t, f, f, t, t, f, t, t, t, f, t, t, t, q, f, f, t, t, f, f, f, t, t, t, t, t, f, t, f, t, f, f, f, f, t, t, f, t, m, f, t, t, f, t}, 
                  {t, t, f, f, t, t, f, t, t, t, f, t, t, t, f, t, t, t, t, t, t, f, f, f, f, t, t, f, f, f, t, f, f, f, t, t, f, f, f, m, f, t, f, f, t}, 
                  {t, t, f, f, t, t, f, t, t, t, f, t, t, t, f, f, f, f, t, t, t, f, f, f, t, t, t, f, t, t, f, f, f, f, t, t, t, t, f, t, f, f, f, t, t}, 
                  {t, f, f, f, t, t, f, f, f, f, f, f, f, f, f, f, t, f, t, t, t, f, f, f, t, t, t, f, t, f, f, f, t, t, t, t, t, t, m, t, t, f, t, t, t}, 
                  {t, f, t, f, t, t, f, t, t, t, f, t, t, t, t, f, t, f, t, t, t, f, t, f, f, f, t, f, t, f, t, f, t, t, t, t, t, t, m, t, t, f, t, t, t}, 
                  {t, f, t, f, t, t, f, t, t, t, f, t, t, t, t, f, t, f, f, f, t, f, t, t, f, f, f, f, t, f, f, f, f, q, m, f, m, f, f, t, t, f, t, m, t}, 
                  {t, f, f, f, f, f, f, t, t, t, f, f, f, f, t, f, t, t, t, f, t, f, f, f, t, f, t, t, t, f, f, f, t, t, t, f, f, t, t, t, t, f, t, f, t}, 
                  {t, m, f, f, f, f, f, f, t, t, f, t, t, f, t, f, t, t, t, f, t, f, t, f, t, f, t, t, f, f, f, t, t, t, t, f, f, t, t, f, f, f, t, f, t}, 
                  {t, t, f, f, m, f, f, f, t, f, f, t, t, f, t, f, f, f, f, f, f, t, f, f, f, f, t, f, f, f, f, t, t, t, f, f, f, t, t, f, t, f, f, f, t}, 
                  {t, t, m, f, f, t, f, f, t, f, t, t, t, f, t, t, t, f, f, t, f, t, f, f, t, f, f, f, f, f, f, m, f, m, f, t, f, f, t, f, f, f, t, t, t}, 
                  {t, t, f, f, f, f, f, t, t, f, t, t, t, f, f, f, f, f, f, t, f, f, f, t, t, f, t, f, t, f, t, f, t, t, t, t, t, m, t, t, m, f, t, f, t}, 
                  {t, t, m, f, f, f, f, t, t, f, m, f, t, t, t, t, t, t, f, t, t, f, t, t, t, f, t, m, t, f, t, f, t, f, f, f, t, f, t, t, f, f, f, f, t}, 
                  {t, t, t, m, f, f, t, t, t, f, f, t, t, f, f, m, f, t, f, t, t, f, f, f, f, f, m, f, f, m, t, f, t, f, m, f, f, f, t, f, t, m, t, m, t}, 
                  {t, t, f, f, f, f, f, f, f, f, f, f, f, m, t, t, f, t, f, f, f, f, t, t, t, t, f, t, t, t, t, m, t, t, f, f, m, f, t, f, t, f, f, f, t}, 
                  {t, t, t, t, f, f, f, t, t, t, f, f, t, t, t, t, f, m, f, t, t, t, t, t, t, t, f, f, m, f, f, f, t, t, f, t, t, f, f, m, t, t, t, t, t}, 
                  {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}};

  void draw() {
    for (int j=4; j<grid.length; j++) {
      for (int i=0; i<grid[0].length; i++) {
        if (grid[j][i]==0) {
          fill(0);
        }
        if (grid[j][i] == 1) { 
          image(block, 20*i, 20*j, 20, 20);
        }

        if (grid[j][i] == 2) {

          image(coin, 20*i+10, 20*j+10, 8, 8);
        }      
        if (grid[j][i] == 3) {

          image(energy, 20*i+7, 20*j+7, 10, 10);
        }
        if (grid[j][i]==4) {
          image(pill, 20*i+7, 20*j+7, 10, 10);
        }
      }
    }
  }
  //this function checks if the parameter is hitting the wall
  boolean is_wall(int x, int y) {
    int i = round(x/20);
    int j = round(y/20);
    if(grid[j][i] == 1){
      return true;}
      else{
      return false;}
  }
 //checks if the avatar can eat the dot and what kind of dot it is 
  void eat_dot_at(int x, int y) {
    int i = round(x/20);
    int j = round(y/20);
    if (grid[j][i] == 3) {
      startenergy=true;
      if(music){
      drink.rewind();
      drink.play();}
    } else if (grid[j][i] == 2) {
      if(music){
      c.rewind();
      c.play();}
      coins++;
    } else if (grid[j][i]==4) {
      starttimer=true;
    }
    //here i have used 7, but i can also use any other number, except for 1,2,3,0,4, i can't use 0 because that means that the user finishes the game
    grid[j][i] = 7;
  }
}
