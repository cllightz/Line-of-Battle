ScheneState scheneState;
AlliesLine allies;
ArrayList<Unit> enemies;
ArrayList<Shell> alliesShells;
ArrayList<Shell> enemiesShells;
KeyManager keyManager;
MouseManager mouseManager;
long frame;

void setup() {
  size( 800, 600 );
  frameRate( 60 );
  ellipseMode( CENTER );
  smooth();
  
  scheneState = ScheneState.TITLE;

  allies = new AlliesLine();
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  allies.addUnit( new Unit( new PVector( width/2, height/2 ), 10, color( 0, 255, 0 ) ) );
  
  enemies = new ArrayList<Unit>();
  alliesShells = new ArrayList<Shell>();
  enemiesShells = new ArrayList<Shell>();
  
  keyManager = new KeyManager();
  mouseManager = new MouseManager();
  
  frame = 0;
}

void draw() {
  background( 0 );
  
  switch ( scheneState ) {
    case TITLE:
      new Title().drawTitle();
      break;
      
    case BATTLE:
      moveEnemies();
      allies.move( keyManager );
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
      
      frame++;
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
  if ( mouseManager.isAnyPressed() && frame % 10 == 0 ) {
    for ( Unit u : allies.getUnits() ) {
      PVector pos = new PVector( u.pos.x, u.pos.y );
      PVector cursor = new PVector( mouseX, mouseY );
      // PVector cursor = screenToLocal( new PVector( mouseX, mouseY ) );
      float vmax = 5.0;
      PVector v;
      
      /*
      color textColor = color( 255, 255, 255 );
      fill( textColor );
      
      int textSize = 10;
      textSize( textSize );
      
      textAlign( CENTER );
      
      pushMatrix();
        translate( width/2, height/2 - 50 );
        scale( 5 );
        String text = Integer.toString( 20000 + (mouseManager.l?100:0) + (mouseManager.c?10:0) + (mouseManager.r?1:0) );
        text( text, 0, 0 );
      popMatrix();
      */
      
      if ( mouseManager.l && mouseManager.r ) {
        v = PVector.sub( cursor, pos ).normalize().mult( vmax ).add( PVector.sub( cursor, new PVector( allies.getUnits().get( 0 ).pos.x, allies.getUnits().get( 0 ).pos.y ) ).normalize().mult( vmax ) ).div( 2 );
      } else if ( mouseManager.l ) {
        v = PVector.sub( cursor, pos ).normalize().mult( vmax );
      } else if ( mouseManager.r ) {
        v = PVector.sub( cursor, new PVector( allies.getUnits().get( 0 ).pos.x, allies.getUnits().get( 0 ).pos.y ) ).normalize().mult( vmax );
      } else {
        return;
      }
      
      color c = color( 0, 255, 255 );
      alliesShells.add( new Shell( pos, v, 5.0, c ) );
    }
  }
}

void moveAlliesShells() {
  for ( Shell s : alliesShells ) {
    s.move();
  }
  
  for ( int i = alliesShells.size() - 1; 0 <= i; i-- ) {
    PVector screen = localToScreen( alliesShells.get( i ).pos );
    
    if ( screen.x < -100 || width+100 < screen.x || screen.y < -100 || height+100 < screen.y ) {
      alliesShells.remove( i );
    }
  }
}

void moveEnemiesShells() {
  for ( Shell s : enemiesShells ) {
    s.move();
  }
  
  for ( int i = enemiesShells.size() - 1; 0 <= i; i-- ) {
    PVector screen = localToScreen( enemiesShells.get( i ).pos );
    
    if ( screen.x < -100 || width+100 < screen.x || screen.y < -100 || height+100 < screen.y ) {
      enemiesShells.remove( i );
    }
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

PVector localToScreen( PVector local ) {
  PMatrix2D tmp = new PMatrix2D();
  getMatrix( tmp );  
  tmp.invert();
  
  PVector screen = new PVector();
  tmp.mult( local, screen );
  return screen;
}

void keyPressed() {
  keyManager.enable( key );
}

void keyReleased() {
  keyManager.disable( key );
}

void mousePressed() {
  mouseManager.enable( mouseButton );
}

void mouseReleased() {
  mouseManager.disable( mouseButton );
}