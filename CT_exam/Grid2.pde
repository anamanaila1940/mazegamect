class Grid2 {
//t is for blocks, f is for grass and coins, m is for energy drinks, p is only for grass in order to cover the empty spaces after the avatar eats the special elements, such as the coins, q is for the special pill, i is for the finish area
  int t=1, f=2, m=3, p=0, q=4, i=5; 
  int coins=0;
  int[][] grid = {{t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
    {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
    {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
    {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
    {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}, 
    {t, f, f, f, f, f, q, f, f, m, f, f, f, f, m, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t}, 
    {t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t}, 
    {t, f, t, f, f, f, f, m, f, f, f, f, f, f, f, f, f, f, f, f, q, f, f, f, m, f, f, f, f, f, f, m, f, q, f, f, f, f, f, f, f, f, t, f, t}, 
    {t, f, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t}, 
    {t, f, t, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, q, f, f, f, f, f, f, f, f, m, f, f, t, f, t, f, t, f, t, f, t}, 
    {t, m, t, f, t, f, t, t, t, t, t, t, t, t, t, t, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, q, t, f, t}, 
    {t, f, f, f, t, f, t, f, f, f, f, f, f, f, f, f, t, f, f, f, q, f, f, f, f, f, f, f, f, f, f, q, f, f, f, f, f, q, t, t, t, f, t, f, t}, 
    {t, f, t, t, t, f, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, f, t}, 
    {t, f, f, m, t, m, t, f, t, f, f, f, m, f, f, m, q, f, f, f, m, f, q, f, f, f, f, f, f, m, f, q, f, f, f, f, t, q, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, t, t, t, t, t, t, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, f, f, f, f, f, m, f, f, f, f, f, f, f, f, m, f, f, f, f, f, q, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, t, t, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, m, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, m, t, f, t, t, t, f, f, f, m, t, f, m, f, f, f, f, m, f, f, m, f, f, f, f, t, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, m, t, f, t, f, t, f, f, f, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, f, f, f, t, f, f, f, t, f, f, f, t, f, f, f, t, f, f, f, f, f, f, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, q, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, m, t, m, t, f, t, f, t, f, t, q, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, q, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, f, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, m, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, q, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, m, t, f, t, f, t, q, t, f, t, m, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, q, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, i, t}, 
    {t, f, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, m, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, i, i}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, i, t}, 
    {t, f, t, f, t, f, t, f, t, m, t, f, t, m, t, f, f, f, t, f, f, f, t, m, f, f, t, f, f, f, t, f, t, f, t, f, f, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, f, f, f, f, m, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, t, t, t, t, t, t, t, t, t, t, f, t, t, t, t, t, t, t, t, t, t, f, t, q, t, m, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, f, f, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, t, t, t, t, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, m, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t, f, t}, 
    {t, f, t, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, m, f, f, f, f, f, f, m, f, f, f, f, f, f, f, f, f, f, t, f, t, f, t}, 
    {t, f, t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t, f, t}, 
    {t, f, t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t, f, t}, 
    {t, f, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, f, t}, 
    {t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, q, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, t}, 
    {t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t}};

  void draw() {
    for (int j=4; j<grid.length; j++) {
      for (int i=0; i<grid[0].length; i++) {
        if (grid[j][i]==2) {
          image(grass, 20*i, 20*j, 20, 20);
        }
        if (grid[j][i] == 1) { 
          image(bloCK, 20*i, 20*j, 20, 20);
        }

        if (grid[j][i] == 2) {

          image(coin, 20*i+10, 20*j+10, 8, 8);
        }      
        if (grid[j][i] == 3) {
          image(grass, 20*i, 20*j, 20, 20);
          image(energy, 20*i+7, 20*j+7, 10, 10);
        }
        if (grid[j][i]==4) {
          image(grass, 20*i, 20*j, 20, 20);
          image(pill, 20*i+7, 20*j+7, 10, 10);
          
        }
        if (grid[j][i]==0){
          image(grass, 20*i, 20*j, 20, 20);
        }
        }
      }
    }
    boolean is_wall(int x, int y) {
      int i = round(x/20);
      int j = round(y/20);
      if(grid[j][i] == 1)
      return true;
      else
      return false;
    }
  void eat_dot_at(int x, int y) {
    int i = round(x/20);
    int j = round(y/20);
    if (grid[j][i] == 3) {
      startenergy2=true;
      if(music){
      drink.rewind();
      drink.play();}
    } else if (grid[j][i] == 2) {
      if(music){
      c.rewind();
      c.play();}
      coins++;
    } else if (grid[j][i]==4) {
      starttimer2=true;
    }
    //here i have used 0 in order to cover it with grass
    grid[j][i] = 0;
  }
}
