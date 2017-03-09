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
      new Title().drawTitle();
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