ScheneState scheneState;
AlliesLine allies;
ArrayList<Unit> enemies;
ArrayList<Shell> alliesShells;
ArrayList<Shell> enemiesShells;

void setup() {
  size( 800, 600 );
  frameRate( 60 );
  ellipseMode( CENTER );
  smooth();
  
  scheneState = ScheneState.TITLE;
  allies = new AlliesLine();
  allies.addUnit( new Unit( 100, 100, 10, color( 0, 255, 0 ) ) );
}

void draw() {
  background( 0 );
  
  switch ( scheneState ) {
    case TITLE:
      new Title().drawTitle();
      break;
      
    case BATTLE:
      moveEnemies();
      allies.draw();
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

void moveEnemies() {
  for ( Unit u : enemies ) {
    // u.move();
  }
}