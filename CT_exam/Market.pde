class Market{
  String text="Price:";
  int price1=200;
  int price2=50;
  int price3=50;
  int price4=400;
  int price5=500;
  int price6=300;
  
  void draw(){
    //i haven't made more spaces in terms of height between the pictures because the button for the second level is not made using G4P, and the user might press the button by mistake
    background(0);
    textSize(15);
    fill(255);
    //first
    text(text+price1,100,95);
    image(pac,100,110,80,80);
    //2nd
    text(text+price2,340,95);
    image(play1,340,110,80,80);
    //3rd
    text(text+price3,540,95);
    image(play2,540,110,80,80);
    //4th
    text(text+price4,100,295);
    image(bird,100,310,80,80);
    //5th
    text(text+price5,340,295);
    image(big,340,310,80,80);
    //6th
    text(text+price6,540,295);
    image(bluegummy,540,310,80,80);
    text("Select one",400,20);
    if (defaultcharacter) {
      image(play, 310, 30, 30, 30);
    }
    if (firstcharacter) {
      image(pac, 350, 30, 30, 30);
    }
    if(secondcharacter){
      image(play1,390,30,30,30);
    }
    if(thirdcharacter){
      image(play2,440,30,30,30);
    }
    if(fourthcharacter){
      image(bird,490,30,30,30);
    }
    if(fifthcharacter){
      image(big,540,30,30,30);
    }
    if(sixthcharacter){
      image(bluegummy,590,30,30,30);
    }
  }
  
}
