import de.bezier.guido.*;

final int NUM_ROWS = 20;
final int NUM_COLS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines; //ArrayList of just the minesweeper buttons that are mined
boolean gameOver = false;

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    // Initialize and fill buttons
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for (int r = 0; r < NUM_ROWS ; r++) {
     for (int c = 0; c < NUM_COLS ; c++ ){
      buttons[r][c] = new MSButton(r,c);
     }
    }
    
    // Initialize mines
    mines = new ArrayList<MSButton>();
    
    
    setMines();
}

public void setMines()
{
    int totalMines = (int)(NUM_ROWS * NUM_COLS * .2);
    for (int i = 0 ; i < totalMines; i++) {
      int randomRow = (int)(Math.random() * NUM_ROWS);
      int randomCol = (int)(Math.random() * NUM_COLS);
      if (!mines.contains(buttons[randomRow][randomCol])) {
        mines.add(buttons[randomRow][randomCol]);
      } else {
        i--; 
       }
     
    }
}

public void draw ()
{
    background( 0 );
    
    // Draw mines
    for (int r = 0; r < NUM_ROWS ; r++) {
     for (int c = 0; c < NUM_COLS ; c++ ){
      buttons[r][c].draw();
     }
      
    }
    
    if(isWon() == true)
        displayWinningMessage();
}
public boolean isWon()
{
    int totalClicks = 0;
    int totalMines = (int)(NUM_ROWS * NUM_COLS * .2);
    int targetClicks = NUM_ROWS * NUM_COLS - totalMines;
    for (int r = 0; r < NUM_ROWS ; r++) {
     for (int c = 0; c < NUM_COLS ; c++ ){
       if (buttons[r][c].getClicked()) {
        totalClicks += 1;
       }
     }  
    }
    return totalClicks == targetClicks;
}
public void displayLosingMessage()
{
    gameOver = true;
    // Reveal all mines
    for (int i = 0; i < mines.size(); i++) {
       mines.get(i).setClicked(true);
    }
    
    String message = "YOU LOSE";
    // Show game over text
    for (int i = 0; i < 8; i++) {
      buttons[NUM_ROWS / 2][i + NUM_COLS / 2 - 4].setLabel(message.charAt(i) + "");
    }
    
}
public void displayWinningMessage()
{
    gameOver = true;
    String message = "YOU WIN!";
    // Show game over text
    for (int i = 0; i < 8; i++) {
      buttons[NUM_ROWS / 2][i + NUM_COLS / 2 - 4].setLabel(message.charAt(i) + "");
    }
}
public boolean isValid(int r, int c)
{
    return (r >= 0 && r < NUM_ROWS && c>=0 && c < NUM_COLS);
}
public int countMines(int row, int col)
{
    int numMines = 0;
    for (int i = -1 ; i  < 2; i ++ ) {
      for (int j = -1 ; j < 2 ; j++ ){
        if (!(i == 0 && j == 0)) {
          if (isValid(row + i, col + j)) {
            if (mines.contains(buttons[row + i][col + j])) {
             numMines += 1; 
            }
          }
          
        }
      }
    }
    return numMines;
}

public class MSButton
{
    private int myRow, myCol;
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;
    
    public MSButton ( int row, int col )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        myRow = row;
        myCol = col; 
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
        flagged = clicked = false;
        Interactive.add( this ); // register it with the manager
    }

    // called by manager
    public void mousePressed () 
    {
        if (!(gameOver)){
          if (mouseButton == RIGHT) {
            flagged = !flagged;
            clicked = !clicked;
          } else if (mines.contains(this)) {
            clicked = true;
            displayLosingMessage();
          } else if (countMines(myRow, myCol) != 0){
            clicked = true;
            this.setLabel(countMines(myRow, myCol));
          } else {
            clicked = true;
            this.setLabel("");
            // Check surroundings squares for 
            for (int i = -1 ; i  < 2; i ++ ) {
              for (int j = -1 ; j < 2 ; j++ ){
                if (!(i == 0 && j == 0)) {
                  if (isValid(myRow + i, myCol + j)) {
                    if (!(mines.contains(buttons[myRow + i][myCol + j])) && !(buttons[myRow + i][myCol + j].getClicked())) {
                      buttons[myRow + i][myCol + j].mousePressed();
                    }
                  }
                  
                }
              }
            }
          }
        }
    }
    public void draw () 
    {    
        if (flagged)
            fill(0);
        else if( clicked && mines.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(myLabel,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        myLabel = newLabel;
    }
    public void setLabel(int newLabel)
    {
        myLabel = ""+ newLabel;
    }
    public boolean isFlagged()
    {
        return flagged;
    }
    public void setClicked(boolean click) {
     clicked = click; 
    }
    public boolean getClicked() {
     return clicked; 
    }
}
