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
  
  enemies = new ArrayList<Unit>();
  alliesShells = new ArrayList<Shell>();
  enemiesShells = new ArrayList<Shell>();
}

void draw() {
  switch ( scheneState ) {
    case TITLE:
      new Title().drawTitle();
      break;
      
    case BATTLE:
      moveEnemies();
      allies.draw();
      moveAlliesShells();
      moveEnemiesShells();
      calculateAlliesShellsCollision();
      calculateEnemiesShellsCollision();
      
      pushMatrix();
        // calculate camera position
        background( 0 );
        drawEnemies();
        drawAllies();
        drawAlliesShells();
        drawEnemiesShells();
      popMatrix();
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

void moveAlliesShells() {
  for ( Shell s : alliesShells ) {
    s.move();
  }
}

void moveEnemiesShells() {
  for ( Shell s : enemiesShells ) {
    s.move();
  }
}

void calculateAlliesShellsCollision() {
}

void calculateEnemiesShellsCollision() {
}

void drawEnemies() {
  for ( Unit u : enemies ) {
    u.draw();
  }
}

void drawAllies() {
  for ( Unit u : allies ) {
    u.draw();
  }
}

void drawAlliesShells() {
  for ( Shell s : alliesShells ) {
    s.draw();
  }
}

void drawEnemiesShells() {
  for ( Shell s : enemiesShells ) {
    s.draw();
  }
}