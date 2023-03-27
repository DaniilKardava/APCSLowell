void setup(){
  size(610, 610);
}

void draw(){
  // Center of Head
  fill(255,255,255);
  int[][] centerHeadCoordinatesRight = {{300, 150}, {400, 175}, {350, 265},  {360, 385}, {385, 435}, {370, 500}, {350, 530}, {300, 545}}; 
  int[][] centerHeadCoordinatesLeft = new int[centerHeadCoordinatesRight.length][2];
  
  
  for (int i = 0; i < centerHeadCoordinatesLeft.length; i++){
     int distance = centerHeadCoordinatesRight[i][0] - 300;
     for (int u = 0; u < 2; u ++) {
       centerHeadCoordinatesLeft[i][u] = centerHeadCoordinatesRight[i][u];
       if (u == 0){
         centerHeadCoordinatesLeft[i][u] = centerHeadCoordinatesLeft[i][u] - (2* distance);
       }
     }  
  } 
  
  beginShape();
  //Right side
  for (int i = 0; i < centerHeadCoordinatesRight.length; i++) { 
    vertex(centerHeadCoordinatesRight[i][0], centerHeadCoordinatesRight[i][1]);
  }
  //Left side
  for (int i = centerHeadCoordinatesLeft.length - 1; i > 0; i--) { 
    vertex(centerHeadCoordinatesLeft[i][0], centerHeadCoordinatesLeft[i][1]);
  }
  endShape(CLOSE);
  
  // Eyes
  int[][] RightEye = {{350, 265}, {360, 385}, {385, 435}, {430, 410}, {350, 265}}; 
  int[][] LeftEye = new int[RightEye.length][2];
  
  // Populate the symmetrical copy of RightEye
  for (int i = 0; i < LeftEye.length; i++){
     int distance = RightEye[i][0] - 300;
     for (int u = 0; u < 2; u ++) {
       LeftEye[i][u] = RightEye[i][u];
       if (u == 0){
         LeftEye[i][u] = LeftEye[i][u] - (2* distance);
       }
     }  
  } 
  
  fill(0,0,0);
  beginShape();
  //Right side
  for (int i = 0; i < RightEye.length; i++) { 
    vertex(RightEye[i][0], RightEye[i][1]);
  }
  endShape(CLOSE);
  
  
  //Left side
  beginShape();
  for (int i = LeftEye.length - 1; i > 0; i--) { 
    vertex(LeftEye[i][0], LeftEye[i][1]);
  }
  endShape(CLOSE);
  
  // Cheeks
  int[][] RightCheek = {{400, 175},{350, 265}, {460, 465}, {500, 360}, {400, 175}}; 
  int[][] LeftCheek = new int[RightEye.length][2];
  
  // Populate the symmetrical copy of RightCheek
  for (int i = 0; i < LeftCheek.length; i++){
     int distance = RightCheek[i][0] - 300;
     for (int u = 0; u < 2; u ++) {
       LeftCheek[i][u] = RightCheek[i][u];
       if (u == 0){
         LeftCheek[i][u] = LeftCheek[i][u] - (2* distance);
       }
     }  
  } 
  
  
  fill(255,255,255);
  beginShape();
  //Right side
  for (int i = 0; i < RightCheek.length; i++) { 
    vertex(RightCheek[i][0], RightCheek[i][1]);
  }
  endShape(CLOSE);
  
  
  //Left side
  beginShape();
  for (int i = LeftCheek.length - 1; i > 0; i--) { 
    vertex(LeftCheek[i][0], LeftCheek[i][1]);
  }
  endShape(CLOSE);
  
  // Lower Cheeks
  int[][] LowerRightCheek = {{430, 410},{385, 435}, {370, 500}, {460, 465}, {430, 410}}; 
  int[][] LowerLeftCheek = new int[RightEye.length][2];
  
  // Populate the symmetrical copy of LowerRightCheek
  for (int i = 0; i < LowerLeftCheek.length; i++){
     int distance = LowerRightCheek[i][0] - 300;
     for (int u = 0; u < 2; u ++) {
       LowerLeftCheek[i][u] = LowerRightCheek[i][u];
       if (u == 0){
         LowerLeftCheek[i][u] = LowerLeftCheek[i][u] - (2* distance);
       }
     }  
  } 
  
  beginShape();
  //Right side
  for (int i = 0; i < LowerRightCheek.length; i++) { 
    vertex(LowerRightCheek[i][0], LowerRightCheek[i][1]);
  }
  endShape(CLOSE);
  
  
  //Left side
  beginShape();
  for (int i = LowerLeftCheek.length - 1; i > 0; i--) { 
    vertex(LowerLeftCheek[i][0], LowerLeftCheek[i][1]);
  }
  endShape(CLOSE);
  
  
  // Mouth Lines
  int[][] RightMouth = {{300, 500}, {345, 510}, {370, 500}}; 
  int[][] LeftMouth = new int[RightMouth.length][2];
  
  // Populate the symmetrical copy of RightMouth
  for (int i = 0; i < LeftMouth.length; i++){
     int distance = RightMouth[i][0] - 300;
     for (int u = 0; u < 2; u ++) {
       LeftMouth[i][u] = RightMouth[i][u];
       if (u == 0){
         LeftMouth[i][u] = LeftMouth[i][u] - (2* distance);
       }
     }  
  } 
  
  //Right side
  for (int i = 1; i < RightMouth.length; i++) { 
    line(RightMouth[i-1][0], RightMouth[i-1][1], RightMouth[i][0], RightMouth[i][1]);
  }
  
  
  //Left side
  for (int i = 1; i < LeftMouth.length; i++) {
    line(LeftMouth[i-1][0], LeftMouth[i-1][1], LeftMouth[i][0], LeftMouth[i][1]);
  }
  
  
  // Mouth 
  fill(0,0,0);
  
  beginShape();
  vertex(300,500);
  vertex(325,505);
  vertex(300,515);
  vertex(275,505);
  endShape(CLOSE);
  
  // Nose
  int[][] RightNose = {{300, 490},{340, 480}, {365, 455}, {300, 460}}; 
  int[][] LeftNose = new int[RightNose.length][2];
  
  // Populate the symmetrical copy of RightNose
  for (int i = 0; i < LeftNose.length; i++){
     int distance = RightNose[i][0] - 300;
     for (int u = 0; u < 2; u ++) {
       LeftNose[i][u] = RightNose[i][u];
       if (u == 0){
         LeftNose[i][u] = LeftNose[i][u] - (2* distance);
       }
     }  
  } 
  
  beginShape();
  //Right side
  for (int i = 0; i < RightNose.length; i++) { 
    vertex(RightNose[i][0], RightNose[i][1]);
  }
  
  for (int i = LeftNose.length - 1; i > 0; i--) { 
    vertex(LeftNose[i][0], LeftNose[i][1]);
  }
  endShape(CLOSE);
  
  // Ears
  int[][] RightEar = {{400, 175},{473, 310}, {525, 200}, {475, 125}, {400, 175}}; 
  int[][] LeftEar = new int[RightEar.length][2];
  
  // Populate the symmetrical copy of RightEar
  for (int i = 0; i < LeftEar.length; i++){
     int distance = RightEar[i][0] - 300;
     for (int u = 0; u < 2; u ++) {
       LeftEar[i][u] = RightEar[i][u];
       if (u == 0){
         LeftEar[i][u] = LeftEar[i][u] - (2* distance);
       }
     }  
  } 
  
  
  beginShape();
  //Right side
  for (int i = 0; i < RightEar.length; i++) { 
    vertex(RightEar[i][0], RightEar[i][1]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = LeftEar.length - 1; i > 0; i--) { 
    vertex(LeftEar[i][0], LeftEar[i][1]);
  }
  endShape(CLOSE);
}
