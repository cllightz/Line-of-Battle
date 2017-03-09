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
  allies.addUnit( new Unit( new PVector( 100, 100 ), 10, color( 0, 255, 0 ) ) );
  
  enemies = new ArrayList<Unit>();
  alliesShells = new ArrayList<Shell>();
  enemiesShells = new ArrayList<Shell>();
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
      moveAlliesShells();
      moveEnemiesShells();
      shoot();
      calculateAlliesShellsCollision();
      calculateEnemiesShellsCollision();
      
      pushMatrix();
        // calculate camera position
        drawEnemies();
        allies.draw();
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

void shoot() {
  if ( mousePressed ) {
    for ( Unit u : allies.getUnits() ) {
      PVector pos = u.pos;
      float vmax = 2.0;
      PVector v = new PVector( 0, 0 );
      color c = color( 0, 255, 255 );
      
      alliesShells.add( new Shell( pos, v, 5.0, c ) );
    }
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

PVector screenToLocal( PVector screen ) {
  PMatrix2D tmp = new PMatrix2D();
  getMatrix( tmp );
  tmp.invert();
  
  PVector local = new PVector();
  tmp.mult( screen, local );
  
  return local;
}