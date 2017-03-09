ScheneState scheneState;
AlliesLine alliesLine;
ArrayList<Unit> enemiesUnits;
ArrayList<Shell> alliesShells;
ArrayList<Shell> enemiesShells;

void setup() {
  size( 800, 600 );
  frameRate( 60 );
  ellipseMode( CENTER );
  smooth();
  
  scheneState = ScheneState.TITLE;
  alliesLine = new AlliesLine();
  alliesLine.addUnit( new Unit( 100, 100, 10, color( 0, 255, 0 ) ) );
}

void draw() {
  background( 0 );
  
  switch ( scheneState ) {
    case TITLE:
      drawTitle();
      break;
      
    case BATTLE:
      // move enemies
      alliesLine.draw();
      // move allies' shells
      // move enemies' shells
      // calculate collision
      // calculate camera position
      // draw background
      // draw enemies
      // draw allies
      // draw allies' shells
      // draw enemies' shells
      break;
      
    case RESULT:
      break;
  }
}

void drawTitle() {
  color textColor = color( 255, 255, 255 );
  fill( textColor );
  
  int textSize = 10;
  textSize( textSize );
  
  textAlign( CENTER );
  
  pushMatrix();
    translate( width/2, height/2 - 50 );
    scale( 5 );
    String title = new String( "Line of Battle" );
    text( title, 0, 0 );
  popMatrix();
  
  pushMatrix();
    translate( width/2, height/2 + 25 );
    scale( 2 );
    String message = new String( "Press Left Mouse Button to Start" );
    text( message, 0, 0 );
  popMatrix();
  
  
  if ( mousePressed ) {
    scheneState = ScheneState.BATTLE;
  }
}